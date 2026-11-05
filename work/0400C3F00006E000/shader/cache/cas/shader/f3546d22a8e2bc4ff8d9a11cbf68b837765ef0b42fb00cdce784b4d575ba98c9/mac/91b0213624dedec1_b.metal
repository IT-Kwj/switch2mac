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
    float4 m_70 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3929 = false;
    bool _3110 = false;
    bool _945 = false;
    bool _777 = false;
    bool _557 = false;
    bool _381 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_48.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4214 = as_type<float>(_127);
        out.gl_Position.z = _4214;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4284 = as_type<float>(_165);
        out.gl_Position.z = _4284;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _209;
    float _231;
    if (!_211)
    {
        float _215 = in.m_60.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_111);
        float _237 = 1.0 / _235;
        float _239 = _145 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    bool _259 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _261 = isnan(_241);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _275 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = -_257;
    float _281 = _279 + 1.0;
    float _283 = 1.0 / _273;
    bool _285 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_241);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _269 * _281;
    float _299 = -_269;
    float _301 = _299 + 1.0;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _305 = _295 * _301;
    float _307 = 1.0 / _277;
    float _309 = -_295;
    float _311 = _309 + 1.0;
    float _313 = _245 * _283;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _241 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = fma(_321, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = fma(_325, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = _317 * _307;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _327 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = _329 * _305;
    float _345 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[143].x, _337);
    float _349 = fma(_341, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _351 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _353 = fma(_345, _297, _347);
    float _355 = fma(_349, _297, _351);
    float _357 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    bool _361 = !_303;
    float _379;
    if (!_361)
    {
        float _363 = in.m_60.x;
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _363 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        float _383 = float(_111);
        float _385 = 1.0 / _383;
        float _387 = _145 * _385;
        _379 = _387;
    }
    _381 = false;
    float _389 = _379;
    float _391 = in.m_62.x;
    float _393 = in.m_62.y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _389 + _395;
    bool _399 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_389);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _419 = 1.0 / _413;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _423 = 1.0 / _417;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _425;
    float _429 = _397 * _419;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _389 + _431;
    bool _435 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _437 = isnan(_389);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = _359 * _393;
    bool _449 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _451 = isnan(_389);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_409;
    float _463 = _461 + 1.0;
    float _465 = fma(_427, _429, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _467 = _357 * _391;
    float _469 = _433 * _423;
    float _471 = _459 * _463;
    float _473 = -_459;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _481;
    float _485 = _445 * _475;
    float _487 = fma(_479, _429, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_483, _429, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _491 = -_445;
    float _493 = _491 + 1.0;
    float _495 = _465 * _485;
    float _497 = _487 * _485;
    float _499 = _489 * _485;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].x, _499);
    float _515 = fma(_503, _469, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _517 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _519 = fma(_507, _469, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _521 = fma(_511, _469, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _523 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _525 = fma(_515, _471, _517);
    float _527 = fma(_519, _471, _513);
    float _529 = fma(_521, _471, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _525);
    float _533 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _527);
    float _535 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _529);
    bool _537 = !_421;
    float _555;
    if (!_537)
    {
        float _539 = in.m_60.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_111);
        float _561 = 1.0 / _559;
        float _563 = _145 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _565 + _567;
    float _571 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = isnan(_565);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = 1.0 / _575;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _603 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _605 = isnan(_565);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _621 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_565);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = 1.0 / _579;
    float _637 = -_613;
    float _639 = _637 + 1.0;
    float _641 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _591 * _639;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _651 = _595 * _597;
    bool _653 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_565);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -_591;
    float _667 = _665 + 1.0;
    float _669 = 1.0 / _601;
    float _671 = fma(_651, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _673;
    float _677 = _663 * _667;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _687 = 1.0 / _619;
    float _689 = _631 * _681;
    float _691 = _685 * _635;
    float _693 = -_631;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _699 = _565 + _697;
    float _701 = _671 * _689;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = _565 + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _711 = _675 * _669;
    bool _713 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _715 = isnan(_565);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_691, _705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _729 = fma(_711, _699, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _733 = _565 + _731;
    float _735 = -_723;
    float _737 = _735 + 1.0;
    float _739 = fma(_725, _677, _727);
    float _741 = _709 * _687;
    float _743 = _613 * _737;
    float _745 = fma(_729, _647, _739);
    float _747 = fma(_741, _733, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _749 = fma(_747, _743, _745);
    float _751 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[119].x, _749);
    float _753 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _641;
    out.m_64.y = _643;
    out.m_64.z = _645;
    out.m_64.w = _753;
    bool _755 = !_649;
    float _757 = _647;
    float _775;
    if (!_755)
    {
        float _759 = in.m_60.x;
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _763 = _759 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _767 = _765 * _761;
        float _769 = floor(_767);
        float _771 = -_769;
        float _773 = _767 + _771;
        _775 = _773;
        _777 = true;
    }
    else
    {
        float _779 = float(_111);
        float _781 = 1.0 / _779;
        float _783 = _145 * _781;
        _775 = _783;
    }
    _777 = false;
    float _785 = _775;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _789 = _785 + _787;
    bool _791 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _793 = isnan(_785);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _805 = _785 + _803;
    bool _807 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _809 = isnan(_785);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _819;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _827 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _829 = isnan(_785);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -_801;
    float _841 = _839 + 1.0;
    float _843 = 1.0 / _825;
    float _845 = _837 * _841;
    float _847 = -_837;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _851;
    bool _855 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _857 = 1.0 / _821;
    float _859 = _817 * _849;
    float _861 = -_817;
    float _863 = _861 + 1.0;
    float _865 = _789 * _857;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _871;
    float _875 = fma(_853, _865, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _877 = fma(_869, _865, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _879 = fma(_873, _865, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _881 = _805 * _843;
    float _883 = _875 * _859;
    float _885 = _877 * _859;
    float _887 = _879 * _859;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _901 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].x, _883);
    float _903 = fma(_891, _881, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _905 = fma(_895, _881, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _907 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].y, _885);
    float _909 = fma(_899, _881, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _911 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].z, _887);
    float _913 = fma(_903, _845, _901);
    float _915 = fma(_905, _845, _907);
    float _917 = fma(_909, _845, _911);
    float _919 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].x, _913);
    float _921 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].y, _915);
    float _923 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].z, _917);
    bool _925 = !_855;
    float _943;
    if (!_925)
    {
        float _927 = in.m_60.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_111);
        float _949 = 1.0 / _947;
        float _951 = _145 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    float _955 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _957 = int(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _961 = _953 + _959;
    float _963 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _973 = int(_971);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _977 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = float(_957);
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _983 = int(_981);
    if (_967)
    {
        float _985 = in.m_60.x;
        _757 = _985;
    }
    float _987 = _757;
    float _989 = _987;
    if (!_967)
    {
        float _991 = in.m_60.y;
        _989 = _991;
    }
    float _993 = _989;
    float _995 = float(uint(_973));
    float _997 = 1.0 / _979;
    int _999 = ~_973;
    int _1001 = _999 + 1;
    bool _1003 = _973 == 0;
    float _1005 = 1.0 / _995;
    float _1007 = float(_983);
    float _1009 = _997 * _145;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1013 = int(_1011);
    int _1015 = as_type<int>(_1005) + (-2);
    float _1017 = trunc(_1009);
    int _1019 = int(_1017);
    float _1021 = 1.0 / _1007;
    float _1023 = float(uint(_1013));
    int _1025 = ~_1013;
    int _1027 = _1025 + 1;
    int _1029 = ~_1013;
    int _1031 = _1029 + 1;
    float _1033 = float(uint(_1019));
    float _1035 = 1.0 / _1023;
    float _1037 = as_type<float>(_1015) * _1033;
    float _1039 = in.m_60.x;
    float _1041 = in.m_60.y;
    float _1043 = in.m_60.z;
    float _1045 = in.m_60.w;
    float _1047 = _1021 * _145;
    float _1049 = trunc(_1037);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    float _1056 = trunc(_1047);
    int _1058 = int(_1056);
    int _1060 = as_type<int>(_1035) + (-2);
    float _1062 = _1037;
    if (_967)
    {
        _1062 = 1.0;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (!_967)
    {
        _1066 = 1.2345600128173828125;
    }
    float _1068 = _1066;
    int _1070 = _1001 * int(_1054);
    int _1072 = _1070 + _1019;
    float _1074 = _993 * _1068;
    float _1076 = float(uint(_1072));
    float _1078 = floor(_1074);
    float _1080 = as_type<float>(_1072);
    if (_967)
    {
        _1080 = 1.0;
    }
    float _1082 = _1080;
    float _1084 = float(uint(_1058));
    float _1086 = as_type<float>(_1015) * _1076;
    float _1088 = _1082;
    int _1090 = as_type<int>(_1045);
    if (!_967)
    {
        _1088 = 7.345489978790283203125;
    }
    float _1092 = _1088;
    float _1094 = as_type<float>(_1060) * _1084;
    float _1096 = trunc(_1086);
    float _1098 = precise::max(_1096, 0.0);
    uint _1100 = uint(_1098);
    float _1102 = _1092 * _1039;
    float _1104 = -_1078;
    float _1106 = _1074 + _1104;
    float _1108 = trunc(_1094);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = floor(_1102);
    int _1116 = int(_1054) + int(_1100);
    float _1118 = float(_111);
    float _1120 = float(_973);
    int _1122 = _1027 * int(_1112);
    int _1124 = _1122 + _1058;
    int _1126 = ~_973;
    int _1128 = _1126 + 1;
    float _1130 = 1.0 / _1118;
    float _1132 = float(uint(_1124));
    float _1134 = -_1114;
    float _1136 = _1102 + _1134;
    int _1138 = _1128 * _1116;
    int _1140 = _1138 + _1019;
    float _1142 = float(_1013);
    float _1144 = as_type<float>(_1060) * _1132;
    float _1146 = _1136 * _1120;
    bool _1148 = uint(_1140) >= uint(_973);
    float _1150 = trunc(_1144);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = float(_1019);
    bool _1158 = !_1148;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1164 = _1162 != 0;
    int _1166 = ~_1116;
    int _1168 = _1166 + _1160;
    int _1170 = _1168 + 1;
    float _1172 = trunc(_1146);
    int _1174 = int(_1172);
    bool _1176 = _1156 >= _1120;
    bool _1178 = isnan(_1156);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1120);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _1130 * _145;
    bool _1190 = !_1164;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _1106 * _1142;
    float _1196 = float(_1058);
    float _1198 = _1120 * _1188;
    int _1200 = abs(_1192);
    float _1202 = trunc(_1186);
    int _1204 = int(_1202);
    int _1206 = int(_1112) + int(_1154);
    float _1208 = _1142 * _1188;
    bool _1210 = _1196 >= _1142;
    bool _1212 = isnan(_1196);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1142);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    int _1222 = _1174 * _1200;
    int _1224 = _1222 + _1019;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1228 = _1226 != 0;
    int _1230 = _973 * _1170;
    int _1232 = _1230 + _1019;
    float _1234 = trunc(_1194);
    int _1236 = int(_1234);
    int _1238 = _1031 * _1206;
    int _1240 = _1238 + _1058;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1252 = _1250 != 0;
    bool _1254 = !_1003;
    int _1256 = _1254 ? _1232 : (-1);
    int _1258 = ~_1204;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    bool _1264 = !_1228;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = trunc(_1198);
    int _1270 = int(_1268);
    bool _1272 = uint(_1240) >= uint(_1013);
    int _1274 = _1256 * _1262;
    int _1276 = abs(_1266);
    bool _1278 = !_1248;
    int _1280 = _1278 ? 0 : 1;
    bool _1282 = !_1272;
    int _1284 = _1282 ? 0 : (-1);
    float _1286 = trunc(_1220);
    int _1288 = int(_1286);
    int _1290 = _973 + (-1);
    int _1292 = _1236 * _1276;
    int _1294 = _1292 + _1058;
    int _1296 = abs(_1280);
    int _1298 = ~_1206;
    int _1300 = _1298 + _1284;
    int _1302 = _1300 + 1;
    int _1304 = _1204 * _1290;
    int _1306 = _1304 + _1274;
    bool _1308 = !_1244;
    int _1310 = _1308 ? 0 : 1;
    float _1312 = trunc(_1208);
    int _1314 = int(_1312);
    int _1316 = _1013 * _1302;
    int _1318 = _1316 + _1058;
    bool _1320 = !_1252;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = abs(_1310);
    int _1326 = _1306 * _1296;
    bool _1328 = _1013 == 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1332 = _1330 != 0;
    int _1334 = _1270 * _1324;
    int _1336 = _1334 + _1326;
    int _1338 = abs(_1322);
    int _1340 = ~_1288;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    bool _1346 = !_1328;
    int _1348 = _1346 ? _1318 : (-1);
    bool _1350 = !_1332;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = _1348 * _1344;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    int _1372 = abs(_1352);
    int _1374 = _1224 * _1338;
    int _1376 = _1374 + _1336;
    int _1378 = _1013 + (-1);
    bool _1380 = !_1362;
    int _1382 = _1380 ? 0 : 1;
    int _1384 = _1174 * _1372;
    int _1386 = _1384 + _1376;
    bool _1388 = _973 == 0;
    int _1390 = _1288 * _1378;
    int _1392 = _1390 + _1354;
    int _1394 = abs(_1382);
    bool _1396 = !_1366;
    int _1398 = _1396 ? 0 : 1;
    bool _1400 = !_1358;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = abs(_1398);
    int _1406 = abs(_1402);
    int _1408 = _1392 * _1394;
    float _1410 = float(uint(_1386));
    bool _1412 = !_1370;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _1314 * _1406;
    int _1418 = _1416 + _1408;
    float _1420 = float(uint(_1224));
    float _1422 = as_type<float>(_1015) * _1410;
    int _1424 = abs(_1414);
    float _1426 = trunc(_1422);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = as_type<float>(_1015) * _1420;
    int _1434 = _1294 * _1404;
    int _1436 = _1434 + _1418;
    int _1438 = ~_973;
    int _1440 = _1438 + 1;
    int _1442 = _1236 * _1424;
    int _1444 = _1442 + _1436;
    int _1446 = ~_1013;
    int _1448 = _1446 + 1;
    int _1450 = ~_973;
    int _1452 = _1450 + 1;
    float _1454 = float(uint(_1444));
    int _1456 = _1440 * int(_1430);
    int _1458 = _1456 + _1386;
    float _1460 = as_type<float>(_1060) * _1454;
    float _1462 = float(uint(_1458));
    float _1464 = trunc(_1460);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    float _1470 = as_type<float>(_1015) * _1462;
    float _1472 = trunc(_1470);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    int _1478 = _1448 * int(_1468);
    int _1480 = _1478 + _1444;
    float _1482 = float(uint(_1480));
    int _1484 = int(_1430) + int(_1476);
    float _1486 = as_type<float>(_1060) * _1482;
    int _1488 = ~_1013;
    int _1490 = _1488 + 1;
    float _1492 = trunc(_1486);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    int _1498 = _1452 * _1484;
    int _1500 = _1498 + _1386;
    bool _1502 = uint(_1500) >= uint(_973);
    bool _1504 = !_1502;
    int _1506 = _1504 ? 0 : (-1);
    int _1508 = ~_1484;
    int _1510 = _1508 + _1506;
    int _1512 = _1510 + 1;
    int _1514 = int(_1468) + int(_1496);
    float _1516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1518 = log2(_1516);
    int _1520 = _973 * _1512;
    int _1522 = _1520 + _1386;
    int _1524 = _1490 * _1514;
    int _1526 = _1524 + _1444;
    bool _1528 = !_1388;
    int _1530 = _1528 ? _1522 : (-1);
    bool _1532 = uint(_1526) >= uint(_1013);
    int _1534 = _1530 & 3;
    bool _1536 = _1534 != 0;
    bool _1538 = !_1532;
    int _1540 = _1538 ? 0 : (-1);
    bool _1542 = uint(_1534) > 1u;
    int _1544 = _1530 & 3;
    bool _1546 = _1544 != 0;
    int _1548 = ~_1514;
    int _1550 = _1548 + _1540;
    int _1552 = _1550 + 1;
    int _1554 = _1546 ? 0 : 1;
    bool _1556 = _1534 != 3;
    int _1558 = _1013 * _1552;
    int _1560 = _1558 + _1444;
    bool _1562 = uint(_1534) >= 2u;
    float _1564 = _1039 * 2.0;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1568 = _1566 != 0;
    int _1570 = _1562 ? 0 : 1;
    float _1572 = floor(_1564);
    bool _1574 = _1045 > 0.5;
    int _1576 = ~_1554;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    bool _1582 = !_1328;
    int _1584 = _1582 ? _1560 : (-1);
    int _1586 = _1580;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1542)
    {
        int _1590 = ~_1554;
        int _1592 = _1590 + 1;
        _1586 = _1592;
    }
    int _1594 = _1586;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1598 = _1596 != 0;
    float _1600 = -_203;
    int _1602 = _1574 ? as_type<int>(_1600) : as_type<int>(_203);
    int _1604 = _1584 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = ~_1570;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    bool _1614 = !_1598;
    int _1616 = _1614 ? 0 : 1;
    int _1618 = _1612;
    if (_1556)
    {
        int _1620 = ~_1570;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    float _1626 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1628 = _1584 & 3;
    bool _1630 = _1628 != 0;
    bool _1632 = uint(_1604) > 1u;
    float _1634 = -_975;
    float _1636 = fma(_1626, 2.0, _1634);
    if (_1568)
    {
        _1090 = 0;
    }
    int _1638 = _1090;
    bool _1640 = uint(_1604) >= 2u;
    float _1642 = -_145;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1636);
    int _1646 = _1638;
    if (!_1568)
    {
        _1646 = 1;
    }
    int _1648 = _1646;
    int _1650 = _1630 ? 0 : 1;
    bool _1652 = _1604 != 3;
    int _1654 = _1640 ? 0 : 1;
    bool _1656 = _1648 != 1;
    int _1658 = ~_1650;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1662;
    if (!_1632)
    {
        int _1666 = ~_1650;
        int _1668 = _1666 + 1;
        _1664 = _1668;
    }
    int _1670 = _1664;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1674 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1676 = _1039 > 0.5;
    int _1678 = ~_1654;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1674, -2.0, _1672);
    int _1686 = _1682;
    float _1688 = _1672;
    float _1690 = _1674;
    if (_1652)
    {
        int _1692 = ~_1654;
        int _1694 = _1692 + 1;
        _1686 = _1694;
    }
    int _1696 = _1686;
    float _1698 = -_193;
    int _1700 = _1676 ? as_type<int>(_1698) : as_type<int>(_193);
    float _1702 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1684);
    bool _1704 = _1572 > 0.0;
    bool _1706 = _1572 >= 0.0;
    bool _1708 = isnan(_1572);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan(0.0);
    bool _1714 = _1710 || _1712;
    float _1716 = _1518 * _145;
    if (!_1656)
    {
        _1688 = _1043;
    }
    float _1718 = _1688;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1722 = _1718;
    if (_1656)
    {
        _1722 = _1041;
    }
    float _1724 = _1722;
    float _1726 = exp2(_1716);
    if (!_1656)
    {
        _1690 = _1041;
    }
    float _1728 = _1690;
    float _1730 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1720);
    float _1732 = float(uint(_1294));
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1736 = _1728;
    float _1738 = _1734;
    if (_1656)
    {
        _1736 = _1039;
    }
    float _1740 = _1736;
    float _1742 = trunc(_1432);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    if (!_1656)
    {
        _1588 = _1041;
    }
    float _1748 = _1588;
    float _1750 = as_type<float>(_1060) * _1732;
    float _1752 = _1748;
    if (_1656)
    {
        _1752 = _1039;
    }
    float _1754 = _1752;
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1734);
    if (!_1656)
    {
        _1738 = _1043;
    }
    float _1758 = _1738;
    float _1760 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1730);
    float _1762 = _1758;
    if (_1656)
    {
        _1762 = _1041;
    }
    float _1764 = _1762;
    float _1766 = trunc(_1750);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = -_1726;
    float _1774 = _1772 + 1.0;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1778 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1792 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1794 = -_1776;
    float _1796 = fma(_1778, 2.0, _1794);
    float _1798 = _1788 ? _1774 : 0.0;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1802 = 1.0 + _1800;
    float _1804 = fma(_1792, -2.0, _1790);
    bool _1806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1808 = isnan(1.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1814 = _1810 || _1812;
    float _1816 = 1.0 / _1802;
    int _1818 = ~_973;
    int _1820 = _1818 + 1;
    float _1822 = -_145;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1796);
    int _1826 = _1031 * int(_1770);
    int _1828 = _1826 + _1294;
    float _1830 = _1041 * 2.0;
    float _1832 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1756);
    float _1834 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1804);
    int _1836 = _1820 * int(_1746);
    int _1838 = _1836 + _1224;
    float _1840 = floor(_1830);
    float _1842 = float(uint(_1828));
    int _1844 = _1714 ? 0 : 1;
    float _1846 = float(uint(_1838));
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1852 = as_type<float>(_1060) * _1842;
    int _1854 = ~_1844;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_1015) * _1846;
    float _1862 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1848);
    float _1864 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1850);
    float _1866 = trunc(_1852);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    int _1872 = _1858;
    if (!_1704)
    {
        int _1874 = ~_1844;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    float _1880 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1862);
    float _1882 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1864);
    if (_1814)
    {
        float _1884 = _1798 * _1816;
        _147 = _1884;
    }
    float _1886 = _147;
    bool _1888 = _1840 > 0.0;
    bool _1890 = _1840 >= 0.0;
    bool _1892 = isnan(_1840);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(0.0);
    bool _1898 = _1894 || _1896;
    float _1900 = trunc(_1860);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    bool _1906 = _1041 > 0.5;
    float _1908 = -_203;
    int _1910 = _1906 ? as_type<int>(_1908) : as_type<int>(_203);
    bool _1912 = _1043 > 0.5;
    int _1914 = _1898 ? 0 : 1;
    int _1916 = int(_1770) + int(_1870);
    int _1918 = ~_1914;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1926 = _1924 != 0;
    int _1928 = _1922;
    if (!_1888)
    {
        int _1930 = ~_1914;
        int _1932 = _1930 + 1;
        _1928 = _1932;
    }
    int _1934 = _1928;
    int _1936 = int(_1746) + int(_1904);
    float _1938 = -_193;
    int _1940 = _1912 ? as_type<int>(_1938) : as_type<int>(_193);
    float _1942 = in.m_48.x;
    float _1944 = in.m_48.y;
    float _1946 = in.m_48.z;
    int _1948 = ~_973;
    int _1950 = _1948 + 1;
    int _1952 = ~_1013;
    int _1954 = _1952 + 1;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1958 = _1956 != 0;
    int _1960 = _1950 * _1936;
    int _1962 = _1960 + _1224;
    bool _1964 = !_1926;
    float _1966 = _1964 ? _193 : as_type<float>(_1700);
    int _1968 = _1954 * _1916;
    int _1970 = _1968 + _1294;
    bool _1972 = !_1958;
    float _1974 = _1972 ? _203 : as_type<float>(_1602);
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1982 = _1980 != 0;
    float _1984 = _1974 + (-0.5);
    bool _1986 = !_1978;
    float _1988 = _1986 ? _203 : as_type<float>(_1910);
    float _1990 = -_1984;
    float _1992 = -_1834;
    float _1994 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1992);
    bool _1996 = !_1982;
    float _1998 = _1996 ? _193 : as_type<float>(_1940);
    float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2004 = uint(_1962) >= uint(_973);
    bool _2006 = uint(_1970) >= uint(_1013);
    float _2008 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2010 = 1.0 / _2002;
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2020 = _2018 != 0;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2024 = _2022 != 0;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2028 = _2026 != 0;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2036 = _2034 != 0;
    float _2038 = _1043 * 2.0;
    float _2040 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2042 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2008);
    float _2044 = 1.0 / _2032;
    float _2046 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2016);
    float _2048 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2040);
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2050;
    float _2054 = _1039 + _1041;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2060 = _2052 * _2010;
    float _2062 = floor(_2038);
    float _2064 = _1043 + _1041;
    float _2066 = _2054 + (-1.0);
    bool _2068 = !_2006;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2042);
    float _2074 = _2064 + (-1.0);
    float _2076 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2078 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2080 = isnan(_953);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = _2058 * _2044;
    float _2092 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2046);
    bool _2094 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2096 = isnan(_953);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = -_2088;
    float _2108 = _2106 + 1.0;
    bool _2110 = !_2020;
    int _2112 = _2110 ? 0 : 1;
    float _2114 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2116 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2118 = isnan(_953);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = -_2104;
    float _2130 = _2128 + 1.0;
    bool _2132 = _2062 >= 0.0;
    bool _2134 = isnan(_2062);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(0.0);
    bool _2140 = _2136 || _2138;
    float _2142 = fma(_2060, _961, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2146 = _953 + _2144;
    float _2148 = _2126 * _2130;
    int _2150 = _2140 ? 0 : 1;
    float _2152 = -_2126;
    float _2154 = _2152 + 1.0;
    bool _2156 = _2062 > 0.0;
    float _2158 = _2104 * _2108;
    float _2160 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2048);
    float _2162 = _1988 + (-0.5);
    float _2164 = _2142 * _2148;
    int _2166 = abs(_2112);
    float _2168 = fma(_2090, _2146, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2170 = -_2162;
    float _2172 = -_1702;
    float _2174 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2172);
    int _2176 = ~_2150;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    float _2182 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2164);
    bool _2184 = !_2024;
    int _2186 = _2184 ? 0 : 1;
    float _2188 = _2092 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2190 = float(_1878);
    float _2192 = fma(_2168, _2158, _2182);
    int _2194 = _2180;
    if (!_2156)
    {
        int _2196 = ~_2150;
        int _2198 = _2196 + 1;
        _2194 = _2198;
    }
    int _2200 = _2194;
    float _2202 = _1966 + 0.5;
    float _2204 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2192);
    int _2206 = _1530 >> 31;
    float _2208 = _2072 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2210 = _1584 >> 31;
    float _2212 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2214 = _2188 + _2212;
    int _2216 = _2206 & 3;
    float _2218 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1644);
    int _2220 = abs(_2186);
    float _2222 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2224 = _1530 + _2216;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2228 = _2208 + _2226;
    int _2230 = _2210 & 3;
    float _2232 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2234 = _2224 >> 2;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2238 = _2222 + _2236;
    int _2240 = _1584 + _2230;
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2232);
    int _2244 = _2234 << 4;
    int _2246 = _2244 + 368;
    float _2248 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2250 = _2240 >> 2;
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2242);
    float _2254 = float(_2220);
    uint _2256 = uint(int(uint(_2246) >> uint(2)));
    uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
    int _2260 = int(_2256) & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = int(_2256) + 1;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    int _2268 = _2264 & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    int _2272 = _2250 << 4;
    int _2274 = _2272 + 512;
    float _2276 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2278 = _1998 + 0.5;
    float _2280 = _2254 * _2190;
    float _2282 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2284 = !_1536;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = _2204 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2290 = uint(int(uint(_2274) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    bool _2306 = _2252 >= 0.0;
    float _2308 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1824);
    int _2310 = ~_1936;
    int _2312 = _2310 + _2014;
    int _2314 = _2312 + 1;
    out.m_66.x = _2276;
    out.m_66.y = _977;
    out.m_66.z = _2282;
    out.m_66.w = _2288;
    int _2316 = abs(_1594);
    float _2318 = _2280 * (-2.0);
    int _2320 = abs(_1696);
    int _2322 = _2246 + 8;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[int(_2334)][_2336];
    float _2340 = float(_2166);
    int _2342 = _973 * _2314;
    int _2344 = _2342 + _1224;
    float _2346 = float(_2200);
    float _2348 = fma(_2114, _2318, _2114);
    int _2350 = ~_1916;
    int _2352 = _2350 + _2070;
    int _2354 = _2352 + 1;
    if (_2306)
    {
        out.m_51.x = 0.0;
    }
    bool _2356 = _1013 == 0;
    int _2358 = _2274 + 8;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    float _2376 = _2340 * _2346;
    bool _2378 = !_1606;
    int _2380 = _2378 ? 0 : 1;
    float _2382 = in.m_68.x;
    float _2384 = in.m_68.y;
    float _2386 = in.m_68.z;
    int _2388 = abs(_1670);
    int _2390 = _1013 * _2354;
    int _2392 = _2390 + _1294;
    int _2394 = abs(_2380);
    float _2396 = _2376 * (-2.0);
    int _2398 = abs(_2286);
    float _2400 = fma(_2076, _2396, _2076);
    int _2402 = ~_2316;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = ~_2398;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    int _2414 = ~_2388;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    int _2420 = abs(_1624);
    bool _2422 = _1534 != 3;
    int _2424 = ~_2420;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = _2406 * as_type<int>(_2270);
    int _2432 = ~_2394;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    bool _2438 = !_2356;
    int _2440 = _2438 ? _2392 : (-1);
    int _2442 = _2412 * as_type<int>(_2262);
    int _2444 = _2442 + _2430;
    bool _2446 = !_2036;
    int _2448 = _2446 ? 0 : 1;
    float _2450 = fma(_2396, _2382, _2382);
    bool _2452 = _1604 != 3;
    int _2454 = _2418 * as_type<int>(_2304);
    int _2456 = abs(_2448);
    float _2458 = fma(_2318, _2384, _2384);
    int _2460 = abs(_1616);
    int _2462 = _2436 * as_type<int>(_2296);
    int _2464 = _2462 + _2454;
    bool _2466 = !_2452;
    int _2468 = _2466 ? 0 : (-1);
    bool _2470 = _973 == 0;
    int _2472 = _2428 * as_type<int>(_2330);
    int _2474 = _2472 + _2444;
    bool _2476 = !_2422;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = abs(_2468);
    int _2482 = abs(_2478);
    int _2484 = ~_2320;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    int _2490 = ~_2482;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = ~_2480;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    int _2502 = _2488 * as_type<int>(_2366);
    int _2504 = _2502 + _2464;
    int _2506 = ~_2460;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = _2494 * as_type<int>(_2338);
    int _2514 = _2512 + _2474;
    int _2516 = ~_2456;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    int _2522 = _2500 * as_type<int>(_2374);
    int _2524 = _2522 + _2504;
    bool _2526 = !_2470;
    int _2528 = _2526 ? _2344 : (-1);
    int _2530 = _2514 * _2510;
    float _2532 = as_type<float>(_2480);
    if (_2306)
    {
        _2532 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2534 = _2532;
    int _2536 = _2524 * _2520;
    float _2538 = _2214 * _2214;
    int _2540 = _2528 * _2460;
    int _2542 = _2540 + _2530;
    float _2544 = -_1880;
    float _2546 = _2544 + 1.0;
    int _2548 = _2440 * _2456;
    int _2550 = _2548 + _2536;
    float _2552 = fma(_2228, _2228, _2538);
    float _2554 = -_1760;
    float _2556 = _2554 + 1.0;
    float _2558 = -_1882;
    float _2560 = _2558 + 1.0;
    float _2562 = -_1832;
    float _2564 = _2562 + 1.0;
    float _2566 = fma(_2238, _2238, _2552);
    float _2568 = fma(_1974, _2556, _1994);
    float _2570 = _1039 + (-0.5);
    float _2572 = -_2546;
    float _2574 = fma(_1966, _2572, _2218);
    float _2576 = rsqrt(_2566);
    float _2578 = fma(_1988, _2560, _2174);
    float _2580 = -_2564;
    float _2582 = fma(_1998, _2580, _2308);
    int _2584 = as_type<int>(_2534);
    if (_2306)
    {
        float _2586 = _2534 * 5.0;
        _2584 = as_type<int>(_2586);
    }
    int _2588 = _2584;
    float _2590 = float(_2542);
    float _2592 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    float _2594 = float(_2550);
    out.m_70.x = _2574;
    out.m_70.y = _2578;
    out.m_70.z = _2582;
    out.m_70.w = _2568;
    bool _2596 = !_2028;
    int _2598 = _2596 ? 0 : 1;
    float _2600 = _1041 + (-0.5);
    float _2602 = fma(_2400, _1886, _2592);
    if (_2306)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7912 = as_type<float>(_2588);
        out.gl_Position.z = _7912;
    }
    int _2604 = abs(_2598);
    out.m_72.x = _2590;
    out.m_72.y = _2594;
    float _2606 = _2214 * _2576;
    float _2608 = _2228 * _2576;
    if (_2306)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2610 = -_2606;
    float _2612 = fma(_2610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2188);
    float _2614 = _2238 * _2576;
    float _2616 = -_2608;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2208);
    float _2620 = float(_1934);
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2624 = _2612 + _2622;
    float _2626 = -_2614;
    float _2628 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2222);
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2632 = _2618 + _2630;
    float _2634 = float(_2604);
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2640 = _2628 + _2638;
    float _2642 = -_2606;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2214);
    float _2646 = -_2608;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2228);
    float _2650 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2636);
    float _2652 = _2634 * _2620;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2600, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2458);
    float _2658 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2650);
    float _2660 = _1043 + _1039;
    float _2662 = fma(_2648, _2648, _2654);
    float _2664 = -_2614;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2668 = fma(_2348, _1886, _2656);
    bool _2670 = _2658 >= 0.0;
    float _2672 = _2660 + (-1.0);
    float _2674 = fma(_2666, _2666, _2662);
    float _2676 = _2652 * (-2.0);
    float _2678 = _2602 * 0.15915493667125701904296875;
    float _2680 = _2668 * 0.15915493667125701904296875;
    float _2682 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2684 = _1043 + (-0.5);
    float _2686 = fma(_2676, _2386, _2386);
    float _2688 = _2678 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = fma(_2682, _2676, _2682);
    float _2694 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2696 = as_type<int>(_2684);
    float _2698 = _2624;
    float _2700 = _2640;
    if (_2670)
    {
        _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2702 = _2694;
    float _2704 = fma(_2684, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2686);
    if (_2670)
    {
        out.m_51.x = 0.0;
    }
    float _2706 = _2678 * 6.283185482025146484375;
    float _2708 = cos(_2706);
    if (_2670)
    {
        float _2710 = _2702 * 5.0;
        _2696 = as_type<int>(_2710);
    }
    int _2712 = _2696;
    float _2714 = fma(_2692, _1886, _2704);
    if (_2670)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8112 = as_type<float>(_2712);
        out.gl_Position.z = _8112;
    }
    float _2716 = _2714 * 0.15915493667125701904296875;
    float _2718 = _2680 * 6.283185482025146484375;
    float _2720 = sin(_2718);
    float _2722 = sqrt(_2674);
    float _2724 = _2680 * 6.283185482025146484375;
    float _2726 = cos(_2724);
    if (_2670)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2728 = _2716 * 6.283185482025146484375;
    float _2730 = cos(_2728);
    float _2732 = _2576 * _2722;
    float _2734 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2738 = _2690 * _2720;
    float _2740 = _2708 * _2726;
    float _2742 = _2732 * _2734;
    float _2744 = _2690 * _2726;
    float _2746 = _2716 * 6.283185482025146484375;
    float _2748 = sin(_2746);
    float _2750 = _2708 * _2720;
    float _2752 = _2736 * _2742;
    float _2754 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2758 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2760 = _2732 * _2754;
    float _2762 = _2708 * _2730;
    float _2764 = _2726 * _2730;
    float _2766 = _2690 * _2730;
    float _2768 = _2720 * _2730;
    float _2770 = _2756 * _2760;
    float _2772 = _2762 * _2752;
    float _2774 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2776 = _2774 * 0.5;
    float _2778 = fma(_2748, _2740, _2738);
    float _2780 = -_2752;
    float _2782 = _2748 * _2780;
    float _2784 = -_2744;
    float _2786 = fma(_2748, _2750, _2784);
    float _2788 = -_2750;
    float _2790 = fma(_2748, _2744, _2788);
    float _2792 = fma(_2778, _2770, _2772);
    float _2794 = _2766 * _2752;
    float _2796 = fma(_2764, _2770, _2782);
    float _2798 = fma(_2748, _2738, _2740);
    float _2800 = fma(_2786, _2776, _2792);
    float _2802 = fma(_2790, _2770, _2794);
    float _2804 = fma(_2768, _2776, _2796);
    float _2806 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2808 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2810 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2812 = fma(_2798, _2776, _2802);
    float _2814 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2808);
    float _2818 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2810);
    float _2820 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2822 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2816);
    float _2824 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2818);
    float _2826 = -_2748;
    float _2828 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2820);
    float _2830 = _2822 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2832 = _2824 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2834 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2836 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2838 = _2208 + _2830;
    float _2840 = _2222 + _2832;
    float _2842 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2814);
    float _2844 = fma(_2758, _2758, 1.0);
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2852 = _2840 + _2850;
    float _2854 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2836);
    float _2856 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2858 = _2848 * _2848;
    float _2860 = _2852 * _2852;
    float _2862 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2854);
    float _2864 = rsqrt(_2844);
    float _2866 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2868 = _2858 + _2860;
    float _2870 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2872 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2834);
    float _2874 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2806);
    float _2876 = -_2748;
    float _2878 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2856);
    float _2880 = -_2748;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2866);
    float _2884 = sqrt(_2868);
    float _2886 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2888 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2890 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2892 = _2188 + _2870;
    float _2894 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2886);
    float _2896 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2888);
    float _2898 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2890);
    bool _2900 = _2884 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2902 = _2886;
    float _2904 = _2768;
    float _2906 = _2762;
    float _2908 = _2888;
    float _2910 = _2890;
    float _2912 = _2872;
    if (!_2900)
    {
        _2902 = _2860;
    }
    float _2914 = _2902;
    float _2916 = _2914;
    if (!_2900)
    {
        _2904 = _2858;
    }
    float _2918 = _2904;
    float _2920 = _2918;
    if (!_2900)
    {
        _2906 = _2838;
    }
    float _2922 = _2906;
    float _2924 = _2922;
    if (!_2900)
    {
        _2908 = _2840;
    }
    float _2926 = _2908;
    float _2928 = _2926;
    if (!_2900)
    {
        _2910 = _2892;
    }
    float _2930 = _2910;
    bool _2932 = !_2900;
    float _2934 = _2930;
    if (!_2932)
    {
        float _2936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2940 = _2884 + _2938;
        float _2942 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = rsqrt(_2868);
        float _2946 = _2940 * _2936;
        float _2948 = _2946 * 0.15915493667125701904296875;
        float _2950 = _2948 * 6.283185482025146484375;
        float _2952 = sin(_2950);
        float _2954 = _2948 * 6.283185482025146484375;
        float _2956 = cos(_2954);
        float _2958 = fma(_2952, _2942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2960 = _2944 * _2958;
        float _2962 = _2956 + (-1.0);
        float _2964 = fma(_2848, _2960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2966 = fma(_2852, _2960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2968 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2972 = _2964 + _2970;
        float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2976 = _2966 + _2974;
        float _2978 = fma(_2892, _2956, _2968);
        float _2980 = _2972 * _2972;
        float _2982 = _2976 * _2976;
        _2934 = _2978;
        _2920 = _2980;
        _2916 = _2982;
        _2924 = _2964;
        _2928 = _2966;
    }
    float _2984 = _2934;
    float _2986 = _2920;
    float _2988 = _2916;
    float _2990 = _2924;
    float _2992 = _2928;
    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2996 = _2984 + _2994;
    float _2998 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2878);
    float _3000 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2882);
    float _3002 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2828);
    float _3004 = fma(_2996, _2996, _2986);
    float _3006 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2894);
    float _3008 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2896);
    float _3010 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2898);
    float _3012 = _3004 + _2988;
    float _3014 = _2758 * _2864;
    float _3016 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2842);
    float _3018 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3020 = _2758 * _2998;
    float _3022 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2872);
    float _3024 = _2758 * _3000;
    float _3026 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2874);
    float _3028 = _2758 * _3002;
    float _3030 = -_3006;
    float _3032 = _3014 * _3030;
    float _3034 = -_3008;
    float _3036 = _3014 * _3034;
    float _3038 = -_3010;
    float _3040 = _3014 * _3038;
    float _3042 = fma(_3018, _3016, _3020);
    float _3044 = sqrt(_3012);
    float _3046 = fma(_3018, _3022, _3024);
    float _3048 = fma(_3018, _3026, _3028);
    float _3050 = fma(_2864, _2998, _3032);
    float _3052 = _3006 + _3042;
    float _3054 = fma(_2864, _3000, _3036);
    float _3056 = _3008 + _3046;
    float _3058 = fma(_2864, _3002, _3040);
    float _3060 = _3010 + _3048;
    out.m_74.x = _3016;
    out.m_74.y = _3022;
    out.m_74.z = _3026;
    out.m_76.x = _3050;
    out.m_76.y = _3054;
    out.m_76.z = _3058;
    bool _3062 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3064 = isnan(_3044);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3070 = _3066 || _3068;
    out.m_78.x = _3052;
    out.m_78.y = _3056;
    out.m_78.z = _3060;
    float _3072 = _2990;
    float _3074 = _3050;
    if (!_3070)
    {
        _2912 = 1.0;
    }
    float _3076 = _2912;
    bool _3078 = !_3070;
    float _3080 = _3076;
    if (!_3078)
    {
        bool _3082 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3084 = isnan(_3044);
        bool _3086 = _3082 || _3084;
        bool _3088 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3090 = _3086 || _3088;
        if (!_3090)
        {
            float _3092 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3094 = _3044 + _3092;
            float _3096 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3098 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3096;
            float _3100 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3104 = 1.0 / _3098;
            float _3106 = _3094 * _3104;
            float _3108 = fma(_3106, _3102, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3080 = _3108;
            _3110 = true;
        }
        else
        {
            bool _3112 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3114 = isnan(_3044);
            bool _3116 = _3112 || _3114;
            bool _3118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3120 = _3116 || _3118;
            if (!_3120)
            {
                float _3122 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3124 = _3044 + _3122;
                float _3126 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3128 = _3126 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3130 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3132 = _3130 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3134 = 1.0 / _3128;
                float _3136 = _3124 * _3134;
                float _3138 = fma(_3136, _3132, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3080 = _3138;
                _3110 = true;
            }
            else
            {
                _3080 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3110 = false;
    float _3140 = _3080;
    float _3142 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3144 = _2984 + _3142;
    float _3146 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3148 = _2990 + _3146;
    float _3150 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3152 = _2992 + _3150;
    float _3154 = fma(_3144, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3156 = fma(_3148, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3158 = fma(_3152, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3160 = -_2188;
    float _3162 = _3160 + _3154;
    float _3164 = -_2208;
    float _3166 = _3164 + _3156;
    float _3168 = -_2222;
    float _3170 = _3168 + _3158;
    float _3172 = _3162 * _3162;
    float _3174 = fma(_3166, _3166, _3172);
    float _3176 = fma(_3170, _3170, _3174);
    float _3178 = sqrt(_3176);
    bool _3180 = _3178 > 0.0;
    bool _3182 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3184 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan(0.5);
    bool _3190 = _3186 || _3188;
    float _3192 = _3156;
    if (!_3180)
    {
        _3072 = _3154;
    }
    float _3194 = _3072;
    float _3196 = _3194;
    if (!_3180)
    {
        _3074 = _3158;
    }
    float _3198 = _3074;
    bool _3200 = !_3180;
    float _3202 = _3198;
    float _3204 = _3198;
    if (!_3200)
    {
        float _3206 = _207 * _207;
        float _3208 = fma(_205, _205, _3206);
        float _3210 = fma(_209, _209, _3208);
        float _3212 = rsqrt(_3176);
        float _3214 = sqrt(_3210);
        float _3216 = _3166 * _3212;
        float _3218 = _3162 * _3212;
        float _3220 = _3170 * _3212;
        bool _3222 = _3214 > 0.0;
        float _3224 = _3214;
        if (!_3222)
        {
            _3224 = _3154;
        }
        float _3226 = _3224;
        _3196 = _3226;
        if (!_3222)
        {
            _3202 = _3158;
        }
        float _3228 = _3202;
        bool _3230 = !_3222;
        _3204 = _3228;
        if (!_3230)
        {
            float _3232 = rsqrt(_3210);
            float _3234 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3236 = _207 * _3232;
            float _3238 = _205 * _3232;
            float _3240 = _209 * _3232;
            float _3242 = _3218 * _3236;
            float _3244 = fma(_3216, _3238, _3242);
            float _3246 = _3234 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3248 = fma(_3220, _3240, _3244);
            float _3250 = _3248 * _3246;
            float _3252 = fma(_205, _3250, _3156);
            float _3254 = fma(_207, _3250, _3154);
            float _3256 = fma(_209, _3250, _3158);
            _3192 = _3252;
            _3196 = _3254;
            _3204 = _3256;
        }
    }
    float _3258 = _3192;
    float _3260 = _3196;
    float _3262 = _3204;
    float _3264 = -_2608;
    float _3266 = fma(_3264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3258);
    float _3268 = -_2606;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3260);
    float _3272 = -_2614;
    float _3274 = fma(_3272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3262);
    float _3276 = _3270;
    float _3278 = _3266;
    float _3280 = _3274;
    if (!_3190)
    {
        float _3282 = _2624 * _2624;
        float _3284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3286 = -_2222;
        float _3288 = _3286 + _3262;
        float _3290 = fma(_2632, _2632, _3282);
        float _3292 = fma(_2640, _2640, _3290);
        float _3294 = 1.0 / _2732;
        float _3296 = sqrt(_3292);
        float _3298 = precise::min(_3296, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3300 = _3298 * _3284;
        float _3302 = -_2208;
        float _3304 = _3302 + _3258;
        float _3306 = _3300 * _3294;
        float _3308 = -_2188;
        float _3310 = _3308 + _3260;
        float _3312 = fma(_3304, _3306, _2618);
        float _3314 = fma(_3310, _3306, _2612);
        float _3316 = fma(_3288, _3306, _2628);
        _3276 = _3314;
        _3278 = _3312;
        _3280 = _3316;
    }
    float _3318 = _3276;
    float _3320 = _3278;
    float _3322 = _3280;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3326 = _3318 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3330 = _3320 + _3328;
    float _3332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3334 = _3322 + _3332;
    float _3336 = _3326 * _3326;
    float _3338 = fma(_3330, _3330, _3336);
    float _3340 = fma(_3334, _3334, _3338);
    float _3342 = rsqrt(_3340);
    float _3344 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3346 = _3330 * _3344;
    float _3348 = _3334 * _3344;
    float _3350 = _3346 * _3346;
    float _3352 = _3348 * _3348;
    float _3354 = _3350 + _3352;
    float _3356 = sqrt(_3354);
    bool _3358 = _3356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3362 = _3356 + _3360;
    float _3364 = _3342;
    float _3366 = _3362;
    float _3368 = _3326;
    if (_3358)
    {
        float _3370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3364 = _3370;
    }
    float _3372 = _3364;
    if (_3358)
    {
        float _3374 = rsqrt(_3354);
        _2698 = _3374;
    }
    float _3376 = _2698;
    float _3378 = _3376;
    if (_3358)
    {
        float _3380 = _3362 * _3372;
        _3366 = _3380;
    }
    float _3382 = _3366;
    if (_3358)
    {
        float _3384 = _3382 * 0.15915493667125701904296875;
        _2700 = _3384;
    }
    float _3386 = _2700;
    float _3388 = _3334;
    float _3390 = _3386;
    if (_3358)
    {
        float _3392 = _3386 * 6.283185482025146484375;
        float _3394 = sin(_3392);
        _3388 = _3394;
    }
    float _3396 = _3388;
    float _3398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3400 = precise::max(0.0, _3398);
    float _3402 = _3372;
    float _3404 = _3400;
    if (_3358)
    {
        float _3406 = _3386 * 6.283185482025146484375;
        float _3408 = cos(_3406);
        _3402 = _3408;
    }
    float _3410 = _3402;
    float _3412 = -_3344;
    float _3414 = -_3400;
    float _3416 = fma(_3326, _3412, _3414);
    if (_3358)
    {
        float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3368 = _3418;
    }
    float _3420 = _3368;
    float _3422 = _3420;
    if (!_3358)
    {
        _3390 = _3352;
    }
    float _3424 = _3390;
    float _3426 = _3396;
    float _3428 = _3424;
    if (_3358)
    {
        float _3430 = fma(_3396, _3420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3422 = _3430;
    }
    float _3432 = _3422;
    float _3434 = _3432;
    if (!_3358)
    {
        _3426 = _3416;
    }
    float _3436 = _3426;
    float _3438 = _3436;
    float _3440 = _3410;
    if (_3358)
    {
        float _3442 = _3410 + (-1.0);
        _3404 = _3442;
    }
    float _3444 = _3404;
    float _3446 = _3444;
    if (_3358)
    {
        float _3448 = _3376 * _3432;
        _213 = _3448;
    }
    float _3450 = _213;
    if (!_3358)
    {
        _3378 = _3346;
    }
    float _3452 = _3378;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3456 = _3452;
    if (_3358)
    {
        float _3458 = _3444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3446 = _3458;
    }
    float _3460 = _3446;
    if (_3358)
    {
        float _3462 = _3346 * _3450;
        _3456 = _3462;
    }
    float _3464 = _3456;
    if (!_3358)
    {
        _3434 = _3348;
    }
    float _3466 = _3434;
    float _3468 = _3466;
    if (_3358)
    {
        float _3470 = _3348 * _3450;
        _3468 = _3470;
    }
    float _3472 = _3468;
    if (_3358)
    {
        float _3474 = fma(_3416, _3410, _3460);
        _3438 = _3474;
    }
    float _3476 = _3438;
    if (!_3358)
    {
        _3440 = _3350;
    }
    float _3478 = _3440;
    float _3480 = sqrt(_3340);
    float _3482 = _3478;
    if (_3358)
    {
        float _3484 = _3464 * _3464;
        _3482 = _3484;
    }
    float _3486 = _3482;
    if (_3358)
    {
        float _3488 = _3472 * _3472;
        _3428 = _3488;
    }
    float _3490 = _3428;
    float _3492 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3494 = fma(_3476, _3476, _3486);
    float _3496 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3498 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3500 = _3494 + _3490;
    float _3502 = floor(_3496);
    float _3504 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3498);
    float _3506 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3492);
    float _3508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3510 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3508);
    float _3512 = precise::clamp(_3510, 0.0, 1.0);
    float _3514 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3504);
    float _3516 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3506);
    float _3518 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3520 = rsqrt(_3500);
    float _3522 = _3514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3524 = -_3512;
    float _3526 = _3524 + 1.0;
    float _3528 = _3522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3530 = abs(_3526);
    float _3532 = log2(_3530);
    float _3534 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3536 = -_3528;
    float _3538 = fma(_3536, _3454, 1.0);
    float _3540 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3542 = -_3502;
    float _3544 = _3496 + _3542;
    float _3546 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3534);
    float _3548 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3540);
    float _3550 = _3520 * _3464;
    float _3552 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3546);
    float _3554 = _3520 * _3476;
    float _3556 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3548);
    float _3558 = _3520 * _3472;
    float _3560 = _3552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3562 = _3550 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3564 = _3556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3566 = log2(_3538);
    float _3568 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3570 = -_3562;
    float _3572 = fma(_3554, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3570);
    float _3574 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3576 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3578 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3568);
    float _3580 = -_3558;
    float _3582 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3572);
    float _3584 = floor(_3518);
    float _3586 = _3516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3588 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3578);
    float _3590 = fma(_3582, -0.5, 0.5);
    float _3592 = fma(_3582, 0.5, 0.5);
    float _3594 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3576);
    float _3596 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3588);
    float _3598 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3600 = exp2(_3574);
    float _3602 = _3554 + 1.0;
    float _3604 = _3566 * 0.693147182464599609375;
    float _3606 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3598);
    float _3608 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3594);
    float _3610 = 1.0 / _3596;
    float _3612 = -_3584;
    float _3614 = _3518 + _3612;
    float _3616 = fma(_3592, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3618 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3608);
    float _3620 = fma(_3592, _3616, -0.212114393711090087890625);
    float _3622 = sqrt(_3590);
    float _3624 = -_3554;
    float _3626 = fma(_3600, _3602, _3624);
    float2 _9650 = float2(_3544, _3614);
    float _3628 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9650, float2(0.0), isnan(_9650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9650, float2(0.0), isnan(_9650)), level(0.0)).x;
    float _3630 = fma(_3592, _3620, 1.570728778839111328125);
    float _3632 = fma(_3626, 0.5, 0.5);
    float _3634 = _3618 * _3610;
    float _3636 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3606);
    float _3638 = fma(_3634, -0.5, 0.5);
    float _3640 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3636);
    float _3642 = _3622 * 0.636619746685028076171875;
    float _3644 = _3640 * _3610;
    float _3646 = _3604 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3648 = -_3630;
    float _3650 = fma(_3642, _3648, 1.0);
    float _3652 = fma(_3644, 0.5, 0.5);
    float3 _9699 = float3(_3652, _3638, _3646);
    float _3654 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9699, float3(0.0), isnan(_9699)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9699, float3(0.0), isnan(_9699)), level(0.0)).x;
    float3 _9710 = float3(_3652, _3638, _3646);
    float4 _3657 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9710, float3(0.0), isnan(_9710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9710, float3(0.0), isnan(_9710)), level(0.0)).xyzw;
    float _3659 = _3657.x;
    float _3661 = _3657.y;
    float _3663 = _3657.z;
    float _3665 = _3657.w;
    float2 _9726 = float2(_3650, _3632);
    float3 _3669 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9726, float2(0.0), isnan(_9726)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9726, float2(0.0), isnan(_9726)), level(0.0)).xyz;
    float _3671 = _3669.x;
    float _3673 = _3669.y;
    float _3675 = _3669.z;
    float _3677 = _2612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3679 = _2612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3681 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _3320;
    out.m_80.y = _3318;
    out.m_80.z = _3322;
    float _3683 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3677);
    float _3685 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3679);
    float _3687 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3681);
    float _3689 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3691 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3683);
    float _3693 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3685);
    float _3695 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3687);
    float _3697 = _3691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3699 = _3693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3701 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3695);
    float _3703 = 1.0 / _3697;
    float _3705 = _3699 + _3697;
    float _3707 = in.m_82.x;
    bool _3709 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3711 = isnan(_3480);
    bool _3713 = _3709 || _3711;
    bool _3715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3717 = _3713 || _3715;
    float _3719 = _3705 * _3703;
    float _3721 = _3719 * 0.5;
    float _3723 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3725 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3723);
    float _3727 = 1.0 / _3725;
    out.gl_Position.x = _3640;
    out.gl_Position.y = _3618;
    out.gl_Position.z = _3701;
    out.gl_Position.w = _3596;
    float _3729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3731 = _3727 * _3729;
    float _3733 = abs(_3731);
    float _3735 = log2(_3733);
    bool _3737 = _3731 <= 8000.0;
    bool _3739 = isnan(_3731);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan(8000.0);
    bool _3745 = _3741 || _3743;
    float _3747 = float(_3745);
    float _3749 = _3640;
    if (!_3717)
    {
        _3749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3751 = _3749;
    float _3753 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3755 = exp2(_3753);
    float _3757 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3759 = precise::clamp(_3757, 0.0, 1.0);
    float _3761 = fma(_3759, -2.0, 3.0);
    float _3763 = _3759 * _3759;
    float _3765 = _3763 * _3761;
    float _3767 = exp2(_3689);
    float _3769 = -_3765;
    float _3771 = _3769 + 1.0;
    float _3773 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3765);
    float _3775 = _3701 + _3596;
    float _3777 = _3747 * _3773;
    float _3779 = _3775 * 0.5;
    float _3781 = _3777 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3783 = -_3767;
    float _3785 = _3783 + 1.0;
    out.m_84.z = _3779;
    out.m_84.w = _3596;
    float _3787 = _3785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3789 = -_3787;
    float _3791 = _3789 + 1.0;
    float _3793 = _3596;
    float _3795 = _3791;
    float _3797 = _3751;
    float _3799 = _3751;
    if (!_3717)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3801 = _3793;
    float _3803 = -_3628;
    float _3805 = _3803 + 1.0;
    float _3807 = _3805 * _3781;
    float _3809 = precise::clamp(_3807, 0.0, 1.0);
    float _3811 = -_3809;
    float _3813 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3815 = _3813 * _3707;
    float _3817 = _3815 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3817;
    float _3819 = _3787 * _3654;
    float _3821 = _3665 * _3819;
    float _3823 = _3675 * _3819;
    float _3825 = _3665 * _3791;
    float _3827 = _3661;
    float _3829 = _3659;
    float _3831 = _3821;
    float _3833 = _3801;
    float _3835 = _3801;
    if (!_3717)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3837 = _3795;
    float _3839 = fma(_3671, _3821, _3659);
    float _3841 = fma(_3673, _3821, _3661);
    float _3843 = fma(_3665, _3823, _3663);
    float _3845 = _3837;
    float _3847 = _3837;
    if (!_3717)
    {
        _3827 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3849 = _3827;
    float _3851 = _3849;
    float _3853 = _3849;
    if (!_3717)
    {
        _3829 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3855 = _3829;
    out.m_88.x = _3839;
    out.m_88.y = _3841;
    out.m_88.z = _3843;
    out.m_88.w = _3825;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3717)
    {
        _3831 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3861 = _3831;
    bool _3863 = !_3717;
    float _3865 = _3861;
    float _3867 = _3861;
    if (!_3863)
    {
        bool _3869 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3871 = isnan(_3480);
        bool _3873 = _3869 || _3871;
        bool _3875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3877 = _3873 || _3875;
        if (!_3877)
        {
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3881 = _3480 + _3879;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3883;
            float _3887 = 1.0 / _3885;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3909 = _3881 * _3887;
            float _3911 = precise::clamp(_3909, 0.0, 1.0);
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3917 = fma(_3911, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3919 = fma(_3911, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3921 = fma(_3911, _3895, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3923 = fma(_3911, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3925 = fma(_3911, _3903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3927 = fma(_3911, _3907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3835 = _3919;
            _3859 = _3925;
            _3799 = _3917;
            _3853 = _3923;
            _3847 = _3921;
            _3867 = _3927;
            _3929 = true;
        }
        else
        {
            bool _3931 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3933 = isnan(_3480);
            bool _3935 = _3931 || _3933;
            bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3939 = _3935 || _3937;
            if (!_3939)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3941 = _3797;
            _3799 = _3941;
            if (!_3939)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3943 = _3833;
            _3835 = _3943;
            if (!_3939)
            {
                _3845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3945 = _3845;
            _3847 = _3945;
            if (!_3939)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3947 = _3851;
            _3853 = _3947;
            if (!_3939)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3949 = _3857;
            _3859 = _3949;
            if (!_3939)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3951 = _3865;
            bool _3953 = !_3939;
            _3867 = _3951;
            if (!_3953)
            {
                bool _3955 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3957 = isnan(_3480);
                bool _3959 = _3955 || _3957;
                bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3963 = _3959 || _3961;
                if (!_3963)
                {
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3967 = _3480 + _3965;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3969;
                    float _3973 = 1.0 / _3971;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3995 = _3967 * _3973;
                    float _3997 = precise::clamp(_3995, 0.0, 1.0);
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4003 = fma(_3997, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4005 = fma(_3997, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4007 = fma(_3997, _3981, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4009 = fma(_3997, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4011 = fma(_3997, _3989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4013 = fma(_3997, _3993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3835 = _4005;
                    _3859 = _4011;
                    _3799 = _4003;
                    _3853 = _4009;
                    _3847 = _4007;
                    _3867 = _4013;
                    _3929 = true;
                }
                else
                {
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3929 = false;
    float _4015 = _3835;
    float _4017 = _3859;
    float _4019 = _3799;
    float _4021 = _3853;
    float _4023 = _3847;
    float _4025 = _3867;
    float _4027 = fma(_3056, -0.5, 0.5);
    float _4029 = precise::clamp(_4027, 0.0, 1.0);
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    float _4035 = -_4019;
    float _4037 = _4035 + _4021;
    float _4039 = -_4023;
    float _4041 = _4039 + _4025;
    bool _4043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4045 = fma(_4029, _4033, _4015);
    float _4047 = fma(_4029, _4037, _4019);
    float _4049 = fma(_4029, _4041, _4023);
    float _4051 = _4045 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _4053 = fma(_4047, 0.298911988735198974609375, _4051);
    float _4055 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4057 = fma(_4049, 0.114477999508380889892578125, _4053);
    out.m_51.x = _4055;
    float _4059 = -_4057;
    float _4061 = _4047 + _4059;
    float _4063 = -_4057;
    float _4065 = _4045 + _4063;
    float _4067 = -_4057;
    float _4069 = _4049 + _4067;
    float _4071 = fma(_4061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    float _4073 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    float _4075 = fma(_4069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    out.m_92.x = _4071;
    out.m_92.y = _4073;
    out.m_92.z = _4075;
    if (!_4043)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4077 = -_3318;
    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4081 = -_3320;
    float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4085 = -_3322;
    float _4087 = _4085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4089 = _4079 * _4079;
    float _4091 = fma(_4083, _4083, _4089);
    float _4093 = fma(_4087, _4087, _4091);
    float _4095 = sqrt(_4093);
    float _4097 = rsqrt(_4093);
    float _4099 = -_4095;
    float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4103 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4105 = precise::clamp(_4103, 0.0, 1.0);
    float _4107 = _4083 * _4097;
    float _4109 = _4079 * _4097;
    float _4111 = abs(_4105);
    float _4113 = log2(_4111);
    float _4115 = _4087 * _4097;
    float _4117 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4119 = _3056 * _4109;
    float _4121 = -_4109;
    float _4123 = -_4117;
    float _4125 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4123);
    float _4127 = fma(_3052, _4107, _4119);
    float _4129 = -_4115;
    float _4131 = fma(_4129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4125);
    float _4133 = fma(_3060, _4115, _4127);
    float _4135 = precise::clamp(_4133, 0.0, 1.0);
    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4139 = _4131 + _4137;
    float _4141 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4143 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4145 = precise::clamp(_4143, 0.0, 1.0);
    float _4147 = exp2(_4141);
    float _4149 = _4147 * _4145;
    float _4151 = _4135 * _4149;
    float _4153 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4155 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4157 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4153;
    out.m_90.y = _4155;
    out.m_90.z = _4157;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3929 = false;
    bool _3110 = false;
    bool _945 = false;
    bool _777 = false;
    bool _557 = false;
    bool _381 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_48.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4214 = as_type<float>(_127);
        out.gl_Position.z = _4214;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4284 = as_type<float>(_165);
        out.gl_Position.z = _4284;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _209;
    float _231;
    if (!_211)
    {
        float _215 = in.m_60.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_111);
        float _237 = 1.0 / _235;
        float _239 = _145 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    bool _259 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _261 = isnan(_241);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _275 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = -_257;
    float _281 = _279 + 1.0;
    float _283 = 1.0 / _273;
    bool _285 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_241);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _269 * _281;
    float _299 = -_269;
    float _301 = _299 + 1.0;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _305 = _295 * _301;
    float _307 = 1.0 / _277;
    float _309 = -_295;
    float _311 = _309 + 1.0;
    float _313 = _245 * _283;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _241 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = fma(_321, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = fma(_325, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = _317 * _307;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _327 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = _329 * _305;
    float _345 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[143].x, _337);
    float _349 = fma(_341, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _351 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _353 = fma(_345, _297, _347);
    float _355 = fma(_349, _297, _351);
    float _357 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    bool _361 = !_303;
    float _379;
    if (!_361)
    {
        float _363 = in.m_60.x;
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _363 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        float _383 = float(_111);
        float _385 = 1.0 / _383;
        float _387 = _145 * _385;
        _379 = _387;
    }
    _381 = false;
    float _389 = _379;
    float _391 = in.m_62.x;
    float _393 = in.m_62.y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _389 + _395;
    bool _399 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_389);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _419 = 1.0 / _413;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _423 = 1.0 / _417;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _425;
    float _429 = _397 * _419;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _389 + _431;
    bool _435 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _437 = isnan(_389);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = _359 * _393;
    bool _449 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _451 = isnan(_389);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_409;
    float _463 = _461 + 1.0;
    float _465 = fma(_427, _429, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _467 = _357 * _391;
    float _469 = _433 * _423;
    float _471 = _459 * _463;
    float _473 = -_459;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _481;
    float _485 = _445 * _475;
    float _487 = fma(_479, _429, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_483, _429, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _491 = -_445;
    float _493 = _491 + 1.0;
    float _495 = _465 * _485;
    float _497 = _487 * _485;
    float _499 = _489 * _485;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].x, _499);
    float _515 = fma(_503, _469, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _517 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _519 = fma(_507, _469, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _521 = fma(_511, _469, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _523 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _525 = fma(_515, _471, _517);
    float _527 = fma(_519, _471, _513);
    float _529 = fma(_521, _471, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _525);
    float _533 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _527);
    float _535 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _529);
    bool _537 = !_421;
    float _555;
    if (!_537)
    {
        float _539 = in.m_60.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_111);
        float _561 = 1.0 / _559;
        float _563 = _145 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _565 + _567;
    float _571 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = isnan(_565);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = 1.0 / _575;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _603 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _605 = isnan(_565);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _621 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_565);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = 1.0 / _579;
    float _637 = -_613;
    float _639 = _637 + 1.0;
    float _641 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _591 * _639;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _651 = _595 * _597;
    bool _653 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_565);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -_591;
    float _667 = _665 + 1.0;
    float _669 = 1.0 / _601;
    float _671 = fma(_651, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _673;
    float _677 = _663 * _667;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _687 = 1.0 / _619;
    float _689 = _631 * _681;
    float _691 = _685 * _635;
    float _693 = -_631;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _699 = _565 + _697;
    float _701 = _671 * _689;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = _565 + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _711 = _675 * _669;
    bool _713 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _715 = isnan(_565);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_691, _705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _729 = fma(_711, _699, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _733 = _565 + _731;
    float _735 = -_723;
    float _737 = _735 + 1.0;
    float _739 = fma(_725, _677, _727);
    float _741 = _709 * _687;
    float _743 = _613 * _737;
    float _745 = fma(_729, _647, _739);
    float _747 = fma(_741, _733, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _749 = fma(_747, _743, _745);
    float _751 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[119].x, _749);
    float _753 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _641;
    out.m_64.y = _643;
    out.m_64.z = _645;
    out.m_64.w = _753;
    bool _755 = !_649;
    float _757 = _647;
    float _775;
    if (!_755)
    {
        float _759 = in.m_60.x;
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _763 = _759 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _767 = _765 * _761;
        float _769 = floor(_767);
        float _771 = -_769;
        float _773 = _767 + _771;
        _775 = _773;
        _777 = true;
    }
    else
    {
        float _779 = float(_111);
        float _781 = 1.0 / _779;
        float _783 = _145 * _781;
        _775 = _783;
    }
    _777 = false;
    float _785 = _775;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _789 = _785 + _787;
    bool _791 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _793 = isnan(_785);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _805 = _785 + _803;
    bool _807 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _809 = isnan(_785);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _819;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _827 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _829 = isnan(_785);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -_801;
    float _841 = _839 + 1.0;
    float _843 = 1.0 / _825;
    float _845 = _837 * _841;
    float _847 = -_837;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _851;
    bool _855 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _857 = 1.0 / _821;
    float _859 = _817 * _849;
    float _861 = -_817;
    float _863 = _861 + 1.0;
    float _865 = _789 * _857;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _871;
    float _875 = fma(_853, _865, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _877 = fma(_869, _865, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _879 = fma(_873, _865, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _881 = _805 * _843;
    float _883 = _875 * _859;
    float _885 = _877 * _859;
    float _887 = _879 * _859;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _901 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].x, _883);
    float _903 = fma(_891, _881, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _905 = fma(_895, _881, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _907 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].y, _885);
    float _909 = fma(_899, _881, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _911 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].z, _887);
    float _913 = fma(_903, _845, _901);
    float _915 = fma(_905, _845, _907);
    float _917 = fma(_909, _845, _911);
    float _919 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].x, _913);
    float _921 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].y, _915);
    float _923 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].z, _917);
    bool _925 = !_855;
    float _943;
    if (!_925)
    {
        float _927 = in.m_60.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_111);
        float _949 = 1.0 / _947;
        float _951 = _145 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    float _955 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _957 = int(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _961 = _953 + _959;
    float _963 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _973 = int(_971);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _977 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = float(_957);
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _983 = int(_981);
    if (_967)
    {
        float _985 = in.m_60.x;
        _757 = _985;
    }
    float _987 = _757;
    float _989 = _987;
    if (!_967)
    {
        float _991 = in.m_60.y;
        _989 = _991;
    }
    float _993 = _989;
    float _995 = float(uint(_973));
    float _997 = 1.0 / _979;
    int _999 = ~_973;
    int _1001 = _999 + 1;
    bool _1003 = _973 == 0;
    float _1005 = 1.0 / _995;
    float _1007 = float(_983);
    float _1009 = _997 * _145;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1013 = int(_1011);
    int _1015 = as_type<int>(_1005) + (-2);
    float _1017 = trunc(_1009);
    int _1019 = int(_1017);
    float _1021 = 1.0 / _1007;
    float _1023 = float(uint(_1013));
    int _1025 = ~_1013;
    int _1027 = _1025 + 1;
    int _1029 = ~_1013;
    int _1031 = _1029 + 1;
    float _1033 = float(uint(_1019));
    float _1035 = 1.0 / _1023;
    float _1037 = as_type<float>(_1015) * _1033;
    float _1039 = in.m_60.x;
    float _1041 = in.m_60.y;
    float _1043 = in.m_60.z;
    float _1045 = in.m_60.w;
    float _1047 = _1021 * _145;
    float _1049 = trunc(_1037);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    float _1056 = trunc(_1047);
    int _1058 = int(_1056);
    int _1060 = as_type<int>(_1035) + (-2);
    float _1062 = _1037;
    if (_967)
    {
        _1062 = 1.0;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (!_967)
    {
        _1066 = 1.2345600128173828125;
    }
    float _1068 = _1066;
    int _1070 = _1001 * int(_1054);
    int _1072 = _1070 + _1019;
    float _1074 = _993 * _1068;
    float _1076 = float(uint(_1072));
    float _1078 = floor(_1074);
    float _1080 = as_type<float>(_1072);
    if (_967)
    {
        _1080 = 1.0;
    }
    float _1082 = _1080;
    float _1084 = float(uint(_1058));
    float _1086 = as_type<float>(_1015) * _1076;
    float _1088 = _1082;
    int _1090 = as_type<int>(_1045);
    if (!_967)
    {
        _1088 = 7.345489978790283203125;
    }
    float _1092 = _1088;
    float _1094 = as_type<float>(_1060) * _1084;
    float _1096 = trunc(_1086);
    float _1098 = precise::max(_1096, 0.0);
    uint _1100 = uint(_1098);
    float _1102 = _1092 * _1039;
    float _1104 = -_1078;
    float _1106 = _1074 + _1104;
    float _1108 = trunc(_1094);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = floor(_1102);
    int _1116 = int(_1054) + int(_1100);
    float _1118 = float(_111);
    float _1120 = float(_973);
    int _1122 = _1027 * int(_1112);
    int _1124 = _1122 + _1058;
    int _1126 = ~_973;
    int _1128 = _1126 + 1;
    float _1130 = 1.0 / _1118;
    float _1132 = float(uint(_1124));
    float _1134 = -_1114;
    float _1136 = _1102 + _1134;
    int _1138 = _1128 * _1116;
    int _1140 = _1138 + _1019;
    float _1142 = float(_1013);
    float _1144 = as_type<float>(_1060) * _1132;
    float _1146 = _1136 * _1120;
    bool _1148 = uint(_1140) >= uint(_973);
    float _1150 = trunc(_1144);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = float(_1019);
    bool _1158 = !_1148;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1164 = _1162 != 0;
    int _1166 = ~_1116;
    int _1168 = _1166 + _1160;
    int _1170 = _1168 + 1;
    float _1172 = trunc(_1146);
    int _1174 = int(_1172);
    bool _1176 = _1156 >= _1120;
    bool _1178 = isnan(_1156);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1120);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _1130 * _145;
    bool _1190 = !_1164;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _1106 * _1142;
    float _1196 = float(_1058);
    float _1198 = _1120 * _1188;
    int _1200 = abs(_1192);
    float _1202 = trunc(_1186);
    int _1204 = int(_1202);
    int _1206 = int(_1112) + int(_1154);
    float _1208 = _1142 * _1188;
    bool _1210 = _1196 >= _1142;
    bool _1212 = isnan(_1196);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1142);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    int _1222 = _1174 * _1200;
    int _1224 = _1222 + _1019;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1228 = _1226 != 0;
    int _1230 = _973 * _1170;
    int _1232 = _1230 + _1019;
    float _1234 = trunc(_1194);
    int _1236 = int(_1234);
    int _1238 = _1031 * _1206;
    int _1240 = _1238 + _1058;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1252 = _1250 != 0;
    bool _1254 = !_1003;
    int _1256 = _1254 ? _1232 : (-1);
    int _1258 = ~_1204;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    bool _1264 = !_1228;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = trunc(_1198);
    int _1270 = int(_1268);
    bool _1272 = uint(_1240) >= uint(_1013);
    int _1274 = _1256 * _1262;
    int _1276 = abs(_1266);
    bool _1278 = !_1248;
    int _1280 = _1278 ? 0 : 1;
    bool _1282 = !_1272;
    int _1284 = _1282 ? 0 : (-1);
    float _1286 = trunc(_1220);
    int _1288 = int(_1286);
    int _1290 = _973 + (-1);
    int _1292 = _1236 * _1276;
    int _1294 = _1292 + _1058;
    int _1296 = abs(_1280);
    int _1298 = ~_1206;
    int _1300 = _1298 + _1284;
    int _1302 = _1300 + 1;
    int _1304 = _1204 * _1290;
    int _1306 = _1304 + _1274;
    bool _1308 = !_1244;
    int _1310 = _1308 ? 0 : 1;
    float _1312 = trunc(_1208);
    int _1314 = int(_1312);
    int _1316 = _1013 * _1302;
    int _1318 = _1316 + _1058;
    bool _1320 = !_1252;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = abs(_1310);
    int _1326 = _1306 * _1296;
    bool _1328 = _1013 == 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1332 = _1330 != 0;
    int _1334 = _1270 * _1324;
    int _1336 = _1334 + _1326;
    int _1338 = abs(_1322);
    int _1340 = ~_1288;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    bool _1346 = !_1328;
    int _1348 = _1346 ? _1318 : (-1);
    bool _1350 = !_1332;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = _1348 * _1344;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    int _1372 = abs(_1352);
    int _1374 = _1224 * _1338;
    int _1376 = _1374 + _1336;
    int _1378 = _1013 + (-1);
    bool _1380 = !_1362;
    int _1382 = _1380 ? 0 : 1;
    int _1384 = _1174 * _1372;
    int _1386 = _1384 + _1376;
    bool _1388 = _973 == 0;
    int _1390 = _1288 * _1378;
    int _1392 = _1390 + _1354;
    int _1394 = abs(_1382);
    bool _1396 = !_1366;
    int _1398 = _1396 ? 0 : 1;
    bool _1400 = !_1358;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = abs(_1398);
    int _1406 = abs(_1402);
    int _1408 = _1392 * _1394;
    float _1410 = float(uint(_1386));
    bool _1412 = !_1370;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _1314 * _1406;
    int _1418 = _1416 + _1408;
    float _1420 = float(uint(_1224));
    float _1422 = as_type<float>(_1015) * _1410;
    int _1424 = abs(_1414);
    float _1426 = trunc(_1422);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = as_type<float>(_1015) * _1420;
    int _1434 = _1294 * _1404;
    int _1436 = _1434 + _1418;
    int _1438 = ~_973;
    int _1440 = _1438 + 1;
    int _1442 = _1236 * _1424;
    int _1444 = _1442 + _1436;
    int _1446 = ~_1013;
    int _1448 = _1446 + 1;
    int _1450 = ~_973;
    int _1452 = _1450 + 1;
    float _1454 = float(uint(_1444));
    int _1456 = _1440 * int(_1430);
    int _1458 = _1456 + _1386;
    float _1460 = as_type<float>(_1060) * _1454;
    float _1462 = float(uint(_1458));
    float _1464 = trunc(_1460);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    float _1470 = as_type<float>(_1015) * _1462;
    float _1472 = trunc(_1470);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    int _1478 = _1448 * int(_1468);
    int _1480 = _1478 + _1444;
    float _1482 = float(uint(_1480));
    int _1484 = int(_1430) + int(_1476);
    float _1486 = as_type<float>(_1060) * _1482;
    int _1488 = ~_1013;
    int _1490 = _1488 + 1;
    float _1492 = trunc(_1486);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    int _1498 = _1452 * _1484;
    int _1500 = _1498 + _1386;
    bool _1502 = uint(_1500) >= uint(_973);
    bool _1504 = !_1502;
    int _1506 = _1504 ? 0 : (-1);
    int _1508 = ~_1484;
    int _1510 = _1508 + _1506;
    int _1512 = _1510 + 1;
    int _1514 = int(_1468) + int(_1496);
    float _1516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1518 = log2(_1516);
    int _1520 = _973 * _1512;
    int _1522 = _1520 + _1386;
    int _1524 = _1490 * _1514;
    int _1526 = _1524 + _1444;
    bool _1528 = !_1388;
    int _1530 = _1528 ? _1522 : (-1);
    bool _1532 = uint(_1526) >= uint(_1013);
    int _1534 = _1530 & 3;
    bool _1536 = _1534 != 0;
    bool _1538 = !_1532;
    int _1540 = _1538 ? 0 : (-1);
    bool _1542 = uint(_1534) > 1u;
    int _1544 = _1530 & 3;
    bool _1546 = _1544 != 0;
    int _1548 = ~_1514;
    int _1550 = _1548 + _1540;
    int _1552 = _1550 + 1;
    int _1554 = _1546 ? 0 : 1;
    bool _1556 = _1534 != 3;
    int _1558 = _1013 * _1552;
    int _1560 = _1558 + _1444;
    bool _1562 = uint(_1534) >= 2u;
    float _1564 = _1039 * 2.0;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1568 = _1566 != 0;
    int _1570 = _1562 ? 0 : 1;
    float _1572 = floor(_1564);
    bool _1574 = _1045 > 0.5;
    int _1576 = ~_1554;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    bool _1582 = !_1328;
    int _1584 = _1582 ? _1560 : (-1);
    int _1586 = _1580;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1542)
    {
        int _1590 = ~_1554;
        int _1592 = _1590 + 1;
        _1586 = _1592;
    }
    int _1594 = _1586;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1598 = _1596 != 0;
    float _1600 = -_203;
    int _1602 = _1574 ? as_type<int>(_1600) : as_type<int>(_203);
    int _1604 = _1584 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = ~_1570;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    bool _1614 = !_1598;
    int _1616 = _1614 ? 0 : 1;
    int _1618 = _1612;
    if (_1556)
    {
        int _1620 = ~_1570;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    float _1626 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1628 = _1584 & 3;
    bool _1630 = _1628 != 0;
    bool _1632 = uint(_1604) > 1u;
    float _1634 = -_975;
    float _1636 = fma(_1626, 2.0, _1634);
    if (_1568)
    {
        _1090 = 0;
    }
    int _1638 = _1090;
    bool _1640 = uint(_1604) >= 2u;
    float _1642 = -_145;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1636);
    int _1646 = _1638;
    if (!_1568)
    {
        _1646 = 1;
    }
    int _1648 = _1646;
    int _1650 = _1630 ? 0 : 1;
    bool _1652 = _1604 != 3;
    int _1654 = _1640 ? 0 : 1;
    bool _1656 = _1648 != 1;
    int _1658 = ~_1650;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1662;
    if (!_1632)
    {
        int _1666 = ~_1650;
        int _1668 = _1666 + 1;
        _1664 = _1668;
    }
    int _1670 = _1664;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1674 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1676 = _1039 > 0.5;
    int _1678 = ~_1654;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1674, -2.0, _1672);
    int _1686 = _1682;
    float _1688 = _1672;
    float _1690 = _1674;
    if (_1652)
    {
        int _1692 = ~_1654;
        int _1694 = _1692 + 1;
        _1686 = _1694;
    }
    int _1696 = _1686;
    float _1698 = -_193;
    int _1700 = _1676 ? as_type<int>(_1698) : as_type<int>(_193);
    float _1702 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1684);
    bool _1704 = _1572 > 0.0;
    bool _1706 = _1572 >= 0.0;
    bool _1708 = isnan(_1572);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan(0.0);
    bool _1714 = _1710 || _1712;
    float _1716 = _1518 * _145;
    if (!_1656)
    {
        _1688 = _1043;
    }
    float _1718 = _1688;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1722 = _1718;
    if (_1656)
    {
        _1722 = _1041;
    }
    float _1724 = _1722;
    float _1726 = exp2(_1716);
    if (!_1656)
    {
        _1690 = _1041;
    }
    float _1728 = _1690;
    float _1730 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1720);
    float _1732 = float(uint(_1294));
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1736 = _1728;
    float _1738 = _1734;
    if (_1656)
    {
        _1736 = _1039;
    }
    float _1740 = _1736;
    float _1742 = trunc(_1432);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    if (!_1656)
    {
        _1588 = _1041;
    }
    float _1748 = _1588;
    float _1750 = as_type<float>(_1060) * _1732;
    float _1752 = _1748;
    if (_1656)
    {
        _1752 = _1039;
    }
    float _1754 = _1752;
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1734);
    if (!_1656)
    {
        _1738 = _1043;
    }
    float _1758 = _1738;
    float _1760 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1730);
    float _1762 = _1758;
    if (_1656)
    {
        _1762 = _1041;
    }
    float _1764 = _1762;
    float _1766 = trunc(_1750);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = -_1726;
    float _1774 = _1772 + 1.0;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1778 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1792 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1794 = -_1776;
    float _1796 = fma(_1778, 2.0, _1794);
    float _1798 = _1788 ? _1774 : 0.0;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1802 = 1.0 + _1800;
    float _1804 = fma(_1792, -2.0, _1790);
    bool _1806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1808 = isnan(1.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1814 = _1810 || _1812;
    float _1816 = 1.0 / _1802;
    int _1818 = ~_973;
    int _1820 = _1818 + 1;
    float _1822 = -_145;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1796);
    int _1826 = _1031 * int(_1770);
    int _1828 = _1826 + _1294;
    float _1830 = _1041 * 2.0;
    float _1832 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1756);
    float _1834 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1804);
    int _1836 = _1820 * int(_1746);
    int _1838 = _1836 + _1224;
    float _1840 = floor(_1830);
    float _1842 = float(uint(_1828));
    int _1844 = _1714 ? 0 : 1;
    float _1846 = float(uint(_1838));
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1852 = as_type<float>(_1060) * _1842;
    int _1854 = ~_1844;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_1015) * _1846;
    float _1862 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1848);
    float _1864 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1850);
    float _1866 = trunc(_1852);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    int _1872 = _1858;
    if (!_1704)
    {
        int _1874 = ~_1844;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    float _1880 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1862);
    float _1882 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1864);
    if (_1814)
    {
        float _1884 = _1798 * _1816;
        _147 = _1884;
    }
    float _1886 = _147;
    bool _1888 = _1840 > 0.0;
    bool _1890 = _1840 >= 0.0;
    bool _1892 = isnan(_1840);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(0.0);
    bool _1898 = _1894 || _1896;
    float _1900 = trunc(_1860);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    bool _1906 = _1041 > 0.5;
    float _1908 = -_203;
    int _1910 = _1906 ? as_type<int>(_1908) : as_type<int>(_203);
    bool _1912 = _1043 > 0.5;
    int _1914 = _1898 ? 0 : 1;
    int _1916 = int(_1770) + int(_1870);
    int _1918 = ~_1914;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1926 = _1924 != 0;
    int _1928 = _1922;
    if (!_1888)
    {
        int _1930 = ~_1914;
        int _1932 = _1930 + 1;
        _1928 = _1932;
    }
    int _1934 = _1928;
    int _1936 = int(_1746) + int(_1904);
    float _1938 = -_193;
    int _1940 = _1912 ? as_type<int>(_1938) : as_type<int>(_193);
    float _1942 = in.m_48.x;
    float _1944 = in.m_48.y;
    float _1946 = in.m_48.z;
    int _1948 = ~_973;
    int _1950 = _1948 + 1;
    int _1952 = ~_1013;
    int _1954 = _1952 + 1;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1958 = _1956 != 0;
    int _1960 = _1950 * _1936;
    int _1962 = _1960 + _1224;
    bool _1964 = !_1926;
    float _1966 = _1964 ? _193 : as_type<float>(_1700);
    int _1968 = _1954 * _1916;
    int _1970 = _1968 + _1294;
    bool _1972 = !_1958;
    float _1974 = _1972 ? _203 : as_type<float>(_1602);
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1982 = _1980 != 0;
    float _1984 = _1974 + (-0.5);
    bool _1986 = !_1978;
    float _1988 = _1986 ? _203 : as_type<float>(_1910);
    float _1990 = -_1984;
    float _1992 = -_1834;
    float _1994 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1992);
    bool _1996 = !_1982;
    float _1998 = _1996 ? _193 : as_type<float>(_1940);
    float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2004 = uint(_1962) >= uint(_973);
    bool _2006 = uint(_1970) >= uint(_1013);
    float _2008 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2010 = 1.0 / _2002;
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2020 = _2018 != 0;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2024 = _2022 != 0;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2028 = _2026 != 0;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2036 = _2034 != 0;
    float _2038 = _1043 * 2.0;
    float _2040 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2042 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2008);
    float _2044 = 1.0 / _2032;
    float _2046 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2016);
    float _2048 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2040);
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2050;
    float _2054 = _1039 + _1041;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2060 = _2052 * _2010;
    float _2062 = floor(_2038);
    float _2064 = _1043 + _1041;
    float _2066 = _2054 + (-1.0);
    bool _2068 = !_2006;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2042);
    float _2074 = _2064 + (-1.0);
    float _2076 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2078 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2080 = isnan(_953);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = _2058 * _2044;
    float _2092 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2046);
    bool _2094 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2096 = isnan(_953);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = -_2088;
    float _2108 = _2106 + 1.0;
    bool _2110 = !_2020;
    int _2112 = _2110 ? 0 : 1;
    float _2114 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2116 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2118 = isnan(_953);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = -_2104;
    float _2130 = _2128 + 1.0;
    bool _2132 = _2062 >= 0.0;
    bool _2134 = isnan(_2062);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(0.0);
    bool _2140 = _2136 || _2138;
    float _2142 = fma(_2060, _961, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2146 = _953 + _2144;
    float _2148 = _2126 * _2130;
    int _2150 = _2140 ? 0 : 1;
    float _2152 = -_2126;
    float _2154 = _2152 + 1.0;
    bool _2156 = _2062 > 0.0;
    float _2158 = _2104 * _2108;
    float _2160 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2048);
    float _2162 = _1988 + (-0.5);
    float _2164 = _2142 * _2148;
    int _2166 = abs(_2112);
    float _2168 = fma(_2090, _2146, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2170 = -_2162;
    float _2172 = -_1702;
    float _2174 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2172);
    int _2176 = ~_2150;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    float _2182 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2164);
    bool _2184 = !_2024;
    int _2186 = _2184 ? 0 : 1;
    float _2188 = _2092 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2190 = float(_1878);
    float _2192 = fma(_2168, _2158, _2182);
    int _2194 = _2180;
    if (!_2156)
    {
        int _2196 = ~_2150;
        int _2198 = _2196 + 1;
        _2194 = _2198;
    }
    int _2200 = _2194;
    float _2202 = _1966 + 0.5;
    float _2204 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2192);
    int _2206 = _1530 >> 31;
    float _2208 = _2072 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2210 = _1584 >> 31;
    float _2212 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2214 = _2188 + _2212;
    int _2216 = _2206 & 3;
    float _2218 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1644);
    int _2220 = abs(_2186);
    float _2222 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2224 = _1530 + _2216;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2228 = _2208 + _2226;
    int _2230 = _2210 & 3;
    float _2232 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2234 = _2224 >> 2;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2238 = _2222 + _2236;
    int _2240 = _1584 + _2230;
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2232);
    int _2244 = _2234 << 4;
    int _2246 = _2244 + 368;
    float _2248 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2250 = _2240 >> 2;
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2242);
    float _2254 = float(_2220);
    uint _2256 = uint(int(uint(_2246) >> uint(2)));
    uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
    int _2260 = int(_2256) & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = int(_2256) + 1;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    int _2268 = _2264 & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    int _2272 = _2250 << 4;
    int _2274 = _2272 + 512;
    float _2276 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2278 = _1998 + 0.5;
    float _2280 = _2254 * _2190;
    float _2282 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2284 = !_1536;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = _2204 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2290 = uint(int(uint(_2274) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    bool _2306 = _2252 >= 0.0;
    float _2308 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1824);
    int _2310 = ~_1936;
    int _2312 = _2310 + _2014;
    int _2314 = _2312 + 1;
    out.m_66.x = _2276;
    out.m_66.y = _977;
    out.m_66.z = _2282;
    out.m_66.w = _2288;
    int _2316 = abs(_1594);
    float _2318 = _2280 * (-2.0);
    int _2320 = abs(_1696);
    int _2322 = _2246 + 8;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[int(_2334)][_2336];
    float _2340 = float(_2166);
    int _2342 = _973 * _2314;
    int _2344 = _2342 + _1224;
    float _2346 = float(_2200);
    float _2348 = fma(_2114, _2318, _2114);
    int _2350 = ~_1916;
    int _2352 = _2350 + _2070;
    int _2354 = _2352 + 1;
    if (_2306)
    {
        out.m_51.x = 0.0;
    }
    bool _2356 = _1013 == 0;
    int _2358 = _2274 + 8;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    float _2376 = _2340 * _2346;
    bool _2378 = !_1606;
    int _2380 = _2378 ? 0 : 1;
    float _2382 = in.m_68.x;
    float _2384 = in.m_68.y;
    float _2386 = in.m_68.z;
    int _2388 = abs(_1670);
    int _2390 = _1013 * _2354;
    int _2392 = _2390 + _1294;
    int _2394 = abs(_2380);
    float _2396 = _2376 * (-2.0);
    int _2398 = abs(_2286);
    float _2400 = fma(_2076, _2396, _2076);
    int _2402 = ~_2316;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = ~_2398;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    int _2414 = ~_2388;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    int _2420 = abs(_1624);
    bool _2422 = _1534 != 3;
    int _2424 = ~_2420;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = _2406 * as_type<int>(_2270);
    int _2432 = ~_2394;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    bool _2438 = !_2356;
    int _2440 = _2438 ? _2392 : (-1);
    int _2442 = _2412 * as_type<int>(_2262);
    int _2444 = _2442 + _2430;
    bool _2446 = !_2036;
    int _2448 = _2446 ? 0 : 1;
    float _2450 = fma(_2396, _2382, _2382);
    bool _2452 = _1604 != 3;
    int _2454 = _2418 * as_type<int>(_2304);
    int _2456 = abs(_2448);
    float _2458 = fma(_2318, _2384, _2384);
    int _2460 = abs(_1616);
    int _2462 = _2436 * as_type<int>(_2296);
    int _2464 = _2462 + _2454;
    bool _2466 = !_2452;
    int _2468 = _2466 ? 0 : (-1);
    bool _2470 = _973 == 0;
    int _2472 = _2428 * as_type<int>(_2330);
    int _2474 = _2472 + _2444;
    bool _2476 = !_2422;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = abs(_2468);
    int _2482 = abs(_2478);
    int _2484 = ~_2320;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    int _2490 = ~_2482;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = ~_2480;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    int _2502 = _2488 * as_type<int>(_2366);
    int _2504 = _2502 + _2464;
    int _2506 = ~_2460;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = _2494 * as_type<int>(_2338);
    int _2514 = _2512 + _2474;
    int _2516 = ~_2456;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    int _2522 = _2500 * as_type<int>(_2374);
    int _2524 = _2522 + _2504;
    bool _2526 = !_2470;
    int _2528 = _2526 ? _2344 : (-1);
    int _2530 = _2514 * _2510;
    float _2532 = as_type<float>(_2480);
    if (_2306)
    {
        _2532 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2534 = _2532;
    int _2536 = _2524 * _2520;
    float _2538 = _2214 * _2214;
    int _2540 = _2528 * _2460;
    int _2542 = _2540 + _2530;
    float _2544 = -_1880;
    float _2546 = _2544 + 1.0;
    int _2548 = _2440 * _2456;
    int _2550 = _2548 + _2536;
    float _2552 = fma(_2228, _2228, _2538);
    float _2554 = -_1760;
    float _2556 = _2554 + 1.0;
    float _2558 = -_1882;
    float _2560 = _2558 + 1.0;
    float _2562 = -_1832;
    float _2564 = _2562 + 1.0;
    float _2566 = fma(_2238, _2238, _2552);
    float _2568 = fma(_1974, _2556, _1994);
    float _2570 = _1039 + (-0.5);
    float _2572 = -_2546;
    float _2574 = fma(_1966, _2572, _2218);
    float _2576 = rsqrt(_2566);
    float _2578 = fma(_1988, _2560, _2174);
    float _2580 = -_2564;
    float _2582 = fma(_1998, _2580, _2308);
    int _2584 = as_type<int>(_2534);
    if (_2306)
    {
        float _2586 = _2534 * 5.0;
        _2584 = as_type<int>(_2586);
    }
    int _2588 = _2584;
    float _2590 = float(_2542);
    float _2592 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    float _2594 = float(_2550);
    out.m_70.x = _2574;
    out.m_70.y = _2578;
    out.m_70.z = _2582;
    out.m_70.w = _2568;
    bool _2596 = !_2028;
    int _2598 = _2596 ? 0 : 1;
    float _2600 = _1041 + (-0.5);
    float _2602 = fma(_2400, _1886, _2592);
    if (_2306)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7912 = as_type<float>(_2588);
        out.gl_Position.z = _7912;
    }
    int _2604 = abs(_2598);
    out.m_72.x = _2590;
    out.m_72.y = _2594;
    float _2606 = _2214 * _2576;
    float _2608 = _2228 * _2576;
    if (_2306)
    {
        return out;
    }
    float _2610 = -_2606;
    float _2612 = fma(_2610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2188);
    float _2614 = _2238 * _2576;
    float _2616 = -_2608;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2208);
    float _2620 = float(_1934);
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2624 = _2612 + _2622;
    float _2626 = -_2614;
    float _2628 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2222);
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2632 = _2618 + _2630;
    float _2634 = float(_2604);
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2640 = _2628 + _2638;
    float _2642 = -_2606;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2214);
    float _2646 = -_2608;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2228);
    float _2650 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2636);
    float _2652 = _2634 * _2620;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2600, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2458);
    float _2658 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2650);
    float _2660 = _1043 + _1039;
    float _2662 = fma(_2648, _2648, _2654);
    float _2664 = -_2614;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2668 = fma(_2348, _1886, _2656);
    bool _2670 = _2658 >= 0.0;
    float _2672 = _2660 + (-1.0);
    float _2674 = fma(_2666, _2666, _2662);
    float _2676 = _2652 * (-2.0);
    float _2678 = _2602 * 0.15915493667125701904296875;
    float _2680 = _2668 * 0.15915493667125701904296875;
    float _2682 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2684 = _1043 + (-0.5);
    float _2686 = fma(_2676, _2386, _2386);
    float _2688 = _2678 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = fma(_2682, _2676, _2682);
    float _2694 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2696 = as_type<int>(_2684);
    float _2698 = _2624;
    float _2700 = _2640;
    if (_2670)
    {
        _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2702 = _2694;
    float _2704 = fma(_2684, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2686);
    if (_2670)
    {
        out.m_51.x = 0.0;
    }
    float _2706 = _2678 * 6.283185482025146484375;
    float _2708 = cos(_2706);
    if (_2670)
    {
        float _2710 = _2702 * 5.0;
        _2696 = as_type<int>(_2710);
    }
    int _2712 = _2696;
    float _2714 = fma(_2692, _1886, _2704);
    if (_2670)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8112 = as_type<float>(_2712);
        out.gl_Position.z = _8112;
    }
    float _2716 = _2714 * 0.15915493667125701904296875;
    float _2718 = _2680 * 6.283185482025146484375;
    float _2720 = sin(_2718);
    float _2722 = sqrt(_2674);
    float _2724 = _2680 * 6.283185482025146484375;
    float _2726 = cos(_2724);
    if (_2670)
    {
        return out;
    }
    float _2728 = _2716 * 6.283185482025146484375;
    float _2730 = cos(_2728);
    float _2732 = _2576 * _2722;
    float _2734 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2738 = _2690 * _2720;
    float _2740 = _2708 * _2726;
    float _2742 = _2732 * _2734;
    float _2744 = _2690 * _2726;
    float _2746 = _2716 * 6.283185482025146484375;
    float _2748 = sin(_2746);
    float _2750 = _2708 * _2720;
    float _2752 = _2736 * _2742;
    float _2754 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2758 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2760 = _2732 * _2754;
    float _2762 = _2708 * _2730;
    float _2764 = _2726 * _2730;
    float _2766 = _2690 * _2730;
    float _2768 = _2720 * _2730;
    float _2770 = _2756 * _2760;
    float _2772 = _2762 * _2752;
    float _2774 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2776 = _2774 * 0.5;
    float _2778 = fma(_2748, _2740, _2738);
    float _2780 = -_2752;
    float _2782 = _2748 * _2780;
    float _2784 = -_2744;
    float _2786 = fma(_2748, _2750, _2784);
    float _2788 = -_2750;
    float _2790 = fma(_2748, _2744, _2788);
    float _2792 = fma(_2778, _2770, _2772);
    float _2794 = _2766 * _2752;
    float _2796 = fma(_2764, _2770, _2782);
    float _2798 = fma(_2748, _2738, _2740);
    float _2800 = fma(_2786, _2776, _2792);
    float _2802 = fma(_2790, _2770, _2794);
    float _2804 = fma(_2768, _2776, _2796);
    float _2806 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2808 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2810 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2812 = fma(_2798, _2776, _2802);
    float _2814 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2808);
    float _2818 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2810);
    float _2820 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2822 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2816);
    float _2824 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2818);
    float _2826 = -_2748;
    float _2828 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2820);
    float _2830 = _2822 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2832 = _2824 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2834 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2836 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2838 = _2208 + _2830;
    float _2840 = _2222 + _2832;
    float _2842 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2814);
    float _2844 = fma(_2758, _2758, 1.0);
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2852 = _2840 + _2850;
    float _2854 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2836);
    float _2856 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2858 = _2848 * _2848;
    float _2860 = _2852 * _2852;
    float _2862 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2854);
    float _2864 = rsqrt(_2844);
    float _2866 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2868 = _2858 + _2860;
    float _2870 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2872 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2834);
    float _2874 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2806);
    float _2876 = -_2748;
    float _2878 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2856);
    float _2880 = -_2748;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2866);
    float _2884 = sqrt(_2868);
    float _2886 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2888 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2890 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2892 = _2188 + _2870;
    float _2894 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2886);
    float _2896 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2888);
    float _2898 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2890);
    bool _2900 = _2884 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2902 = _2886;
    float _2904 = _2768;
    float _2906 = _2762;
    float _2908 = _2888;
    float _2910 = _2890;
    float _2912 = _2872;
    if (!_2900)
    {
        _2902 = _2860;
    }
    float _2914 = _2902;
    float _2916 = _2914;
    if (!_2900)
    {
        _2904 = _2858;
    }
    float _2918 = _2904;
    float _2920 = _2918;
    if (!_2900)
    {
        _2906 = _2838;
    }
    float _2922 = _2906;
    float _2924 = _2922;
    if (!_2900)
    {
        _2908 = _2840;
    }
    float _2926 = _2908;
    float _2928 = _2926;
    if (!_2900)
    {
        _2910 = _2892;
    }
    float _2930 = _2910;
    bool _2932 = !_2900;
    float _2934 = _2930;
    if (!_2932)
    {
        float _2936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2940 = _2884 + _2938;
        float _2942 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = rsqrt(_2868);
        float _2946 = _2940 * _2936;
        float _2948 = _2946 * 0.15915493667125701904296875;
        float _2950 = _2948 * 6.283185482025146484375;
        float _2952 = sin(_2950);
        float _2954 = _2948 * 6.283185482025146484375;
        float _2956 = cos(_2954);
        float _2958 = fma(_2952, _2942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2960 = _2944 * _2958;
        float _2962 = _2956 + (-1.0);
        float _2964 = fma(_2848, _2960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2966 = fma(_2852, _2960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2968 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2972 = _2964 + _2970;
        float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2976 = _2966 + _2974;
        float _2978 = fma(_2892, _2956, _2968);
        float _2980 = _2972 * _2972;
        float _2982 = _2976 * _2976;
        _2934 = _2978;
        _2920 = _2980;
        _2916 = _2982;
        _2924 = _2964;
        _2928 = _2966;
    }
    float _2984 = _2934;
    float _2986 = _2920;
    float _2988 = _2916;
    float _2990 = _2924;
    float _2992 = _2928;
    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2996 = _2984 + _2994;
    float _2998 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2878);
    float _3000 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2882);
    float _3002 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2828);
    float _3004 = fma(_2996, _2996, _2986);
    float _3006 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2894);
    float _3008 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2896);
    float _3010 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2898);
    float _3012 = _3004 + _2988;
    float _3014 = _2758 * _2864;
    float _3016 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2842);
    float _3018 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3020 = _2758 * _2998;
    float _3022 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2872);
    float _3024 = _2758 * _3000;
    float _3026 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2874);
    float _3028 = _2758 * _3002;
    float _3030 = -_3006;
    float _3032 = _3014 * _3030;
    float _3034 = -_3008;
    float _3036 = _3014 * _3034;
    float _3038 = -_3010;
    float _3040 = _3014 * _3038;
    float _3042 = fma(_3018, _3016, _3020);
    float _3044 = sqrt(_3012);
    float _3046 = fma(_3018, _3022, _3024);
    float _3048 = fma(_3018, _3026, _3028);
    float _3050 = fma(_2864, _2998, _3032);
    float _3052 = _3006 + _3042;
    float _3054 = fma(_2864, _3000, _3036);
    float _3056 = _3008 + _3046;
    float _3058 = fma(_2864, _3002, _3040);
    float _3060 = _3010 + _3048;
    out.m_74.x = _3016;
    out.m_74.y = _3022;
    out.m_74.z = _3026;
    out.m_76.x = _3050;
    out.m_76.y = _3054;
    out.m_76.z = _3058;
    bool _3062 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3064 = isnan(_3044);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3070 = _3066 || _3068;
    out.m_78.x = _3052;
    out.m_78.y = _3056;
    out.m_78.z = _3060;
    float _3072 = _2990;
    float _3074 = _3050;
    if (!_3070)
    {
        _2912 = 1.0;
    }
    float _3076 = _2912;
    bool _3078 = !_3070;
    float _3080 = _3076;
    if (!_3078)
    {
        bool _3082 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3084 = isnan(_3044);
        bool _3086 = _3082 || _3084;
        bool _3088 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3090 = _3086 || _3088;
        if (!_3090)
        {
            float _3092 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3094 = _3044 + _3092;
            float _3096 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3098 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3096;
            float _3100 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3104 = 1.0 / _3098;
            float _3106 = _3094 * _3104;
            float _3108 = fma(_3106, _3102, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3080 = _3108;
            _3110 = true;
        }
        else
        {
            bool _3112 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3114 = isnan(_3044);
            bool _3116 = _3112 || _3114;
            bool _3118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3120 = _3116 || _3118;
            if (!_3120)
            {
                float _3122 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3124 = _3044 + _3122;
                float _3126 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3128 = _3126 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3130 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3132 = _3130 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3134 = 1.0 / _3128;
                float _3136 = _3124 * _3134;
                float _3138 = fma(_3136, _3132, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3080 = _3138;
                _3110 = true;
            }
            else
            {
                _3080 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3110 = false;
    float _3140 = _3080;
    float _3142 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3144 = _2984 + _3142;
    float _3146 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3148 = _2990 + _3146;
    float _3150 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3152 = _2992 + _3150;
    float _3154 = fma(_3144, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3156 = fma(_3148, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3158 = fma(_3152, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3160 = -_2188;
    float _3162 = _3160 + _3154;
    float _3164 = -_2208;
    float _3166 = _3164 + _3156;
    float _3168 = -_2222;
    float _3170 = _3168 + _3158;
    float _3172 = _3162 * _3162;
    float _3174 = fma(_3166, _3166, _3172);
    float _3176 = fma(_3170, _3170, _3174);
    float _3178 = sqrt(_3176);
    bool _3180 = _3178 > 0.0;
    bool _3182 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3184 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan(0.5);
    bool _3190 = _3186 || _3188;
    float _3192 = _3156;
    if (!_3180)
    {
        _3072 = _3154;
    }
    float _3194 = _3072;
    float _3196 = _3194;
    if (!_3180)
    {
        _3074 = _3158;
    }
    float _3198 = _3074;
    bool _3200 = !_3180;
    float _3202 = _3198;
    float _3204 = _3198;
    if (!_3200)
    {
        float _3206 = _207 * _207;
        float _3208 = fma(_205, _205, _3206);
        float _3210 = fma(_209, _209, _3208);
        float _3212 = rsqrt(_3176);
        float _3214 = sqrt(_3210);
        float _3216 = _3166 * _3212;
        float _3218 = _3162 * _3212;
        float _3220 = _3170 * _3212;
        bool _3222 = _3214 > 0.0;
        float _3224 = _3214;
        if (!_3222)
        {
            _3224 = _3154;
        }
        float _3226 = _3224;
        _3196 = _3226;
        if (!_3222)
        {
            _3202 = _3158;
        }
        float _3228 = _3202;
        bool _3230 = !_3222;
        _3204 = _3228;
        if (!_3230)
        {
            float _3232 = rsqrt(_3210);
            float _3234 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3236 = _207 * _3232;
            float _3238 = _205 * _3232;
            float _3240 = _209 * _3232;
            float _3242 = _3218 * _3236;
            float _3244 = fma(_3216, _3238, _3242);
            float _3246 = _3234 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3248 = fma(_3220, _3240, _3244);
            float _3250 = _3248 * _3246;
            float _3252 = fma(_205, _3250, _3156);
            float _3254 = fma(_207, _3250, _3154);
            float _3256 = fma(_209, _3250, _3158);
            _3192 = _3252;
            _3196 = _3254;
            _3204 = _3256;
        }
    }
    float _3258 = _3192;
    float _3260 = _3196;
    float _3262 = _3204;
    float _3264 = -_2608;
    float _3266 = fma(_3264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3258);
    float _3268 = -_2606;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3260);
    float _3272 = -_2614;
    float _3274 = fma(_3272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3262);
    float _3276 = _3270;
    float _3278 = _3266;
    float _3280 = _3274;
    if (!_3190)
    {
        float _3282 = _2624 * _2624;
        float _3284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3286 = -_2222;
        float _3288 = _3286 + _3262;
        float _3290 = fma(_2632, _2632, _3282);
        float _3292 = fma(_2640, _2640, _3290);
        float _3294 = 1.0 / _2732;
        float _3296 = sqrt(_3292);
        float _3298 = precise::min(_3296, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3300 = _3298 * _3284;
        float _3302 = -_2208;
        float _3304 = _3302 + _3258;
        float _3306 = _3300 * _3294;
        float _3308 = -_2188;
        float _3310 = _3308 + _3260;
        float _3312 = fma(_3304, _3306, _2618);
        float _3314 = fma(_3310, _3306, _2612);
        float _3316 = fma(_3288, _3306, _2628);
        _3276 = _3314;
        _3278 = _3312;
        _3280 = _3316;
    }
    float _3318 = _3276;
    float _3320 = _3278;
    float _3322 = _3280;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3326 = _3318 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3330 = _3320 + _3328;
    float _3332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3334 = _3322 + _3332;
    float _3336 = _3326 * _3326;
    float _3338 = fma(_3330, _3330, _3336);
    float _3340 = fma(_3334, _3334, _3338);
    float _3342 = rsqrt(_3340);
    float _3344 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3346 = _3330 * _3344;
    float _3348 = _3334 * _3344;
    float _3350 = _3346 * _3346;
    float _3352 = _3348 * _3348;
    float _3354 = _3350 + _3352;
    float _3356 = sqrt(_3354);
    bool _3358 = _3356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3362 = _3356 + _3360;
    float _3364 = _3342;
    float _3366 = _3362;
    float _3368 = _3326;
    if (_3358)
    {
        float _3370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3364 = _3370;
    }
    float _3372 = _3364;
    if (_3358)
    {
        float _3374 = rsqrt(_3354);
        _2698 = _3374;
    }
    float _3376 = _2698;
    float _3378 = _3376;
    if (_3358)
    {
        float _3380 = _3362 * _3372;
        _3366 = _3380;
    }
    float _3382 = _3366;
    if (_3358)
    {
        float _3384 = _3382 * 0.15915493667125701904296875;
        _2700 = _3384;
    }
    float _3386 = _2700;
    float _3388 = _3334;
    float _3390 = _3386;
    if (_3358)
    {
        float _3392 = _3386 * 6.283185482025146484375;
        float _3394 = sin(_3392);
        _3388 = _3394;
    }
    float _3396 = _3388;
    float _3398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3400 = precise::max(0.0, _3398);
    float _3402 = _3372;
    float _3404 = _3400;
    if (_3358)
    {
        float _3406 = _3386 * 6.283185482025146484375;
        float _3408 = cos(_3406);
        _3402 = _3408;
    }
    float _3410 = _3402;
    float _3412 = -_3344;
    float _3414 = -_3400;
    float _3416 = fma(_3326, _3412, _3414);
    if (_3358)
    {
        float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3368 = _3418;
    }
    float _3420 = _3368;
    float _3422 = _3420;
    if (!_3358)
    {
        _3390 = _3352;
    }
    float _3424 = _3390;
    float _3426 = _3396;
    float _3428 = _3424;
    if (_3358)
    {
        float _3430 = fma(_3396, _3420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3422 = _3430;
    }
    float _3432 = _3422;
    float _3434 = _3432;
    if (!_3358)
    {
        _3426 = _3416;
    }
    float _3436 = _3426;
    float _3438 = _3436;
    float _3440 = _3410;
    if (_3358)
    {
        float _3442 = _3410 + (-1.0);
        _3404 = _3442;
    }
    float _3444 = _3404;
    float _3446 = _3444;
    if (_3358)
    {
        float _3448 = _3376 * _3432;
        _213 = _3448;
    }
    float _3450 = _213;
    if (!_3358)
    {
        _3378 = _3346;
    }
    float _3452 = _3378;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3456 = _3452;
    if (_3358)
    {
        float _3458 = _3444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3446 = _3458;
    }
    float _3460 = _3446;
    if (_3358)
    {
        float _3462 = _3346 * _3450;
        _3456 = _3462;
    }
    float _3464 = _3456;
    if (!_3358)
    {
        _3434 = _3348;
    }
    float _3466 = _3434;
    float _3468 = _3466;
    if (_3358)
    {
        float _3470 = _3348 * _3450;
        _3468 = _3470;
    }
    float _3472 = _3468;
    if (_3358)
    {
        float _3474 = fma(_3416, _3410, _3460);
        _3438 = _3474;
    }
    float _3476 = _3438;
    if (!_3358)
    {
        _3440 = _3350;
    }
    float _3478 = _3440;
    float _3480 = sqrt(_3340);
    float _3482 = _3478;
    if (_3358)
    {
        float _3484 = _3464 * _3464;
        _3482 = _3484;
    }
    float _3486 = _3482;
    if (_3358)
    {
        float _3488 = _3472 * _3472;
        _3428 = _3488;
    }
    float _3490 = _3428;
    float _3492 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3494 = fma(_3476, _3476, _3486);
    float _3496 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3498 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3500 = _3494 + _3490;
    float _3502 = floor(_3496);
    float _3504 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3498);
    float _3506 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3492);
    float _3508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3510 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3508);
    float _3512 = precise::clamp(_3510, 0.0, 1.0);
    float _3514 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3504);
    float _3516 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3506);
    float _3518 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3520 = rsqrt(_3500);
    float _3522 = _3514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3524 = -_3512;
    float _3526 = _3524 + 1.0;
    float _3528 = _3522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3530 = abs(_3526);
    float _3532 = log2(_3530);
    float _3534 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3536 = -_3528;
    float _3538 = fma(_3536, _3454, 1.0);
    float _3540 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3542 = -_3502;
    float _3544 = _3496 + _3542;
    float _3546 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3534);
    float _3548 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3540);
    float _3550 = _3520 * _3464;
    float _3552 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3546);
    float _3554 = _3520 * _3476;
    float _3556 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3548);
    float _3558 = _3520 * _3472;
    float _3560 = _3552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3562 = _3550 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3564 = _3556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3566 = log2(_3538);
    float _3568 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3570 = -_3562;
    float _3572 = fma(_3554, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3570);
    float _3574 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3576 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3578 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3568);
    float _3580 = -_3558;
    float _3582 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3572);
    float _3584 = floor(_3518);
    float _3586 = _3516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3588 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3578);
    float _3590 = fma(_3582, -0.5, 0.5);
    float _3592 = fma(_3582, 0.5, 0.5);
    float _3594 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3576);
    float _3596 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3588);
    float _3598 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3600 = exp2(_3574);
    float _3602 = _3554 + 1.0;
    float _3604 = _3566 * 0.693147182464599609375;
    float _3606 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3598);
    float _3608 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3594);
    float _3610 = 1.0 / _3596;
    float _3612 = -_3584;
    float _3614 = _3518 + _3612;
    float _3616 = fma(_3592, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3618 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3608);
    float _3620 = fma(_3592, _3616, -0.212114393711090087890625);
    float _3622 = sqrt(_3590);
    float _3624 = -_3554;
    float _3626 = fma(_3600, _3602, _3624);
    float2 _9650 = float2(_3544, _3614);
    float _3628 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9650, float2(0.0), isnan(_9650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9650, float2(0.0), isnan(_9650)), level(0.0)).x;
    float _3630 = fma(_3592, _3620, 1.570728778839111328125);
    float _3632 = fma(_3626, 0.5, 0.5);
    float _3634 = _3618 * _3610;
    float _3636 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3606);
    float _3638 = fma(_3634, -0.5, 0.5);
    float _3640 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3636);
    float _3642 = _3622 * 0.636619746685028076171875;
    float _3644 = _3640 * _3610;
    float _3646 = _3604 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3648 = -_3630;
    float _3650 = fma(_3642, _3648, 1.0);
    float _3652 = fma(_3644, 0.5, 0.5);
    float3 _9699 = float3(_3652, _3638, _3646);
    float _3654 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9699, float3(0.0), isnan(_9699)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9699, float3(0.0), isnan(_9699)), level(0.0)).x;
    float3 _9710 = float3(_3652, _3638, _3646);
    float4 _3657 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9710, float3(0.0), isnan(_9710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9710, float3(0.0), isnan(_9710)), level(0.0)).xyzw;
    float _3659 = _3657.x;
    float _3661 = _3657.y;
    float _3663 = _3657.z;
    float _3665 = _3657.w;
    float2 _9726 = float2(_3650, _3632);
    float3 _3669 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9726, float2(0.0), isnan(_9726)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9726, float2(0.0), isnan(_9726)), level(0.0)).xyz;
    float _3671 = _3669.x;
    float _3673 = _3669.y;
    float _3675 = _3669.z;
    float _3677 = _2612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3679 = _2612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3681 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _3320;
    out.m_80.y = _3318;
    out.m_80.z = _3322;
    float _3683 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3677);
    float _3685 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3679);
    float _3687 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3681);
    float _3689 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3691 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3683);
    float _3693 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3685);
    float _3695 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3687);
    float _3697 = _3691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3699 = _3693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3701 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3695);
    float _3703 = 1.0 / _3697;
    float _3705 = _3699 + _3697;
    float _3707 = in.m_82.x;
    bool _3709 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3711 = isnan(_3480);
    bool _3713 = _3709 || _3711;
    bool _3715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3717 = _3713 || _3715;
    float _3719 = _3705 * _3703;
    float _3721 = _3719 * 0.5;
    float _3723 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3725 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3723);
    float _3727 = 1.0 / _3725;
    out.gl_Position.x = _3640;
    out.gl_Position.y = _3618;
    out.gl_Position.z = _3701;
    out.gl_Position.w = _3596;
    float _3729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3731 = _3727 * _3729;
    float _3733 = abs(_3731);
    float _3735 = log2(_3733);
    bool _3737 = _3731 <= 8000.0;
    bool _3739 = isnan(_3731);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan(8000.0);
    bool _3745 = _3741 || _3743;
    float _3747 = float(_3745);
    float _3749 = _3640;
    if (!_3717)
    {
        _3749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3751 = _3749;
    float _3753 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3755 = exp2(_3753);
    float _3757 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3759 = precise::clamp(_3757, 0.0, 1.0);
    float _3761 = fma(_3759, -2.0, 3.0);
    float _3763 = _3759 * _3759;
    float _3765 = _3763 * _3761;
    float _3767 = exp2(_3689);
    float _3769 = -_3765;
    float _3771 = _3769 + 1.0;
    float _3773 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3765);
    float _3775 = _3701 + _3596;
    float _3777 = _3747 * _3773;
    float _3779 = _3775 * 0.5;
    float _3781 = _3777 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3783 = -_3767;
    float _3785 = _3783 + 1.0;
    out.m_84.z = _3779;
    out.m_84.w = _3596;
    float _3787 = _3785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3789 = -_3787;
    float _3791 = _3789 + 1.0;
    float _3793 = _3596;
    float _3795 = _3791;
    float _3797 = _3751;
    float _3799 = _3751;
    if (!_3717)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3801 = _3793;
    float _3803 = -_3628;
    float _3805 = _3803 + 1.0;
    float _3807 = _3805 * _3781;
    float _3809 = precise::clamp(_3807, 0.0, 1.0);
    float _3811 = -_3809;
    float _3813 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3815 = _3813 * _3707;
    float _3817 = _3815 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3817;
    float _3819 = _3787 * _3654;
    float _3821 = _3665 * _3819;
    float _3823 = _3675 * _3819;
    float _3825 = _3665 * _3791;
    float _3827 = _3661;
    float _3829 = _3659;
    float _3831 = _3821;
    float _3833 = _3801;
    float _3835 = _3801;
    if (!_3717)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3837 = _3795;
    float _3839 = fma(_3671, _3821, _3659);
    float _3841 = fma(_3673, _3821, _3661);
    float _3843 = fma(_3665, _3823, _3663);
    float _3845 = _3837;
    float _3847 = _3837;
    if (!_3717)
    {
        _3827 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3849 = _3827;
    float _3851 = _3849;
    float _3853 = _3849;
    if (!_3717)
    {
        _3829 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3855 = _3829;
    out.m_88.x = _3839;
    out.m_88.y = _3841;
    out.m_88.z = _3843;
    out.m_88.w = _3825;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3717)
    {
        _3831 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3861 = _3831;
    bool _3863 = !_3717;
    float _3865 = _3861;
    float _3867 = _3861;
    if (!_3863)
    {
        bool _3869 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3871 = isnan(_3480);
        bool _3873 = _3869 || _3871;
        bool _3875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3877 = _3873 || _3875;
        if (!_3877)
        {
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3881 = _3480 + _3879;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3883;
            float _3887 = 1.0 / _3885;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3909 = _3881 * _3887;
            float _3911 = precise::clamp(_3909, 0.0, 1.0);
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3917 = fma(_3911, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3919 = fma(_3911, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3921 = fma(_3911, _3895, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3923 = fma(_3911, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3925 = fma(_3911, _3903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3927 = fma(_3911, _3907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3835 = _3919;
            _3859 = _3925;
            _3799 = _3917;
            _3853 = _3923;
            _3847 = _3921;
            _3867 = _3927;
            _3929 = true;
        }
        else
        {
            bool _3931 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3933 = isnan(_3480);
            bool _3935 = _3931 || _3933;
            bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3939 = _3935 || _3937;
            if (!_3939)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3941 = _3797;
            _3799 = _3941;
            if (!_3939)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3943 = _3833;
            _3835 = _3943;
            if (!_3939)
            {
                _3845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3945 = _3845;
            _3847 = _3945;
            if (!_3939)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3947 = _3851;
            _3853 = _3947;
            if (!_3939)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3949 = _3857;
            _3859 = _3949;
            if (!_3939)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3951 = _3865;
            bool _3953 = !_3939;
            _3867 = _3951;
            if (!_3953)
            {
                bool _3955 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3957 = isnan(_3480);
                bool _3959 = _3955 || _3957;
                bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3963 = _3959 || _3961;
                if (!_3963)
                {
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3967 = _3480 + _3965;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3969;
                    float _3973 = 1.0 / _3971;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3995 = _3967 * _3973;
                    float _3997 = precise::clamp(_3995, 0.0, 1.0);
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4003 = fma(_3997, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4005 = fma(_3997, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4007 = fma(_3997, _3981, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4009 = fma(_3997, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4011 = fma(_3997, _3989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4013 = fma(_3997, _3993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3835 = _4005;
                    _3859 = _4011;
                    _3799 = _4003;
                    _3853 = _4009;
                    _3847 = _4007;
                    _3867 = _4013;
                    _3929 = true;
                }
                else
                {
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3929 = false;
    float _4015 = _3835;
    float _4017 = _3859;
    float _4019 = _3799;
    float _4021 = _3853;
    float _4023 = _3847;
    float _4025 = _3867;
    float _4027 = fma(_3056, -0.5, 0.5);
    float _4029 = precise::clamp(_4027, 0.0, 1.0);
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    float _4035 = -_4019;
    float _4037 = _4035 + _4021;
    float _4039 = -_4023;
    float _4041 = _4039 + _4025;
    bool _4043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4045 = fma(_4029, _4033, _4015);
    float _4047 = fma(_4029, _4037, _4019);
    float _4049 = fma(_4029, _4041, _4023);
    float _4051 = _4045 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _4053 = fma(_4047, 0.298911988735198974609375, _4051);
    float _4055 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4057 = fma(_4049, 0.114477999508380889892578125, _4053);
    out.m_51.x = _4055;
    float _4059 = -_4057;
    float _4061 = _4047 + _4059;
    float _4063 = -_4057;
    float _4065 = _4045 + _4063;
    float _4067 = -_4057;
    float _4069 = _4049 + _4067;
    float _4071 = fma(_4061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    float _4073 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    float _4075 = fma(_4069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    out.m_92.x = _4071;
    out.m_92.y = _4073;
    out.m_92.z = _4075;
    if (!_4043)
    {
        return out;
    }
    float _4077 = -_3318;
    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4081 = -_3320;
    float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4085 = -_3322;
    float _4087 = _4085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4089 = _4079 * _4079;
    float _4091 = fma(_4083, _4083, _4089);
    float _4093 = fma(_4087, _4087, _4091);
    float _4095 = sqrt(_4093);
    float _4097 = rsqrt(_4093);
    float _4099 = -_4095;
    float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4103 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4105 = precise::clamp(_4103, 0.0, 1.0);
    float _4107 = _4083 * _4097;
    float _4109 = _4079 * _4097;
    float _4111 = abs(_4105);
    float _4113 = log2(_4111);
    float _4115 = _4087 * _4097;
    float _4117 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4119 = _3056 * _4109;
    float _4121 = -_4109;
    float _4123 = -_4117;
    float _4125 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4123);
    float _4127 = fma(_3052, _4107, _4119);
    float _4129 = -_4115;
    float _4131 = fma(_4129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4125);
    float _4133 = fma(_3060, _4115, _4127);
    float _4135 = precise::clamp(_4133, 0.0, 1.0);
    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4139 = _4131 + _4137;
    float _4141 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4143 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4145 = precise::clamp(_4143, 0.0, 1.0);
    float _4147 = exp2(_4141);
    float _4149 = _4147 * _4145;
    float _4151 = _4135 * _4149;
    float _4153 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4155 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4157 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4153;
    out.m_90.y = _4155;
    out.m_90.z = _4157;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3929 = false;
    bool _3110 = false;
    bool _945 = false;
    bool _777 = false;
    bool _557 = false;
    bool _381 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_48.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4214 = as_type<float>(_127);
        out.gl_Position.z = _4214;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4284 = as_type<float>(_165);
        out.gl_Position.z = _4284;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _209;
    float _231;
    if (!_211)
    {
        float _215 = in.m_60.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_111);
        float _237 = 1.0 / _235;
        float _239 = _145 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    bool _247 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _249 = isnan(_241);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    bool _259 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _261 = isnan(_241);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _275 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = -_257;
    float _281 = _279 + 1.0;
    float _283 = 1.0 / _273;
    bool _285 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _287 = isnan(_241);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = _269 * _281;
    float _299 = -_269;
    float _301 = _299 + 1.0;
    bool _303 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _305 = _295 * _301;
    float _307 = 1.0 / _277;
    float _309 = -_295;
    float _311 = _309 + 1.0;
    float _313 = _245 * _283;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _241 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = fma(_321, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _329 = fma(_325, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _331 = _317 * _307;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _327 * _305;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = _329 * _305;
    float _345 = fma(_335, _331, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _347 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[143].x, _337);
    float _349 = fma(_341, _331, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _351 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[143].y, _343);
    float _353 = fma(_345, _297, _347);
    float _355 = fma(_349, _297, _351);
    float _357 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].x, _353);
    float _359 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[145].y, _355);
    bool _361 = !_303;
    float _379;
    if (!_361)
    {
        float _363 = in.m_60.x;
        float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _367 = _363 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _369 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _371 = _369 * _365;
        float _373 = floor(_371);
        float _375 = -_373;
        float _377 = _371 + _375;
        _379 = _377;
        _381 = true;
    }
    else
    {
        float _383 = float(_111);
        float _385 = 1.0 / _383;
        float _387 = _145 * _385;
        _379 = _387;
    }
    _381 = false;
    float _389 = _379;
    float _391 = in.m_62.x;
    float _393 = in.m_62.y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _397 = _389 + _395;
    bool _399 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _401 = isnan(_389);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _419 = 1.0 / _413;
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _423 = 1.0 / _417;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _425;
    float _429 = _397 * _419;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _433 = _389 + _431;
    bool _435 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _437 = isnan(_389);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = _359 * _393;
    bool _449 = _389 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _451 = isnan(_389);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = -_409;
    float _463 = _461 + 1.0;
    float _465 = fma(_427, _429, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _467 = _357 * _391;
    float _469 = _433 * _423;
    float _471 = _459 * _463;
    float _473 = -_459;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _481;
    float _485 = _445 * _475;
    float _487 = fma(_479, _429, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = fma(_483, _429, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _491 = -_445;
    float _493 = _491 + 1.0;
    float _495 = _465 * _485;
    float _497 = _487 * _485;
    float _499 = _489 * _485;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _507 = _505 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _511 = _509 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _513 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].x, _499);
    float _515 = fma(_503, _469, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _517 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _519 = fma(_507, _469, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _521 = fma(_511, _469, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _523 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[107].z, _495);
    float _525 = fma(_515, _471, _517);
    float _527 = fma(_519, _471, _513);
    float _529 = fma(_521, _471, _523);
    float _531 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].y, _525);
    float _533 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].x, _527);
    float _535 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[109].z, _529);
    bool _537 = !_421;
    float _555;
    if (!_537)
    {
        float _539 = in.m_60.x;
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _543 = _539 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _547 = _545 * _541;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _553;
        _557 = true;
    }
    else
    {
        float _559 = float(_111);
        float _561 = 1.0 / _559;
        float _563 = _145 * _561;
        _555 = _563;
    }
    _557 = false;
    float _565 = _555;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _569 = _565 + _567;
    float _571 = _533 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _581 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _583 = isnan(_565);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _595 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _593;
    float _597 = 1.0 / _575;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _603 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _605 = isnan(_565);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = _531 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _619 = _617 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _621 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _623 = isnan(_565);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _635 = 1.0 / _579;
    float _637 = -_613;
    float _639 = _637 + 1.0;
    float _641 = _571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _643 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _591 * _639;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _651 = _595 * _597;
    bool _653 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _655 = isnan(_565);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = -_591;
    float _667 = _665 + 1.0;
    float _669 = 1.0 / _601;
    float _671 = fma(_651, _569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _673;
    float _677 = _663 * _667;
    float _679 = -_663;
    float _681 = _679 + 1.0;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _687 = 1.0 / _619;
    float _689 = _631 * _681;
    float _691 = _685 * _635;
    float _693 = -_631;
    float _695 = _693 + 1.0;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _699 = _565 + _697;
    float _701 = _671 * _689;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = _565 + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _711 = _675 * _669;
    bool _713 = _565 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _715 = isnan(_565);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_691, _705, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _701);
    float _729 = fma(_711, _699, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _733 = _565 + _731;
    float _735 = -_723;
    float _737 = _735 + 1.0;
    float _739 = fma(_725, _677, _727);
    float _741 = _709 * _687;
    float _743 = _613 * _737;
    float _745 = fma(_729, _647, _739);
    float _747 = fma(_741, _733, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _749 = fma(_747, _743, _745);
    float _751 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[119].x, _749);
    float _753 = _751 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _641;
    out.m_64.y = _643;
    out.m_64.z = _645;
    out.m_64.w = _753;
    bool _755 = !_649;
    float _757 = _647;
    float _775;
    if (!_755)
    {
        float _759 = in.m_60.x;
        float _761 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _763 = _759 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _767 = _765 * _761;
        float _769 = floor(_767);
        float _771 = -_769;
        float _773 = _767 + _771;
        _775 = _773;
        _777 = true;
    }
    else
    {
        float _779 = float(_111);
        float _781 = 1.0 / _779;
        float _783 = _145 * _781;
        _775 = _783;
    }
    _777 = false;
    float _785 = _775;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _789 = _785 + _787;
    bool _791 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _793 = isnan(_785);
    bool _795 = _791 || _793;
    bool _797 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _799 = _795 || _797;
    float _801 = float(_799);
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _805 = _785 + _803;
    bool _807 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _809 = isnan(_785);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _819;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _827 = _785 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _829 = isnan(_785);
    bool _831 = _827 || _829;
    bool _833 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _835 = _831 || _833;
    float _837 = float(_835);
    float _839 = -_801;
    float _841 = _839 + 1.0;
    float _843 = 1.0 / _825;
    float _845 = _837 * _841;
    float _847 = -_837;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _851;
    bool _855 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _857 = 1.0 / _821;
    float _859 = _817 * _849;
    float _861 = -_817;
    float _863 = _861 + 1.0;
    float _865 = _789 * _857;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _867;
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _871;
    float _875 = fma(_853, _865, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _877 = fma(_869, _865, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _879 = fma(_873, _865, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _881 = _805 * _843;
    float _883 = _875 * _859;
    float _885 = _877 * _859;
    float _887 = _879 * _859;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _899 = _897 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _901 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].x, _883);
    float _903 = fma(_891, _881, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _905 = fma(_895, _881, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _907 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].y, _885);
    float _909 = fma(_899, _881, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _911 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[123].z, _887);
    float _913 = fma(_903, _845, _901);
    float _915 = fma(_905, _845, _907);
    float _917 = fma(_909, _845, _911);
    float _919 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].x, _913);
    float _921 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].y, _915);
    float _923 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[125].z, _917);
    bool _925 = !_855;
    float _943;
    if (!_925)
    {
        float _927 = in.m_60.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_111);
        float _949 = 1.0 / _947;
        float _951 = _145 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    float _955 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _957 = int(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _961 = _953 + _959;
    float _963 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _973 = int(_971);
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _977 = _969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _979 = float(_957);
    float _981 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _983 = int(_981);
    if (_967)
    {
        float _985 = in.m_60.x;
        _757 = _985;
    }
    float _987 = _757;
    float _989 = _987;
    if (!_967)
    {
        float _991 = in.m_60.y;
        _989 = _991;
    }
    float _993 = _989;
    float _995 = float(uint(_973));
    float _997 = 1.0 / _979;
    int _999 = ~_973;
    int _1001 = _999 + 1;
    bool _1003 = _973 == 0;
    float _1005 = 1.0 / _995;
    float _1007 = float(_983);
    float _1009 = _997 * _145;
    float _1011 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1013 = int(_1011);
    int _1015 = as_type<int>(_1005) + (-2);
    float _1017 = trunc(_1009);
    int _1019 = int(_1017);
    float _1021 = 1.0 / _1007;
    float _1023 = float(uint(_1013));
    int _1025 = ~_1013;
    int _1027 = _1025 + 1;
    int _1029 = ~_1013;
    int _1031 = _1029 + 1;
    float _1033 = float(uint(_1019));
    float _1035 = 1.0 / _1023;
    float _1037 = as_type<float>(_1015) * _1033;
    float _1039 = in.m_60.x;
    float _1041 = in.m_60.y;
    float _1043 = in.m_60.z;
    float _1045 = in.m_60.w;
    float _1047 = _1021 * _145;
    float _1049 = trunc(_1037);
    float _1051 = precise::max(_1049, 0.0);
    uint _1054 = uint(_1051);
    float _1056 = trunc(_1047);
    int _1058 = int(_1056);
    int _1060 = as_type<int>(_1035) + (-2);
    float _1062 = _1037;
    if (_967)
    {
        _1062 = 1.0;
    }
    float _1064 = _1062;
    float _1066 = _1064;
    if (!_967)
    {
        _1066 = 1.2345600128173828125;
    }
    float _1068 = _1066;
    int _1070 = _1001 * int(_1054);
    int _1072 = _1070 + _1019;
    float _1074 = _993 * _1068;
    float _1076 = float(uint(_1072));
    float _1078 = floor(_1074);
    float _1080 = as_type<float>(_1072);
    if (_967)
    {
        _1080 = 1.0;
    }
    float _1082 = _1080;
    float _1084 = float(uint(_1058));
    float _1086 = as_type<float>(_1015) * _1076;
    float _1088 = _1082;
    int _1090 = as_type<int>(_1045);
    if (!_967)
    {
        _1088 = 7.345489978790283203125;
    }
    float _1092 = _1088;
    float _1094 = as_type<float>(_1060) * _1084;
    float _1096 = trunc(_1086);
    float _1098 = precise::max(_1096, 0.0);
    uint _1100 = uint(_1098);
    float _1102 = _1092 * _1039;
    float _1104 = -_1078;
    float _1106 = _1074 + _1104;
    float _1108 = trunc(_1094);
    float _1110 = precise::max(_1108, 0.0);
    uint _1112 = uint(_1110);
    float _1114 = floor(_1102);
    int _1116 = int(_1054) + int(_1100);
    float _1118 = float(_111);
    float _1120 = float(_973);
    int _1122 = _1027 * int(_1112);
    int _1124 = _1122 + _1058;
    int _1126 = ~_973;
    int _1128 = _1126 + 1;
    float _1130 = 1.0 / _1118;
    float _1132 = float(uint(_1124));
    float _1134 = -_1114;
    float _1136 = _1102 + _1134;
    int _1138 = _1128 * _1116;
    int _1140 = _1138 + _1019;
    float _1142 = float(_1013);
    float _1144 = as_type<float>(_1060) * _1132;
    float _1146 = _1136 * _1120;
    bool _1148 = uint(_1140) >= uint(_973);
    float _1150 = trunc(_1144);
    float _1152 = precise::max(_1150, 0.0);
    uint _1154 = uint(_1152);
    float _1156 = float(_1019);
    bool _1158 = !_1148;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1164 = _1162 != 0;
    int _1166 = ~_1116;
    int _1168 = _1166 + _1160;
    int _1170 = _1168 + 1;
    float _1172 = trunc(_1146);
    int _1174 = int(_1172);
    bool _1176 = _1156 >= _1120;
    bool _1178 = isnan(_1156);
    bool _1180 = _1176 || _1178;
    bool _1182 = isnan(_1120);
    bool _1184 = _1180 || _1182;
    float _1186 = float(_1184);
    float _1188 = _1130 * _145;
    bool _1190 = !_1164;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = _1106 * _1142;
    float _1196 = float(_1058);
    float _1198 = _1120 * _1188;
    int _1200 = abs(_1192);
    float _1202 = trunc(_1186);
    int _1204 = int(_1202);
    int _1206 = int(_1112) + int(_1154);
    float _1208 = _1142 * _1188;
    bool _1210 = _1196 >= _1142;
    bool _1212 = isnan(_1196);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1142);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    int _1222 = _1174 * _1200;
    int _1224 = _1222 + _1019;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1228 = _1226 != 0;
    int _1230 = _973 * _1170;
    int _1232 = _1230 + _1019;
    float _1234 = trunc(_1194);
    int _1236 = int(_1234);
    int _1238 = _1031 * _1206;
    int _1240 = _1238 + _1058;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1244 = _1242 != 0;
    int _1246 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1248 = _1246 != 0;
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1252 = _1250 != 0;
    bool _1254 = !_1003;
    int _1256 = _1254 ? _1232 : (-1);
    int _1258 = ~_1204;
    int _1260 = _1258 + 1;
    int _1262 = _1260 + 1;
    bool _1264 = !_1228;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = trunc(_1198);
    int _1270 = int(_1268);
    bool _1272 = uint(_1240) >= uint(_1013);
    int _1274 = _1256 * _1262;
    int _1276 = abs(_1266);
    bool _1278 = !_1248;
    int _1280 = _1278 ? 0 : 1;
    bool _1282 = !_1272;
    int _1284 = _1282 ? 0 : (-1);
    float _1286 = trunc(_1220);
    int _1288 = int(_1286);
    int _1290 = _973 + (-1);
    int _1292 = _1236 * _1276;
    int _1294 = _1292 + _1058;
    int _1296 = abs(_1280);
    int _1298 = ~_1206;
    int _1300 = _1298 + _1284;
    int _1302 = _1300 + 1;
    int _1304 = _1204 * _1290;
    int _1306 = _1304 + _1274;
    bool _1308 = !_1244;
    int _1310 = _1308 ? 0 : 1;
    float _1312 = trunc(_1208);
    int _1314 = int(_1312);
    int _1316 = _1013 * _1302;
    int _1318 = _1316 + _1058;
    bool _1320 = !_1252;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = abs(_1310);
    int _1326 = _1306 * _1296;
    bool _1328 = _1013 == 0;
    int _1330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1332 = _1330 != 0;
    int _1334 = _1270 * _1324;
    int _1336 = _1334 + _1326;
    int _1338 = abs(_1322);
    int _1340 = ~_1288;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    bool _1346 = !_1328;
    int _1348 = _1346 ? _1318 : (-1);
    bool _1350 = !_1332;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = _1348 * _1344;
    int _1356 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1358 = _1356 != 0;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1370 = _1368 != 0;
    int _1372 = abs(_1352);
    int _1374 = _1224 * _1338;
    int _1376 = _1374 + _1336;
    int _1378 = _1013 + (-1);
    bool _1380 = !_1362;
    int _1382 = _1380 ? 0 : 1;
    int _1384 = _1174 * _1372;
    int _1386 = _1384 + _1376;
    bool _1388 = _973 == 0;
    int _1390 = _1288 * _1378;
    int _1392 = _1390 + _1354;
    int _1394 = abs(_1382);
    bool _1396 = !_1366;
    int _1398 = _1396 ? 0 : 1;
    bool _1400 = !_1358;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = abs(_1398);
    int _1406 = abs(_1402);
    int _1408 = _1392 * _1394;
    float _1410 = float(uint(_1386));
    bool _1412 = !_1370;
    int _1414 = _1412 ? 0 : 1;
    int _1416 = _1314 * _1406;
    int _1418 = _1416 + _1408;
    float _1420 = float(uint(_1224));
    float _1422 = as_type<float>(_1015) * _1410;
    int _1424 = abs(_1414);
    float _1426 = trunc(_1422);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = as_type<float>(_1015) * _1420;
    int _1434 = _1294 * _1404;
    int _1436 = _1434 + _1418;
    int _1438 = ~_973;
    int _1440 = _1438 + 1;
    int _1442 = _1236 * _1424;
    int _1444 = _1442 + _1436;
    int _1446 = ~_1013;
    int _1448 = _1446 + 1;
    int _1450 = ~_973;
    int _1452 = _1450 + 1;
    float _1454 = float(uint(_1444));
    int _1456 = _1440 * int(_1430);
    int _1458 = _1456 + _1386;
    float _1460 = as_type<float>(_1060) * _1454;
    float _1462 = float(uint(_1458));
    float _1464 = trunc(_1460);
    float _1466 = precise::max(_1464, 0.0);
    uint _1468 = uint(_1466);
    float _1470 = as_type<float>(_1015) * _1462;
    float _1472 = trunc(_1470);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    int _1478 = _1448 * int(_1468);
    int _1480 = _1478 + _1444;
    float _1482 = float(uint(_1480));
    int _1484 = int(_1430) + int(_1476);
    float _1486 = as_type<float>(_1060) * _1482;
    int _1488 = ~_1013;
    int _1490 = _1488 + 1;
    float _1492 = trunc(_1486);
    float _1494 = precise::max(_1492, 0.0);
    uint _1496 = uint(_1494);
    int _1498 = _1452 * _1484;
    int _1500 = _1498 + _1386;
    bool _1502 = uint(_1500) >= uint(_973);
    bool _1504 = !_1502;
    int _1506 = _1504 ? 0 : (-1);
    int _1508 = ~_1484;
    int _1510 = _1508 + _1506;
    int _1512 = _1510 + 1;
    int _1514 = int(_1468) + int(_1496);
    float _1516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1518 = log2(_1516);
    int _1520 = _973 * _1512;
    int _1522 = _1520 + _1386;
    int _1524 = _1490 * _1514;
    int _1526 = _1524 + _1444;
    bool _1528 = !_1388;
    int _1530 = _1528 ? _1522 : (-1);
    bool _1532 = uint(_1526) >= uint(_1013);
    int _1534 = _1530 & 3;
    bool _1536 = _1534 != 0;
    bool _1538 = !_1532;
    int _1540 = _1538 ? 0 : (-1);
    bool _1542 = uint(_1534) > 1u;
    int _1544 = _1530 & 3;
    bool _1546 = _1544 != 0;
    int _1548 = ~_1514;
    int _1550 = _1548 + _1540;
    int _1552 = _1550 + 1;
    int _1554 = _1546 ? 0 : 1;
    bool _1556 = _1534 != 3;
    int _1558 = _1013 * _1552;
    int _1560 = _1558 + _1444;
    bool _1562 = uint(_1534) >= 2u;
    float _1564 = _1039 * 2.0;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1568 = _1566 != 0;
    int _1570 = _1562 ? 0 : 1;
    float _1572 = floor(_1564);
    bool _1574 = _1045 > 0.5;
    int _1576 = ~_1554;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    bool _1582 = !_1328;
    int _1584 = _1582 ? _1560 : (-1);
    int _1586 = _1580;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_1542)
    {
        int _1590 = ~_1554;
        int _1592 = _1590 + 1;
        _1586 = _1592;
    }
    int _1594 = _1586;
    int _1596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1598 = _1596 != 0;
    float _1600 = -_203;
    int _1602 = _1574 ? as_type<int>(_1600) : as_type<int>(_203);
    int _1604 = _1584 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = ~_1570;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    bool _1614 = !_1598;
    int _1616 = _1614 ? 0 : 1;
    int _1618 = _1612;
    if (_1556)
    {
        int _1620 = ~_1570;
        int _1622 = _1620 + 1;
        _1618 = _1622;
    }
    int _1624 = _1618;
    float _1626 = _1039 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1628 = _1584 & 3;
    bool _1630 = _1628 != 0;
    bool _1632 = uint(_1604) > 1u;
    float _1634 = -_975;
    float _1636 = fma(_1626, 2.0, _1634);
    if (_1568)
    {
        _1090 = 0;
    }
    int _1638 = _1090;
    bool _1640 = uint(_1604) >= 2u;
    float _1642 = -_145;
    float _1644 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1636);
    int _1646 = _1638;
    if (!_1568)
    {
        _1646 = 1;
    }
    int _1648 = _1646;
    int _1650 = _1630 ? 0 : 1;
    bool _1652 = _1604 != 3;
    int _1654 = _1640 ? 0 : 1;
    bool _1656 = _1648 != 1;
    int _1658 = ~_1650;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    int _1664 = _1662;
    if (!_1632)
    {
        int _1666 = ~_1650;
        int _1668 = _1666 + 1;
        _1664 = _1668;
    }
    int _1670 = _1664;
    float _1672 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1674 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1676 = _1039 > 0.5;
    int _1678 = ~_1654;
    int _1680 = _1678 + 1;
    int _1682 = _1680 + 1;
    float _1684 = fma(_1674, -2.0, _1672);
    int _1686 = _1682;
    float _1688 = _1672;
    float _1690 = _1674;
    if (_1652)
    {
        int _1692 = ~_1654;
        int _1694 = _1692 + 1;
        _1686 = _1694;
    }
    int _1696 = _1686;
    float _1698 = -_193;
    int _1700 = _1676 ? as_type<int>(_1698) : as_type<int>(_193);
    float _1702 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1684);
    bool _1704 = _1572 > 0.0;
    bool _1706 = _1572 >= 0.0;
    bool _1708 = isnan(_1572);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan(0.0);
    bool _1714 = _1710 || _1712;
    float _1716 = _1518 * _145;
    if (!_1656)
    {
        _1688 = _1043;
    }
    float _1718 = _1688;
    float _1720 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1722 = _1718;
    if (_1656)
    {
        _1722 = _1041;
    }
    float _1724 = _1722;
    float _1726 = exp2(_1716);
    if (!_1656)
    {
        _1690 = _1041;
    }
    float _1728 = _1690;
    float _1730 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1720);
    float _1732 = float(uint(_1294));
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1736 = _1728;
    float _1738 = _1734;
    if (_1656)
    {
        _1736 = _1039;
    }
    float _1740 = _1736;
    float _1742 = trunc(_1432);
    float _1744 = precise::max(_1742, 0.0);
    uint _1746 = uint(_1744);
    if (!_1656)
    {
        _1588 = _1041;
    }
    float _1748 = _1588;
    float _1750 = as_type<float>(_1060) * _1732;
    float _1752 = _1748;
    if (_1656)
    {
        _1752 = _1039;
    }
    float _1754 = _1752;
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1734);
    if (!_1656)
    {
        _1738 = _1043;
    }
    float _1758 = _1738;
    float _1760 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1730);
    float _1762 = _1758;
    if (_1656)
    {
        _1762 = _1041;
    }
    float _1764 = _1762;
    float _1766 = trunc(_1750);
    float _1768 = precise::max(_1766, 0.0);
    uint _1770 = uint(_1768);
    float _1772 = -_1726;
    float _1774 = _1772 + 1.0;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1778 = _1754 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1780 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1782 = isnan(0.0);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1788 = _1784 || _1786;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1792 = _1764 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1794 = -_1776;
    float _1796 = fma(_1778, 2.0, _1794);
    float _1798 = _1788 ? _1774 : 0.0;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1802 = 1.0 + _1800;
    float _1804 = fma(_1792, -2.0, _1790);
    bool _1806 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1808 = isnan(1.0);
    bool _1810 = _1806 || _1808;
    bool _1812 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1814 = _1810 || _1812;
    float _1816 = 1.0 / _1802;
    int _1818 = ~_973;
    int _1820 = _1818 + 1;
    float _1822 = -_145;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1796);
    int _1826 = _1031 * int(_1770);
    int _1828 = _1826 + _1294;
    float _1830 = _1041 * 2.0;
    float _1832 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1756);
    float _1834 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1804);
    int _1836 = _1820 * int(_1746);
    int _1838 = _1836 + _1224;
    float _1840 = floor(_1830);
    float _1842 = float(uint(_1828));
    int _1844 = _1714 ? 0 : 1;
    float _1846 = float(uint(_1838));
    float _1848 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1852 = as_type<float>(_1060) * _1842;
    int _1854 = ~_1844;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    float _1860 = as_type<float>(_1015) * _1846;
    float _1862 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1848);
    float _1864 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1850);
    float _1866 = trunc(_1852);
    float _1868 = precise::max(_1866, 0.0);
    uint _1870 = uint(_1868);
    int _1872 = _1858;
    if (!_1704)
    {
        int _1874 = ~_1844;
        int _1876 = _1874 + 1;
        _1872 = _1876;
    }
    int _1878 = _1872;
    float _1880 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1862);
    float _1882 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1864);
    if (_1814)
    {
        float _1884 = _1798 * _1816;
        _147 = _1884;
    }
    float _1886 = _147;
    bool _1888 = _1840 > 0.0;
    bool _1890 = _1840 >= 0.0;
    bool _1892 = isnan(_1840);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(0.0);
    bool _1898 = _1894 || _1896;
    float _1900 = trunc(_1860);
    float _1902 = precise::max(_1900, 0.0);
    uint _1904 = uint(_1902);
    bool _1906 = _1041 > 0.5;
    float _1908 = -_203;
    int _1910 = _1906 ? as_type<int>(_1908) : as_type<int>(_203);
    bool _1912 = _1043 > 0.5;
    int _1914 = _1898 ? 0 : 1;
    int _1916 = int(_1770) + int(_1870);
    int _1918 = ~_1914;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1926 = _1924 != 0;
    int _1928 = _1922;
    if (!_1888)
    {
        int _1930 = ~_1914;
        int _1932 = _1930 + 1;
        _1928 = _1932;
    }
    int _1934 = _1928;
    int _1936 = int(_1746) + int(_1904);
    float _1938 = -_193;
    int _1940 = _1912 ? as_type<int>(_1938) : as_type<int>(_193);
    float _1942 = in.m_48.x;
    float _1944 = in.m_48.y;
    float _1946 = in.m_48.z;
    int _1948 = ~_973;
    int _1950 = _1948 + 1;
    int _1952 = ~_1013;
    int _1954 = _1952 + 1;
    int _1956 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1958 = _1956 != 0;
    int _1960 = _1950 * _1936;
    int _1962 = _1960 + _1224;
    bool _1964 = !_1926;
    float _1966 = _1964 ? _193 : as_type<float>(_1700);
    int _1968 = _1954 * _1916;
    int _1970 = _1968 + _1294;
    bool _1972 = !_1958;
    float _1974 = _1972 ? _203 : as_type<float>(_1602);
    int _1976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1978 = _1976 != 0;
    int _1980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1982 = _1980 != 0;
    float _1984 = _1974 + (-0.5);
    bool _1986 = !_1978;
    float _1988 = _1986 ? _203 : as_type<float>(_1910);
    float _1990 = -_1984;
    float _1992 = -_1834;
    float _1994 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1992);
    bool _1996 = !_1982;
    float _1998 = _1996 ? _193 : as_type<float>(_1940);
    float _2000 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2002 = _2000 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2004 = uint(_1962) >= uint(_973);
    bool _2006 = uint(_1970) >= uint(_1013);
    float _2008 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2010 = 1.0 / _2002;
    bool _2012 = !_2004;
    int _2014 = _2012 ? 0 : (-1);
    float _2016 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2020 = _2018 != 0;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2024 = _2022 != 0;
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2028 = _2026 != 0;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _2034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2036 = _2034 != 0;
    float _2038 = _1043 * 2.0;
    float _2040 = _1944 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2042 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2008);
    float _2044 = 1.0 / _2032;
    float _2046 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2016);
    float _2048 = fma(_1942, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2040);
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2050;
    float _2054 = _1039 + _1041;
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2060 = _2052 * _2010;
    float _2062 = floor(_2038);
    float _2064 = _1043 + _1041;
    float _2066 = _2054 + (-1.0);
    bool _2068 = !_2006;
    int _2070 = _2068 ? 0 : (-1);
    float _2072 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2042);
    float _2074 = _2064 + (-1.0);
    float _2076 = fma(_2066, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2078 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2080 = isnan(_953);
    bool _2082 = _2078 || _2080;
    bool _2084 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2086 = _2082 || _2084;
    float _2088 = float(_2086);
    float _2090 = _2058 * _2044;
    float _2092 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2046);
    bool _2094 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2096 = isnan(_953);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = -_2088;
    float _2108 = _2106 + 1.0;
    bool _2110 = !_2020;
    int _2112 = _2110 ? 0 : 1;
    float _2114 = fma(_2074, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2116 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2118 = isnan(_953);
    bool _2120 = _2116 || _2118;
    bool _2122 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2124 = _2120 || _2122;
    float _2126 = float(_2124);
    float _2128 = -_2104;
    float _2130 = _2128 + 1.0;
    bool _2132 = _2062 >= 0.0;
    bool _2134 = isnan(_2062);
    bool _2136 = _2132 || _2134;
    bool _2138 = isnan(0.0);
    bool _2140 = _2136 || _2138;
    float _2142 = fma(_2060, _961, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2144 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2146 = _953 + _2144;
    float _2148 = _2126 * _2130;
    int _2150 = _2140 ? 0 : 1;
    float _2152 = -_2126;
    float _2154 = _2152 + 1.0;
    bool _2156 = _2062 > 0.0;
    float _2158 = _2104 * _2108;
    float _2160 = fma(_1946, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2048);
    float _2162 = _1988 + (-0.5);
    float _2164 = _2142 * _2148;
    int _2166 = abs(_2112);
    float _2168 = fma(_2090, _2146, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2170 = -_2162;
    float _2172 = -_1702;
    float _2174 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2172);
    int _2176 = ~_2150;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    float _2182 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2164);
    bool _2184 = !_2024;
    int _2186 = _2184 ? 0 : 1;
    float _2188 = _2092 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2190 = float(_1878);
    float _2192 = fma(_2168, _2158, _2182);
    int _2194 = _2180;
    if (!_2156)
    {
        int _2196 = ~_2150;
        int _2198 = _2196 + 1;
        _2194 = _2198;
    }
    int _2200 = _2194;
    float _2202 = _1966 + 0.5;
    float _2204 = fma(_2088, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2192);
    int _2206 = _1530 >> 31;
    float _2208 = _2072 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2210 = _1584 >> 31;
    float _2212 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2214 = _2188 + _2212;
    int _2216 = _2206 & 3;
    float _2218 = fma(_2202, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1644);
    int _2220 = abs(_2186);
    float _2222 = _2160 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2224 = _1530 + _2216;
    float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2228 = _2208 + _2226;
    int _2230 = _2210 & 3;
    float _2232 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2234 = _2224 >> 2;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2238 = _2222 + _2236;
    int _2240 = _1584 + _2230;
    float _2242 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2232);
    int _2244 = _2234 << 4;
    int _2246 = _2244 + 368;
    float _2248 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2250 = _2240 >> 2;
    float _2252 = fma(_2238, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2242);
    float _2254 = float(_2220);
    uint _2256 = uint(int(uint(_2246) >> uint(2)));
    uint _2258 = uint(int(uint(int(_2256)) >> uint(2)));
    int _2260 = int(_2256) & 3;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[int(_2258)][_2260];
    int _2264 = int(_2256) + 1;
    uint _2266 = uint(int(uint(_2264) >> uint(2)));
    int _2268 = _2264 & 3;
    float _2270 = (*spvDescriptorSet0.vp_c9)._m0[int(_2266)][_2268];
    int _2272 = _2250 << 4;
    int _2274 = _2272 + 512;
    float _2276 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2278 = _1998 + 0.5;
    float _2280 = _2254 * _2190;
    float _2282 = _2248 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2284 = !_1536;
    int _2286 = _2284 ? 0 : 1;
    float _2288 = _2204 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    uint _2290 = uint(int(uint(_2274) >> uint(2)));
    uint _2292 = uint(int(uint(int(_2290)) >> uint(2)));
    int _2294 = int(_2290) & 3;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[int(_2292)][_2294];
    int _2298 = int(_2290) + 1;
    uint _2300 = uint(int(uint(_2298) >> uint(2)));
    int _2302 = _2298 & 3;
    float _2304 = (*spvDescriptorSet0.vp_c9)._m0[int(_2300)][_2302];
    bool _2306 = _2252 >= 0.0;
    float _2308 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1824);
    int _2310 = ~_1936;
    int _2312 = _2310 + _2014;
    int _2314 = _2312 + 1;
    out.m_66.x = _2276;
    out.m_66.y = _977;
    out.m_66.z = _2282;
    out.m_66.w = _2288;
    int _2316 = abs(_1594);
    float _2318 = _2280 * (-2.0);
    int _2320 = abs(_1696);
    int _2322 = _2246 + 8;
    uint _2324 = uint(int(uint(_2322) >> uint(2)));
    uint _2326 = uint(int(uint(int(_2324)) >> uint(2)));
    int _2328 = int(_2324) & 3;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[int(_2326)][_2328];
    int _2332 = int(_2324) + 1;
    uint _2334 = uint(int(uint(_2332) >> uint(2)));
    int _2336 = _2332 & 3;
    float _2338 = (*spvDescriptorSet0.vp_c9)._m0[int(_2334)][_2336];
    float _2340 = float(_2166);
    int _2342 = _973 * _2314;
    int _2344 = _2342 + _1224;
    float _2346 = float(_2200);
    float _2348 = fma(_2114, _2318, _2114);
    int _2350 = ~_1916;
    int _2352 = _2350 + _2070;
    int _2354 = _2352 + 1;
    if (_2306)
    {
        out.m_51.x = 0.0;
    }
    bool _2356 = _1013 == 0;
    int _2358 = _2274 + 8;
    uint _2360 = uint(int(uint(_2358) >> uint(2)));
    uint _2362 = uint(int(uint(int(_2360)) >> uint(2)));
    int _2364 = int(_2360) & 3;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[int(_2362)][_2364];
    int _2368 = int(_2360) + 1;
    uint _2370 = uint(int(uint(_2368) >> uint(2)));
    int _2372 = _2368 & 3;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[int(_2370)][_2372];
    float _2376 = _2340 * _2346;
    bool _2378 = !_1606;
    int _2380 = _2378 ? 0 : 1;
    float _2382 = in.m_68.x;
    float _2384 = in.m_68.y;
    float _2386 = in.m_68.z;
    int _2388 = abs(_1670);
    int _2390 = _1013 * _2354;
    int _2392 = _2390 + _1294;
    int _2394 = abs(_2380);
    float _2396 = _2376 * (-2.0);
    int _2398 = abs(_2286);
    float _2400 = fma(_2076, _2396, _2076);
    int _2402 = ~_2316;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = ~_2398;
    int _2410 = _2408 + 1;
    int _2412 = _2410 + 1;
    int _2414 = ~_2388;
    int _2416 = _2414 + 1;
    int _2418 = _2416 + 1;
    int _2420 = abs(_1624);
    bool _2422 = _1534 != 3;
    int _2424 = ~_2420;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = _2406 * as_type<int>(_2270);
    int _2432 = ~_2394;
    int _2434 = _2432 + 1;
    int _2436 = _2434 + 1;
    bool _2438 = !_2356;
    int _2440 = _2438 ? _2392 : (-1);
    int _2442 = _2412 * as_type<int>(_2262);
    int _2444 = _2442 + _2430;
    bool _2446 = !_2036;
    int _2448 = _2446 ? 0 : 1;
    float _2450 = fma(_2396, _2382, _2382);
    bool _2452 = _1604 != 3;
    int _2454 = _2418 * as_type<int>(_2304);
    int _2456 = abs(_2448);
    float _2458 = fma(_2318, _2384, _2384);
    int _2460 = abs(_1616);
    int _2462 = _2436 * as_type<int>(_2296);
    int _2464 = _2462 + _2454;
    bool _2466 = !_2452;
    int _2468 = _2466 ? 0 : (-1);
    bool _2470 = _973 == 0;
    int _2472 = _2428 * as_type<int>(_2330);
    int _2474 = _2472 + _2444;
    bool _2476 = !_2422;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = abs(_2468);
    int _2482 = abs(_2478);
    int _2484 = ~_2320;
    int _2486 = _2484 + 1;
    int _2488 = _2486 + 1;
    int _2490 = ~_2482;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = ~_2480;
    int _2498 = _2496 + 1;
    int _2500 = _2498 + 1;
    int _2502 = _2488 * as_type<int>(_2366);
    int _2504 = _2502 + _2464;
    int _2506 = ~_2460;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = _2494 * as_type<int>(_2338);
    int _2514 = _2512 + _2474;
    int _2516 = ~_2456;
    int _2518 = _2516 + 1;
    int _2520 = _2518 + 1;
    int _2522 = _2500 * as_type<int>(_2374);
    int _2524 = _2522 + _2504;
    bool _2526 = !_2470;
    int _2528 = _2526 ? _2344 : (-1);
    int _2530 = _2514 * _2510;
    float _2532 = as_type<float>(_2480);
    if (_2306)
    {
        _2532 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2534 = _2532;
    int _2536 = _2524 * _2520;
    float _2538 = _2214 * _2214;
    int _2540 = _2528 * _2460;
    int _2542 = _2540 + _2530;
    float _2544 = -_1880;
    float _2546 = _2544 + 1.0;
    int _2548 = _2440 * _2456;
    int _2550 = _2548 + _2536;
    float _2552 = fma(_2228, _2228, _2538);
    float _2554 = -_1760;
    float _2556 = _2554 + 1.0;
    float _2558 = -_1882;
    float _2560 = _2558 + 1.0;
    float _2562 = -_1832;
    float _2564 = _2562 + 1.0;
    float _2566 = fma(_2238, _2238, _2552);
    float _2568 = fma(_1974, _2556, _1994);
    float _2570 = _1039 + (-0.5);
    float _2572 = -_2546;
    float _2574 = fma(_1966, _2572, _2218);
    float _2576 = rsqrt(_2566);
    float _2578 = fma(_1988, _2560, _2174);
    float _2580 = -_2564;
    float _2582 = fma(_1998, _2580, _2308);
    int _2584 = as_type<int>(_2534);
    if (_2306)
    {
        float _2586 = _2534 * 5.0;
        _2584 = as_type<int>(_2586);
    }
    int _2588 = _2584;
    float _2590 = float(_2542);
    float _2592 = fma(_2570, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2450);
    float _2594 = float(_2550);
    out.m_70.x = _2574;
    out.m_70.y = _2578;
    out.m_70.z = _2582;
    out.m_70.w = _2568;
    bool _2596 = !_2028;
    int _2598 = _2596 ? 0 : 1;
    float _2600 = _1041 + (-0.5);
    float _2602 = fma(_2400, _1886, _2592);
    if (_2306)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7912 = as_type<float>(_2588);
        out.gl_Position.z = _7912;
    }
    int _2604 = abs(_2598);
    out.m_72.x = _2590;
    out.m_72.y = _2594;
    float _2606 = _2214 * _2576;
    float _2608 = _2228 * _2576;
    if (_2306)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2610 = -_2606;
    float _2612 = fma(_2610, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2188);
    float _2614 = _2238 * _2576;
    float _2616 = -_2608;
    float _2618 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2208);
    float _2620 = float(_1934);
    float _2622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2624 = _2612 + _2622;
    float _2626 = -_2614;
    float _2628 = fma(_2626, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2222);
    float _2630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2632 = _2618 + _2630;
    float _2634 = float(_2604);
    float _2636 = _2624 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2638 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2640 = _2628 + _2638;
    float _2642 = -_2606;
    float _2644 = fma(_2642, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2214);
    float _2646 = -_2608;
    float _2648 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2228);
    float _2650 = fma(_2632, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2636);
    float _2652 = _2634 * _2620;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2600, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2458);
    float _2658 = fma(_2640, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2650);
    float _2660 = _1043 + _1039;
    float _2662 = fma(_2648, _2648, _2654);
    float _2664 = -_2614;
    float _2666 = fma(_2664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2668 = fma(_2348, _1886, _2656);
    bool _2670 = _2658 >= 0.0;
    float _2672 = _2660 + (-1.0);
    float _2674 = fma(_2666, _2666, _2662);
    float _2676 = _2652 * (-2.0);
    float _2678 = _2602 * 0.15915493667125701904296875;
    float _2680 = _2668 * 0.15915493667125701904296875;
    float _2682 = fma(_2672, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2684 = _1043 + (-0.5);
    float _2686 = fma(_2676, _2386, _2386);
    float _2688 = _2678 * 6.283185482025146484375;
    float _2690 = sin(_2688);
    float _2692 = fma(_2682, _2676, _2682);
    float _2694 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _2696 = as_type<int>(_2684);
    float _2698 = _2624;
    float _2700 = _2640;
    if (_2670)
    {
        _2694 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2702 = _2694;
    float _2704 = fma(_2684, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2686);
    if (_2670)
    {
        out.m_51.x = 0.0;
    }
    float _2706 = _2678 * 6.283185482025146484375;
    float _2708 = cos(_2706);
    if (_2670)
    {
        float _2710 = _2702 * 5.0;
        _2696 = as_type<int>(_2710);
    }
    int _2712 = _2696;
    float _2714 = fma(_2692, _1886, _2704);
    if (_2670)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8112 = as_type<float>(_2712);
        out.gl_Position.z = _8112;
    }
    float _2716 = _2714 * 0.15915493667125701904296875;
    float _2718 = _2680 * 6.283185482025146484375;
    float _2720 = sin(_2718);
    float _2722 = sqrt(_2674);
    float _2724 = _2680 * 6.283185482025146484375;
    float _2726 = cos(_2724);
    if (_2670)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2728 = _2716 * 6.283185482025146484375;
    float _2730 = cos(_2728);
    float _2732 = _2576 * _2722;
    float _2734 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2738 = _2690 * _2720;
    float _2740 = _2708 * _2726;
    float _2742 = _2732 * _2734;
    float _2744 = _2690 * _2726;
    float _2746 = _2716 * 6.283185482025146484375;
    float _2748 = sin(_2746);
    float _2750 = _2708 * _2720;
    float _2752 = _2736 * _2742;
    float _2754 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2756 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2758 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2760 = _2732 * _2754;
    float _2762 = _2708 * _2730;
    float _2764 = _2726 * _2730;
    float _2766 = _2690 * _2730;
    float _2768 = _2720 * _2730;
    float _2770 = _2756 * _2760;
    float _2772 = _2762 * _2752;
    float _2774 = _2732 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2776 = _2774 * 0.5;
    float _2778 = fma(_2748, _2740, _2738);
    float _2780 = -_2752;
    float _2782 = _2748 * _2780;
    float _2784 = -_2744;
    float _2786 = fma(_2748, _2750, _2784);
    float _2788 = -_2750;
    float _2790 = fma(_2748, _2744, _2788);
    float _2792 = fma(_2778, _2770, _2772);
    float _2794 = _2766 * _2752;
    float _2796 = fma(_2764, _2770, _2782);
    float _2798 = fma(_2748, _2738, _2740);
    float _2800 = fma(_2786, _2776, _2792);
    float _2802 = fma(_2790, _2770, _2794);
    float _2804 = fma(_2768, _2776, _2796);
    float _2806 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2808 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2810 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2812 = fma(_2798, _2776, _2802);
    float _2814 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2808);
    float _2818 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2810);
    float _2820 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2822 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2816);
    float _2824 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2818);
    float _2826 = -_2748;
    float _2828 = fma(_2826, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2820);
    float _2830 = _2822 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2832 = _2824 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2834 = _2778 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2836 = _2800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2838 = _2208 + _2830;
    float _2840 = _2222 + _2832;
    float _2842 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2814);
    float _2844 = fma(_2758, _2758, 1.0);
    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2848 = _2838 + _2846;
    float _2850 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2852 = _2840 + _2850;
    float _2854 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2836);
    float _2856 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2858 = _2848 * _2848;
    float _2860 = _2852 * _2852;
    float _2862 = fma(_2812, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2854);
    float _2864 = rsqrt(_2844);
    float _2866 = _2762 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2868 = _2858 + _2860;
    float _2870 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2872 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2834);
    float _2874 = fma(_2764, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2806);
    float _2876 = -_2748;
    float _2878 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2856);
    float _2880 = -_2748;
    float _2882 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2866);
    float _2884 = sqrt(_2868);
    float _2886 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2888 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2890 = _2786 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2892 = _2188 + _2870;
    float _2894 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2886);
    float _2896 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2888);
    float _2898 = fma(_2768, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2890);
    bool _2900 = _2884 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2902 = _2886;
    float _2904 = _2768;
    float _2906 = _2762;
    float _2908 = _2888;
    float _2910 = _2890;
    float _2912 = _2872;
    if (!_2900)
    {
        _2902 = _2860;
    }
    float _2914 = _2902;
    float _2916 = _2914;
    if (!_2900)
    {
        _2904 = _2858;
    }
    float _2918 = _2904;
    float _2920 = _2918;
    if (!_2900)
    {
        _2906 = _2838;
    }
    float _2922 = _2906;
    float _2924 = _2922;
    if (!_2900)
    {
        _2908 = _2840;
    }
    float _2926 = _2908;
    float _2928 = _2926;
    if (!_2900)
    {
        _2910 = _2892;
    }
    float _2930 = _2910;
    bool _2932 = !_2900;
    float _2934 = _2930;
    if (!_2932)
    {
        float _2936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2940 = _2884 + _2938;
        float _2942 = _2892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2944 = rsqrt(_2868);
        float _2946 = _2940 * _2936;
        float _2948 = _2946 * 0.15915493667125701904296875;
        float _2950 = _2948 * 6.283185482025146484375;
        float _2952 = sin(_2950);
        float _2954 = _2948 * 6.283185482025146484375;
        float _2956 = cos(_2954);
        float _2958 = fma(_2952, _2942, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2960 = _2944 * _2958;
        float _2962 = _2956 + (-1.0);
        float _2964 = fma(_2848, _2960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2966 = fma(_2852, _2960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2968 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2970 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2972 = _2964 + _2970;
        float _2974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2976 = _2966 + _2974;
        float _2978 = fma(_2892, _2956, _2968);
        float _2980 = _2972 * _2972;
        float _2982 = _2976 * _2976;
        _2934 = _2978;
        _2920 = _2980;
        _2916 = _2982;
        _2924 = _2964;
        _2928 = _2966;
    }
    float _2984 = _2934;
    float _2986 = _2920;
    float _2988 = _2916;
    float _2990 = _2924;
    float _2992 = _2928;
    float _2994 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2996 = _2984 + _2994;
    float _2998 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2878);
    float _3000 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2882);
    float _3002 = fma(_2766, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2828);
    float _3004 = fma(_2996, _2996, _2986);
    float _3006 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2894);
    float _3008 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2896);
    float _3010 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2898);
    float _3012 = _3004 + _2988;
    float _3014 = _2758 * _2864;
    float _3016 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2842);
    float _3018 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3020 = _2758 * _2998;
    float _3022 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2872);
    float _3024 = _2758 * _3000;
    float _3026 = fma(_2790, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2874);
    float _3028 = _2758 * _3002;
    float _3030 = -_3006;
    float _3032 = _3014 * _3030;
    float _3034 = -_3008;
    float _3036 = _3014 * _3034;
    float _3038 = -_3010;
    float _3040 = _3014 * _3038;
    float _3042 = fma(_3018, _3016, _3020);
    float _3044 = sqrt(_3012);
    float _3046 = fma(_3018, _3022, _3024);
    float _3048 = fma(_3018, _3026, _3028);
    float _3050 = fma(_2864, _2998, _3032);
    float _3052 = _3006 + _3042;
    float _3054 = fma(_2864, _3000, _3036);
    float _3056 = _3008 + _3046;
    float _3058 = fma(_2864, _3002, _3040);
    float _3060 = _3010 + _3048;
    out.m_74.x = _3016;
    out.m_74.y = _3022;
    out.m_74.z = _3026;
    out.m_76.x = _3050;
    out.m_76.y = _3054;
    out.m_76.z = _3058;
    bool _3062 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3064 = isnan(_3044);
    bool _3066 = _3062 || _3064;
    bool _3068 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3070 = _3066 || _3068;
    out.m_78.x = _3052;
    out.m_78.y = _3056;
    out.m_78.z = _3060;
    float _3072 = _2990;
    float _3074 = _3050;
    if (!_3070)
    {
        _2912 = 1.0;
    }
    float _3076 = _2912;
    bool _3078 = !_3070;
    float _3080 = _3076;
    if (!_3078)
    {
        bool _3082 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3084 = isnan(_3044);
        bool _3086 = _3082 || _3084;
        bool _3088 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3090 = _3086 || _3088;
        if (!_3090)
        {
            float _3092 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3094 = _3044 + _3092;
            float _3096 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3098 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3096;
            float _3100 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3104 = 1.0 / _3098;
            float _3106 = _3094 * _3104;
            float _3108 = fma(_3106, _3102, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3080 = _3108;
            _3110 = true;
        }
        else
        {
            bool _3112 = _3044 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3114 = isnan(_3044);
            bool _3116 = _3112 || _3114;
            bool _3118 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3120 = _3116 || _3118;
            if (!_3120)
            {
                float _3122 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3124 = _3044 + _3122;
                float _3126 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3128 = _3126 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3130 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3132 = _3130 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3134 = 1.0 / _3128;
                float _3136 = _3124 * _3134;
                float _3138 = fma(_3136, _3132, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3080 = _3138;
                _3110 = true;
            }
            else
            {
                _3080 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3110 = false;
    float _3140 = _3080;
    float _3142 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3144 = _2984 + _3142;
    float _3146 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3148 = _2990 + _3146;
    float _3150 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3152 = _2992 + _3150;
    float _3154 = fma(_3144, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3156 = fma(_3148, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3158 = fma(_3152, _3140, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3160 = -_2188;
    float _3162 = _3160 + _3154;
    float _3164 = -_2208;
    float _3166 = _3164 + _3156;
    float _3168 = -_2222;
    float _3170 = _3168 + _3158;
    float _3172 = _3162 * _3162;
    float _3174 = fma(_3166, _3166, _3172);
    float _3176 = fma(_3170, _3170, _3174);
    float _3178 = sqrt(_3176);
    bool _3180 = _3178 > 0.0;
    bool _3182 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3184 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan(0.5);
    bool _3190 = _3186 || _3188;
    float _3192 = _3156;
    if (!_3180)
    {
        _3072 = _3154;
    }
    float _3194 = _3072;
    float _3196 = _3194;
    if (!_3180)
    {
        _3074 = _3158;
    }
    float _3198 = _3074;
    bool _3200 = !_3180;
    float _3202 = _3198;
    float _3204 = _3198;
    if (!_3200)
    {
        float _3206 = _207 * _207;
        float _3208 = fma(_205, _205, _3206);
        float _3210 = fma(_209, _209, _3208);
        float _3212 = rsqrt(_3176);
        float _3214 = sqrt(_3210);
        float _3216 = _3166 * _3212;
        float _3218 = _3162 * _3212;
        float _3220 = _3170 * _3212;
        bool _3222 = _3214 > 0.0;
        float _3224 = _3214;
        if (!_3222)
        {
            _3224 = _3154;
        }
        float _3226 = _3224;
        _3196 = _3226;
        if (!_3222)
        {
            _3202 = _3158;
        }
        float _3228 = _3202;
        bool _3230 = !_3222;
        _3204 = _3228;
        if (!_3230)
        {
            float _3232 = rsqrt(_3210);
            float _3234 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3236 = _207 * _3232;
            float _3238 = _205 * _3232;
            float _3240 = _209 * _3232;
            float _3242 = _3218 * _3236;
            float _3244 = fma(_3216, _3238, _3242);
            float _3246 = _3234 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3248 = fma(_3220, _3240, _3244);
            float _3250 = _3248 * _3246;
            float _3252 = fma(_205, _3250, _3156);
            float _3254 = fma(_207, _3250, _3154);
            float _3256 = fma(_209, _3250, _3158);
            _3192 = _3252;
            _3196 = _3254;
            _3204 = _3256;
        }
    }
    float _3258 = _3192;
    float _3260 = _3196;
    float _3262 = _3204;
    float _3264 = -_2608;
    float _3266 = fma(_3264, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3258);
    float _3268 = -_2606;
    float _3270 = fma(_3268, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3260);
    float _3272 = -_2614;
    float _3274 = fma(_3272, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3262);
    float _3276 = _3270;
    float _3278 = _3266;
    float _3280 = _3274;
    if (!_3190)
    {
        float _3282 = _2624 * _2624;
        float _3284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3286 = -_2222;
        float _3288 = _3286 + _3262;
        float _3290 = fma(_2632, _2632, _3282);
        float _3292 = fma(_2640, _2640, _3290);
        float _3294 = 1.0 / _2732;
        float _3296 = sqrt(_3292);
        float _3298 = precise::min(_3296, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3300 = _3298 * _3284;
        float _3302 = -_2208;
        float _3304 = _3302 + _3258;
        float _3306 = _3300 * _3294;
        float _3308 = -_2188;
        float _3310 = _3308 + _3260;
        float _3312 = fma(_3304, _3306, _2618);
        float _3314 = fma(_3310, _3306, _2612);
        float _3316 = fma(_3288, _3306, _2628);
        _3276 = _3314;
        _3278 = _3312;
        _3280 = _3316;
    }
    float _3318 = _3276;
    float _3320 = _3278;
    float _3322 = _3280;
    float _3324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3326 = _3318 + _3324;
    float _3328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3330 = _3320 + _3328;
    float _3332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3334 = _3322 + _3332;
    float _3336 = _3326 * _3326;
    float _3338 = fma(_3330, _3330, _3336);
    float _3340 = fma(_3334, _3334, _3338);
    float _3342 = rsqrt(_3340);
    float _3344 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3346 = _3330 * _3344;
    float _3348 = _3334 * _3344;
    float _3350 = _3346 * _3346;
    float _3352 = _3348 * _3348;
    float _3354 = _3350 + _3352;
    float _3356 = sqrt(_3354);
    bool _3358 = _3356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3362 = _3356 + _3360;
    float _3364 = _3342;
    float _3366 = _3362;
    float _3368 = _3326;
    if (_3358)
    {
        float _3370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3364 = _3370;
    }
    float _3372 = _3364;
    if (_3358)
    {
        float _3374 = rsqrt(_3354);
        _2698 = _3374;
    }
    float _3376 = _2698;
    float _3378 = _3376;
    if (_3358)
    {
        float _3380 = _3362 * _3372;
        _3366 = _3380;
    }
    float _3382 = _3366;
    if (_3358)
    {
        float _3384 = _3382 * 0.15915493667125701904296875;
        _2700 = _3384;
    }
    float _3386 = _2700;
    float _3388 = _3334;
    float _3390 = _3386;
    if (_3358)
    {
        float _3392 = _3386 * 6.283185482025146484375;
        float _3394 = sin(_3392);
        _3388 = _3394;
    }
    float _3396 = _3388;
    float _3398 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3400 = precise::max(0.0, _3398);
    float _3402 = _3372;
    float _3404 = _3400;
    if (_3358)
    {
        float _3406 = _3386 * 6.283185482025146484375;
        float _3408 = cos(_3406);
        _3402 = _3408;
    }
    float _3410 = _3402;
    float _3412 = -_3344;
    float _3414 = -_3400;
    float _3416 = fma(_3326, _3412, _3414);
    if (_3358)
    {
        float _3418 = _3416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3368 = _3418;
    }
    float _3420 = _3368;
    float _3422 = _3420;
    if (!_3358)
    {
        _3390 = _3352;
    }
    float _3424 = _3390;
    float _3426 = _3396;
    float _3428 = _3424;
    if (_3358)
    {
        float _3430 = fma(_3396, _3420, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3422 = _3430;
    }
    float _3432 = _3422;
    float _3434 = _3432;
    if (!_3358)
    {
        _3426 = _3416;
    }
    float _3436 = _3426;
    float _3438 = _3436;
    float _3440 = _3410;
    if (_3358)
    {
        float _3442 = _3410 + (-1.0);
        _3404 = _3442;
    }
    float _3444 = _3404;
    float _3446 = _3444;
    if (_3358)
    {
        float _3448 = _3376 * _3432;
        _213 = _3448;
    }
    float _3450 = _213;
    if (!_3358)
    {
        _3378 = _3346;
    }
    float _3452 = _3378;
    float _3454 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3456 = _3452;
    if (_3358)
    {
        float _3458 = _3444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3446 = _3458;
    }
    float _3460 = _3446;
    if (_3358)
    {
        float _3462 = _3346 * _3450;
        _3456 = _3462;
    }
    float _3464 = _3456;
    if (!_3358)
    {
        _3434 = _3348;
    }
    float _3466 = _3434;
    float _3468 = _3466;
    if (_3358)
    {
        float _3470 = _3348 * _3450;
        _3468 = _3470;
    }
    float _3472 = _3468;
    if (_3358)
    {
        float _3474 = fma(_3416, _3410, _3460);
        _3438 = _3474;
    }
    float _3476 = _3438;
    if (!_3358)
    {
        _3440 = _3350;
    }
    float _3478 = _3440;
    float _3480 = sqrt(_3340);
    float _3482 = _3478;
    if (_3358)
    {
        float _3484 = _3464 * _3464;
        _3482 = _3484;
    }
    float _3486 = _3482;
    if (_3358)
    {
        float _3488 = _3472 * _3472;
        _3428 = _3488;
    }
    float _3490 = _3428;
    float _3492 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3494 = fma(_3476, _3476, _3486);
    float _3496 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3498 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3500 = _3494 + _3490;
    float _3502 = floor(_3496);
    float _3504 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3498);
    float _3506 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3492);
    float _3508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3510 = fma(_3480, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3508);
    float _3512 = precise::clamp(_3510, 0.0, 1.0);
    float _3514 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3504);
    float _3516 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3506);
    float _3518 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3520 = rsqrt(_3500);
    float _3522 = _3514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3524 = -_3512;
    float _3526 = _3524 + 1.0;
    float _3528 = _3522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3530 = abs(_3526);
    float _3532 = log2(_3530);
    float _3534 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3536 = -_3528;
    float _3538 = fma(_3536, _3454, 1.0);
    float _3540 = _3318 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3542 = -_3502;
    float _3544 = _3496 + _3542;
    float _3546 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3534);
    float _3548 = fma(_3320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3540);
    float _3550 = _3520 * _3464;
    float _3552 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3546);
    float _3554 = _3520 * _3476;
    float _3556 = fma(_3322, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3548);
    float _3558 = _3520 * _3472;
    float _3560 = _3552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3562 = _3550 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3564 = _3556 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3566 = log2(_3538);
    float _3568 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3570 = -_3562;
    float _3572 = fma(_3554, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3570);
    float _3574 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3576 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3578 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3568);
    float _3580 = -_3558;
    float _3582 = fma(_3580, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3572);
    float _3584 = floor(_3518);
    float _3586 = _3516 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3588 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3578);
    float _3590 = fma(_3582, -0.5, 0.5);
    float _3592 = fma(_3582, 0.5, 0.5);
    float _3594 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3576);
    float _3596 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3588);
    float _3598 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3600 = exp2(_3574);
    float _3602 = _3554 + 1.0;
    float _3604 = _3566 * 0.693147182464599609375;
    float _3606 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3598);
    float _3608 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3594);
    float _3610 = 1.0 / _3596;
    float _3612 = -_3584;
    float _3614 = _3518 + _3612;
    float _3616 = fma(_3592, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3618 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3608);
    float _3620 = fma(_3592, _3616, -0.212114393711090087890625);
    float _3622 = sqrt(_3590);
    float _3624 = -_3554;
    float _3626 = fma(_3600, _3602, _3624);
    float2 _9650 = float2(_3544, _3614);
    float _3628 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9650, float2(0.0), isnan(_9650)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9650, float2(0.0), isnan(_9650)), level(0.0)).x;
    float _3630 = fma(_3592, _3620, 1.570728778839111328125);
    float _3632 = fma(_3626, 0.5, 0.5);
    float _3634 = _3618 * _3610;
    float _3636 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3606);
    float _3638 = fma(_3634, -0.5, 0.5);
    float _3640 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3636);
    float _3642 = _3622 * 0.636619746685028076171875;
    float _3644 = _3640 * _3610;
    float _3646 = _3604 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3648 = -_3630;
    float _3650 = fma(_3642, _3648, 1.0);
    float _3652 = fma(_3644, 0.5, 0.5);
    float3 _9699 = float3(_3652, _3638, _3646);
    float _3654 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9699, float3(0.0), isnan(_9699)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9699, float3(0.0), isnan(_9699)), level(0.0)).x;
    float3 _9710 = float3(_3652, _3638, _3646);
    float4 _3657 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9710, float3(0.0), isnan(_9710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9710, float3(0.0), isnan(_9710)), level(0.0)).xyzw;
    float _3659 = _3657.x;
    float _3661 = _3657.y;
    float _3663 = _3657.z;
    float _3665 = _3657.w;
    float2 _9726 = float2(_3650, _3632);
    float3 _3669 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9726, float2(0.0), isnan(_9726)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9726, float2(0.0), isnan(_9726)), level(0.0)).xyz;
    float _3671 = _3669.x;
    float _3673 = _3669.y;
    float _3675 = _3669.z;
    float _3677 = _2612 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3679 = _2612 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3681 = _3560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _3320;
    out.m_80.y = _3318;
    out.m_80.z = _3322;
    float _3683 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3677);
    float _3685 = fma(_2618, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3679);
    float _3687 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3681);
    float _3689 = _3532 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3691 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3683);
    float _3693 = fma(_2628, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3685);
    float _3695 = fma(_3522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3687);
    float _3697 = _3691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3699 = _3693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3701 = fma(_3586, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3695);
    float _3703 = 1.0 / _3697;
    float _3705 = _3699 + _3697;
    float _3707 = in.m_82.x;
    bool _3709 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3711 = isnan(_3480);
    bool _3713 = _3709 || _3711;
    bool _3715 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3717 = _3713 || _3715;
    float _3719 = _3705 * _3703;
    float _3721 = _3719 * 0.5;
    float _3723 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3725 = fma(_3721, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3723);
    float _3727 = 1.0 / _3725;
    out.gl_Position.x = _3640;
    out.gl_Position.y = _3618;
    out.gl_Position.z = _3701;
    out.gl_Position.w = _3596;
    float _3729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3731 = _3727 * _3729;
    float _3733 = abs(_3731);
    float _3735 = log2(_3733);
    bool _3737 = _3731 <= 8000.0;
    bool _3739 = isnan(_3731);
    bool _3741 = _3737 || _3739;
    bool _3743 = isnan(8000.0);
    bool _3745 = _3741 || _3743;
    float _3747 = float(_3745);
    float _3749 = _3640;
    if (!_3717)
    {
        _3749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3751 = _3749;
    float _3753 = _3735 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3755 = exp2(_3753);
    float _3757 = fma(_3755, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3759 = precise::clamp(_3757, 0.0, 1.0);
    float _3761 = fma(_3759, -2.0, 3.0);
    float _3763 = _3759 * _3759;
    float _3765 = _3763 * _3761;
    float _3767 = exp2(_3689);
    float _3769 = -_3765;
    float _3771 = _3769 + 1.0;
    float _3773 = fma(_3771, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3765);
    float _3775 = _3701 + _3596;
    float _3777 = _3747 * _3773;
    float _3779 = _3775 * 0.5;
    float _3781 = _3777 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3783 = -_3767;
    float _3785 = _3783 + 1.0;
    out.m_84.z = _3779;
    out.m_84.w = _3596;
    float _3787 = _3785 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3789 = -_3787;
    float _3791 = _3789 + 1.0;
    float _3793 = _3596;
    float _3795 = _3791;
    float _3797 = _3751;
    float _3799 = _3751;
    if (!_3717)
    {
        _3793 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3801 = _3793;
    float _3803 = -_3628;
    float _3805 = _3803 + 1.0;
    float _3807 = _3805 * _3781;
    float _3809 = precise::clamp(_3807, 0.0, 1.0);
    float _3811 = -_3809;
    float _3813 = fma(_3811, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3815 = _3813 * _3707;
    float _3817 = _3815 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3817;
    float _3819 = _3787 * _3654;
    float _3821 = _3665 * _3819;
    float _3823 = _3675 * _3819;
    float _3825 = _3665 * _3791;
    float _3827 = _3661;
    float _3829 = _3659;
    float _3831 = _3821;
    float _3833 = _3801;
    float _3835 = _3801;
    if (!_3717)
    {
        _3795 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3837 = _3795;
    float _3839 = fma(_3671, _3821, _3659);
    float _3841 = fma(_3673, _3821, _3661);
    float _3843 = fma(_3665, _3823, _3663);
    float _3845 = _3837;
    float _3847 = _3837;
    if (!_3717)
    {
        _3827 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3849 = _3827;
    float _3851 = _3849;
    float _3853 = _3849;
    if (!_3717)
    {
        _3829 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3855 = _3829;
    out.m_88.x = _3839;
    out.m_88.y = _3841;
    out.m_88.z = _3843;
    out.m_88.w = _3825;
    float _3857 = _3855;
    float _3859 = _3855;
    if (!_3717)
    {
        _3831 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3861 = _3831;
    bool _3863 = !_3717;
    float _3865 = _3861;
    float _3867 = _3861;
    if (!_3863)
    {
        bool _3869 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3871 = isnan(_3480);
        bool _3873 = _3869 || _3871;
        bool _3875 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3877 = _3873 || _3875;
        if (!_3877)
        {
            float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3881 = _3480 + _3879;
            float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3885 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3883;
            float _3887 = 1.0 / _3885;
            float _3889 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3893 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3897 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3907 = _3905 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3909 = _3881 * _3887;
            float _3911 = precise::clamp(_3909, 0.0, 1.0);
            float _3913 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3915 = _3913 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3917 = fma(_3911, _3891, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3919 = fma(_3911, _3915, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3921 = fma(_3911, _3895, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3923 = fma(_3911, _3899, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3925 = fma(_3911, _3903, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3927 = fma(_3911, _3907, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3835 = _3919;
            _3859 = _3925;
            _3799 = _3917;
            _3853 = _3923;
            _3847 = _3921;
            _3867 = _3927;
            _3929 = true;
        }
        else
        {
            bool _3931 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3933 = isnan(_3480);
            bool _3935 = _3931 || _3933;
            bool _3937 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3939 = _3935 || _3937;
            if (!_3939)
            {
                _3797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3941 = _3797;
            _3799 = _3941;
            if (!_3939)
            {
                _3833 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3943 = _3833;
            _3835 = _3943;
            if (!_3939)
            {
                _3845 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3945 = _3845;
            _3847 = _3945;
            if (!_3939)
            {
                _3851 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3947 = _3851;
            _3853 = _3947;
            if (!_3939)
            {
                _3857 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3949 = _3857;
            _3859 = _3949;
            if (!_3939)
            {
                _3865 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3951 = _3865;
            bool _3953 = !_3939;
            _3867 = _3951;
            if (!_3953)
            {
                bool _3955 = _3480 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3957 = isnan(_3480);
                bool _3959 = _3955 || _3957;
                bool _3961 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3963 = _3959 || _3961;
                if (!_3963)
                {
                    float _3965 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3967 = _3480 + _3965;
                    float _3969 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3971 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3969;
                    float _3973 = 1.0 / _3971;
                    float _3975 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3977 = _3975 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3979 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3981 = _3979 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3983 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3985 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3987 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3989 = _3987 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3991 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3993 = _3991 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3995 = _3967 * _3973;
                    float _3997 = precise::clamp(_3995, 0.0, 1.0);
                    float _3999 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4001 = _3999 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4003 = fma(_3997, _3977, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4005 = fma(_3997, _4001, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4007 = fma(_3997, _3981, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4009 = fma(_3997, _3985, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4011 = fma(_3997, _3989, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4013 = fma(_3997, _3993, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3835 = _4005;
                    _3859 = _4011;
                    _3799 = _4003;
                    _3853 = _4009;
                    _3847 = _4007;
                    _3867 = _4013;
                    _3929 = true;
                }
                else
                {
                    _3835 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3859 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3853 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3847 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3867 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3929 = false;
    float _4015 = _3835;
    float _4017 = _3859;
    float _4019 = _3799;
    float _4021 = _3853;
    float _4023 = _3847;
    float _4025 = _3867;
    float _4027 = fma(_3056, -0.5, 0.5);
    float _4029 = precise::clamp(_4027, 0.0, 1.0);
    float _4031 = -_4015;
    float _4033 = _4031 + _4017;
    float _4035 = -_4019;
    float _4037 = _4035 + _4021;
    float _4039 = -_4023;
    float _4041 = _4039 + _4025;
    bool _4043 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4045 = fma(_4029, _4033, _4015);
    float _4047 = fma(_4029, _4037, _4019);
    float _4049 = fma(_4029, _4041, _4023);
    float _4051 = _4045 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _4053 = fma(_4047, 0.298911988735198974609375, _4051);
    float _4055 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4057 = fma(_4049, 0.114477999508380889892578125, _4053);
    out.m_51.x = _4055;
    float _4059 = -_4057;
    float _4061 = _4047 + _4059;
    float _4063 = -_4057;
    float _4065 = _4045 + _4063;
    float _4067 = -_4057;
    float _4069 = _4049 + _4067;
    float _4071 = fma(_4061, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    float _4073 = fma(_4065, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    float _4075 = fma(_4069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4057);
    out.m_92.x = _4071;
    out.m_92.y = _4073;
    out.m_92.z = _4075;
    if (!_4043)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4077 = -_3318;
    float _4079 = _4077 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4081 = -_3320;
    float _4083 = _4081 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4085 = -_3322;
    float _4087 = _4085 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4089 = _4079 * _4079;
    float _4091 = fma(_4083, _4083, _4089);
    float _4093 = fma(_4087, _4087, _4091);
    float _4095 = sqrt(_4093);
    float _4097 = rsqrt(_4093);
    float _4099 = -_4095;
    float _4101 = _4099 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4103 = _4101 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4105 = precise::clamp(_4103, 0.0, 1.0);
    float _4107 = _4083 * _4097;
    float _4109 = _4079 * _4097;
    float _4111 = abs(_4105);
    float _4113 = log2(_4111);
    float _4115 = _4087 * _4097;
    float _4117 = _4107 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4119 = _3056 * _4109;
    float _4121 = -_4109;
    float _4123 = -_4117;
    float _4125 = fma(_4121, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4123);
    float _4127 = fma(_3052, _4107, _4119);
    float _4129 = -_4115;
    float _4131 = fma(_4129, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4125);
    float _4133 = fma(_3060, _4115, _4127);
    float _4135 = precise::clamp(_4133, 0.0, 1.0);
    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4139 = _4131 + _4137;
    float _4141 = _4113 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4143 = _4139 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4145 = precise::clamp(_4143, 0.0, 1.0);
    float _4147 = exp2(_4141);
    float _4149 = _4147 * _4145;
    float _4151 = _4135 * _4149;
    float _4153 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4155 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4157 = _4151 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4153;
    out.m_90.y = _4155;
    out.m_90.z = _4157;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

