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
    float4 m_68 [[user(locn1)]];
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
    float4 m_66 [[attribute(1)]];
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _3971 = false;
    bool _3152 = false;
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
        float _4256 = as_type<float>(_127);
        out.gl_Position.z = _4256;
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
        float _4326 = as_type<float>(_165);
        out.gl_Position.z = _4326;
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
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
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
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _961 = _953 + _959;
    float _963 = float(_111);
    float _965 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _969 = _967 != 0;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _973 = int(_971);
    bool _975 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_953);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = float(_957);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _991 = int(_989);
    if (_969)
    {
        float _993 = in.m_60.x;
        _757 = _993;
    }
    float _995 = _757;
    float _997 = -_985;
    float _999 = _997 + 1.0;
    float _1001 = _995;
    if (!_969)
    {
        float _1003 = in.m_60.y;
        _1001 = _1003;
    }
    float _1005 = _1001;
    float _1007 = float(uint(_973));
    float _1009 = 1.0 / _987;
    int _1011 = ~_973;
    int _1013 = _1011 + 1;
    int _1015 = ~_973;
    int _1017 = _1015 + 1;
    bool _1019 = _973 == 0;
    float _1021 = float(_991);
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1025 = int(_1023);
    float _1027 = _1009 * _145;
    float _1029 = 1.0 / _1007;
    float _1031 = 1.0 / _1021;
    float _1033 = float(uint(_1025));
    int _1035 = ~_1025;
    int _1037 = _1035 + 1;
    int _1039 = ~_1025;
    int _1041 = _1039 + 1;
    float _1043 = trunc(_1027);
    int _1045 = int(_1043);
    int _1047 = as_type<int>(_1029) + (-2);
    float _1049 = _1031 * _145;
    float _1051 = 1.0 / _1033;
    float _1053 = float(uint(_1045));
    float _1055 = trunc(_1049);
    int _1057 = int(_1055);
    float _1059 = as_type<float>(_1047) * _1053;
    float _1061 = in.m_60.x;
    float _1063 = in.m_60.y;
    float _1065 = in.m_60.z;
    float _1067 = in.m_60.w;
    float _1069 = trunc(_1059);
    float _1071 = precise::max(_1069, 0.0);
    uint _1074 = uint(_1071);
    int _1076 = as_type<int>(_1051) + (-2);
    float _1078 = float(uint(_1057));
    float _1080 = 1.0 / _963;
    float _1082 = _1059;
    if (_969)
    {
        _1082 = 1.0;
    }
    float _1084 = _1082;
    float _1086 = _1084;
    if (!_969)
    {
        _1086 = 1.2345600128173828125;
    }
    float _1088 = _1086;
    float _1090 = as_type<float>(_1076) * _1078;
    int _1092 = _1013 * int(_1074);
    int _1094 = _1092 + _1045;
    float _1096 = _1005 * _1088;
    float _1098 = trunc(_1090);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = float(uint(_1094));
    float _1106 = as_type<float>(_1094);
    if (_969)
    {
        _1106 = 1.0;
    }
    float _1108 = _1106;
    float _1110 = _1108;
    if (!_969)
    {
        _1110 = 7.345489978790283203125;
    }
    float _1112 = _1110;
    float _1114 = as_type<float>(_1047) * _1104;
    int _1116 = ~_1025;
    int _1118 = _1116 + 1;
    float _1120 = trunc(_1114);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = _1112 * _1061;
    int _1128 = _1118 * int(_1102);
    int _1130 = _1128 + _1057;
    float _1132 = floor(_1096);
    float _1134 = float(uint(_1130));
    float _1136 = floor(_1126);
    int _1138 = int(_1074) + int(_1124);
    float _1140 = as_type<float>(_1076) * _1134;
    float _1142 = float(_973);
    int _1144 = _1017 * _1138;
    int _1146 = _1144 + _1045;
    float _1148 = trunc(_1140);
    float _1150 = precise::max(_1148, 0.0);
    uint _1152 = uint(_1150);
    float _1154 = -_1132;
    float _1156 = _1096 + _1154;
    bool _1158 = uint(_1146) >= uint(_973);
    float _1160 = float(_1045);
    bool _1162 = !_1158;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = -_1136;
    float _1168 = _1126 + _1166;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1172 = _1170 != 0;
    int _1174 = ~_1138;
    int _1176 = _1174 + _1164;
    int _1178 = _1176 + 1;
    float _1180 = _1168 * _1142;
    bool _1182 = _1160 >= _1142;
    bool _1184 = isnan(_1160);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(_1142);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1080 * _145;
    bool _1196 = !_1172;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = float(_1025);
    float _1202 = trunc(_1180);
    int _1204 = int(_1202);
    float _1206 = float(_1057);
    int _1208 = abs(_1198);
    float _1210 = _1142 * _1194;
    bool _1212 = _1206 >= _1200;
    bool _1214 = isnan(_1206);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1200);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _1200 * _1194;
    float _1226 = _1156 * _1200;
    float _1228 = trunc(_1192);
    int _1230 = int(_1228);
    int _1232 = int(_1102) + int(_1152);
    int _1234 = _973 * _1178;
    int _1236 = _1234 + _1045;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1240 = _1238 != 0;
    int _1242 = _1037 * _1232;
    int _1244 = _1242 + _1057;
    float _1246 = trunc(_1226);
    int _1248 = int(_1246);
    bool _1250 = !_1019;
    int _1252 = _1250 ? _1236 : (-1);
    int _1254 = _1204 * _1208;
    int _1256 = _1254 + _1045;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1268 = _1266 != 0;
    bool _1270 = uint(_1244) >= uint(_1025);
    bool _1272 = !_1240;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = trunc(_1222);
    int _1278 = int(_1276);
    int _1280 = ~_1230;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    int _1286 = abs(_1274);
    bool _1288 = !_1270;
    int _1290 = _1288 ? 0 : (-1);
    int _1292 = _1252 * _1284;
    bool _1294 = !_1264;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = trunc(_1210);
    int _1300 = int(_1298);
    int _1302 = _973 + (-1);
    int _1304 = _1248 * _1286;
    int _1306 = _1304 + _1057;
    int _1308 = ~_1232;
    int _1310 = _1308 + _1290;
    int _1312 = _1310 + 1;
    int _1314 = abs(_1296);
    int _1316 = _1230 * _1302;
    int _1318 = _1316 + _1292;
    bool _1320 = !_1260;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1025 * _1312;
    int _1326 = _1324 + _1057;
    bool _1328 = !_1268;
    int _1330 = _1328 ? 0 : 1;
    int _1332 = _1318 * _1314;
    int _1334 = abs(_1322);
    float _1336 = trunc(_1224);
    int _1338 = int(_1336);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1342 = _1340 != 0;
    bool _1344 = _1025 == 0;
    int _1346 = _1300 * _1334;
    int _1348 = _1346 + _1332;
    int _1350 = abs(_1330);
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : 1;
    int _1356 = ~_1278;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    bool _1362 = !_1344;
    int _1364 = _1362 ? _1326 : (-1);
    int _1366 = abs(_1354);
    int _1368 = _1364 * _1360;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1372 = _1370 != 0;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1384 = _1382 != 0;
    int _1386 = _1256 * _1350;
    int _1388 = _1386 + _1348;
    int _1390 = _1025 + (-1);
    bool _1392 = !_1376;
    int _1394 = _1392 ? 0 : 1;
    int _1396 = _1278 * _1390;
    int _1398 = _1396 + _1368;
    bool _1400 = !_1372;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = _1204 * _1366;
    int _1406 = _1404 + _1388;
    int _1408 = abs(_1394);
    float _1410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1412 = log2(_1410);
    bool _1414 = !_1380;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = abs(_1402);
    bool _1420 = !_1384;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = float(uint(_1406));
    int _1426 = abs(_1416);
    int _1428 = _1398 * _1408;
    int _1430 = abs(_1422);
    float _1432 = as_type<float>(_1047) * _1424;
    int _1434 = _1338 * _1418;
    int _1436 = _1434 + _1428;
    float _1438 = _1412 * _145;
    int _1440 = ~_973;
    int _1442 = _1440 + 1;
    int _1444 = _1306 * _1426;
    int _1446 = _1444 + _1436;
    float _1448 = trunc(_1432);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = ~_973;
    int _1456 = _1454 + 1;
    int _1458 = _1248 * _1430;
    int _1460 = _1458 + _1446;
    int _1462 = ~_1025;
    int _1464 = _1462 + 1;
    bool _1466 = _973 == 0;
    float _1468 = float(uint(_1460));
    float _1470 = exp2(_1438);
    float _1472 = float(uint(_1256));
    int _1474 = ~_973;
    int _1476 = _1474 + 1;
    float _1478 = as_type<float>(_1076) * _1468;
    int _1480 = _1456 * int(_1452);
    int _1482 = _1480 + _1406;
    float _1484 = trunc(_1478);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    float _1490 = float(uint(_1482));
    float _1492 = as_type<float>(_1047) * _1490;
    float _1494 = trunc(_1492);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = _1464 * int(_1488);
    int _1502 = _1500 + _1460;
    float _1504 = float(uint(_1502));
    float _1506 = as_type<float>(_1076) * _1504;
    int _1508 = int(_1452) + int(_1498);
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1512 = trunc(_1506);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = _1442 * _1508;
    int _1520 = _1518 + _1406;
    int _1522 = ~_1025;
    int _1524 = _1522 + 1;
    bool _1526 = uint(_1520) >= uint(_973);
    bool _1528 = !_1526;
    int _1530 = _1528 ? 0 : (-1);
    int _1532 = ~_1508;
    int _1534 = _1532 + _1530;
    int _1536 = _1534 + 1;
    float _1538 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1540 = int(_1488) + int(_1516);
    int _1542 = _973 * _1536;
    int _1544 = _1542 + _1406;
    float _1546 = _1061 * 2.0;
    int _1548 = _1524 * _1540;
    int _1550 = _1548 + _1460;
    bool _1552 = !_1466;
    int _1554 = _1552 ? _1544 : (-1);
    bool _1556 = uint(_1550) >= uint(_1025);
    float _1558 = floor(_1546);
    int _1560 = _1554 & 3;
    bool _1562 = _1560 != 0;
    bool _1564 = !_1556;
    int _1566 = _1564 ? 0 : (-1);
    bool _1568 = uint(_1560) > 1u;
    int _1570 = _1554 & 3;
    bool _1572 = _1570 != 0;
    int _1574 = ~_1540;
    int _1576 = _1574 + _1566;
    int _1578 = _1576 + 1;
    int _1580 = _1572 ? 0 : 1;
    bool _1582 = _1560 != 3;
    int _1584 = _1025 * _1578;
    int _1586 = _1584 + _1460;
    bool _1588 = uint(_1560) >= 2u;
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1592 = _1590 != 0;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1596 = ~_1580;
    int _1598 = _1596 + 1;
    int _1600 = _1598 + 1;
    int _1602 = _1588 ? 0 : 1;
    int _1604 = _1600;
    int _1606 = as_type<int>(_1067);
    float _1608 = as_type<float>(_1408);
    if (!_1568)
    {
        int _1610 = ~_1580;
        int _1612 = _1610 + 1;
        _1604 = _1612;
    }
    int _1614 = _1604;
    bool _1616 = _1067 > 0.5;
    bool _1618 = !_1344;
    int _1620 = _1618 ? _1586 : (-1);
    float _1622 = -_203;
    int _1624 = _1616 ? as_type<int>(_1622) : as_type<int>(_203);
    int _1626 = _1620 & 3;
    bool _1628 = _1626 != 0;
    int _1630 = _1620 & 3;
    bool _1632 = _1630 != 0;
    int _1634 = ~_1602;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    int _1640 = _1638;
    if (_1582)
    {
        int _1642 = ~_1602;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    bool _1648 = uint(_1626) > 1u;
    float _1650 = _1632 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1652 = _1650;
    if (_1592)
    {
        _1606 = 0;
    }
    int _1654 = _1606;
    bool _1656 = uint(_1626) >= 2u;
    int _1658 = _1654;
    if (!_1592)
    {
        _1658 = 1;
    }
    int _1660 = _1658;
    bool _1662 = _1626 != 3;
    int _1664 = _1656 ? 0 : 1;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1668 = _1660 != 1;
    int _1670 = ~as_type<int>(_1650);
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = -_1666;
    float _1678 = fma(_1538, 2.0, _1676);
    int _1680 = _1674;
    float _1682 = as_type<float>(_1660);
    if (!_1648)
    {
        int _1684 = ~as_type<int>(_1650);
        int _1686 = _1684 + 1;
        _1680 = _1686;
    }
    int _1688 = _1680;
    float _1690 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1694 = _1692 != 0;
    float _1696 = -_145;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1678);
    int _1700 = ~_1664;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    float _1706 = fma(_1690, -2.0, _1594);
    int _1708 = _1704;
    if (_1662)
    {
        int _1710 = ~_1664;
        int _1712 = _1710 + 1;
        _1708 = _1712;
    }
    int _1714 = _1708;
    bool _1716 = !_1694;
    int _1718 = _1716 ? 0 : 1;
    float _1720 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1706);
    bool _1722 = _1558 > 0.0;
    bool _1724 = _1558 >= 0.0;
    bool _1726 = isnan(_1558);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    float _1734 = _1558;
    if (!_1668)
    {
        _1734 = _1063;
    }
    float _1736 = _1734;
    float _1738 = _1736;
    if (!_1668)
    {
        _1652 = _1063;
    }
    float _1740 = _1652;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1744 = _1740;
    if (_1668)
    {
        _1738 = _1061;
    }
    float _1746 = _1738;
    if (_1668)
    {
        _1744 = _1061;
    }
    float _1748 = _1744;
    if (!_1668)
    {
        _1682 = _1065;
    }
    float _1750 = _1682;
    float _1752 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1754 = _1750;
    if (_1668)
    {
        _1754 = _1063;
    }
    float _1756 = _1754;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1510);
    float _1760 = as_type<float>(_1047) * _1472;
    float _1762 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1742);
    float _1764 = float(uint(_1306));
    float _1766 = -_1470;
    float _1768 = _1766 + 1.0;
    float _1770 = trunc(_1760);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1668)
    {
        _1608 = _1065;
    }
    float _1778 = _1608;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1782 = 1.0 + _1780;
    float _1784 = -_1776;
    float _1786 = fma(_1752, 2.0, _1784);
    float _1788 = _1778;
    if (_1668)
    {
        _1788 = _1063;
    }
    float _1790 = _1788;
    float _1792 = as_type<float>(_1076) * _1764;
    bool _1794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1796 = isnan(0.0);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1802 = _1798 || _1800;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1806 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1808 = _1802 ? _1768 : 0.0;
    float _1810 = trunc(_1792);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    bool _1816 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1818 = isnan(1.0);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1824 = _1820 || _1822;
    float _1826 = fma(_1806, -2.0, _1804);
    int _1828 = _1476 * int(_1774);
    int _1830 = _1828 + _1256;
    float _1832 = _1063 * 2.0;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1838 = 1.0 / _1782;
    float _1840 = float(uint(_1830));
    float _1842 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1834);
    float _1844 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1836);
    float _1846 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1762);
    float _1848 = -_145;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1786);
    float _1852 = as_type<float>(_1047) * _1840;
    float _1854 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1842);
    float _1856 = floor(_1832);
    int _1858 = _1041 * int(_1814);
    int _1860 = _1858 + _1306;
    float _1862 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1844);
    float _1864 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1758);
    float _1866 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1826);
    float _1868 = _1065 * 2.0;
    float _1870 = float(uint(_1860));
    float _1872 = trunc(_1852);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    if (_1824)
    {
        float _1878 = _1808 * _1838;
        _147 = _1878;
    }
    float _1880 = _147;
    float _1882 = as_type<float>(_1076) * _1870;
    int _1884 = _1732 ? 0 : 1;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1890 = _1856 > 0.0;
    float _1892 = floor(_1868);
    bool _1894 = _1856 >= 0.0;
    bool _1896 = isnan(_1856);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.0);
    bool _1902 = _1898 || _1900;
    int _1904 = ~_1884;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    int _1910 = _1902 ? 0 : 1;
    int _1912 = _1908;
    if (!_1722)
    {
        int _1914 = ~_1884;
        int _1916 = _1914 + 1;
        _1912 = _1916;
    }
    int _1918 = _1912;
    float _1920 = trunc(_1882);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = ~_1910;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    int _1932 = int(_1774) + int(_1876);
    int _1934 = _1930;
    if (!_1890)
    {
        int _1936 = ~_1910;
        int _1938 = _1936 + 1;
        _1934 = _1938;
    }
    int _1940 = _1934;
    bool _1942 = _1063 > 0.5;
    float _1944 = in.m_48.x;
    float _1946 = in.m_48.y;
    float _1948 = in.m_48.z;
    bool _1950 = _1061 > 0.5;
    float _1952 = 1.0 / _1888;
    float _1954 = -_203;
    int _1956 = _1942 ? as_type<int>(_1954) : as_type<int>(_203);
    bool _1958 = _1065 > 0.5;
    int _1960 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1962 = _1960 != 0;
    int _1964 = int(_1814) + int(_1924);
    float _1966 = -_193;
    int _1968 = _1958 ? as_type<int>(_1966) : as_type<int>(_193);
    float _1970 = -_193;
    int _1972 = _1950 ? as_type<int>(_1970) : as_type<int>(_193);
    int _1974 = ~_973;
    int _1976 = _1974 + 1;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1980 = _1978 != 0;
    int _1982 = ~_1025;
    int _1984 = _1982 + 1;
    bool _1986 = !_1980;
    float _1988 = _1986 ? _203 : as_type<float>(_1624);
    int _1990 = _1976 * _1932;
    int _1992 = _1990 + _1256;
    bool _1994 = !_1962;
    float _1996 = _1994 ? _193 : as_type<float>(_1972);
    int _1998 = _1984 * _1964;
    int _2000 = _1998 + _1306;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2004 = _2002 != 0;
    float _2006 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2010 = _2008 != 0;
    float _2012 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2014 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2006);
    bool _2016 = !_2004;
    float _2018 = _2016 ? _203 : as_type<float>(_1956);
    float _2020 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2012);
    bool _2022 = !_2010;
    float _2024 = _2022 ? _193 : as_type<float>(_1968);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2028 = _2026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2030 = uint(_1992) >= uint(_973);
    bool _2032 = uint(_2000) >= uint(_1025);
    float _2034 = 1.0 / _2028;
    bool _2036 = !_2030;
    int _2038 = _2036 ? 0 : (-1);
    int _2040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2042 = _2040 != 0;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2046 = _2044 != 0;
    int _2048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2050 = _2048 != 0;
    float _2052 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2056 = _2054 != 0;
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2062 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2052);
    float _2064 = 1.0 / _2060;
    bool _2066 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2068 = isnan(_953);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2082;
    float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2086;
    bool _2090 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2092 = isnan(_953);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2080 * _1952;
    float _2104 = _1061 + _1063;
    float _2106 = _2084 * _2034;
    float _2108 = _1065 + _1063;
    float _2110 = _2076 * _999;
    float _2112 = _2104 + (-1.0);
    float _2114 = -_2076;
    float _2116 = _2114 + 1.0;
    bool _2118 = !_2032;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2062);
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2128 = _953 + _2126;
    float _2130 = _2088 * _2064;
    float _2132 = _2108 + (-1.0);
    bool _2134 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2136 = isnan(_953);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = fma(_2106, _2128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2148 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2014);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2152 = _953 + _2150;
    float _2154 = _1996 + 0.5;
    float _2156 = -_2100;
    float _2158 = _2156 + 1.0;
    float _2160 = _2146 * _2110;
    float _2162 = fma(_2130, _2152, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1698);
    int _2166 = _1554 >> 31;
    float _2168 = _2144 * _2158;
    float _2170 = -_2144;
    float _2172 = _2170 + 1.0;
    bool _2174 = _1892 >= 0.0;
    bool _2176 = isnan(_1892);
    bool _2178 = _2174 || _2176;
    bool _2180 = isnan(0.0);
    bool _2182 = _2178 || _2180;
    float _2184 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2160);
    int _2186 = _2166 & 3;
    float _2188 = _985 * _2172;
    int _2190 = _1620 >> 31;
    float _2192 = _2122 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2194 = _2182 ? 0 : 1;
    float _2196 = _2148 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2198 = _1554 + _2186;
    bool _2200 = _1892 > 0.0;
    float _2202 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2020);
    int _2204 = _2190 & 3;
    float _2206 = fma(_2102, _961, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2208 = !_2046;
    int _2210 = _2208 ? 0 : 1;
    float _2212 = _2018 + (-0.5);
    float _2214 = fma(_2206, _2188, _2184);
    int _2216 = _2198 >> 2;
    float _2218 = -_2212;
    float _2220 = -_1720;
    float _2222 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2220);
    int _2224 = _1620 + _2204;
    float _2226 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2228 = abs(_2210);
    float _2230 = fma(_2162, _2168, _2214);
    int _2232 = _2216 << 4;
    int _2234 = _2232 + 368;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2192 + _2236;
    int _2240 = _2224 >> 2;
    float _2242 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2230);
    bool _2244 = !_2042;
    int _2246 = _2244 ? 0 : 1;
    float _2248 = _2202 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2250 = float(_1918);
    float _2252 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2254 = _2196 + _2252;
    float _2256 = float(_2228);
    float _2258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2260 = _2248 + _2258;
    uint _2262 = uint(int(uint(_2234) >> uint(2)));
    uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
    int _2266 = int(_2262) & 3;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[int(_2264)][_2266];
    int _2270 = int(_2262) + 1;
    uint _2272 = uint(int(uint(_2270) >> uint(2)));
    int _2274 = _2270 & 3;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[int(_2272)][_2274];
    int _2278 = ~_2194;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    float _2284 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2286 = _2240 << 4;
    int _2288 = _2286 + 512;
    float _2290 = in.m_66.x;
    float _2292 = in.m_66.y;
    float _2294 = in.m_66.z;
    int _2296 = _2282;
    if (!_2200)
    {
        int _2298 = ~_2194;
        int _2300 = _2298 + 1;
        _2296 = _2300;
    }
    int _2302 = _2296;
    float _2304 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2306 = abs(_2246);
    uint _2308 = uint(int(uint(_2288) >> uint(2)));
    uint _2310 = uint(int(uint(int(_2308)) >> uint(2)));
    int _2312 = int(_2308) & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    int _2316 = int(_2308) + 1;
    uint _2318 = uint(int(uint(_2316) >> uint(2)));
    int _2320 = _2316 & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    float _2324 = float(_2302);
    float _2326 = _2256 * _2250;
    float _2328 = float(_2306);
    float _2330 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2304);
    int _2332 = ~_1932;
    int _2334 = _2332 + _2038;
    int _2336 = _2334 + 1;
    int _2338 = ~_1964;
    int _2340 = _2338 + _2120;
    int _2342 = _2340 + 1;
    float _2344 = _2328 * _2324;
    int _2346 = _2234 + 8;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    uint _2350 = uint(int(uint(int(_2348)) >> uint(2)));
    int _2352 = int(_2348) & 3;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[int(_2350)][_2352];
    int _2356 = int(_2348) + 1;
    uint _2358 = uint(int(uint(_2356) >> uint(2)));
    int _2360 = _2356 & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    float _2364 = _1988 + (-0.5);
    float _2366 = _2024 + 0.5;
    int _2368 = _973 * _2336;
    int _2370 = _2368 + _1256;
    float _2372 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2330);
    float _2374 = -_2364;
    float _2376 = -_1866;
    float _2378 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2376);
    float _2380 = _2344 * (-2.0);
    float _2382 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2384 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1850);
    float _2386 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2388 = !_1628;
    int _2390 = _2388 ? 0 : 1;
    float _2392 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2394 = _2326 * (-2.0);
    bool _2396 = !_1562;
    int _2398 = _2396 ? 0 : 1;
    int _2400 = _2288 + 8;
    uint _2402 = uint(int(uint(_2400) >> uint(2)));
    uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
    int _2406 = int(_2402) & 3;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[int(_2404)][_2406];
    int _2410 = int(_2402) + 1;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    int _2414 = _2410 & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = abs(_1614);
    float _2420 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2422 = _1025 * _2342;
    int _2424 = _2422 + _1306;
    float _2426 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2428 = abs(_1688);
    float _2430 = fma(_2380, _2290, _2290);
    int _2432 = abs(_2390);
    float _2434 = fma(_2124, _2380, _2124);
    int _2436 = abs(_2398);
    out.m_68.x = _2420;
    out.m_68.y = _2392;
    out.m_68.z = _2426;
    out.m_68.w = _2284;
    float _2438 = fma(_2226, _2394, _2226);
    float _2440 = fma(_2394, _2292, _2292);
    bool _2442 = _1560 != 3;
    int _2444 = abs(_1714);
    bool _2446 = _973 == 0;
    bool _2448 = _2372 >= 0.0;
    bool _2450 = !_2446;
    int _2452 = _2450 ? _2370 : (-1);
    int _2454 = ~_2418;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = ~_2436;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    int _2466 = ~_2428;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2458 * as_type<int>(_2276);
    if (_2448)
    {
        out.m_51.x = 0.0;
    }
    int _2474 = abs(_1646);
    int _2476 = _2464 * as_type<int>(_2268);
    int _2478 = _2476 + _2472;
    int _2480 = ~_2432;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    int _2486 = _2470 * as_type<int>(_2322);
    bool _2488 = !_2056;
    int _2490 = _2488 ? 0 : 1;
    bool _2492 = _1626 != 3;
    int _2494 = _2484 * as_type<int>(_2314);
    int _2496 = _2494 + _2486;
    int _2498 = ~_2474;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    bool _2504 = !_2492;
    int _2506 = _2504 ? 0 : (-1);
    int _2508 = abs(_2490);
    int _2510 = _2502 * as_type<int>(_2354);
    int _2512 = _2510 + _2478;
    bool _2514 = !_2442;
    int _2516 = _2514 ? 0 : (-1);
    int _2518 = abs(_2506);
    int _2520 = abs(_2516);
    int _2522 = ~_2444;
    int _2524 = _2522 + 1;
    int _2526 = _2524 + 1;
    int _2528 = ~_2520;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    int _2534 = abs(_1718);
    int _2536 = _2526 * as_type<int>(_2408);
    int _2538 = _2536 + _2496;
    int _2540 = ~_2518;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    int _2546 = _2532 * as_type<int>(_2362);
    int _2548 = _2546 + _2512;
    int _2550 = ~_2534;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    int _2556 = ~_2508;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    int _2562 = _2544 * as_type<int>(_2416);
    int _2564 = _2562 + _2538;
    bool _2566 = _1025 == 0;
    int _2568 = _2548 * _2554;
    float _2570 = as_type<float>(_2518);
    float _2572 = _2416;
    if (_2448)
    {
        _2570 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2574 = _2570;
    int _2576 = _2564 * _2560;
    float _2578 = _2238 * _2238;
    int _2580 = _2452 * _2534;
    int _2582 = _2580 + _2568;
    bool _2584 = !_2566;
    int _2586 = _2584 ? _2424 : (-1);
    float _2588 = -_1854;
    float _2590 = _2588 + 1.0;
    float _2592 = fma(_2254, _2254, _2578);
    float _2594 = -_1864;
    float _2596 = _2594 + 1.0;
    float _2598 = -_1862;
    float _2600 = _2598 + 1.0;
    int _2602 = _2586 * _2508;
    int _2604 = _2602 + _2576;
    float _2606 = fma(_2260, _2260, _2592);
    float _2608 = -_2596;
    float _2610 = fma(_2024, _2608, _2384);
    float _2612 = -_1846;
    float _2614 = _2612 + 1.0;
    float _2616 = _1061 + (-0.5);
    float _2618 = rsqrt(_2606);
    float _2620 = -_2590;
    float _2622 = fma(_1996, _2620, _2164);
    float _2624 = fma(_2018, _2600, _2222);
    float _2626 = fma(_1988, _2614, _2378);
    int _2628 = as_type<int>(_2574);
    if (_2448)
    {
        float _2630 = _2574 * 5.0;
        _2628 = as_type<int>(_2630);
    }
    int _2632 = _2628;
    float _2634 = float(_2582);
    float _2636 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2430);
    float _2638 = float(_2604);
    out.m_70.x = _2622;
    out.m_70.y = _2624;
    out.m_70.z = _2610;
    out.m_70.w = _2626;
    bool _2640 = !_2050;
    int _2642 = _2640 ? 0 : 1;
    float _2644 = fma(_2434, _1880, _2636);
    float _2646 = _1063 + (-0.5);
    if (_2448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8023 = as_type<float>(_2632);
        out.gl_Position.z = _8023;
    }
    int _2648 = abs(_2642);
    float _2650 = _2238 * _2618;
    out.m_72.x = _2634;
    out.m_72.y = _2638;
    float _2652 = _2254 * _2618;
    if (_2448)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2654 = -_2650;
    float _2656 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2192);
    float _2658 = _2260 * _2618;
    float _2660 = -_2652;
    float _2662 = fma(_2660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2196);
    float _2664 = float(_1940);
    float _2666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2668 = _2656 + _2666;
    float _2670 = -_2658;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2248);
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2676 = _2662 + _2674;
    float _2678 = -_2650;
    float _2680 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2686 = _2672 + _2684;
    float _2688 = float(_2648);
    float _2690 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2440);
    float _2692 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2682);
    float _2694 = -_2652;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2254);
    float _2698 = _2680 * _2680;
    float _2700 = _2688 * _2664;
    float _2702 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2692);
    float _2704 = _1065 + _1061;
    float _2706 = fma(_2438, _1880, _2690);
    float _2708 = fma(_2696, _2696, _2698);
    float _2710 = -_2658;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2260);
    bool _2714 = _2702 >= 0.0;
    float _2716 = _2704 + (-1.0);
    float _2718 = _2700 * (-2.0);
    float _2720 = _2706 * 0.15915493667125701904296875;
    float _2722 = fma(_2712, _2712, _2708);
    float _2724 = _1065 + (-0.5);
    float _2726 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2728 = fma(_2718, _2294, _2294);
    float _2730 = _2720 * 6.283185482025146484375;
    float _2732 = sin(_2730);
    float _2734 = _2644 * 0.15915493667125701904296875;
    float _2736 = fma(_2726, _2718, _2726);
    float _2738 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2728);
    int _2740 = as_type<int>(_2724);
    float _2742 = _2668;
    float _2744 = _2686;
    if (_2714)
    {
        _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2746 = _2572;
    if (_2714)
    {
        out.m_51.x = 0.0;
    }
    float _2748 = fma(_2736, _1880, _2738);
    float _2750 = sqrt(_2722);
    if (_2714)
    {
        float _2752 = _2746 * 5.0;
        _2740 = as_type<int>(_2752);
    }
    int _2754 = _2740;
    if (_2714)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8219 = as_type<float>(_2754);
        out.gl_Position.z = _8219;
    }
    float _2756 = _2720 * 6.283185482025146484375;
    float _2758 = cos(_2756);
    float _2760 = _2734 * 6.283185482025146484375;
    float _2762 = sin(_2760);
    float _2764 = _2734 * 6.283185482025146484375;
    float _2766 = cos(_2764);
    float _2768 = _2748 * 0.15915493667125701904296875;
    if (_2714)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2770 = _2768 * 6.283185482025146484375;
    float _2772 = cos(_2770);
    float _2774 = _2618 * _2750;
    float _2776 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2780 = _2762 * _2732;
    float _2782 = _2766 * _2758;
    float _2784 = _2774 * _2776;
    float _2786 = _2762 * _2758;
    float _2788 = _2768 * 6.283185482025146484375;
    float _2790 = sin(_2788);
    float _2792 = _2766 * _2732;
    float _2794 = _2778 * _2784;
    float _2796 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2800 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2802 = _2774 * _2796;
    float _2804 = _2766 * _2772;
    float _2806 = _2758 * _2772;
    float _2808 = _2762 * _2772;
    float _2810 = _2732 * _2772;
    float _2812 = _2798 * _2802;
    float _2814 = _2804 * _2794;
    float _2816 = _2774 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2818 = _2816 * 0.5;
    float _2820 = fma(_2790, _2782, _2780);
    float _2822 = -_2794;
    float _2824 = _2790 * _2822;
    float _2826 = -_2786;
    float _2828 = fma(_2790, _2792, _2826);
    float _2830 = -_2792;
    float _2832 = fma(_2790, _2786, _2830);
    float _2834 = fma(_2820, _2812, _2814);
    float _2836 = _2808 * _2794;
    float _2838 = fma(_2806, _2812, _2824);
    float _2840 = fma(_2790, _2780, _2782);
    float _2842 = fma(_2828, _2818, _2834);
    float _2844 = fma(_2832, _2812, _2836);
    float _2846 = fma(_2810, _2818, _2838);
    float _2848 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2850 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2852 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2854 = fma(_2840, _2818, _2844);
    float _2856 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2858 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2850);
    float _2860 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2852);
    float _2862 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2864 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2858);
    float _2866 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2860);
    float _2868 = -_2790;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2862);
    float _2872 = _2864 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2874 = _2866 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2876 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2878 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2880 = _2196 + _2872;
    float _2882 = _2248 + _2874;
    float _2884 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2856);
    float _2886 = fma(_2800, _2800, 1.0);
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2880 + _2888;
    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2894 = _2882 + _2892;
    float _2896 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2878);
    float _2898 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2900 = _2890 * _2890;
    float _2902 = _2894 * _2894;
    float _2904 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2896);
    float _2906 = rsqrt(_2886);
    float _2908 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2910 = _2900 + _2902;
    float _2912 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2914 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2876);
    float _2916 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2848);
    float _2918 = -_2790;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2898);
    float _2922 = -_2790;
    float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2908);
    float _2926 = sqrt(_2910);
    float _2928 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2930 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2932 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2934 = _2192 + _2912;
    float _2936 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2928);
    float _2938 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2930);
    float _2940 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2932);
    bool _2942 = _2926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = _2928;
    float _2946 = _2810;
    float _2948 = _2804;
    float _2950 = _2930;
    float _2952 = _2932;
    float _2954 = _2914;
    if (!_2942)
    {
        _2944 = _2902;
    }
    float _2956 = _2944;
    float _2958 = _2956;
    if (!_2942)
    {
        _2946 = _2900;
    }
    float _2960 = _2946;
    float _2962 = _2960;
    if (!_2942)
    {
        _2948 = _2880;
    }
    float _2964 = _2948;
    float _2966 = _2964;
    if (!_2942)
    {
        _2950 = _2882;
    }
    float _2968 = _2950;
    float _2970 = _2968;
    if (!_2942)
    {
        _2952 = _2934;
    }
    float _2972 = _2952;
    bool _2974 = !_2942;
    float _2976 = _2972;
    if (!_2974)
    {
        float _2978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2982 = _2926 + _2980;
        float _2984 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2986 = rsqrt(_2910);
        float _2988 = _2982 * _2978;
        float _2990 = _2988 * 0.15915493667125701904296875;
        float _2992 = _2990 * 6.283185482025146484375;
        float _2994 = sin(_2992);
        float _2996 = _2990 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        float _3000 = fma(_2994, _2984, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3002 = _2986 * _3000;
        float _3004 = _2998 + (-1.0);
        float _3006 = fma(_2890, _3002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3008 = fma(_2894, _3002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3010 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3014 = _3006 + _3012;
        float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3018 = _3008 + _3016;
        float _3020 = fma(_2934, _2998, _3010);
        float _3022 = _3014 * _3014;
        float _3024 = _3018 * _3018;
        _2976 = _3020;
        _2962 = _3022;
        _2958 = _3024;
        _2966 = _3006;
        _2970 = _3008;
    }
    float _3026 = _2976;
    float _3028 = _2962;
    float _3030 = _2958;
    float _3032 = _2966;
    float _3034 = _2970;
    float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3038 = _3026 + _3036;
    float _3040 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2920);
    float _3042 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2924);
    float _3044 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2870);
    float _3046 = fma(_3038, _3038, _3028);
    float _3048 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2936);
    float _3050 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2938);
    float _3052 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2940);
    float _3054 = _3046 + _3030;
    float _3056 = _2800 * _2906;
    float _3058 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2884);
    float _3060 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3062 = _2800 * _3040;
    float _3064 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2914);
    float _3066 = _2800 * _3042;
    float _3068 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2916);
    float _3070 = _2800 * _3044;
    float _3072 = -_3048;
    float _3074 = _3056 * _3072;
    float _3076 = -_3050;
    float _3078 = _3056 * _3076;
    float _3080 = -_3052;
    float _3082 = _3056 * _3080;
    float _3084 = fma(_3060, _3058, _3062);
    float _3086 = sqrt(_3054);
    float _3088 = fma(_3060, _3064, _3066);
    float _3090 = fma(_3060, _3068, _3070);
    float _3092 = fma(_2906, _3040, _3074);
    float _3094 = _3048 + _3084;
    float _3096 = fma(_2906, _3042, _3078);
    float _3098 = _3050 + _3088;
    float _3100 = fma(_2906, _3044, _3082);
    float _3102 = _3052 + _3090;
    out.m_74.x = _3058;
    out.m_74.y = _3064;
    out.m_74.z = _3068;
    out.m_76.x = _3092;
    out.m_76.y = _3096;
    out.m_76.z = _3100;
    bool _3104 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3106 = isnan(_3086);
    bool _3108 = _3104 || _3106;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3112 = _3108 || _3110;
    out.m_78.x = _3094;
    out.m_78.y = _3098;
    out.m_78.z = _3102;
    float _3114 = _3092;
    float _3116 = _3032;
    if (!_3112)
    {
        _2954 = 1.0;
    }
    float _3118 = _2954;
    bool _3120 = !_3112;
    float _3122 = _3118;
    if (!_3120)
    {
        bool _3124 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3126 = isnan(_3086);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3132 = _3128 || _3130;
        if (!_3132)
        {
            float _3134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3136 = _3086 + _3134;
            float _3138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3140 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3138;
            float _3142 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3144 = _3142 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3146 = 1.0 / _3140;
            float _3148 = _3136 * _3146;
            float _3150 = fma(_3148, _3144, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3122 = _3150;
            _3152 = true;
        }
        else
        {
            bool _3154 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3156 = isnan(_3086);
            bool _3158 = _3154 || _3156;
            bool _3160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3162 = _3158 || _3160;
            if (!_3162)
            {
                float _3164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3166 = _3086 + _3164;
                float _3168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3170 = _3168 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3172 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3174 = _3172 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3176 = 1.0 / _3170;
                float _3178 = _3166 * _3176;
                float _3180 = fma(_3178, _3174, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3122 = _3180;
                _3152 = true;
            }
            else
            {
                _3122 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3152 = false;
    float _3182 = _3122;
    float _3184 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3186 = _3026 + _3184;
    float _3188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3190 = _3032 + _3188;
    float _3192 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3194 = _3034 + _3192;
    float _3196 = fma(_3186, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3198 = fma(_3190, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3200 = fma(_3194, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3202 = -_2192;
    float _3204 = _3202 + _3196;
    float _3206 = -_2196;
    float _3208 = _3206 + _3198;
    float _3210 = -_2248;
    float _3212 = _3210 + _3200;
    float _3214 = _3204 * _3204;
    float _3216 = fma(_3208, _3208, _3214);
    float _3218 = fma(_3212, _3212, _3216);
    float _3220 = sqrt(_3218);
    bool _3222 = _3220 > 0.0;
    bool _3224 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan(0.5);
    bool _3232 = _3228 || _3230;
    float _3234 = _3196;
    if (!_3222)
    {
        _3114 = _3198;
    }
    float _3236 = _3114;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3222)
    {
        _3116 = _3200;
    }
    float _3242 = _3116;
    bool _3244 = !_3222;
    float _3246 = _3242;
    if (!_3244)
    {
        float _3248 = _207 * _207;
        float _3250 = fma(_205, _205, _3248);
        float _3252 = fma(_209, _209, _3250);
        float _3254 = rsqrt(_3218);
        float _3256 = sqrt(_3252);
        float _3258 = _3208 * _3254;
        float _3260 = _3204 * _3254;
        float _3262 = _3212 * _3254;
        bool _3264 = _3256 > 0.0;
        float _3266 = _3256;
        if (!_3264)
        {
            _3238 = _3198;
        }
        float _3268 = _3238;
        _3240 = _3268;
        if (!_3264)
        {
            _3266 = _3200;
        }
        float _3270 = _3266;
        bool _3272 = !_3264;
        _3246 = _3270;
        if (!_3272)
        {
            float _3274 = rsqrt(_3252);
            float _3276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3278 = _207 * _3274;
            float _3280 = _205 * _3274;
            float _3282 = _209 * _3274;
            float _3284 = _3260 * _3278;
            float _3286 = fma(_3258, _3280, _3284);
            float _3288 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3290 = fma(_3262, _3282, _3286);
            float _3292 = _3290 * _3288;
            float _3294 = fma(_205, _3292, _3198);
            float _3296 = fma(_207, _3292, _3196);
            float _3298 = fma(_209, _3292, _3200);
            _3240 = _3294;
            _3234 = _3296;
            _3246 = _3298;
        }
    }
    float _3300 = _3240;
    float _3302 = _3234;
    float _3304 = _3246;
    float _3306 = -_2652;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3300);
    float _3310 = -_2650;
    float _3312 = fma(_3310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3302);
    float _3314 = -_2658;
    float _3316 = fma(_3314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3304);
    float _3318 = _3312;
    float _3320 = _3308;
    float _3322 = _3316;
    if (!_3232)
    {
        float _3324 = _2668 * _2668;
        float _3326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3328 = -_2248;
        float _3330 = _3328 + _3304;
        float _3332 = fma(_2676, _2676, _3324);
        float _3334 = fma(_2686, _2686, _3332);
        float _3336 = 1.0 / _2774;
        float _3338 = sqrt(_3334);
        float _3340 = precise::min(_3338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3342 = _3340 * _3326;
        float _3344 = -_2196;
        float _3346 = _3344 + _3300;
        float _3348 = _3342 * _3336;
        float _3350 = -_2192;
        float _3352 = _3350 + _3302;
        float _3354 = fma(_3346, _3348, _2662);
        float _3356 = fma(_3352, _3348, _2656);
        float _3358 = fma(_3330, _3348, _2672);
        _3318 = _3356;
        _3320 = _3354;
        _3322 = _3358;
    }
    float _3360 = _3318;
    float _3362 = _3320;
    float _3364 = _3322;
    float _3366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3368 = _3360 + _3366;
    float _3370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3372 = _3362 + _3370;
    float _3374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3376 = _3364 + _3374;
    float _3378 = _3368 * _3368;
    float _3380 = fma(_3372, _3372, _3378);
    float _3382 = fma(_3376, _3376, _3380);
    float _3384 = rsqrt(_3382);
    float _3386 = _3384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3388 = _3372 * _3386;
    float _3390 = _3376 * _3386;
    float _3392 = _3388 * _3388;
    float _3394 = _3390 * _3390;
    float _3396 = _3392 + _3394;
    float _3398 = sqrt(_3396);
    bool _3400 = _3398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3404 = _3398 + _3402;
    float _3406 = _3384;
    float _3408 = _3404;
    float _3410 = _3368;
    if (_3400)
    {
        float _3412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3406 = _3412;
    }
    float _3414 = _3406;
    if (_3400)
    {
        float _3416 = rsqrt(_3396);
        _2742 = _3416;
    }
    float _3418 = _2742;
    float _3420 = _3418;
    if (_3400)
    {
        float _3422 = _3404 * _3414;
        _3408 = _3422;
    }
    float _3424 = _3408;
    if (_3400)
    {
        float _3426 = _3424 * 0.15915493667125701904296875;
        _2744 = _3426;
    }
    float _3428 = _2744;
    float _3430 = _3376;
    float _3432 = _3428;
    if (_3400)
    {
        float _3434 = _3428 * 6.283185482025146484375;
        float _3436 = sin(_3434);
        _3430 = _3436;
    }
    float _3438 = _3430;
    float _3440 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3442 = precise::max(0.0, _3440);
    float _3444 = _3414;
    float _3446 = _3442;
    if (_3400)
    {
        float _3448 = _3428 * 6.283185482025146484375;
        float _3450 = cos(_3448);
        _3444 = _3450;
    }
    float _3452 = _3444;
    float _3454 = -_3386;
    float _3456 = -_3442;
    float _3458 = fma(_3368, _3454, _3456);
    if (_3400)
    {
        float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3410 = _3460;
    }
    float _3462 = _3410;
    float _3464 = _3462;
    if (!_3400)
    {
        _3432 = _3394;
    }
    float _3466 = _3432;
    float _3468 = _3438;
    float _3470 = _3466;
    if (_3400)
    {
        float _3472 = fma(_3438, _3462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3464 = _3472;
    }
    float _3474 = _3464;
    float _3476 = _3474;
    if (!_3400)
    {
        _3468 = _3458;
    }
    float _3478 = _3468;
    float _3480 = _3478;
    float _3482 = _3452;
    if (_3400)
    {
        float _3484 = _3452 + (-1.0);
        _3446 = _3484;
    }
    float _3486 = _3446;
    float _3488 = _3486;
    if (_3400)
    {
        float _3490 = _3418 * _3474;
        _213 = _3490;
    }
    float _3492 = _213;
    if (!_3400)
    {
        _3420 = _3388;
    }
    float _3494 = _3420;
    float _3496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3498 = _3494;
    if (_3400)
    {
        float _3500 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3488 = _3500;
    }
    float _3502 = _3488;
    if (_3400)
    {
        float _3504 = _3388 * _3492;
        _3498 = _3504;
    }
    float _3506 = _3498;
    if (!_3400)
    {
        _3476 = _3390;
    }
    float _3508 = _3476;
    float _3510 = _3508;
    if (_3400)
    {
        float _3512 = _3390 * _3492;
        _3510 = _3512;
    }
    float _3514 = _3510;
    if (_3400)
    {
        float _3516 = fma(_3458, _3452, _3502);
        _3480 = _3516;
    }
    float _3518 = _3480;
    if (!_3400)
    {
        _3482 = _3392;
    }
    float _3520 = _3482;
    float _3522 = sqrt(_3382);
    float _3524 = _3520;
    if (_3400)
    {
        float _3526 = _3506 * _3506;
        _3524 = _3526;
    }
    float _3528 = _3524;
    if (_3400)
    {
        float _3530 = _3514 * _3514;
        _3470 = _3530;
    }
    float _3532 = _3470;
    float _3534 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3536 = fma(_3518, _3518, _3528);
    float _3538 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3540 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3542 = _3536 + _3532;
    float _3544 = floor(_3538);
    float _3546 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3540);
    float _3548 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3534);
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3552 = fma(_3522, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3550);
    float _3554 = precise::clamp(_3552, 0.0, 1.0);
    float _3556 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3546);
    float _3558 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3548);
    float _3560 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3562 = rsqrt(_3542);
    float _3564 = _3556 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3566 = -_3554;
    float _3568 = _3566 + 1.0;
    float _3570 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3572 = abs(_3568);
    float _3574 = log2(_3572);
    float _3576 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3578 = -_3570;
    float _3580 = fma(_3578, _3496, 1.0);
    float _3582 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3584 = -_3544;
    float _3586 = _3538 + _3584;
    float _3588 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3576);
    float _3590 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3582);
    float _3592 = _3562 * _3506;
    float _3594 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3588);
    float _3596 = _3562 * _3518;
    float _3598 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3590);
    float _3600 = _3562 * _3514;
    float _3602 = _3594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3604 = _3592 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3606 = _3598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3608 = log2(_3580);
    float _3610 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3612 = -_3604;
    float _3614 = fma(_3596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3612);
    float _3616 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3618 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3620 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3610);
    float _3622 = -_3600;
    float _3624 = fma(_3622, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3614);
    float _3626 = floor(_3560);
    float _3628 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3630 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3620);
    float _3632 = fma(_3624, -0.5, 0.5);
    float _3634 = fma(_3624, 0.5, 0.5);
    float _3636 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3618);
    float _3638 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3630);
    float _3640 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3642 = exp2(_3616);
    float _3644 = _3596 + 1.0;
    float _3646 = _3608 * 0.693147182464599609375;
    float _3648 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3640);
    float _3650 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3636);
    float _3652 = 1.0 / _3638;
    float _3654 = -_3626;
    float _3656 = _3560 + _3654;
    float _3658 = fma(_3634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3660 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3650);
    float _3662 = fma(_3634, _3658, -0.212114393711090087890625);
    float _3664 = sqrt(_3632);
    float _3666 = -_3596;
    float _3668 = fma(_3642, _3644, _3666);
    float2 _9759 = float2(_3586, _3656);
    float _3670 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9759, float2(0.0), isnan(_9759)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9759, float2(0.0), isnan(_9759)), level(0.0)).x;
    float _3672 = fma(_3634, _3662, 1.570728778839111328125);
    float _3674 = fma(_3668, 0.5, 0.5);
    float _3676 = _3660 * _3652;
    float _3678 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3648);
    float _3680 = fma(_3676, -0.5, 0.5);
    float _3682 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3678);
    float _3684 = _3664 * 0.636619746685028076171875;
    float _3686 = _3682 * _3652;
    float _3688 = _3646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3690 = -_3672;
    float _3692 = fma(_3684, _3690, 1.0);
    float _3694 = fma(_3686, 0.5, 0.5);
    float3 _9808 = float3(_3694, _3680, _3688);
    float _3696 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9808, float3(0.0), isnan(_9808)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9808, float3(0.0), isnan(_9808)), level(0.0)).x;
    float3 _9819 = float3(_3694, _3680, _3688);
    float4 _3699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9819, float3(0.0), isnan(_9819)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9819, float3(0.0), isnan(_9819)), level(0.0)).xyzw;
    float _3701 = _3699.x;
    float _3703 = _3699.y;
    float _3705 = _3699.z;
    float _3707 = _3699.w;
    float2 _9835 = float2(_3692, _3674);
    float3 _3711 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9835, float2(0.0), isnan(_9835)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9835, float2(0.0), isnan(_9835)), level(0.0)).xyz;
    float _3713 = _3711.x;
    float _3715 = _3711.y;
    float _3717 = _3711.z;
    float _3719 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3721 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3723 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _3362;
    out.m_80.y = _3360;
    out.m_80.z = _3364;
    float _3725 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3719);
    float _3727 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3721);
    float _3729 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3723);
    float _3731 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3733 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3725);
    float _3735 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3727);
    float _3737 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3729);
    float _3739 = _3733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3741 = _3735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3743 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3737);
    float _3745 = 1.0 / _3739;
    float _3747 = _3741 + _3739;
    float _3749 = in.m_82.x;
    bool _3751 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3522);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = _3747 * _3745;
    float _3763 = _3761 * 0.5;
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3767 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3765);
    float _3769 = 1.0 / _3767;
    out.gl_Position.x = _3682;
    out.gl_Position.y = _3660;
    out.gl_Position.z = _3743;
    out.gl_Position.w = _3638;
    float _3771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3773 = _3769 * _3771;
    float _3775 = abs(_3773);
    float _3777 = log2(_3775);
    bool _3779 = _3773 <= 8000.0;
    bool _3781 = isnan(_3773);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan(8000.0);
    bool _3787 = _3783 || _3785;
    float _3789 = float(_3787);
    float _3791 = _3682;
    if (!_3759)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3793 = _3791;
    float _3795 = _3777 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3797 = exp2(_3795);
    float _3799 = fma(_3797, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3801 = precise::clamp(_3799, 0.0, 1.0);
    float _3803 = fma(_3801, -2.0, 3.0);
    float _3805 = _3801 * _3801;
    float _3807 = _3805 * _3803;
    float _3809 = exp2(_3731);
    float _3811 = -_3807;
    float _3813 = _3811 + 1.0;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3807);
    float _3817 = _3743 + _3638;
    float _3819 = _3789 * _3815;
    float _3821 = _3817 * 0.5;
    float _3823 = _3819 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3825 = -_3809;
    float _3827 = _3825 + 1.0;
    out.m_84.z = _3821;
    out.m_84.w = _3638;
    float _3829 = _3827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3831 = -_3829;
    float _3833 = _3831 + 1.0;
    float _3835 = _3638;
    float _3837 = _3833;
    float _3839 = _3793;
    float _3841 = _3793;
    if (!_3759)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3843 = _3835;
    float _3845 = -_3670;
    float _3847 = _3845 + 1.0;
    float _3849 = _3847 * _3823;
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -_3851;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3857 = _3855 * _3749;
    float _3859 = _3857 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3859;
    float _3861 = _3829 * _3696;
    float _3863 = _3707 * _3861;
    float _3865 = _3717 * _3861;
    float _3867 = _3707 * _3833;
    float _3869 = _3703;
    float _3871 = _3701;
    float _3873 = _3863;
    float _3875 = _3843;
    float _3877 = _3843;
    if (!_3759)
    {
        _3837 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3879 = _3837;
    float _3881 = fma(_3713, _3863, _3701);
    float _3883 = fma(_3715, _3863, _3703);
    float _3885 = fma(_3707, _3865, _3705);
    float _3887 = _3879;
    float _3889 = _3879;
    if (!_3759)
    {
        _3869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3891 = _3869;
    float _3893 = _3891;
    float _3895 = _3891;
    if (!_3759)
    {
        _3871 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3897 = _3871;
    out.m_88.x = _3881;
    out.m_88.y = _3883;
    out.m_88.z = _3885;
    out.m_88.w = _3867;
    float _3899 = _3897;
    float _3901 = _3897;
    if (!_3759)
    {
        _3873 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3903 = _3873;
    bool _3905 = !_3759;
    float _3907 = _3903;
    float _3909 = _3903;
    if (!_3905)
    {
        bool _3911 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3913 = isnan(_3522);
        bool _3915 = _3911 || _3913;
        bool _3917 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3919 = _3915 || _3917;
        if (!_3919)
        {
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3923 = _3522 + _3921;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3927 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3925;
            float _3929 = 1.0 / _3927;
            float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3951 = _3923 * _3929;
            float _3953 = precise::clamp(_3951, 0.0, 1.0);
            float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3959 = fma(_3953, _3933, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3961 = fma(_3953, _3957, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3963 = fma(_3953, _3937, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3965 = fma(_3953, _3941, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3967 = fma(_3953, _3945, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3969 = fma(_3953, _3949, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3877 = _3961;
            _3901 = _3967;
            _3841 = _3959;
            _3895 = _3965;
            _3889 = _3963;
            _3909 = _3969;
            _3971 = true;
        }
        else
        {
            bool _3973 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3975 = isnan(_3522);
            bool _3977 = _3973 || _3975;
            bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3981 = _3977 || _3979;
            if (!_3981)
            {
                _3839 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3983 = _3839;
            _3841 = _3983;
            if (!_3981)
            {
                _3875 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3985 = _3875;
            _3877 = _3985;
            if (!_3981)
            {
                _3887 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3987 = _3887;
            _3889 = _3987;
            if (!_3981)
            {
                _3893 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3989 = _3893;
            _3895 = _3989;
            if (!_3981)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3991 = _3899;
            _3901 = _3991;
            if (!_3981)
            {
                _3907 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3993 = _3907;
            bool _3995 = !_3981;
            _3909 = _3993;
            if (!_3995)
            {
                bool _3997 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3999 = isnan(_3522);
                bool _4001 = _3997 || _3999;
                bool _4003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4005 = _4001 || _4003;
                if (!_4005)
                {
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4009 = _3522 + _4007;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4013 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4011;
                    float _4015 = 1.0 / _4013;
                    float _4017 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4019 = _4017 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4037 = _4009 * _4015;
                    float _4039 = precise::clamp(_4037, 0.0, 1.0);
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4045 = fma(_4039, _4019, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4047 = fma(_4039, _4043, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4049 = fma(_4039, _4023, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4051 = fma(_4039, _4027, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4053 = fma(_4039, _4031, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4055 = fma(_4039, _4035, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3877 = _4047;
                    _3901 = _4053;
                    _3841 = _4045;
                    _3895 = _4051;
                    _3889 = _4049;
                    _3909 = _4055;
                    _3971 = true;
                }
                else
                {
                    _3877 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3841 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3895 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3889 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3909 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3971 = false;
    float _4057 = _3877;
    float _4059 = _3901;
    float _4061 = _3841;
    float _4063 = _3895;
    float _4065 = _3889;
    float _4067 = _3909;
    float _4069 = fma(_3098, -0.5, 0.5);
    float _4071 = precise::clamp(_4069, 0.0, 1.0);
    float _4073 = -_4057;
    float _4075 = _4073 + _4059;
    float _4077 = -_4061;
    float _4079 = _4077 + _4063;
    float _4081 = -_4065;
    float _4083 = _4081 + _4067;
    bool _4085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = fma(_4071, _4075, _4057);
    float _4089 = fma(_4071, _4079, _4061);
    float _4091 = fma(_4071, _4083, _4065);
    float _4093 = _4087 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _4095 = fma(_4089, 0.298911988735198974609375, _4093);
    float _4097 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4099 = fma(_4091, 0.114477999508380889892578125, _4095);
    out.m_51.x = _4097;
    float _4101 = -_4099;
    float _4103 = _4089 + _4101;
    float _4105 = -_4099;
    float _4107 = _4087 + _4105;
    float _4109 = -_4099;
    float _4111 = _4091 + _4109;
    float _4113 = fma(_4103, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    float _4115 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    float _4117 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    out.m_92.x = _4113;
    out.m_92.y = _4115;
    out.m_92.z = _4117;
    if (!_4085)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4119 = -_3360;
    float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4123 = -_3362;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4127 = -_3364;
    float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4131 = _4121 * _4121;
    float _4133 = fma(_4125, _4125, _4131);
    float _4135 = fma(_4129, _4129, _4133);
    float _4137 = sqrt(_4135);
    float _4139 = rsqrt(_4135);
    float _4141 = -_4137;
    float _4143 = _4141 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4145 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4147 = precise::clamp(_4145, 0.0, 1.0);
    float _4149 = _4125 * _4139;
    float _4151 = _4121 * _4139;
    float _4153 = abs(_4147);
    float _4155 = log2(_4153);
    float _4157 = _4129 * _4139;
    float _4159 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4161 = _3098 * _4151;
    float _4163 = -_4151;
    float _4165 = -_4159;
    float _4167 = fma(_4163, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4165);
    float _4169 = fma(_3094, _4149, _4161);
    float _4171 = -_4157;
    float _4173 = fma(_4171, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4167);
    float _4175 = fma(_3102, _4157, _4169);
    float _4177 = precise::clamp(_4175, 0.0, 1.0);
    float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4181 = _4173 + _4179;
    float _4183 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4187 = precise::clamp(_4185, 0.0, 1.0);
    float _4189 = exp2(_4183);
    float _4191 = _4189 * _4187;
    float _4193 = _4177 * _4191;
    float _4195 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4197 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4199 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4195;
    out.m_90.y = _4197;
    out.m_90.z = _4199;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _3971 = false;
    bool _3152 = false;
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
        float _4256 = as_type<float>(_127);
        out.gl_Position.z = _4256;
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
        float _4326 = as_type<float>(_165);
        out.gl_Position.z = _4326;
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
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
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
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _961 = _953 + _959;
    float _963 = float(_111);
    float _965 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _969 = _967 != 0;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _973 = int(_971);
    bool _975 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_953);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = float(_957);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _991 = int(_989);
    if (_969)
    {
        float _993 = in.m_60.x;
        _757 = _993;
    }
    float _995 = _757;
    float _997 = -_985;
    float _999 = _997 + 1.0;
    float _1001 = _995;
    if (!_969)
    {
        float _1003 = in.m_60.y;
        _1001 = _1003;
    }
    float _1005 = _1001;
    float _1007 = float(uint(_973));
    float _1009 = 1.0 / _987;
    int _1011 = ~_973;
    int _1013 = _1011 + 1;
    int _1015 = ~_973;
    int _1017 = _1015 + 1;
    bool _1019 = _973 == 0;
    float _1021 = float(_991);
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1025 = int(_1023);
    float _1027 = _1009 * _145;
    float _1029 = 1.0 / _1007;
    float _1031 = 1.0 / _1021;
    float _1033 = float(uint(_1025));
    int _1035 = ~_1025;
    int _1037 = _1035 + 1;
    int _1039 = ~_1025;
    int _1041 = _1039 + 1;
    float _1043 = trunc(_1027);
    int _1045 = int(_1043);
    int _1047 = as_type<int>(_1029) + (-2);
    float _1049 = _1031 * _145;
    float _1051 = 1.0 / _1033;
    float _1053 = float(uint(_1045));
    float _1055 = trunc(_1049);
    int _1057 = int(_1055);
    float _1059 = as_type<float>(_1047) * _1053;
    float _1061 = in.m_60.x;
    float _1063 = in.m_60.y;
    float _1065 = in.m_60.z;
    float _1067 = in.m_60.w;
    float _1069 = trunc(_1059);
    float _1071 = precise::max(_1069, 0.0);
    uint _1074 = uint(_1071);
    int _1076 = as_type<int>(_1051) + (-2);
    float _1078 = float(uint(_1057));
    float _1080 = 1.0 / _963;
    float _1082 = _1059;
    if (_969)
    {
        _1082 = 1.0;
    }
    float _1084 = _1082;
    float _1086 = _1084;
    if (!_969)
    {
        _1086 = 1.2345600128173828125;
    }
    float _1088 = _1086;
    float _1090 = as_type<float>(_1076) * _1078;
    int _1092 = _1013 * int(_1074);
    int _1094 = _1092 + _1045;
    float _1096 = _1005 * _1088;
    float _1098 = trunc(_1090);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = float(uint(_1094));
    float _1106 = as_type<float>(_1094);
    if (_969)
    {
        _1106 = 1.0;
    }
    float _1108 = _1106;
    float _1110 = _1108;
    if (!_969)
    {
        _1110 = 7.345489978790283203125;
    }
    float _1112 = _1110;
    float _1114 = as_type<float>(_1047) * _1104;
    int _1116 = ~_1025;
    int _1118 = _1116 + 1;
    float _1120 = trunc(_1114);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = _1112 * _1061;
    int _1128 = _1118 * int(_1102);
    int _1130 = _1128 + _1057;
    float _1132 = floor(_1096);
    float _1134 = float(uint(_1130));
    float _1136 = floor(_1126);
    int _1138 = int(_1074) + int(_1124);
    float _1140 = as_type<float>(_1076) * _1134;
    float _1142 = float(_973);
    int _1144 = _1017 * _1138;
    int _1146 = _1144 + _1045;
    float _1148 = trunc(_1140);
    float _1150 = precise::max(_1148, 0.0);
    uint _1152 = uint(_1150);
    float _1154 = -_1132;
    float _1156 = _1096 + _1154;
    bool _1158 = uint(_1146) >= uint(_973);
    float _1160 = float(_1045);
    bool _1162 = !_1158;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = -_1136;
    float _1168 = _1126 + _1166;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1172 = _1170 != 0;
    int _1174 = ~_1138;
    int _1176 = _1174 + _1164;
    int _1178 = _1176 + 1;
    float _1180 = _1168 * _1142;
    bool _1182 = _1160 >= _1142;
    bool _1184 = isnan(_1160);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(_1142);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1080 * _145;
    bool _1196 = !_1172;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = float(_1025);
    float _1202 = trunc(_1180);
    int _1204 = int(_1202);
    float _1206 = float(_1057);
    int _1208 = abs(_1198);
    float _1210 = _1142 * _1194;
    bool _1212 = _1206 >= _1200;
    bool _1214 = isnan(_1206);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1200);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _1200 * _1194;
    float _1226 = _1156 * _1200;
    float _1228 = trunc(_1192);
    int _1230 = int(_1228);
    int _1232 = int(_1102) + int(_1152);
    int _1234 = _973 * _1178;
    int _1236 = _1234 + _1045;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1240 = _1238 != 0;
    int _1242 = _1037 * _1232;
    int _1244 = _1242 + _1057;
    float _1246 = trunc(_1226);
    int _1248 = int(_1246);
    bool _1250 = !_1019;
    int _1252 = _1250 ? _1236 : (-1);
    int _1254 = _1204 * _1208;
    int _1256 = _1254 + _1045;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1268 = _1266 != 0;
    bool _1270 = uint(_1244) >= uint(_1025);
    bool _1272 = !_1240;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = trunc(_1222);
    int _1278 = int(_1276);
    int _1280 = ~_1230;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    int _1286 = abs(_1274);
    bool _1288 = !_1270;
    int _1290 = _1288 ? 0 : (-1);
    int _1292 = _1252 * _1284;
    bool _1294 = !_1264;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = trunc(_1210);
    int _1300 = int(_1298);
    int _1302 = _973 + (-1);
    int _1304 = _1248 * _1286;
    int _1306 = _1304 + _1057;
    int _1308 = ~_1232;
    int _1310 = _1308 + _1290;
    int _1312 = _1310 + 1;
    int _1314 = abs(_1296);
    int _1316 = _1230 * _1302;
    int _1318 = _1316 + _1292;
    bool _1320 = !_1260;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1025 * _1312;
    int _1326 = _1324 + _1057;
    bool _1328 = !_1268;
    int _1330 = _1328 ? 0 : 1;
    int _1332 = _1318 * _1314;
    int _1334 = abs(_1322);
    float _1336 = trunc(_1224);
    int _1338 = int(_1336);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1342 = _1340 != 0;
    bool _1344 = _1025 == 0;
    int _1346 = _1300 * _1334;
    int _1348 = _1346 + _1332;
    int _1350 = abs(_1330);
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : 1;
    int _1356 = ~_1278;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    bool _1362 = !_1344;
    int _1364 = _1362 ? _1326 : (-1);
    int _1366 = abs(_1354);
    int _1368 = _1364 * _1360;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1372 = _1370 != 0;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1384 = _1382 != 0;
    int _1386 = _1256 * _1350;
    int _1388 = _1386 + _1348;
    int _1390 = _1025 + (-1);
    bool _1392 = !_1376;
    int _1394 = _1392 ? 0 : 1;
    int _1396 = _1278 * _1390;
    int _1398 = _1396 + _1368;
    bool _1400 = !_1372;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = _1204 * _1366;
    int _1406 = _1404 + _1388;
    int _1408 = abs(_1394);
    float _1410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1412 = log2(_1410);
    bool _1414 = !_1380;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = abs(_1402);
    bool _1420 = !_1384;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = float(uint(_1406));
    int _1426 = abs(_1416);
    int _1428 = _1398 * _1408;
    int _1430 = abs(_1422);
    float _1432 = as_type<float>(_1047) * _1424;
    int _1434 = _1338 * _1418;
    int _1436 = _1434 + _1428;
    float _1438 = _1412 * _145;
    int _1440 = ~_973;
    int _1442 = _1440 + 1;
    int _1444 = _1306 * _1426;
    int _1446 = _1444 + _1436;
    float _1448 = trunc(_1432);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = ~_973;
    int _1456 = _1454 + 1;
    int _1458 = _1248 * _1430;
    int _1460 = _1458 + _1446;
    int _1462 = ~_1025;
    int _1464 = _1462 + 1;
    bool _1466 = _973 == 0;
    float _1468 = float(uint(_1460));
    float _1470 = exp2(_1438);
    float _1472 = float(uint(_1256));
    int _1474 = ~_973;
    int _1476 = _1474 + 1;
    float _1478 = as_type<float>(_1076) * _1468;
    int _1480 = _1456 * int(_1452);
    int _1482 = _1480 + _1406;
    float _1484 = trunc(_1478);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    float _1490 = float(uint(_1482));
    float _1492 = as_type<float>(_1047) * _1490;
    float _1494 = trunc(_1492);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = _1464 * int(_1488);
    int _1502 = _1500 + _1460;
    float _1504 = float(uint(_1502));
    float _1506 = as_type<float>(_1076) * _1504;
    int _1508 = int(_1452) + int(_1498);
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1512 = trunc(_1506);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = _1442 * _1508;
    int _1520 = _1518 + _1406;
    int _1522 = ~_1025;
    int _1524 = _1522 + 1;
    bool _1526 = uint(_1520) >= uint(_973);
    bool _1528 = !_1526;
    int _1530 = _1528 ? 0 : (-1);
    int _1532 = ~_1508;
    int _1534 = _1532 + _1530;
    int _1536 = _1534 + 1;
    float _1538 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1540 = int(_1488) + int(_1516);
    int _1542 = _973 * _1536;
    int _1544 = _1542 + _1406;
    float _1546 = _1061 * 2.0;
    int _1548 = _1524 * _1540;
    int _1550 = _1548 + _1460;
    bool _1552 = !_1466;
    int _1554 = _1552 ? _1544 : (-1);
    bool _1556 = uint(_1550) >= uint(_1025);
    float _1558 = floor(_1546);
    int _1560 = _1554 & 3;
    bool _1562 = _1560 != 0;
    bool _1564 = !_1556;
    int _1566 = _1564 ? 0 : (-1);
    bool _1568 = uint(_1560) > 1u;
    int _1570 = _1554 & 3;
    bool _1572 = _1570 != 0;
    int _1574 = ~_1540;
    int _1576 = _1574 + _1566;
    int _1578 = _1576 + 1;
    int _1580 = _1572 ? 0 : 1;
    bool _1582 = _1560 != 3;
    int _1584 = _1025 * _1578;
    int _1586 = _1584 + _1460;
    bool _1588 = uint(_1560) >= 2u;
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1592 = _1590 != 0;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1596 = ~_1580;
    int _1598 = _1596 + 1;
    int _1600 = _1598 + 1;
    int _1602 = _1588 ? 0 : 1;
    int _1604 = _1600;
    int _1606 = as_type<int>(_1067);
    float _1608 = as_type<float>(_1408);
    if (!_1568)
    {
        int _1610 = ~_1580;
        int _1612 = _1610 + 1;
        _1604 = _1612;
    }
    int _1614 = _1604;
    bool _1616 = _1067 > 0.5;
    bool _1618 = !_1344;
    int _1620 = _1618 ? _1586 : (-1);
    float _1622 = -_203;
    int _1624 = _1616 ? as_type<int>(_1622) : as_type<int>(_203);
    int _1626 = _1620 & 3;
    bool _1628 = _1626 != 0;
    int _1630 = _1620 & 3;
    bool _1632 = _1630 != 0;
    int _1634 = ~_1602;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    int _1640 = _1638;
    if (_1582)
    {
        int _1642 = ~_1602;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    bool _1648 = uint(_1626) > 1u;
    float _1650 = _1632 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1652 = _1650;
    if (_1592)
    {
        _1606 = 0;
    }
    int _1654 = _1606;
    bool _1656 = uint(_1626) >= 2u;
    int _1658 = _1654;
    if (!_1592)
    {
        _1658 = 1;
    }
    int _1660 = _1658;
    bool _1662 = _1626 != 3;
    int _1664 = _1656 ? 0 : 1;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1668 = _1660 != 1;
    int _1670 = ~as_type<int>(_1650);
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = -_1666;
    float _1678 = fma(_1538, 2.0, _1676);
    int _1680 = _1674;
    float _1682 = as_type<float>(_1660);
    if (!_1648)
    {
        int _1684 = ~as_type<int>(_1650);
        int _1686 = _1684 + 1;
        _1680 = _1686;
    }
    int _1688 = _1680;
    float _1690 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1694 = _1692 != 0;
    float _1696 = -_145;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1678);
    int _1700 = ~_1664;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    float _1706 = fma(_1690, -2.0, _1594);
    int _1708 = _1704;
    if (_1662)
    {
        int _1710 = ~_1664;
        int _1712 = _1710 + 1;
        _1708 = _1712;
    }
    int _1714 = _1708;
    bool _1716 = !_1694;
    int _1718 = _1716 ? 0 : 1;
    float _1720 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1706);
    bool _1722 = _1558 > 0.0;
    bool _1724 = _1558 >= 0.0;
    bool _1726 = isnan(_1558);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    float _1734 = _1558;
    if (!_1668)
    {
        _1734 = _1063;
    }
    float _1736 = _1734;
    float _1738 = _1736;
    if (!_1668)
    {
        _1652 = _1063;
    }
    float _1740 = _1652;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1744 = _1740;
    if (_1668)
    {
        _1738 = _1061;
    }
    float _1746 = _1738;
    if (_1668)
    {
        _1744 = _1061;
    }
    float _1748 = _1744;
    if (!_1668)
    {
        _1682 = _1065;
    }
    float _1750 = _1682;
    float _1752 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1754 = _1750;
    if (_1668)
    {
        _1754 = _1063;
    }
    float _1756 = _1754;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1510);
    float _1760 = as_type<float>(_1047) * _1472;
    float _1762 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1742);
    float _1764 = float(uint(_1306));
    float _1766 = -_1470;
    float _1768 = _1766 + 1.0;
    float _1770 = trunc(_1760);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1668)
    {
        _1608 = _1065;
    }
    float _1778 = _1608;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1782 = 1.0 + _1780;
    float _1784 = -_1776;
    float _1786 = fma(_1752, 2.0, _1784);
    float _1788 = _1778;
    if (_1668)
    {
        _1788 = _1063;
    }
    float _1790 = _1788;
    float _1792 = as_type<float>(_1076) * _1764;
    bool _1794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1796 = isnan(0.0);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1802 = _1798 || _1800;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1806 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1808 = _1802 ? _1768 : 0.0;
    float _1810 = trunc(_1792);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    bool _1816 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1818 = isnan(1.0);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1824 = _1820 || _1822;
    float _1826 = fma(_1806, -2.0, _1804);
    int _1828 = _1476 * int(_1774);
    int _1830 = _1828 + _1256;
    float _1832 = _1063 * 2.0;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1838 = 1.0 / _1782;
    float _1840 = float(uint(_1830));
    float _1842 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1834);
    float _1844 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1836);
    float _1846 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1762);
    float _1848 = -_145;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1786);
    float _1852 = as_type<float>(_1047) * _1840;
    float _1854 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1842);
    float _1856 = floor(_1832);
    int _1858 = _1041 * int(_1814);
    int _1860 = _1858 + _1306;
    float _1862 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1844);
    float _1864 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1758);
    float _1866 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1826);
    float _1868 = _1065 * 2.0;
    float _1870 = float(uint(_1860));
    float _1872 = trunc(_1852);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    if (_1824)
    {
        float _1878 = _1808 * _1838;
        _147 = _1878;
    }
    float _1880 = _147;
    float _1882 = as_type<float>(_1076) * _1870;
    int _1884 = _1732 ? 0 : 1;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1890 = _1856 > 0.0;
    float _1892 = floor(_1868);
    bool _1894 = _1856 >= 0.0;
    bool _1896 = isnan(_1856);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.0);
    bool _1902 = _1898 || _1900;
    int _1904 = ~_1884;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    int _1910 = _1902 ? 0 : 1;
    int _1912 = _1908;
    if (!_1722)
    {
        int _1914 = ~_1884;
        int _1916 = _1914 + 1;
        _1912 = _1916;
    }
    int _1918 = _1912;
    float _1920 = trunc(_1882);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = ~_1910;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    int _1932 = int(_1774) + int(_1876);
    int _1934 = _1930;
    if (!_1890)
    {
        int _1936 = ~_1910;
        int _1938 = _1936 + 1;
        _1934 = _1938;
    }
    int _1940 = _1934;
    bool _1942 = _1063 > 0.5;
    float _1944 = in.m_48.x;
    float _1946 = in.m_48.y;
    float _1948 = in.m_48.z;
    bool _1950 = _1061 > 0.5;
    float _1952 = 1.0 / _1888;
    float _1954 = -_203;
    int _1956 = _1942 ? as_type<int>(_1954) : as_type<int>(_203);
    bool _1958 = _1065 > 0.5;
    int _1960 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1962 = _1960 != 0;
    int _1964 = int(_1814) + int(_1924);
    float _1966 = -_193;
    int _1968 = _1958 ? as_type<int>(_1966) : as_type<int>(_193);
    float _1970 = -_193;
    int _1972 = _1950 ? as_type<int>(_1970) : as_type<int>(_193);
    int _1974 = ~_973;
    int _1976 = _1974 + 1;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1980 = _1978 != 0;
    int _1982 = ~_1025;
    int _1984 = _1982 + 1;
    bool _1986 = !_1980;
    float _1988 = _1986 ? _203 : as_type<float>(_1624);
    int _1990 = _1976 * _1932;
    int _1992 = _1990 + _1256;
    bool _1994 = !_1962;
    float _1996 = _1994 ? _193 : as_type<float>(_1972);
    int _1998 = _1984 * _1964;
    int _2000 = _1998 + _1306;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2004 = _2002 != 0;
    float _2006 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2010 = _2008 != 0;
    float _2012 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2014 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2006);
    bool _2016 = !_2004;
    float _2018 = _2016 ? _203 : as_type<float>(_1956);
    float _2020 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2012);
    bool _2022 = !_2010;
    float _2024 = _2022 ? _193 : as_type<float>(_1968);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2028 = _2026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2030 = uint(_1992) >= uint(_973);
    bool _2032 = uint(_2000) >= uint(_1025);
    float _2034 = 1.0 / _2028;
    bool _2036 = !_2030;
    int _2038 = _2036 ? 0 : (-1);
    int _2040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2042 = _2040 != 0;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2046 = _2044 != 0;
    int _2048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2050 = _2048 != 0;
    float _2052 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2056 = _2054 != 0;
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2062 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2052);
    float _2064 = 1.0 / _2060;
    bool _2066 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2068 = isnan(_953);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2082;
    float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2086;
    bool _2090 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2092 = isnan(_953);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2080 * _1952;
    float _2104 = _1061 + _1063;
    float _2106 = _2084 * _2034;
    float _2108 = _1065 + _1063;
    float _2110 = _2076 * _999;
    float _2112 = _2104 + (-1.0);
    float _2114 = -_2076;
    float _2116 = _2114 + 1.0;
    bool _2118 = !_2032;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2062);
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2128 = _953 + _2126;
    float _2130 = _2088 * _2064;
    float _2132 = _2108 + (-1.0);
    bool _2134 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2136 = isnan(_953);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = fma(_2106, _2128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2148 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2014);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2152 = _953 + _2150;
    float _2154 = _1996 + 0.5;
    float _2156 = -_2100;
    float _2158 = _2156 + 1.0;
    float _2160 = _2146 * _2110;
    float _2162 = fma(_2130, _2152, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1698);
    int _2166 = _1554 >> 31;
    float _2168 = _2144 * _2158;
    float _2170 = -_2144;
    float _2172 = _2170 + 1.0;
    bool _2174 = _1892 >= 0.0;
    bool _2176 = isnan(_1892);
    bool _2178 = _2174 || _2176;
    bool _2180 = isnan(0.0);
    bool _2182 = _2178 || _2180;
    float _2184 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2160);
    int _2186 = _2166 & 3;
    float _2188 = _985 * _2172;
    int _2190 = _1620 >> 31;
    float _2192 = _2122 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2194 = _2182 ? 0 : 1;
    float _2196 = _2148 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2198 = _1554 + _2186;
    bool _2200 = _1892 > 0.0;
    float _2202 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2020);
    int _2204 = _2190 & 3;
    float _2206 = fma(_2102, _961, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2208 = !_2046;
    int _2210 = _2208 ? 0 : 1;
    float _2212 = _2018 + (-0.5);
    float _2214 = fma(_2206, _2188, _2184);
    int _2216 = _2198 >> 2;
    float _2218 = -_2212;
    float _2220 = -_1720;
    float _2222 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2220);
    int _2224 = _1620 + _2204;
    float _2226 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2228 = abs(_2210);
    float _2230 = fma(_2162, _2168, _2214);
    int _2232 = _2216 << 4;
    int _2234 = _2232 + 368;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2192 + _2236;
    int _2240 = _2224 >> 2;
    float _2242 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2230);
    bool _2244 = !_2042;
    int _2246 = _2244 ? 0 : 1;
    float _2248 = _2202 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2250 = float(_1918);
    float _2252 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2254 = _2196 + _2252;
    float _2256 = float(_2228);
    float _2258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2260 = _2248 + _2258;
    uint _2262 = uint(int(uint(_2234) >> uint(2)));
    uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
    int _2266 = int(_2262) & 3;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[int(_2264)][_2266];
    int _2270 = int(_2262) + 1;
    uint _2272 = uint(int(uint(_2270) >> uint(2)));
    int _2274 = _2270 & 3;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[int(_2272)][_2274];
    int _2278 = ~_2194;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    float _2284 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2286 = _2240 << 4;
    int _2288 = _2286 + 512;
    float _2290 = in.m_66.x;
    float _2292 = in.m_66.y;
    float _2294 = in.m_66.z;
    int _2296 = _2282;
    if (!_2200)
    {
        int _2298 = ~_2194;
        int _2300 = _2298 + 1;
        _2296 = _2300;
    }
    int _2302 = _2296;
    float _2304 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2306 = abs(_2246);
    uint _2308 = uint(int(uint(_2288) >> uint(2)));
    uint _2310 = uint(int(uint(int(_2308)) >> uint(2)));
    int _2312 = int(_2308) & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    int _2316 = int(_2308) + 1;
    uint _2318 = uint(int(uint(_2316) >> uint(2)));
    int _2320 = _2316 & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    float _2324 = float(_2302);
    float _2326 = _2256 * _2250;
    float _2328 = float(_2306);
    float _2330 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2304);
    int _2332 = ~_1932;
    int _2334 = _2332 + _2038;
    int _2336 = _2334 + 1;
    int _2338 = ~_1964;
    int _2340 = _2338 + _2120;
    int _2342 = _2340 + 1;
    float _2344 = _2328 * _2324;
    int _2346 = _2234 + 8;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    uint _2350 = uint(int(uint(int(_2348)) >> uint(2)));
    int _2352 = int(_2348) & 3;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[int(_2350)][_2352];
    int _2356 = int(_2348) + 1;
    uint _2358 = uint(int(uint(_2356) >> uint(2)));
    int _2360 = _2356 & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    float _2364 = _1988 + (-0.5);
    float _2366 = _2024 + 0.5;
    int _2368 = _973 * _2336;
    int _2370 = _2368 + _1256;
    float _2372 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2330);
    float _2374 = -_2364;
    float _2376 = -_1866;
    float _2378 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2376);
    float _2380 = _2344 * (-2.0);
    float _2382 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2384 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1850);
    float _2386 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2388 = !_1628;
    int _2390 = _2388 ? 0 : 1;
    float _2392 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2394 = _2326 * (-2.0);
    bool _2396 = !_1562;
    int _2398 = _2396 ? 0 : 1;
    int _2400 = _2288 + 8;
    uint _2402 = uint(int(uint(_2400) >> uint(2)));
    uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
    int _2406 = int(_2402) & 3;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[int(_2404)][_2406];
    int _2410 = int(_2402) + 1;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    int _2414 = _2410 & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = abs(_1614);
    float _2420 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2422 = _1025 * _2342;
    int _2424 = _2422 + _1306;
    float _2426 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2428 = abs(_1688);
    float _2430 = fma(_2380, _2290, _2290);
    int _2432 = abs(_2390);
    float _2434 = fma(_2124, _2380, _2124);
    int _2436 = abs(_2398);
    out.m_68.x = _2420;
    out.m_68.y = _2392;
    out.m_68.z = _2426;
    out.m_68.w = _2284;
    float _2438 = fma(_2226, _2394, _2226);
    float _2440 = fma(_2394, _2292, _2292);
    bool _2442 = _1560 != 3;
    int _2444 = abs(_1714);
    bool _2446 = _973 == 0;
    bool _2448 = _2372 >= 0.0;
    bool _2450 = !_2446;
    int _2452 = _2450 ? _2370 : (-1);
    int _2454 = ~_2418;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = ~_2436;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    int _2466 = ~_2428;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2458 * as_type<int>(_2276);
    if (_2448)
    {
        out.m_51.x = 0.0;
    }
    int _2474 = abs(_1646);
    int _2476 = _2464 * as_type<int>(_2268);
    int _2478 = _2476 + _2472;
    int _2480 = ~_2432;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    int _2486 = _2470 * as_type<int>(_2322);
    bool _2488 = !_2056;
    int _2490 = _2488 ? 0 : 1;
    bool _2492 = _1626 != 3;
    int _2494 = _2484 * as_type<int>(_2314);
    int _2496 = _2494 + _2486;
    int _2498 = ~_2474;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    bool _2504 = !_2492;
    int _2506 = _2504 ? 0 : (-1);
    int _2508 = abs(_2490);
    int _2510 = _2502 * as_type<int>(_2354);
    int _2512 = _2510 + _2478;
    bool _2514 = !_2442;
    int _2516 = _2514 ? 0 : (-1);
    int _2518 = abs(_2506);
    int _2520 = abs(_2516);
    int _2522 = ~_2444;
    int _2524 = _2522 + 1;
    int _2526 = _2524 + 1;
    int _2528 = ~_2520;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    int _2534 = abs(_1718);
    int _2536 = _2526 * as_type<int>(_2408);
    int _2538 = _2536 + _2496;
    int _2540 = ~_2518;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    int _2546 = _2532 * as_type<int>(_2362);
    int _2548 = _2546 + _2512;
    int _2550 = ~_2534;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    int _2556 = ~_2508;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    int _2562 = _2544 * as_type<int>(_2416);
    int _2564 = _2562 + _2538;
    bool _2566 = _1025 == 0;
    int _2568 = _2548 * _2554;
    float _2570 = as_type<float>(_2518);
    float _2572 = _2416;
    if (_2448)
    {
        _2570 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2574 = _2570;
    int _2576 = _2564 * _2560;
    float _2578 = _2238 * _2238;
    int _2580 = _2452 * _2534;
    int _2582 = _2580 + _2568;
    bool _2584 = !_2566;
    int _2586 = _2584 ? _2424 : (-1);
    float _2588 = -_1854;
    float _2590 = _2588 + 1.0;
    float _2592 = fma(_2254, _2254, _2578);
    float _2594 = -_1864;
    float _2596 = _2594 + 1.0;
    float _2598 = -_1862;
    float _2600 = _2598 + 1.0;
    int _2602 = _2586 * _2508;
    int _2604 = _2602 + _2576;
    float _2606 = fma(_2260, _2260, _2592);
    float _2608 = -_2596;
    float _2610 = fma(_2024, _2608, _2384);
    float _2612 = -_1846;
    float _2614 = _2612 + 1.0;
    float _2616 = _1061 + (-0.5);
    float _2618 = rsqrt(_2606);
    float _2620 = -_2590;
    float _2622 = fma(_1996, _2620, _2164);
    float _2624 = fma(_2018, _2600, _2222);
    float _2626 = fma(_1988, _2614, _2378);
    int _2628 = as_type<int>(_2574);
    if (_2448)
    {
        float _2630 = _2574 * 5.0;
        _2628 = as_type<int>(_2630);
    }
    int _2632 = _2628;
    float _2634 = float(_2582);
    float _2636 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2430);
    float _2638 = float(_2604);
    out.m_70.x = _2622;
    out.m_70.y = _2624;
    out.m_70.z = _2610;
    out.m_70.w = _2626;
    bool _2640 = !_2050;
    int _2642 = _2640 ? 0 : 1;
    float _2644 = fma(_2434, _1880, _2636);
    float _2646 = _1063 + (-0.5);
    if (_2448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8023 = as_type<float>(_2632);
        out.gl_Position.z = _8023;
    }
    int _2648 = abs(_2642);
    float _2650 = _2238 * _2618;
    out.m_72.x = _2634;
    out.m_72.y = _2638;
    float _2652 = _2254 * _2618;
    if (_2448)
    {
        return out;
    }
    float _2654 = -_2650;
    float _2656 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2192);
    float _2658 = _2260 * _2618;
    float _2660 = -_2652;
    float _2662 = fma(_2660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2196);
    float _2664 = float(_1940);
    float _2666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2668 = _2656 + _2666;
    float _2670 = -_2658;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2248);
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2676 = _2662 + _2674;
    float _2678 = -_2650;
    float _2680 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2686 = _2672 + _2684;
    float _2688 = float(_2648);
    float _2690 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2440);
    float _2692 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2682);
    float _2694 = -_2652;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2254);
    float _2698 = _2680 * _2680;
    float _2700 = _2688 * _2664;
    float _2702 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2692);
    float _2704 = _1065 + _1061;
    float _2706 = fma(_2438, _1880, _2690);
    float _2708 = fma(_2696, _2696, _2698);
    float _2710 = -_2658;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2260);
    bool _2714 = _2702 >= 0.0;
    float _2716 = _2704 + (-1.0);
    float _2718 = _2700 * (-2.0);
    float _2720 = _2706 * 0.15915493667125701904296875;
    float _2722 = fma(_2712, _2712, _2708);
    float _2724 = _1065 + (-0.5);
    float _2726 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2728 = fma(_2718, _2294, _2294);
    float _2730 = _2720 * 6.283185482025146484375;
    float _2732 = sin(_2730);
    float _2734 = _2644 * 0.15915493667125701904296875;
    float _2736 = fma(_2726, _2718, _2726);
    float _2738 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2728);
    int _2740 = as_type<int>(_2724);
    float _2742 = _2668;
    float _2744 = _2686;
    if (_2714)
    {
        _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2746 = _2572;
    if (_2714)
    {
        out.m_51.x = 0.0;
    }
    float _2748 = fma(_2736, _1880, _2738);
    float _2750 = sqrt(_2722);
    if (_2714)
    {
        float _2752 = _2746 * 5.0;
        _2740 = as_type<int>(_2752);
    }
    int _2754 = _2740;
    if (_2714)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8219 = as_type<float>(_2754);
        out.gl_Position.z = _8219;
    }
    float _2756 = _2720 * 6.283185482025146484375;
    float _2758 = cos(_2756);
    float _2760 = _2734 * 6.283185482025146484375;
    float _2762 = sin(_2760);
    float _2764 = _2734 * 6.283185482025146484375;
    float _2766 = cos(_2764);
    float _2768 = _2748 * 0.15915493667125701904296875;
    if (_2714)
    {
        return out;
    }
    float _2770 = _2768 * 6.283185482025146484375;
    float _2772 = cos(_2770);
    float _2774 = _2618 * _2750;
    float _2776 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2780 = _2762 * _2732;
    float _2782 = _2766 * _2758;
    float _2784 = _2774 * _2776;
    float _2786 = _2762 * _2758;
    float _2788 = _2768 * 6.283185482025146484375;
    float _2790 = sin(_2788);
    float _2792 = _2766 * _2732;
    float _2794 = _2778 * _2784;
    float _2796 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2800 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2802 = _2774 * _2796;
    float _2804 = _2766 * _2772;
    float _2806 = _2758 * _2772;
    float _2808 = _2762 * _2772;
    float _2810 = _2732 * _2772;
    float _2812 = _2798 * _2802;
    float _2814 = _2804 * _2794;
    float _2816 = _2774 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2818 = _2816 * 0.5;
    float _2820 = fma(_2790, _2782, _2780);
    float _2822 = -_2794;
    float _2824 = _2790 * _2822;
    float _2826 = -_2786;
    float _2828 = fma(_2790, _2792, _2826);
    float _2830 = -_2792;
    float _2832 = fma(_2790, _2786, _2830);
    float _2834 = fma(_2820, _2812, _2814);
    float _2836 = _2808 * _2794;
    float _2838 = fma(_2806, _2812, _2824);
    float _2840 = fma(_2790, _2780, _2782);
    float _2842 = fma(_2828, _2818, _2834);
    float _2844 = fma(_2832, _2812, _2836);
    float _2846 = fma(_2810, _2818, _2838);
    float _2848 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2850 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2852 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2854 = fma(_2840, _2818, _2844);
    float _2856 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2858 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2850);
    float _2860 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2852);
    float _2862 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2864 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2858);
    float _2866 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2860);
    float _2868 = -_2790;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2862);
    float _2872 = _2864 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2874 = _2866 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2876 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2878 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2880 = _2196 + _2872;
    float _2882 = _2248 + _2874;
    float _2884 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2856);
    float _2886 = fma(_2800, _2800, 1.0);
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2880 + _2888;
    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2894 = _2882 + _2892;
    float _2896 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2878);
    float _2898 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2900 = _2890 * _2890;
    float _2902 = _2894 * _2894;
    float _2904 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2896);
    float _2906 = rsqrt(_2886);
    float _2908 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2910 = _2900 + _2902;
    float _2912 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2914 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2876);
    float _2916 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2848);
    float _2918 = -_2790;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2898);
    float _2922 = -_2790;
    float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2908);
    float _2926 = sqrt(_2910);
    float _2928 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2930 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2932 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2934 = _2192 + _2912;
    float _2936 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2928);
    float _2938 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2930);
    float _2940 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2932);
    bool _2942 = _2926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = _2928;
    float _2946 = _2810;
    float _2948 = _2804;
    float _2950 = _2930;
    float _2952 = _2932;
    float _2954 = _2914;
    if (!_2942)
    {
        _2944 = _2902;
    }
    float _2956 = _2944;
    float _2958 = _2956;
    if (!_2942)
    {
        _2946 = _2900;
    }
    float _2960 = _2946;
    float _2962 = _2960;
    if (!_2942)
    {
        _2948 = _2880;
    }
    float _2964 = _2948;
    float _2966 = _2964;
    if (!_2942)
    {
        _2950 = _2882;
    }
    float _2968 = _2950;
    float _2970 = _2968;
    if (!_2942)
    {
        _2952 = _2934;
    }
    float _2972 = _2952;
    bool _2974 = !_2942;
    float _2976 = _2972;
    if (!_2974)
    {
        float _2978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2982 = _2926 + _2980;
        float _2984 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2986 = rsqrt(_2910);
        float _2988 = _2982 * _2978;
        float _2990 = _2988 * 0.15915493667125701904296875;
        float _2992 = _2990 * 6.283185482025146484375;
        float _2994 = sin(_2992);
        float _2996 = _2990 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        float _3000 = fma(_2994, _2984, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3002 = _2986 * _3000;
        float _3004 = _2998 + (-1.0);
        float _3006 = fma(_2890, _3002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3008 = fma(_2894, _3002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3010 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3014 = _3006 + _3012;
        float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3018 = _3008 + _3016;
        float _3020 = fma(_2934, _2998, _3010);
        float _3022 = _3014 * _3014;
        float _3024 = _3018 * _3018;
        _2976 = _3020;
        _2962 = _3022;
        _2958 = _3024;
        _2966 = _3006;
        _2970 = _3008;
    }
    float _3026 = _2976;
    float _3028 = _2962;
    float _3030 = _2958;
    float _3032 = _2966;
    float _3034 = _2970;
    float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3038 = _3026 + _3036;
    float _3040 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2920);
    float _3042 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2924);
    float _3044 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2870);
    float _3046 = fma(_3038, _3038, _3028);
    float _3048 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2936);
    float _3050 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2938);
    float _3052 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2940);
    float _3054 = _3046 + _3030;
    float _3056 = _2800 * _2906;
    float _3058 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2884);
    float _3060 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3062 = _2800 * _3040;
    float _3064 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2914);
    float _3066 = _2800 * _3042;
    float _3068 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2916);
    float _3070 = _2800 * _3044;
    float _3072 = -_3048;
    float _3074 = _3056 * _3072;
    float _3076 = -_3050;
    float _3078 = _3056 * _3076;
    float _3080 = -_3052;
    float _3082 = _3056 * _3080;
    float _3084 = fma(_3060, _3058, _3062);
    float _3086 = sqrt(_3054);
    float _3088 = fma(_3060, _3064, _3066);
    float _3090 = fma(_3060, _3068, _3070);
    float _3092 = fma(_2906, _3040, _3074);
    float _3094 = _3048 + _3084;
    float _3096 = fma(_2906, _3042, _3078);
    float _3098 = _3050 + _3088;
    float _3100 = fma(_2906, _3044, _3082);
    float _3102 = _3052 + _3090;
    out.m_74.x = _3058;
    out.m_74.y = _3064;
    out.m_74.z = _3068;
    out.m_76.x = _3092;
    out.m_76.y = _3096;
    out.m_76.z = _3100;
    bool _3104 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3106 = isnan(_3086);
    bool _3108 = _3104 || _3106;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3112 = _3108 || _3110;
    out.m_78.x = _3094;
    out.m_78.y = _3098;
    out.m_78.z = _3102;
    float _3114 = _3092;
    float _3116 = _3032;
    if (!_3112)
    {
        _2954 = 1.0;
    }
    float _3118 = _2954;
    bool _3120 = !_3112;
    float _3122 = _3118;
    if (!_3120)
    {
        bool _3124 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3126 = isnan(_3086);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3132 = _3128 || _3130;
        if (!_3132)
        {
            float _3134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3136 = _3086 + _3134;
            float _3138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3140 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3138;
            float _3142 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3144 = _3142 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3146 = 1.0 / _3140;
            float _3148 = _3136 * _3146;
            float _3150 = fma(_3148, _3144, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3122 = _3150;
            _3152 = true;
        }
        else
        {
            bool _3154 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3156 = isnan(_3086);
            bool _3158 = _3154 || _3156;
            bool _3160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3162 = _3158 || _3160;
            if (!_3162)
            {
                float _3164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3166 = _3086 + _3164;
                float _3168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3170 = _3168 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3172 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3174 = _3172 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3176 = 1.0 / _3170;
                float _3178 = _3166 * _3176;
                float _3180 = fma(_3178, _3174, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3122 = _3180;
                _3152 = true;
            }
            else
            {
                _3122 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3152 = false;
    float _3182 = _3122;
    float _3184 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3186 = _3026 + _3184;
    float _3188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3190 = _3032 + _3188;
    float _3192 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3194 = _3034 + _3192;
    float _3196 = fma(_3186, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3198 = fma(_3190, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3200 = fma(_3194, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3202 = -_2192;
    float _3204 = _3202 + _3196;
    float _3206 = -_2196;
    float _3208 = _3206 + _3198;
    float _3210 = -_2248;
    float _3212 = _3210 + _3200;
    float _3214 = _3204 * _3204;
    float _3216 = fma(_3208, _3208, _3214);
    float _3218 = fma(_3212, _3212, _3216);
    float _3220 = sqrt(_3218);
    bool _3222 = _3220 > 0.0;
    bool _3224 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan(0.5);
    bool _3232 = _3228 || _3230;
    float _3234 = _3196;
    if (!_3222)
    {
        _3114 = _3198;
    }
    float _3236 = _3114;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3222)
    {
        _3116 = _3200;
    }
    float _3242 = _3116;
    bool _3244 = !_3222;
    float _3246 = _3242;
    if (!_3244)
    {
        float _3248 = _207 * _207;
        float _3250 = fma(_205, _205, _3248);
        float _3252 = fma(_209, _209, _3250);
        float _3254 = rsqrt(_3218);
        float _3256 = sqrt(_3252);
        float _3258 = _3208 * _3254;
        float _3260 = _3204 * _3254;
        float _3262 = _3212 * _3254;
        bool _3264 = _3256 > 0.0;
        float _3266 = _3256;
        if (!_3264)
        {
            _3238 = _3198;
        }
        float _3268 = _3238;
        _3240 = _3268;
        if (!_3264)
        {
            _3266 = _3200;
        }
        float _3270 = _3266;
        bool _3272 = !_3264;
        _3246 = _3270;
        if (!_3272)
        {
            float _3274 = rsqrt(_3252);
            float _3276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3278 = _207 * _3274;
            float _3280 = _205 * _3274;
            float _3282 = _209 * _3274;
            float _3284 = _3260 * _3278;
            float _3286 = fma(_3258, _3280, _3284);
            float _3288 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3290 = fma(_3262, _3282, _3286);
            float _3292 = _3290 * _3288;
            float _3294 = fma(_205, _3292, _3198);
            float _3296 = fma(_207, _3292, _3196);
            float _3298 = fma(_209, _3292, _3200);
            _3240 = _3294;
            _3234 = _3296;
            _3246 = _3298;
        }
    }
    float _3300 = _3240;
    float _3302 = _3234;
    float _3304 = _3246;
    float _3306 = -_2652;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3300);
    float _3310 = -_2650;
    float _3312 = fma(_3310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3302);
    float _3314 = -_2658;
    float _3316 = fma(_3314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3304);
    float _3318 = _3312;
    float _3320 = _3308;
    float _3322 = _3316;
    if (!_3232)
    {
        float _3324 = _2668 * _2668;
        float _3326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3328 = -_2248;
        float _3330 = _3328 + _3304;
        float _3332 = fma(_2676, _2676, _3324);
        float _3334 = fma(_2686, _2686, _3332);
        float _3336 = 1.0 / _2774;
        float _3338 = sqrt(_3334);
        float _3340 = precise::min(_3338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3342 = _3340 * _3326;
        float _3344 = -_2196;
        float _3346 = _3344 + _3300;
        float _3348 = _3342 * _3336;
        float _3350 = -_2192;
        float _3352 = _3350 + _3302;
        float _3354 = fma(_3346, _3348, _2662);
        float _3356 = fma(_3352, _3348, _2656);
        float _3358 = fma(_3330, _3348, _2672);
        _3318 = _3356;
        _3320 = _3354;
        _3322 = _3358;
    }
    float _3360 = _3318;
    float _3362 = _3320;
    float _3364 = _3322;
    float _3366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3368 = _3360 + _3366;
    float _3370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3372 = _3362 + _3370;
    float _3374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3376 = _3364 + _3374;
    float _3378 = _3368 * _3368;
    float _3380 = fma(_3372, _3372, _3378);
    float _3382 = fma(_3376, _3376, _3380);
    float _3384 = rsqrt(_3382);
    float _3386 = _3384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3388 = _3372 * _3386;
    float _3390 = _3376 * _3386;
    float _3392 = _3388 * _3388;
    float _3394 = _3390 * _3390;
    float _3396 = _3392 + _3394;
    float _3398 = sqrt(_3396);
    bool _3400 = _3398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3404 = _3398 + _3402;
    float _3406 = _3384;
    float _3408 = _3404;
    float _3410 = _3368;
    if (_3400)
    {
        float _3412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3406 = _3412;
    }
    float _3414 = _3406;
    if (_3400)
    {
        float _3416 = rsqrt(_3396);
        _2742 = _3416;
    }
    float _3418 = _2742;
    float _3420 = _3418;
    if (_3400)
    {
        float _3422 = _3404 * _3414;
        _3408 = _3422;
    }
    float _3424 = _3408;
    if (_3400)
    {
        float _3426 = _3424 * 0.15915493667125701904296875;
        _2744 = _3426;
    }
    float _3428 = _2744;
    float _3430 = _3376;
    float _3432 = _3428;
    if (_3400)
    {
        float _3434 = _3428 * 6.283185482025146484375;
        float _3436 = sin(_3434);
        _3430 = _3436;
    }
    float _3438 = _3430;
    float _3440 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3442 = precise::max(0.0, _3440);
    float _3444 = _3414;
    float _3446 = _3442;
    if (_3400)
    {
        float _3448 = _3428 * 6.283185482025146484375;
        float _3450 = cos(_3448);
        _3444 = _3450;
    }
    float _3452 = _3444;
    float _3454 = -_3386;
    float _3456 = -_3442;
    float _3458 = fma(_3368, _3454, _3456);
    if (_3400)
    {
        float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3410 = _3460;
    }
    float _3462 = _3410;
    float _3464 = _3462;
    if (!_3400)
    {
        _3432 = _3394;
    }
    float _3466 = _3432;
    float _3468 = _3438;
    float _3470 = _3466;
    if (_3400)
    {
        float _3472 = fma(_3438, _3462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3464 = _3472;
    }
    float _3474 = _3464;
    float _3476 = _3474;
    if (!_3400)
    {
        _3468 = _3458;
    }
    float _3478 = _3468;
    float _3480 = _3478;
    float _3482 = _3452;
    if (_3400)
    {
        float _3484 = _3452 + (-1.0);
        _3446 = _3484;
    }
    float _3486 = _3446;
    float _3488 = _3486;
    if (_3400)
    {
        float _3490 = _3418 * _3474;
        _213 = _3490;
    }
    float _3492 = _213;
    if (!_3400)
    {
        _3420 = _3388;
    }
    float _3494 = _3420;
    float _3496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3498 = _3494;
    if (_3400)
    {
        float _3500 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3488 = _3500;
    }
    float _3502 = _3488;
    if (_3400)
    {
        float _3504 = _3388 * _3492;
        _3498 = _3504;
    }
    float _3506 = _3498;
    if (!_3400)
    {
        _3476 = _3390;
    }
    float _3508 = _3476;
    float _3510 = _3508;
    if (_3400)
    {
        float _3512 = _3390 * _3492;
        _3510 = _3512;
    }
    float _3514 = _3510;
    if (_3400)
    {
        float _3516 = fma(_3458, _3452, _3502);
        _3480 = _3516;
    }
    float _3518 = _3480;
    if (!_3400)
    {
        _3482 = _3392;
    }
    float _3520 = _3482;
    float _3522 = sqrt(_3382);
    float _3524 = _3520;
    if (_3400)
    {
        float _3526 = _3506 * _3506;
        _3524 = _3526;
    }
    float _3528 = _3524;
    if (_3400)
    {
        float _3530 = _3514 * _3514;
        _3470 = _3530;
    }
    float _3532 = _3470;
    float _3534 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3536 = fma(_3518, _3518, _3528);
    float _3538 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3540 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3542 = _3536 + _3532;
    float _3544 = floor(_3538);
    float _3546 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3540);
    float _3548 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3534);
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3552 = fma(_3522, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3550);
    float _3554 = precise::clamp(_3552, 0.0, 1.0);
    float _3556 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3546);
    float _3558 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3548);
    float _3560 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3562 = rsqrt(_3542);
    float _3564 = _3556 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3566 = -_3554;
    float _3568 = _3566 + 1.0;
    float _3570 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3572 = abs(_3568);
    float _3574 = log2(_3572);
    float _3576 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3578 = -_3570;
    float _3580 = fma(_3578, _3496, 1.0);
    float _3582 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3584 = -_3544;
    float _3586 = _3538 + _3584;
    float _3588 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3576);
    float _3590 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3582);
    float _3592 = _3562 * _3506;
    float _3594 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3588);
    float _3596 = _3562 * _3518;
    float _3598 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3590);
    float _3600 = _3562 * _3514;
    float _3602 = _3594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3604 = _3592 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3606 = _3598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3608 = log2(_3580);
    float _3610 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3612 = -_3604;
    float _3614 = fma(_3596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3612);
    float _3616 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3618 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3620 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3610);
    float _3622 = -_3600;
    float _3624 = fma(_3622, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3614);
    float _3626 = floor(_3560);
    float _3628 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3630 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3620);
    float _3632 = fma(_3624, -0.5, 0.5);
    float _3634 = fma(_3624, 0.5, 0.5);
    float _3636 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3618);
    float _3638 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3630);
    float _3640 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3642 = exp2(_3616);
    float _3644 = _3596 + 1.0;
    float _3646 = _3608 * 0.693147182464599609375;
    float _3648 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3640);
    float _3650 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3636);
    float _3652 = 1.0 / _3638;
    float _3654 = -_3626;
    float _3656 = _3560 + _3654;
    float _3658 = fma(_3634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3660 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3650);
    float _3662 = fma(_3634, _3658, -0.212114393711090087890625);
    float _3664 = sqrt(_3632);
    float _3666 = -_3596;
    float _3668 = fma(_3642, _3644, _3666);
    float2 _9759 = float2(_3586, _3656);
    float _3670 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9759, float2(0.0), isnan(_9759)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9759, float2(0.0), isnan(_9759)), level(0.0)).x;
    float _3672 = fma(_3634, _3662, 1.570728778839111328125);
    float _3674 = fma(_3668, 0.5, 0.5);
    float _3676 = _3660 * _3652;
    float _3678 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3648);
    float _3680 = fma(_3676, -0.5, 0.5);
    float _3682 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3678);
    float _3684 = _3664 * 0.636619746685028076171875;
    float _3686 = _3682 * _3652;
    float _3688 = _3646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3690 = -_3672;
    float _3692 = fma(_3684, _3690, 1.0);
    float _3694 = fma(_3686, 0.5, 0.5);
    float3 _9808 = float3(_3694, _3680, _3688);
    float _3696 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9808, float3(0.0), isnan(_9808)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9808, float3(0.0), isnan(_9808)), level(0.0)).x;
    float3 _9819 = float3(_3694, _3680, _3688);
    float4 _3699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9819, float3(0.0), isnan(_9819)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9819, float3(0.0), isnan(_9819)), level(0.0)).xyzw;
    float _3701 = _3699.x;
    float _3703 = _3699.y;
    float _3705 = _3699.z;
    float _3707 = _3699.w;
    float2 _9835 = float2(_3692, _3674);
    float3 _3711 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9835, float2(0.0), isnan(_9835)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9835, float2(0.0), isnan(_9835)), level(0.0)).xyz;
    float _3713 = _3711.x;
    float _3715 = _3711.y;
    float _3717 = _3711.z;
    float _3719 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3721 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3723 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _3362;
    out.m_80.y = _3360;
    out.m_80.z = _3364;
    float _3725 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3719);
    float _3727 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3721);
    float _3729 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3723);
    float _3731 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3733 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3725);
    float _3735 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3727);
    float _3737 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3729);
    float _3739 = _3733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3741 = _3735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3743 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3737);
    float _3745 = 1.0 / _3739;
    float _3747 = _3741 + _3739;
    float _3749 = in.m_82.x;
    bool _3751 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3522);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = _3747 * _3745;
    float _3763 = _3761 * 0.5;
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3767 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3765);
    float _3769 = 1.0 / _3767;
    out.gl_Position.x = _3682;
    out.gl_Position.y = _3660;
    out.gl_Position.z = _3743;
    out.gl_Position.w = _3638;
    float _3771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3773 = _3769 * _3771;
    float _3775 = abs(_3773);
    float _3777 = log2(_3775);
    bool _3779 = _3773 <= 8000.0;
    bool _3781 = isnan(_3773);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan(8000.0);
    bool _3787 = _3783 || _3785;
    float _3789 = float(_3787);
    float _3791 = _3682;
    if (!_3759)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3793 = _3791;
    float _3795 = _3777 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3797 = exp2(_3795);
    float _3799 = fma(_3797, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3801 = precise::clamp(_3799, 0.0, 1.0);
    float _3803 = fma(_3801, -2.0, 3.0);
    float _3805 = _3801 * _3801;
    float _3807 = _3805 * _3803;
    float _3809 = exp2(_3731);
    float _3811 = -_3807;
    float _3813 = _3811 + 1.0;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3807);
    float _3817 = _3743 + _3638;
    float _3819 = _3789 * _3815;
    float _3821 = _3817 * 0.5;
    float _3823 = _3819 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3825 = -_3809;
    float _3827 = _3825 + 1.0;
    out.m_84.z = _3821;
    out.m_84.w = _3638;
    float _3829 = _3827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3831 = -_3829;
    float _3833 = _3831 + 1.0;
    float _3835 = _3638;
    float _3837 = _3833;
    float _3839 = _3793;
    float _3841 = _3793;
    if (!_3759)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3843 = _3835;
    float _3845 = -_3670;
    float _3847 = _3845 + 1.0;
    float _3849 = _3847 * _3823;
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -_3851;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3857 = _3855 * _3749;
    float _3859 = _3857 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3859;
    float _3861 = _3829 * _3696;
    float _3863 = _3707 * _3861;
    float _3865 = _3717 * _3861;
    float _3867 = _3707 * _3833;
    float _3869 = _3703;
    float _3871 = _3701;
    float _3873 = _3863;
    float _3875 = _3843;
    float _3877 = _3843;
    if (!_3759)
    {
        _3837 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3879 = _3837;
    float _3881 = fma(_3713, _3863, _3701);
    float _3883 = fma(_3715, _3863, _3703);
    float _3885 = fma(_3707, _3865, _3705);
    float _3887 = _3879;
    float _3889 = _3879;
    if (!_3759)
    {
        _3869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3891 = _3869;
    float _3893 = _3891;
    float _3895 = _3891;
    if (!_3759)
    {
        _3871 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3897 = _3871;
    out.m_88.x = _3881;
    out.m_88.y = _3883;
    out.m_88.z = _3885;
    out.m_88.w = _3867;
    float _3899 = _3897;
    float _3901 = _3897;
    if (!_3759)
    {
        _3873 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3903 = _3873;
    bool _3905 = !_3759;
    float _3907 = _3903;
    float _3909 = _3903;
    if (!_3905)
    {
        bool _3911 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3913 = isnan(_3522);
        bool _3915 = _3911 || _3913;
        bool _3917 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3919 = _3915 || _3917;
        if (!_3919)
        {
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3923 = _3522 + _3921;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3927 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3925;
            float _3929 = 1.0 / _3927;
            float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3951 = _3923 * _3929;
            float _3953 = precise::clamp(_3951, 0.0, 1.0);
            float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3959 = fma(_3953, _3933, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3961 = fma(_3953, _3957, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3963 = fma(_3953, _3937, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3965 = fma(_3953, _3941, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3967 = fma(_3953, _3945, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3969 = fma(_3953, _3949, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3877 = _3961;
            _3901 = _3967;
            _3841 = _3959;
            _3895 = _3965;
            _3889 = _3963;
            _3909 = _3969;
            _3971 = true;
        }
        else
        {
            bool _3973 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3975 = isnan(_3522);
            bool _3977 = _3973 || _3975;
            bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3981 = _3977 || _3979;
            if (!_3981)
            {
                _3839 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3983 = _3839;
            _3841 = _3983;
            if (!_3981)
            {
                _3875 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3985 = _3875;
            _3877 = _3985;
            if (!_3981)
            {
                _3887 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3987 = _3887;
            _3889 = _3987;
            if (!_3981)
            {
                _3893 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3989 = _3893;
            _3895 = _3989;
            if (!_3981)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3991 = _3899;
            _3901 = _3991;
            if (!_3981)
            {
                _3907 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3993 = _3907;
            bool _3995 = !_3981;
            _3909 = _3993;
            if (!_3995)
            {
                bool _3997 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3999 = isnan(_3522);
                bool _4001 = _3997 || _3999;
                bool _4003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4005 = _4001 || _4003;
                if (!_4005)
                {
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4009 = _3522 + _4007;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4013 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4011;
                    float _4015 = 1.0 / _4013;
                    float _4017 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4019 = _4017 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4037 = _4009 * _4015;
                    float _4039 = precise::clamp(_4037, 0.0, 1.0);
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4045 = fma(_4039, _4019, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4047 = fma(_4039, _4043, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4049 = fma(_4039, _4023, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4051 = fma(_4039, _4027, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4053 = fma(_4039, _4031, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4055 = fma(_4039, _4035, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3877 = _4047;
                    _3901 = _4053;
                    _3841 = _4045;
                    _3895 = _4051;
                    _3889 = _4049;
                    _3909 = _4055;
                    _3971 = true;
                }
                else
                {
                    _3877 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3841 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3895 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3889 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3909 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3971 = false;
    float _4057 = _3877;
    float _4059 = _3901;
    float _4061 = _3841;
    float _4063 = _3895;
    float _4065 = _3889;
    float _4067 = _3909;
    float _4069 = fma(_3098, -0.5, 0.5);
    float _4071 = precise::clamp(_4069, 0.0, 1.0);
    float _4073 = -_4057;
    float _4075 = _4073 + _4059;
    float _4077 = -_4061;
    float _4079 = _4077 + _4063;
    float _4081 = -_4065;
    float _4083 = _4081 + _4067;
    bool _4085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = fma(_4071, _4075, _4057);
    float _4089 = fma(_4071, _4079, _4061);
    float _4091 = fma(_4071, _4083, _4065);
    float _4093 = _4087 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _4095 = fma(_4089, 0.298911988735198974609375, _4093);
    float _4097 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4099 = fma(_4091, 0.114477999508380889892578125, _4095);
    out.m_51.x = _4097;
    float _4101 = -_4099;
    float _4103 = _4089 + _4101;
    float _4105 = -_4099;
    float _4107 = _4087 + _4105;
    float _4109 = -_4099;
    float _4111 = _4091 + _4109;
    float _4113 = fma(_4103, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    float _4115 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    float _4117 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    out.m_92.x = _4113;
    out.m_92.y = _4115;
    out.m_92.z = _4117;
    if (!_4085)
    {
        return out;
    }
    float _4119 = -_3360;
    float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4123 = -_3362;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4127 = -_3364;
    float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4131 = _4121 * _4121;
    float _4133 = fma(_4125, _4125, _4131);
    float _4135 = fma(_4129, _4129, _4133);
    float _4137 = sqrt(_4135);
    float _4139 = rsqrt(_4135);
    float _4141 = -_4137;
    float _4143 = _4141 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4145 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4147 = precise::clamp(_4145, 0.0, 1.0);
    float _4149 = _4125 * _4139;
    float _4151 = _4121 * _4139;
    float _4153 = abs(_4147);
    float _4155 = log2(_4153);
    float _4157 = _4129 * _4139;
    float _4159 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4161 = _3098 * _4151;
    float _4163 = -_4151;
    float _4165 = -_4159;
    float _4167 = fma(_4163, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4165);
    float _4169 = fma(_3094, _4149, _4161);
    float _4171 = -_4157;
    float _4173 = fma(_4171, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4167);
    float _4175 = fma(_3102, _4157, _4169);
    float _4177 = precise::clamp(_4175, 0.0, 1.0);
    float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4181 = _4173 + _4179;
    float _4183 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4187 = precise::clamp(_4185, 0.0, 1.0);
    float _4189 = exp2(_4183);
    float _4191 = _4189 * _4187;
    float _4193 = _4177 * _4191;
    float _4195 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4197 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4199 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4195;
    out.m_90.y = _4197;
    out.m_90.z = _4199;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
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
    bool _3971 = false;
    bool _3152 = false;
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
        float _4256 = as_type<float>(_127);
        out.gl_Position.z = _4256;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4326 = as_type<float>(_165);
        out.gl_Position.z = _4326;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[118].x;
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
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _961 = _953 + _959;
    float _963 = float(_111);
    float _965 = _919 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _969 = _967 != 0;
    float _971 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _973 = int(_971);
    bool _975 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_953);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = float(_957);
    float _989 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _991 = int(_989);
    if (_969)
    {
        float _993 = in.m_60.x;
        _757 = _993;
    }
    float _995 = _757;
    float _997 = -_985;
    float _999 = _997 + 1.0;
    float _1001 = _995;
    if (!_969)
    {
        float _1003 = in.m_60.y;
        _1001 = _1003;
    }
    float _1005 = _1001;
    float _1007 = float(uint(_973));
    float _1009 = 1.0 / _987;
    int _1011 = ~_973;
    int _1013 = _1011 + 1;
    int _1015 = ~_973;
    int _1017 = _1015 + 1;
    bool _1019 = _973 == 0;
    float _1021 = float(_991);
    float _1023 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1025 = int(_1023);
    float _1027 = _1009 * _145;
    float _1029 = 1.0 / _1007;
    float _1031 = 1.0 / _1021;
    float _1033 = float(uint(_1025));
    int _1035 = ~_1025;
    int _1037 = _1035 + 1;
    int _1039 = ~_1025;
    int _1041 = _1039 + 1;
    float _1043 = trunc(_1027);
    int _1045 = int(_1043);
    int _1047 = as_type<int>(_1029) + (-2);
    float _1049 = _1031 * _145;
    float _1051 = 1.0 / _1033;
    float _1053 = float(uint(_1045));
    float _1055 = trunc(_1049);
    int _1057 = int(_1055);
    float _1059 = as_type<float>(_1047) * _1053;
    float _1061 = in.m_60.x;
    float _1063 = in.m_60.y;
    float _1065 = in.m_60.z;
    float _1067 = in.m_60.w;
    float _1069 = trunc(_1059);
    float _1071 = precise::max(_1069, 0.0);
    uint _1074 = uint(_1071);
    int _1076 = as_type<int>(_1051) + (-2);
    float _1078 = float(uint(_1057));
    float _1080 = 1.0 / _963;
    float _1082 = _1059;
    if (_969)
    {
        _1082 = 1.0;
    }
    float _1084 = _1082;
    float _1086 = _1084;
    if (!_969)
    {
        _1086 = 1.2345600128173828125;
    }
    float _1088 = _1086;
    float _1090 = as_type<float>(_1076) * _1078;
    int _1092 = _1013 * int(_1074);
    int _1094 = _1092 + _1045;
    float _1096 = _1005 * _1088;
    float _1098 = trunc(_1090);
    float _1100 = precise::max(_1098, 0.0);
    uint _1102 = uint(_1100);
    float _1104 = float(uint(_1094));
    float _1106 = as_type<float>(_1094);
    if (_969)
    {
        _1106 = 1.0;
    }
    float _1108 = _1106;
    float _1110 = _1108;
    if (!_969)
    {
        _1110 = 7.345489978790283203125;
    }
    float _1112 = _1110;
    float _1114 = as_type<float>(_1047) * _1104;
    int _1116 = ~_1025;
    int _1118 = _1116 + 1;
    float _1120 = trunc(_1114);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = _1112 * _1061;
    int _1128 = _1118 * int(_1102);
    int _1130 = _1128 + _1057;
    float _1132 = floor(_1096);
    float _1134 = float(uint(_1130));
    float _1136 = floor(_1126);
    int _1138 = int(_1074) + int(_1124);
    float _1140 = as_type<float>(_1076) * _1134;
    float _1142 = float(_973);
    int _1144 = _1017 * _1138;
    int _1146 = _1144 + _1045;
    float _1148 = trunc(_1140);
    float _1150 = precise::max(_1148, 0.0);
    uint _1152 = uint(_1150);
    float _1154 = -_1132;
    float _1156 = _1096 + _1154;
    bool _1158 = uint(_1146) >= uint(_973);
    float _1160 = float(_1045);
    bool _1162 = !_1158;
    int _1164 = _1162 ? 0 : (-1);
    float _1166 = -_1136;
    float _1168 = _1126 + _1166;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1172 = _1170 != 0;
    int _1174 = ~_1138;
    int _1176 = _1174 + _1164;
    int _1178 = _1176 + 1;
    float _1180 = _1168 * _1142;
    bool _1182 = _1160 >= _1142;
    bool _1184 = isnan(_1160);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan(_1142);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = _1080 * _145;
    bool _1196 = !_1172;
    int _1198 = _1196 ? 0 : 1;
    float _1200 = float(_1025);
    float _1202 = trunc(_1180);
    int _1204 = int(_1202);
    float _1206 = float(_1057);
    int _1208 = abs(_1198);
    float _1210 = _1142 * _1194;
    bool _1212 = _1206 >= _1200;
    bool _1214 = isnan(_1206);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1200);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _1200 * _1194;
    float _1226 = _1156 * _1200;
    float _1228 = trunc(_1192);
    int _1230 = int(_1228);
    int _1232 = int(_1102) + int(_1152);
    int _1234 = _973 * _1178;
    int _1236 = _1234 + _1045;
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1240 = _1238 != 0;
    int _1242 = _1037 * _1232;
    int _1244 = _1242 + _1057;
    float _1246 = trunc(_1226);
    int _1248 = int(_1246);
    bool _1250 = !_1019;
    int _1252 = _1250 ? _1236 : (-1);
    int _1254 = _1204 * _1208;
    int _1256 = _1254 + _1045;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1264 = _1262 != 0;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1268 = _1266 != 0;
    bool _1270 = uint(_1244) >= uint(_1025);
    bool _1272 = !_1240;
    int _1274 = _1272 ? 0 : 1;
    float _1276 = trunc(_1222);
    int _1278 = int(_1276);
    int _1280 = ~_1230;
    int _1282 = _1280 + 1;
    int _1284 = _1282 + 1;
    int _1286 = abs(_1274);
    bool _1288 = !_1270;
    int _1290 = _1288 ? 0 : (-1);
    int _1292 = _1252 * _1284;
    bool _1294 = !_1264;
    int _1296 = _1294 ? 0 : 1;
    float _1298 = trunc(_1210);
    int _1300 = int(_1298);
    int _1302 = _973 + (-1);
    int _1304 = _1248 * _1286;
    int _1306 = _1304 + _1057;
    int _1308 = ~_1232;
    int _1310 = _1308 + _1290;
    int _1312 = _1310 + 1;
    int _1314 = abs(_1296);
    int _1316 = _1230 * _1302;
    int _1318 = _1316 + _1292;
    bool _1320 = !_1260;
    int _1322 = _1320 ? 0 : 1;
    int _1324 = _1025 * _1312;
    int _1326 = _1324 + _1057;
    bool _1328 = !_1268;
    int _1330 = _1328 ? 0 : 1;
    int _1332 = _1318 * _1314;
    int _1334 = abs(_1322);
    float _1336 = trunc(_1224);
    int _1338 = int(_1336);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1342 = _1340 != 0;
    bool _1344 = _1025 == 0;
    int _1346 = _1300 * _1334;
    int _1348 = _1346 + _1332;
    int _1350 = abs(_1330);
    bool _1352 = !_1342;
    int _1354 = _1352 ? 0 : 1;
    int _1356 = ~_1278;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    bool _1362 = !_1344;
    int _1364 = _1362 ? _1326 : (-1);
    int _1366 = abs(_1354);
    int _1368 = _1364 * _1360;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1372 = _1370 != 0;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1384 = _1382 != 0;
    int _1386 = _1256 * _1350;
    int _1388 = _1386 + _1348;
    int _1390 = _1025 + (-1);
    bool _1392 = !_1376;
    int _1394 = _1392 ? 0 : 1;
    int _1396 = _1278 * _1390;
    int _1398 = _1396 + _1368;
    bool _1400 = !_1372;
    int _1402 = _1400 ? 0 : 1;
    int _1404 = _1204 * _1366;
    int _1406 = _1404 + _1388;
    int _1408 = abs(_1394);
    float _1410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1412 = log2(_1410);
    bool _1414 = !_1380;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = abs(_1402);
    bool _1420 = !_1384;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = float(uint(_1406));
    int _1426 = abs(_1416);
    int _1428 = _1398 * _1408;
    int _1430 = abs(_1422);
    float _1432 = as_type<float>(_1047) * _1424;
    int _1434 = _1338 * _1418;
    int _1436 = _1434 + _1428;
    float _1438 = _1412 * _145;
    int _1440 = ~_973;
    int _1442 = _1440 + 1;
    int _1444 = _1306 * _1426;
    int _1446 = _1444 + _1436;
    float _1448 = trunc(_1432);
    float _1450 = precise::max(_1448, 0.0);
    uint _1452 = uint(_1450);
    int _1454 = ~_973;
    int _1456 = _1454 + 1;
    int _1458 = _1248 * _1430;
    int _1460 = _1458 + _1446;
    int _1462 = ~_1025;
    int _1464 = _1462 + 1;
    bool _1466 = _973 == 0;
    float _1468 = float(uint(_1460));
    float _1470 = exp2(_1438);
    float _1472 = float(uint(_1256));
    int _1474 = ~_973;
    int _1476 = _1474 + 1;
    float _1478 = as_type<float>(_1076) * _1468;
    int _1480 = _1456 * int(_1452);
    int _1482 = _1480 + _1406;
    float _1484 = trunc(_1478);
    float _1486 = precise::max(_1484, 0.0);
    uint _1488 = uint(_1486);
    float _1490 = float(uint(_1482));
    float _1492 = as_type<float>(_1047) * _1490;
    float _1494 = trunc(_1492);
    float _1496 = precise::max(_1494, 0.0);
    uint _1498 = uint(_1496);
    int _1500 = _1464 * int(_1488);
    int _1502 = _1500 + _1460;
    float _1504 = float(uint(_1502));
    float _1506 = as_type<float>(_1076) * _1504;
    int _1508 = int(_1452) + int(_1498);
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1512 = trunc(_1506);
    float _1514 = precise::max(_1512, 0.0);
    uint _1516 = uint(_1514);
    int _1518 = _1442 * _1508;
    int _1520 = _1518 + _1406;
    int _1522 = ~_1025;
    int _1524 = _1522 + 1;
    bool _1526 = uint(_1520) >= uint(_973);
    bool _1528 = !_1526;
    int _1530 = _1528 ? 0 : (-1);
    int _1532 = ~_1508;
    int _1534 = _1532 + _1530;
    int _1536 = _1534 + 1;
    float _1538 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1540 = int(_1488) + int(_1516);
    int _1542 = _973 * _1536;
    int _1544 = _1542 + _1406;
    float _1546 = _1061 * 2.0;
    int _1548 = _1524 * _1540;
    int _1550 = _1548 + _1460;
    bool _1552 = !_1466;
    int _1554 = _1552 ? _1544 : (-1);
    bool _1556 = uint(_1550) >= uint(_1025);
    float _1558 = floor(_1546);
    int _1560 = _1554 & 3;
    bool _1562 = _1560 != 0;
    bool _1564 = !_1556;
    int _1566 = _1564 ? 0 : (-1);
    bool _1568 = uint(_1560) > 1u;
    int _1570 = _1554 & 3;
    bool _1572 = _1570 != 0;
    int _1574 = ~_1540;
    int _1576 = _1574 + _1566;
    int _1578 = _1576 + 1;
    int _1580 = _1572 ? 0 : 1;
    bool _1582 = _1560 != 3;
    int _1584 = _1025 * _1578;
    int _1586 = _1584 + _1460;
    bool _1588 = uint(_1560) >= 2u;
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1592 = _1590 != 0;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1596 = ~_1580;
    int _1598 = _1596 + 1;
    int _1600 = _1598 + 1;
    int _1602 = _1588 ? 0 : 1;
    int _1604 = _1600;
    int _1606 = as_type<int>(_1067);
    float _1608 = as_type<float>(_1408);
    if (!_1568)
    {
        int _1610 = ~_1580;
        int _1612 = _1610 + 1;
        _1604 = _1612;
    }
    int _1614 = _1604;
    bool _1616 = _1067 > 0.5;
    bool _1618 = !_1344;
    int _1620 = _1618 ? _1586 : (-1);
    float _1622 = -_203;
    int _1624 = _1616 ? as_type<int>(_1622) : as_type<int>(_203);
    int _1626 = _1620 & 3;
    bool _1628 = _1626 != 0;
    int _1630 = _1620 & 3;
    bool _1632 = _1630 != 0;
    int _1634 = ~_1602;
    int _1636 = _1634 + 1;
    int _1638 = _1636 + 1;
    int _1640 = _1638;
    if (_1582)
    {
        int _1642 = ~_1602;
        int _1644 = _1642 + 1;
        _1640 = _1644;
    }
    int _1646 = _1640;
    bool _1648 = uint(_1626) > 1u;
    float _1650 = _1632 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1652 = _1650;
    if (_1592)
    {
        _1606 = 0;
    }
    int _1654 = _1606;
    bool _1656 = uint(_1626) >= 2u;
    int _1658 = _1654;
    if (!_1592)
    {
        _1658 = 1;
    }
    int _1660 = _1658;
    bool _1662 = _1626 != 3;
    int _1664 = _1656 ? 0 : 1;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1668 = _1660 != 1;
    int _1670 = ~as_type<int>(_1650);
    int _1672 = _1670 + 1;
    int _1674 = _1672 + 1;
    float _1676 = -_1666;
    float _1678 = fma(_1538, 2.0, _1676);
    int _1680 = _1674;
    float _1682 = as_type<float>(_1660);
    if (!_1648)
    {
        int _1684 = ~as_type<int>(_1650);
        int _1686 = _1684 + 1;
        _1680 = _1686;
    }
    int _1688 = _1680;
    float _1690 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1694 = _1692 != 0;
    float _1696 = -_145;
    float _1698 = fma(_1696, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1678);
    int _1700 = ~_1664;
    int _1702 = _1700 + 1;
    int _1704 = _1702 + 1;
    float _1706 = fma(_1690, -2.0, _1594);
    int _1708 = _1704;
    if (_1662)
    {
        int _1710 = ~_1664;
        int _1712 = _1710 + 1;
        _1708 = _1712;
    }
    int _1714 = _1708;
    bool _1716 = !_1694;
    int _1718 = _1716 ? 0 : 1;
    float _1720 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1706);
    bool _1722 = _1558 > 0.0;
    bool _1724 = _1558 >= 0.0;
    bool _1726 = isnan(_1558);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    float _1734 = _1558;
    if (!_1668)
    {
        _1734 = _1063;
    }
    float _1736 = _1734;
    float _1738 = _1736;
    if (!_1668)
    {
        _1652 = _1063;
    }
    float _1740 = _1652;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1744 = _1740;
    if (_1668)
    {
        _1738 = _1061;
    }
    float _1746 = _1738;
    if (_1668)
    {
        _1744 = _1061;
    }
    float _1748 = _1744;
    if (!_1668)
    {
        _1682 = _1065;
    }
    float _1750 = _1682;
    float _1752 = _1746 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1754 = _1750;
    if (_1668)
    {
        _1754 = _1063;
    }
    float _1756 = _1754;
    float _1758 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1510);
    float _1760 = as_type<float>(_1047) * _1472;
    float _1762 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1742);
    float _1764 = float(uint(_1306));
    float _1766 = -_1470;
    float _1768 = _1766 + 1.0;
    float _1770 = trunc(_1760);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_1668)
    {
        _1608 = _1065;
    }
    float _1778 = _1608;
    float _1780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1782 = 1.0 + _1780;
    float _1784 = -_1776;
    float _1786 = fma(_1752, 2.0, _1784);
    float _1788 = _1778;
    if (_1668)
    {
        _1788 = _1063;
    }
    float _1790 = _1788;
    float _1792 = as_type<float>(_1076) * _1764;
    bool _1794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1796 = isnan(0.0);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1802 = _1798 || _1800;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1806 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1808 = _1802 ? _1768 : 0.0;
    float _1810 = trunc(_1792);
    float _1812 = precise::max(_1810, 0.0);
    uint _1814 = uint(_1812);
    bool _1816 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1818 = isnan(1.0);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1824 = _1820 || _1822;
    float _1826 = fma(_1806, -2.0, _1804);
    int _1828 = _1476 * int(_1774);
    int _1830 = _1828 + _1256;
    float _1832 = _1063 * 2.0;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1838 = 1.0 / _1782;
    float _1840 = float(uint(_1830));
    float _1842 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1834);
    float _1844 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1836);
    float _1846 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1762);
    float _1848 = -_145;
    float _1850 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1786);
    float _1852 = as_type<float>(_1047) * _1840;
    float _1854 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1842);
    float _1856 = floor(_1832);
    int _1858 = _1041 * int(_1814);
    int _1860 = _1858 + _1306;
    float _1862 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1844);
    float _1864 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1758);
    float _1866 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1826);
    float _1868 = _1065 * 2.0;
    float _1870 = float(uint(_1860));
    float _1872 = trunc(_1852);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    if (_1824)
    {
        float _1878 = _1808 * _1838;
        _147 = _1878;
    }
    float _1880 = _147;
    float _1882 = as_type<float>(_1076) * _1870;
    int _1884 = _1732 ? 0 : 1;
    float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1888 = _1886 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1890 = _1856 > 0.0;
    float _1892 = floor(_1868);
    bool _1894 = _1856 >= 0.0;
    bool _1896 = isnan(_1856);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan(0.0);
    bool _1902 = _1898 || _1900;
    int _1904 = ~_1884;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    int _1910 = _1902 ? 0 : 1;
    int _1912 = _1908;
    if (!_1722)
    {
        int _1914 = ~_1884;
        int _1916 = _1914 + 1;
        _1912 = _1916;
    }
    int _1918 = _1912;
    float _1920 = trunc(_1882);
    float _1922 = precise::max(_1920, 0.0);
    uint _1924 = uint(_1922);
    int _1926 = ~_1910;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    int _1932 = int(_1774) + int(_1876);
    int _1934 = _1930;
    if (!_1890)
    {
        int _1936 = ~_1910;
        int _1938 = _1936 + 1;
        _1934 = _1938;
    }
    int _1940 = _1934;
    bool _1942 = _1063 > 0.5;
    float _1944 = in.m_48.x;
    float _1946 = in.m_48.y;
    float _1948 = in.m_48.z;
    bool _1950 = _1061 > 0.5;
    float _1952 = 1.0 / _1888;
    float _1954 = -_203;
    int _1956 = _1942 ? as_type<int>(_1954) : as_type<int>(_203);
    bool _1958 = _1065 > 0.5;
    int _1960 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1962 = _1960 != 0;
    int _1964 = int(_1814) + int(_1924);
    float _1966 = -_193;
    int _1968 = _1958 ? as_type<int>(_1966) : as_type<int>(_193);
    float _1970 = -_193;
    int _1972 = _1950 ? as_type<int>(_1970) : as_type<int>(_193);
    int _1974 = ~_973;
    int _1976 = _1974 + 1;
    int _1978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1980 = _1978 != 0;
    int _1982 = ~_1025;
    int _1984 = _1982 + 1;
    bool _1986 = !_1980;
    float _1988 = _1986 ? _203 : as_type<float>(_1624);
    int _1990 = _1976 * _1932;
    int _1992 = _1990 + _1256;
    bool _1994 = !_1962;
    float _1996 = _1994 ? _193 : as_type<float>(_1972);
    int _1998 = _1984 * _1964;
    int _2000 = _1998 + _1306;
    int _2002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2004 = _2002 != 0;
    float _2006 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2010 = _2008 != 0;
    float _2012 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2014 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2006);
    bool _2016 = !_2004;
    float _2018 = _2016 ? _203 : as_type<float>(_1956);
    float _2020 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2012);
    bool _2022 = !_2010;
    float _2024 = _2022 ? _193 : as_type<float>(_1968);
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2028 = _2026 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2030 = uint(_1992) >= uint(_973);
    bool _2032 = uint(_2000) >= uint(_1025);
    float _2034 = 1.0 / _2028;
    bool _2036 = !_2030;
    int _2038 = _2036 ? 0 : (-1);
    int _2040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2042 = _2040 != 0;
    int _2044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2046 = _2044 != 0;
    int _2048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2050 = _2048 != 0;
    float _2052 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2056 = _2054 != 0;
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2060 = _2058 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2062 = fma(_1944, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2052);
    float _2064 = 1.0 / _2060;
    bool _2066 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2068 = isnan(_953);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2080 = _2078 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2084 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2082;
    float _2086 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2088 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2086;
    bool _2090 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2092 = isnan(_953);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2080 * _1952;
    float _2104 = _1061 + _1063;
    float _2106 = _2084 * _2034;
    float _2108 = _1065 + _1063;
    float _2110 = _2076 * _999;
    float _2112 = _2104 + (-1.0);
    float _2114 = -_2076;
    float _2116 = _2114 + 1.0;
    bool _2118 = !_2032;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2062);
    float _2124 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2126 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2128 = _953 + _2126;
    float _2130 = _2088 * _2064;
    float _2132 = _2108 + (-1.0);
    bool _2134 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2136 = isnan(_953);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2142 = _2138 || _2140;
    float _2144 = float(_2142);
    float _2146 = fma(_2106, _2128, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2148 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2014);
    float _2150 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2152 = _953 + _2150;
    float _2154 = _1996 + 0.5;
    float _2156 = -_2100;
    float _2158 = _2156 + 1.0;
    float _2160 = _2146 * _2110;
    float _2162 = fma(_2130, _2152, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2164 = fma(_2154, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1698);
    int _2166 = _1554 >> 31;
    float _2168 = _2144 * _2158;
    float _2170 = -_2144;
    float _2172 = _2170 + 1.0;
    bool _2174 = _1892 >= 0.0;
    bool _2176 = isnan(_1892);
    bool _2178 = _2174 || _2176;
    bool _2180 = isnan(0.0);
    bool _2182 = _2178 || _2180;
    float _2184 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2160);
    int _2186 = _2166 & 3;
    float _2188 = _985 * _2172;
    int _2190 = _1620 >> 31;
    float _2192 = _2122 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2194 = _2182 ? 0 : 1;
    float _2196 = _2148 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2198 = _1554 + _2186;
    bool _2200 = _1892 > 0.0;
    float _2202 = fma(_1948, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2020);
    int _2204 = _2190 & 3;
    float _2206 = fma(_2102, _961, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2208 = !_2046;
    int _2210 = _2208 ? 0 : 1;
    float _2212 = _2018 + (-0.5);
    float _2214 = fma(_2206, _2188, _2184);
    int _2216 = _2198 >> 2;
    float _2218 = -_2212;
    float _2220 = -_1720;
    float _2222 = fma(_2218, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2220);
    int _2224 = _1620 + _2204;
    float _2226 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2228 = abs(_2210);
    float _2230 = fma(_2162, _2168, _2214);
    int _2232 = _2216 << 4;
    int _2234 = _2232 + 368;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2238 = _2192 + _2236;
    int _2240 = _2224 >> 2;
    float _2242 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2230);
    bool _2244 = !_2042;
    int _2246 = _2244 ? 0 : 1;
    float _2248 = _2202 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2250 = float(_1918);
    float _2252 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2254 = _2196 + _2252;
    float _2256 = float(_2228);
    float _2258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2260 = _2248 + _2258;
    uint _2262 = uint(int(uint(_2234) >> uint(2)));
    uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
    int _2266 = int(_2262) & 3;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[int(_2264)][_2266];
    int _2270 = int(_2262) + 1;
    uint _2272 = uint(int(uint(_2270) >> uint(2)));
    int _2274 = _2270 & 3;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[int(_2272)][_2274];
    int _2278 = ~_2194;
    int _2280 = _2278 + 1;
    int _2282 = _2280 + 1;
    float _2284 = _2242 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2286 = _2240 << 4;
    int _2288 = _2286 + 512;
    float _2290 = in.m_66.x;
    float _2292 = in.m_66.y;
    float _2294 = in.m_66.z;
    int _2296 = _2282;
    if (!_2200)
    {
        int _2298 = ~_2194;
        int _2300 = _2298 + 1;
        _2296 = _2300;
    }
    int _2302 = _2296;
    float _2304 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2306 = abs(_2246);
    uint _2308 = uint(int(uint(_2288) >> uint(2)));
    uint _2310 = uint(int(uint(int(_2308)) >> uint(2)));
    int _2312 = int(_2308) & 3;
    float _2314 = (*spvDescriptorSet0.vp_c9)._m0[int(_2310)][_2312];
    int _2316 = int(_2308) + 1;
    uint _2318 = uint(int(uint(_2316) >> uint(2)));
    int _2320 = _2316 & 3;
    float _2322 = (*spvDescriptorSet0.vp_c9)._m0[int(_2318)][_2320];
    float _2324 = float(_2302);
    float _2326 = _2256 * _2250;
    float _2328 = float(_2306);
    float _2330 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2304);
    int _2332 = ~_1932;
    int _2334 = _2332 + _2038;
    int _2336 = _2334 + 1;
    int _2338 = ~_1964;
    int _2340 = _2338 + _2120;
    int _2342 = _2340 + 1;
    float _2344 = _2328 * _2324;
    int _2346 = _2234 + 8;
    uint _2348 = uint(int(uint(_2346) >> uint(2)));
    uint _2350 = uint(int(uint(int(_2348)) >> uint(2)));
    int _2352 = int(_2348) & 3;
    float _2354 = (*spvDescriptorSet0.vp_c9)._m0[int(_2350)][_2352];
    int _2356 = int(_2348) + 1;
    uint _2358 = uint(int(uint(_2356) >> uint(2)));
    int _2360 = _2356 & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    float _2364 = _1988 + (-0.5);
    float _2366 = _2024 + 0.5;
    int _2368 = _973 * _2336;
    int _2370 = _2368 + _1256;
    float _2372 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2330);
    float _2374 = -_2364;
    float _2376 = -_1866;
    float _2378 = fma(_2374, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2376);
    float _2380 = _2344 * (-2.0);
    float _2382 = _921 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2384 = fma(_2366, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1850);
    float _2386 = _923 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2388 = !_1628;
    int _2390 = _2388 ? 0 : 1;
    float _2392 = _2382 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2394 = _2326 * (-2.0);
    bool _2396 = !_1562;
    int _2398 = _2396 ? 0 : 1;
    int _2400 = _2288 + 8;
    uint _2402 = uint(int(uint(_2400) >> uint(2)));
    uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
    int _2406 = int(_2402) & 3;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[int(_2404)][_2406];
    int _2410 = int(_2402) + 1;
    uint _2412 = uint(int(uint(_2410) >> uint(2)));
    int _2414 = _2410 & 3;
    float _2416 = (*spvDescriptorSet0.vp_c9)._m0[int(_2412)][_2414];
    int _2418 = abs(_1614);
    float _2420 = _965 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2422 = _1025 * _2342;
    int _2424 = _2422 + _1306;
    float _2426 = _2386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2428 = abs(_1688);
    float _2430 = fma(_2380, _2290, _2290);
    int _2432 = abs(_2390);
    float _2434 = fma(_2124, _2380, _2124);
    int _2436 = abs(_2398);
    out.m_68.x = _2420;
    out.m_68.y = _2392;
    out.m_68.z = _2426;
    out.m_68.w = _2284;
    float _2438 = fma(_2226, _2394, _2226);
    float _2440 = fma(_2394, _2292, _2292);
    bool _2442 = _1560 != 3;
    int _2444 = abs(_1714);
    bool _2446 = _973 == 0;
    bool _2448 = _2372 >= 0.0;
    bool _2450 = !_2446;
    int _2452 = _2450 ? _2370 : (-1);
    int _2454 = ~_2418;
    int _2456 = _2454 + 1;
    int _2458 = _2456 + 1;
    int _2460 = ~_2436;
    int _2462 = _2460 + 1;
    int _2464 = _2462 + 1;
    int _2466 = ~_2428;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    int _2472 = _2458 * as_type<int>(_2276);
    if (_2448)
    {
        out.m_51.x = 0.0;
    }
    int _2474 = abs(_1646);
    int _2476 = _2464 * as_type<int>(_2268);
    int _2478 = _2476 + _2472;
    int _2480 = ~_2432;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    int _2486 = _2470 * as_type<int>(_2322);
    bool _2488 = !_2056;
    int _2490 = _2488 ? 0 : 1;
    bool _2492 = _1626 != 3;
    int _2494 = _2484 * as_type<int>(_2314);
    int _2496 = _2494 + _2486;
    int _2498 = ~_2474;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    bool _2504 = !_2492;
    int _2506 = _2504 ? 0 : (-1);
    int _2508 = abs(_2490);
    int _2510 = _2502 * as_type<int>(_2354);
    int _2512 = _2510 + _2478;
    bool _2514 = !_2442;
    int _2516 = _2514 ? 0 : (-1);
    int _2518 = abs(_2506);
    int _2520 = abs(_2516);
    int _2522 = ~_2444;
    int _2524 = _2522 + 1;
    int _2526 = _2524 + 1;
    int _2528 = ~_2520;
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    int _2534 = abs(_1718);
    int _2536 = _2526 * as_type<int>(_2408);
    int _2538 = _2536 + _2496;
    int _2540 = ~_2518;
    int _2542 = _2540 + 1;
    int _2544 = _2542 + 1;
    int _2546 = _2532 * as_type<int>(_2362);
    int _2548 = _2546 + _2512;
    int _2550 = ~_2534;
    int _2552 = _2550 + 1;
    int _2554 = _2552 + 1;
    int _2556 = ~_2508;
    int _2558 = _2556 + 1;
    int _2560 = _2558 + 1;
    int _2562 = _2544 * as_type<int>(_2416);
    int _2564 = _2562 + _2538;
    bool _2566 = _1025 == 0;
    int _2568 = _2548 * _2554;
    float _2570 = as_type<float>(_2518);
    float _2572 = _2416;
    if (_2448)
    {
        _2570 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2574 = _2570;
    int _2576 = _2564 * _2560;
    float _2578 = _2238 * _2238;
    int _2580 = _2452 * _2534;
    int _2582 = _2580 + _2568;
    bool _2584 = !_2566;
    int _2586 = _2584 ? _2424 : (-1);
    float _2588 = -_1854;
    float _2590 = _2588 + 1.0;
    float _2592 = fma(_2254, _2254, _2578);
    float _2594 = -_1864;
    float _2596 = _2594 + 1.0;
    float _2598 = -_1862;
    float _2600 = _2598 + 1.0;
    int _2602 = _2586 * _2508;
    int _2604 = _2602 + _2576;
    float _2606 = fma(_2260, _2260, _2592);
    float _2608 = -_2596;
    float _2610 = fma(_2024, _2608, _2384);
    float _2612 = -_1846;
    float _2614 = _2612 + 1.0;
    float _2616 = _1061 + (-0.5);
    float _2618 = rsqrt(_2606);
    float _2620 = -_2590;
    float _2622 = fma(_1996, _2620, _2164);
    float _2624 = fma(_2018, _2600, _2222);
    float _2626 = fma(_1988, _2614, _2378);
    int _2628 = as_type<int>(_2574);
    if (_2448)
    {
        float _2630 = _2574 * 5.0;
        _2628 = as_type<int>(_2630);
    }
    int _2632 = _2628;
    float _2634 = float(_2582);
    float _2636 = fma(_2616, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2430);
    float _2638 = float(_2604);
    out.m_70.x = _2622;
    out.m_70.y = _2624;
    out.m_70.z = _2610;
    out.m_70.w = _2626;
    bool _2640 = !_2050;
    int _2642 = _2640 ? 0 : 1;
    float _2644 = fma(_2434, _1880, _2636);
    float _2646 = _1063 + (-0.5);
    if (_2448)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8023 = as_type<float>(_2632);
        out.gl_Position.z = _8023;
    }
    int _2648 = abs(_2642);
    float _2650 = _2238 * _2618;
    out.m_72.x = _2634;
    out.m_72.y = _2638;
    float _2652 = _2254 * _2618;
    if (_2448)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2654 = -_2650;
    float _2656 = fma(_2654, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2192);
    float _2658 = _2260 * _2618;
    float _2660 = -_2652;
    float _2662 = fma(_2660, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2196);
    float _2664 = float(_1940);
    float _2666 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2668 = _2656 + _2666;
    float _2670 = -_2658;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2248);
    float _2674 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2676 = _2662 + _2674;
    float _2678 = -_2650;
    float _2680 = fma(_2678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2238);
    float _2682 = _2668 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2686 = _2672 + _2684;
    float _2688 = float(_2648);
    float _2690 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2440);
    float _2692 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2682);
    float _2694 = -_2652;
    float _2696 = fma(_2694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2254);
    float _2698 = _2680 * _2680;
    float _2700 = _2688 * _2664;
    float _2702 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2692);
    float _2704 = _1065 + _1061;
    float _2706 = fma(_2438, _1880, _2690);
    float _2708 = fma(_2696, _2696, _2698);
    float _2710 = -_2658;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2260);
    bool _2714 = _2702 >= 0.0;
    float _2716 = _2704 + (-1.0);
    float _2718 = _2700 * (-2.0);
    float _2720 = _2706 * 0.15915493667125701904296875;
    float _2722 = fma(_2712, _2712, _2708);
    float _2724 = _1065 + (-0.5);
    float _2726 = fma(_2716, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2728 = fma(_2718, _2294, _2294);
    float _2730 = _2720 * 6.283185482025146484375;
    float _2732 = sin(_2730);
    float _2734 = _2644 * 0.15915493667125701904296875;
    float _2736 = fma(_2726, _2718, _2726);
    float _2738 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2728);
    int _2740 = as_type<int>(_2724);
    float _2742 = _2668;
    float _2744 = _2686;
    if (_2714)
    {
        _2572 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2746 = _2572;
    if (_2714)
    {
        out.m_51.x = 0.0;
    }
    float _2748 = fma(_2736, _1880, _2738);
    float _2750 = sqrt(_2722);
    if (_2714)
    {
        float _2752 = _2746 * 5.0;
        _2740 = as_type<int>(_2752);
    }
    int _2754 = _2740;
    if (_2714)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8219 = as_type<float>(_2754);
        out.gl_Position.z = _8219;
    }
    float _2756 = _2720 * 6.283185482025146484375;
    float _2758 = cos(_2756);
    float _2760 = _2734 * 6.283185482025146484375;
    float _2762 = sin(_2760);
    float _2764 = _2734 * 6.283185482025146484375;
    float _2766 = cos(_2764);
    float _2768 = _2748 * 0.15915493667125701904296875;
    if (_2714)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2770 = _2768 * 6.283185482025146484375;
    float _2772 = cos(_2770);
    float _2774 = _2618 * _2750;
    float _2776 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2778 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _2780 = _2762 * _2732;
    float _2782 = _2766 * _2758;
    float _2784 = _2774 * _2776;
    float _2786 = _2762 * _2758;
    float _2788 = _2768 * 6.283185482025146484375;
    float _2790 = sin(_2788);
    float _2792 = _2766 * _2732;
    float _2794 = _2778 * _2784;
    float _2796 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2798 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _2800 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2802 = _2774 * _2796;
    float _2804 = _2766 * _2772;
    float _2806 = _2758 * _2772;
    float _2808 = _2762 * _2772;
    float _2810 = _2732 * _2772;
    float _2812 = _2798 * _2802;
    float _2814 = _2804 * _2794;
    float _2816 = _2774 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2818 = _2816 * 0.5;
    float _2820 = fma(_2790, _2782, _2780);
    float _2822 = -_2794;
    float _2824 = _2790 * _2822;
    float _2826 = -_2786;
    float _2828 = fma(_2790, _2792, _2826);
    float _2830 = -_2792;
    float _2832 = fma(_2790, _2786, _2830);
    float _2834 = fma(_2820, _2812, _2814);
    float _2836 = _2808 * _2794;
    float _2838 = fma(_2806, _2812, _2824);
    float _2840 = fma(_2790, _2780, _2782);
    float _2842 = fma(_2828, _2818, _2834);
    float _2844 = fma(_2832, _2812, _2836);
    float _2846 = fma(_2810, _2818, _2838);
    float _2848 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2850 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2852 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2854 = fma(_2840, _2818, _2844);
    float _2856 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2858 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2850);
    float _2860 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2852);
    float _2862 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2864 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2858);
    float _2866 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2860);
    float _2868 = -_2790;
    float _2870 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2862);
    float _2872 = _2864 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2874 = _2866 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2876 = _2820 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2878 = _2842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2880 = _2196 + _2872;
    float _2882 = _2248 + _2874;
    float _2884 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2856);
    float _2886 = fma(_2800, _2800, 1.0);
    float _2888 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2890 = _2880 + _2888;
    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2894 = _2882 + _2892;
    float _2896 = fma(_2846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2878);
    float _2898 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2900 = _2890 * _2890;
    float _2902 = _2894 * _2894;
    float _2904 = fma(_2854, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2896);
    float _2906 = rsqrt(_2886);
    float _2908 = _2804 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2910 = _2900 + _2902;
    float _2912 = _2904 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2914 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2876);
    float _2916 = fma(_2806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2848);
    float _2918 = -_2790;
    float _2920 = fma(_2918, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2898);
    float _2922 = -_2790;
    float _2924 = fma(_2922, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2908);
    float _2926 = sqrt(_2910);
    float _2928 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2930 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2932 = _2828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2934 = _2192 + _2912;
    float _2936 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2928);
    float _2938 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2930);
    float _2940 = fma(_2810, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2932);
    bool _2942 = _2926 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2944 = _2928;
    float _2946 = _2810;
    float _2948 = _2804;
    float _2950 = _2930;
    float _2952 = _2932;
    float _2954 = _2914;
    if (!_2942)
    {
        _2944 = _2902;
    }
    float _2956 = _2944;
    float _2958 = _2956;
    if (!_2942)
    {
        _2946 = _2900;
    }
    float _2960 = _2946;
    float _2962 = _2960;
    if (!_2942)
    {
        _2948 = _2880;
    }
    float _2964 = _2948;
    float _2966 = _2964;
    if (!_2942)
    {
        _2950 = _2882;
    }
    float _2968 = _2950;
    float _2970 = _2968;
    if (!_2942)
    {
        _2952 = _2934;
    }
    float _2972 = _2952;
    bool _2974 = !_2942;
    float _2976 = _2972;
    if (!_2974)
    {
        float _2978 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2982 = _2926 + _2980;
        float _2984 = _2934 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2986 = rsqrt(_2910);
        float _2988 = _2982 * _2978;
        float _2990 = _2988 * 0.15915493667125701904296875;
        float _2992 = _2990 * 6.283185482025146484375;
        float _2994 = sin(_2992);
        float _2996 = _2990 * 6.283185482025146484375;
        float _2998 = cos(_2996);
        float _3000 = fma(_2994, _2984, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3002 = _2986 * _3000;
        float _3004 = _2998 + (-1.0);
        float _3006 = fma(_2890, _3002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3008 = fma(_2894, _3002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3010 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3012 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3014 = _3006 + _3012;
        float _3016 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3018 = _3008 + _3016;
        float _3020 = fma(_2934, _2998, _3010);
        float _3022 = _3014 * _3014;
        float _3024 = _3018 * _3018;
        _2976 = _3020;
        _2962 = _3022;
        _2958 = _3024;
        _2966 = _3006;
        _2970 = _3008;
    }
    float _3026 = _2976;
    float _3028 = _2962;
    float _3030 = _2958;
    float _3032 = _2966;
    float _3034 = _2970;
    float _3036 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3038 = _3026 + _3036;
    float _3040 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2920);
    float _3042 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2924);
    float _3044 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2870);
    float _3046 = fma(_3038, _3038, _3028);
    float _3048 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2936);
    float _3050 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2938);
    float _3052 = fma(_2840, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2940);
    float _3054 = _3046 + _3030;
    float _3056 = _2800 * _2906;
    float _3058 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2884);
    float _3060 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3062 = _2800 * _3040;
    float _3064 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2914);
    float _3066 = _2800 * _3042;
    float _3068 = fma(_2832, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2916);
    float _3070 = _2800 * _3044;
    float _3072 = -_3048;
    float _3074 = _3056 * _3072;
    float _3076 = -_3050;
    float _3078 = _3056 * _3076;
    float _3080 = -_3052;
    float _3082 = _3056 * _3080;
    float _3084 = fma(_3060, _3058, _3062);
    float _3086 = sqrt(_3054);
    float _3088 = fma(_3060, _3064, _3066);
    float _3090 = fma(_3060, _3068, _3070);
    float _3092 = fma(_2906, _3040, _3074);
    float _3094 = _3048 + _3084;
    float _3096 = fma(_2906, _3042, _3078);
    float _3098 = _3050 + _3088;
    float _3100 = fma(_2906, _3044, _3082);
    float _3102 = _3052 + _3090;
    out.m_74.x = _3058;
    out.m_74.y = _3064;
    out.m_74.z = _3068;
    out.m_76.x = _3092;
    out.m_76.y = _3096;
    out.m_76.z = _3100;
    bool _3104 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3106 = isnan(_3086);
    bool _3108 = _3104 || _3106;
    bool _3110 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3112 = _3108 || _3110;
    out.m_78.x = _3094;
    out.m_78.y = _3098;
    out.m_78.z = _3102;
    float _3114 = _3092;
    float _3116 = _3032;
    if (!_3112)
    {
        _2954 = 1.0;
    }
    float _3118 = _2954;
    bool _3120 = !_3112;
    float _3122 = _3118;
    if (!_3120)
    {
        bool _3124 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3126 = isnan(_3086);
        bool _3128 = _3124 || _3126;
        bool _3130 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3132 = _3128 || _3130;
        if (!_3132)
        {
            float _3134 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3136 = _3086 + _3134;
            float _3138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3140 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3138;
            float _3142 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3144 = _3142 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3146 = 1.0 / _3140;
            float _3148 = _3136 * _3146;
            float _3150 = fma(_3148, _3144, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3122 = _3150;
            _3152 = true;
        }
        else
        {
            bool _3154 = _3086 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3156 = isnan(_3086);
            bool _3158 = _3154 || _3156;
            bool _3160 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3162 = _3158 || _3160;
            if (!_3162)
            {
                float _3164 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3166 = _3086 + _3164;
                float _3168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3170 = _3168 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3172 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3174 = _3172 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3176 = 1.0 / _3170;
                float _3178 = _3166 * _3176;
                float _3180 = fma(_3178, _3174, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3122 = _3180;
                _3152 = true;
            }
            else
            {
                _3122 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3152 = false;
    float _3182 = _3122;
    float _3184 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3186 = _3026 + _3184;
    float _3188 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3190 = _3032 + _3188;
    float _3192 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3194 = _3034 + _3192;
    float _3196 = fma(_3186, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3198 = fma(_3190, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3200 = fma(_3194, _3182, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3202 = -_2192;
    float _3204 = _3202 + _3196;
    float _3206 = -_2196;
    float _3208 = _3206 + _3198;
    float _3210 = -_2248;
    float _3212 = _3210 + _3200;
    float _3214 = _3204 * _3204;
    float _3216 = fma(_3208, _3208, _3214);
    float _3218 = fma(_3212, _3212, _3216);
    float _3220 = sqrt(_3218);
    bool _3222 = _3220 > 0.0;
    bool _3224 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan(0.5);
    bool _3232 = _3228 || _3230;
    float _3234 = _3196;
    if (!_3222)
    {
        _3114 = _3198;
    }
    float _3236 = _3114;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3222)
    {
        _3116 = _3200;
    }
    float _3242 = _3116;
    bool _3244 = !_3222;
    float _3246 = _3242;
    if (!_3244)
    {
        float _3248 = _207 * _207;
        float _3250 = fma(_205, _205, _3248);
        float _3252 = fma(_209, _209, _3250);
        float _3254 = rsqrt(_3218);
        float _3256 = sqrt(_3252);
        float _3258 = _3208 * _3254;
        float _3260 = _3204 * _3254;
        float _3262 = _3212 * _3254;
        bool _3264 = _3256 > 0.0;
        float _3266 = _3256;
        if (!_3264)
        {
            _3238 = _3198;
        }
        float _3268 = _3238;
        _3240 = _3268;
        if (!_3264)
        {
            _3266 = _3200;
        }
        float _3270 = _3266;
        bool _3272 = !_3264;
        _3246 = _3270;
        if (!_3272)
        {
            float _3274 = rsqrt(_3252);
            float _3276 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3278 = _207 * _3274;
            float _3280 = _205 * _3274;
            float _3282 = _209 * _3274;
            float _3284 = _3260 * _3278;
            float _3286 = fma(_3258, _3280, _3284);
            float _3288 = _3276 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3290 = fma(_3262, _3282, _3286);
            float _3292 = _3290 * _3288;
            float _3294 = fma(_205, _3292, _3198);
            float _3296 = fma(_207, _3292, _3196);
            float _3298 = fma(_209, _3292, _3200);
            _3240 = _3294;
            _3234 = _3296;
            _3246 = _3298;
        }
    }
    float _3300 = _3240;
    float _3302 = _3234;
    float _3304 = _3246;
    float _3306 = -_2652;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3300);
    float _3310 = -_2650;
    float _3312 = fma(_3310, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3302);
    float _3314 = -_2658;
    float _3316 = fma(_3314, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3304);
    float _3318 = _3312;
    float _3320 = _3308;
    float _3322 = _3316;
    if (!_3232)
    {
        float _3324 = _2668 * _2668;
        float _3326 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3328 = -_2248;
        float _3330 = _3328 + _3304;
        float _3332 = fma(_2676, _2676, _3324);
        float _3334 = fma(_2686, _2686, _3332);
        float _3336 = 1.0 / _2774;
        float _3338 = sqrt(_3334);
        float _3340 = precise::min(_3338, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3342 = _3340 * _3326;
        float _3344 = -_2196;
        float _3346 = _3344 + _3300;
        float _3348 = _3342 * _3336;
        float _3350 = -_2192;
        float _3352 = _3350 + _3302;
        float _3354 = fma(_3346, _3348, _2662);
        float _3356 = fma(_3352, _3348, _2656);
        float _3358 = fma(_3330, _3348, _2672);
        _3318 = _3356;
        _3320 = _3354;
        _3322 = _3358;
    }
    float _3360 = _3318;
    float _3362 = _3320;
    float _3364 = _3322;
    float _3366 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3368 = _3360 + _3366;
    float _3370 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3372 = _3362 + _3370;
    float _3374 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3376 = _3364 + _3374;
    float _3378 = _3368 * _3368;
    float _3380 = fma(_3372, _3372, _3378);
    float _3382 = fma(_3376, _3376, _3380);
    float _3384 = rsqrt(_3382);
    float _3386 = _3384 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3388 = _3372 * _3386;
    float _3390 = _3376 * _3386;
    float _3392 = _3388 * _3388;
    float _3394 = _3390 * _3390;
    float _3396 = _3392 + _3394;
    float _3398 = sqrt(_3396);
    bool _3400 = _3398 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3404 = _3398 + _3402;
    float _3406 = _3384;
    float _3408 = _3404;
    float _3410 = _3368;
    if (_3400)
    {
        float _3412 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3406 = _3412;
    }
    float _3414 = _3406;
    if (_3400)
    {
        float _3416 = rsqrt(_3396);
        _2742 = _3416;
    }
    float _3418 = _2742;
    float _3420 = _3418;
    if (_3400)
    {
        float _3422 = _3404 * _3414;
        _3408 = _3422;
    }
    float _3424 = _3408;
    if (_3400)
    {
        float _3426 = _3424 * 0.15915493667125701904296875;
        _2744 = _3426;
    }
    float _3428 = _2744;
    float _3430 = _3376;
    float _3432 = _3428;
    if (_3400)
    {
        float _3434 = _3428 * 6.283185482025146484375;
        float _3436 = sin(_3434);
        _3430 = _3436;
    }
    float _3438 = _3430;
    float _3440 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3442 = precise::max(0.0, _3440);
    float _3444 = _3414;
    float _3446 = _3442;
    if (_3400)
    {
        float _3448 = _3428 * 6.283185482025146484375;
        float _3450 = cos(_3448);
        _3444 = _3450;
    }
    float _3452 = _3444;
    float _3454 = -_3386;
    float _3456 = -_3442;
    float _3458 = fma(_3368, _3454, _3456);
    if (_3400)
    {
        float _3460 = _3458 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3410 = _3460;
    }
    float _3462 = _3410;
    float _3464 = _3462;
    if (!_3400)
    {
        _3432 = _3394;
    }
    float _3466 = _3432;
    float _3468 = _3438;
    float _3470 = _3466;
    if (_3400)
    {
        float _3472 = fma(_3438, _3462, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3464 = _3472;
    }
    float _3474 = _3464;
    float _3476 = _3474;
    if (!_3400)
    {
        _3468 = _3458;
    }
    float _3478 = _3468;
    float _3480 = _3478;
    float _3482 = _3452;
    if (_3400)
    {
        float _3484 = _3452 + (-1.0);
        _3446 = _3484;
    }
    float _3486 = _3446;
    float _3488 = _3486;
    if (_3400)
    {
        float _3490 = _3418 * _3474;
        _213 = _3490;
    }
    float _3492 = _213;
    if (!_3400)
    {
        _3420 = _3388;
    }
    float _3494 = _3420;
    float _3496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3498 = _3494;
    if (_3400)
    {
        float _3500 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3488 = _3500;
    }
    float _3502 = _3488;
    if (_3400)
    {
        float _3504 = _3388 * _3492;
        _3498 = _3504;
    }
    float _3506 = _3498;
    if (!_3400)
    {
        _3476 = _3390;
    }
    float _3508 = _3476;
    float _3510 = _3508;
    if (_3400)
    {
        float _3512 = _3390 * _3492;
        _3510 = _3512;
    }
    float _3514 = _3510;
    if (_3400)
    {
        float _3516 = fma(_3458, _3452, _3502);
        _3480 = _3516;
    }
    float _3518 = _3480;
    if (!_3400)
    {
        _3482 = _3392;
    }
    float _3520 = _3482;
    float _3522 = sqrt(_3382);
    float _3524 = _3520;
    if (_3400)
    {
        float _3526 = _3506 * _3506;
        _3524 = _3526;
    }
    float _3528 = _3524;
    if (_3400)
    {
        float _3530 = _3514 * _3514;
        _3470 = _3530;
    }
    float _3532 = _3470;
    float _3534 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3536 = fma(_3518, _3518, _3528);
    float _3538 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3540 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3542 = _3536 + _3532;
    float _3544 = floor(_3538);
    float _3546 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3540);
    float _3548 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3534);
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3552 = fma(_3522, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3550);
    float _3554 = precise::clamp(_3552, 0.0, 1.0);
    float _3556 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3546);
    float _3558 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3548);
    float _3560 = fma(_2672, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3562 = rsqrt(_3542);
    float _3564 = _3556 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3566 = -_3554;
    float _3568 = _3566 + 1.0;
    float _3570 = _3564 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3572 = abs(_3568);
    float _3574 = log2(_3572);
    float _3576 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3578 = -_3570;
    float _3580 = fma(_3578, _3496, 1.0);
    float _3582 = _3360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3584 = -_3544;
    float _3586 = _3538 + _3584;
    float _3588 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3576);
    float _3590 = fma(_3362, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3582);
    float _3592 = _3562 * _3506;
    float _3594 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3588);
    float _3596 = _3562 * _3518;
    float _3598 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3590);
    float _3600 = _3562 * _3514;
    float _3602 = _3594 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3604 = _3592 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3606 = _3598 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3608 = log2(_3580);
    float _3610 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3612 = -_3604;
    float _3614 = fma(_3596, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3612);
    float _3616 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3618 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3620 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3610);
    float _3622 = -_3600;
    float _3624 = fma(_3622, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3614);
    float _3626 = floor(_3560);
    float _3628 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3630 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3620);
    float _3632 = fma(_3624, -0.5, 0.5);
    float _3634 = fma(_3624, 0.5, 0.5);
    float _3636 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3618);
    float _3638 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3630);
    float _3640 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3642 = exp2(_3616);
    float _3644 = _3596 + 1.0;
    float _3646 = _3608 * 0.693147182464599609375;
    float _3648 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3640);
    float _3650 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3636);
    float _3652 = 1.0 / _3638;
    float _3654 = -_3626;
    float _3656 = _3560 + _3654;
    float _3658 = fma(_3634, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3660 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3650);
    float _3662 = fma(_3634, _3658, -0.212114393711090087890625);
    float _3664 = sqrt(_3632);
    float _3666 = -_3596;
    float _3668 = fma(_3642, _3644, _3666);
    float2 _9759 = float2(_3586, _3656);
    float _3670 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_9759, float2(0.0), isnan(_9759)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_9759, float2(0.0), isnan(_9759)), level(0.0)).x;
    float _3672 = fma(_3634, _3662, 1.570728778839111328125);
    float _3674 = fma(_3668, 0.5, 0.5);
    float _3676 = _3660 * _3652;
    float _3678 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3648);
    float _3680 = fma(_3676, -0.5, 0.5);
    float _3682 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3678);
    float _3684 = _3664 * 0.636619746685028076171875;
    float _3686 = _3682 * _3652;
    float _3688 = _3646 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3690 = -_3672;
    float _3692 = fma(_3684, _3690, 1.0);
    float _3694 = fma(_3686, 0.5, 0.5);
    float3 _9808 = float3(_3694, _3680, _3688);
    float _3696 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_9808, float3(0.0), isnan(_9808)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_9808, float3(0.0), isnan(_9808)), level(0.0)).x;
    float3 _9819 = float3(_3694, _3680, _3688);
    float4 _3699 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_9819, float3(0.0), isnan(_9819)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_9819, float3(0.0), isnan(_9819)), level(0.0)).xyzw;
    float _3701 = _3699.x;
    float _3703 = _3699.y;
    float _3705 = _3699.z;
    float _3707 = _3699.w;
    float2 _9835 = float2(_3692, _3674);
    float3 _3711 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_9835, float2(0.0), isnan(_9835)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_9835, float2(0.0), isnan(_9835)), level(0.0)).xyz;
    float _3713 = _3711.x;
    float _3715 = _3711.y;
    float _3717 = _3711.z;
    float _3719 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3721 = _2656 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3723 = _3602 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_80.x = _3362;
    out.m_80.y = _3360;
    out.m_80.z = _3364;
    float _3725 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3719);
    float _3727 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3721);
    float _3729 = fma(_3606, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3723);
    float _3731 = _3574 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3733 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3725);
    float _3735 = fma(_2672, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3727);
    float _3737 = fma(_3564, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3729);
    float _3739 = _3733 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3741 = _3735 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3743 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3737);
    float _3745 = 1.0 / _3739;
    float _3747 = _3741 + _3739;
    float _3749 = in.m_82.x;
    bool _3751 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3753 = isnan(_3522);
    bool _3755 = _3751 || _3753;
    bool _3757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3759 = _3755 || _3757;
    float _3761 = _3747 * _3745;
    float _3763 = _3761 * 0.5;
    float _3765 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3767 = fma(_3763, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3765);
    float _3769 = 1.0 / _3767;
    out.gl_Position.x = _3682;
    out.gl_Position.y = _3660;
    out.gl_Position.z = _3743;
    out.gl_Position.w = _3638;
    float _3771 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3773 = _3769 * _3771;
    float _3775 = abs(_3773);
    float _3777 = log2(_3775);
    bool _3779 = _3773 <= 8000.0;
    bool _3781 = isnan(_3773);
    bool _3783 = _3779 || _3781;
    bool _3785 = isnan(8000.0);
    bool _3787 = _3783 || _3785;
    float _3789 = float(_3787);
    float _3791 = _3682;
    if (!_3759)
    {
        _3791 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3793 = _3791;
    float _3795 = _3777 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3797 = exp2(_3795);
    float _3799 = fma(_3797, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3801 = precise::clamp(_3799, 0.0, 1.0);
    float _3803 = fma(_3801, -2.0, 3.0);
    float _3805 = _3801 * _3801;
    float _3807 = _3805 * _3803;
    float _3809 = exp2(_3731);
    float _3811 = -_3807;
    float _3813 = _3811 + 1.0;
    float _3815 = fma(_3813, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3807);
    float _3817 = _3743 + _3638;
    float _3819 = _3789 * _3815;
    float _3821 = _3817 * 0.5;
    float _3823 = _3819 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3825 = -_3809;
    float _3827 = _3825 + 1.0;
    out.m_84.z = _3821;
    out.m_84.w = _3638;
    float _3829 = _3827 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3831 = -_3829;
    float _3833 = _3831 + 1.0;
    float _3835 = _3638;
    float _3837 = _3833;
    float _3839 = _3793;
    float _3841 = _3793;
    if (!_3759)
    {
        _3835 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3843 = _3835;
    float _3845 = -_3670;
    float _3847 = _3845 + 1.0;
    float _3849 = _3847 * _3823;
    float _3851 = precise::clamp(_3849, 0.0, 1.0);
    float _3853 = -_3851;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3857 = _3855 * _3749;
    float _3859 = _3857 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _3859;
    float _3861 = _3829 * _3696;
    float _3863 = _3707 * _3861;
    float _3865 = _3717 * _3861;
    float _3867 = _3707 * _3833;
    float _3869 = _3703;
    float _3871 = _3701;
    float _3873 = _3863;
    float _3875 = _3843;
    float _3877 = _3843;
    if (!_3759)
    {
        _3837 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3879 = _3837;
    float _3881 = fma(_3713, _3863, _3701);
    float _3883 = fma(_3715, _3863, _3703);
    float _3885 = fma(_3707, _3865, _3705);
    float _3887 = _3879;
    float _3889 = _3879;
    if (!_3759)
    {
        _3869 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3891 = _3869;
    float _3893 = _3891;
    float _3895 = _3891;
    if (!_3759)
    {
        _3871 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3897 = _3871;
    out.m_88.x = _3881;
    out.m_88.y = _3883;
    out.m_88.z = _3885;
    out.m_88.w = _3867;
    float _3899 = _3897;
    float _3901 = _3897;
    if (!_3759)
    {
        _3873 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3903 = _3873;
    bool _3905 = !_3759;
    float _3907 = _3903;
    float _3909 = _3903;
    if (!_3905)
    {
        bool _3911 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3913 = isnan(_3522);
        bool _3915 = _3911 || _3913;
        bool _3917 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3919 = _3915 || _3917;
        if (!_3919)
        {
            float _3921 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3923 = _3522 + _3921;
            float _3925 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3927 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3925;
            float _3929 = 1.0 / _3927;
            float _3931 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3933 = _3931 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3935 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3937 = _3935 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3939 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3941 = _3939 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3943 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3945 = _3943 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3947 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3949 = _3947 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3951 = _3923 * _3929;
            float _3953 = precise::clamp(_3951, 0.0, 1.0);
            float _3955 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3957 = _3955 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3959 = fma(_3953, _3933, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3961 = fma(_3953, _3957, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3963 = fma(_3953, _3937, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3965 = fma(_3953, _3941, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3967 = fma(_3953, _3945, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3969 = fma(_3953, _3949, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3877 = _3961;
            _3901 = _3967;
            _3841 = _3959;
            _3895 = _3965;
            _3889 = _3963;
            _3909 = _3969;
            _3971 = true;
        }
        else
        {
            bool _3973 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3975 = isnan(_3522);
            bool _3977 = _3973 || _3975;
            bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3981 = _3977 || _3979;
            if (!_3981)
            {
                _3839 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3983 = _3839;
            _3841 = _3983;
            if (!_3981)
            {
                _3875 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3985 = _3875;
            _3877 = _3985;
            if (!_3981)
            {
                _3887 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3987 = _3887;
            _3889 = _3987;
            if (!_3981)
            {
                _3893 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3989 = _3893;
            _3895 = _3989;
            if (!_3981)
            {
                _3899 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3991 = _3899;
            _3901 = _3991;
            if (!_3981)
            {
                _3907 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3993 = _3907;
            bool _3995 = !_3981;
            _3909 = _3993;
            if (!_3995)
            {
                bool _3997 = _3522 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3999 = isnan(_3522);
                bool _4001 = _3997 || _3999;
                bool _4003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4005 = _4001 || _4003;
                if (!_4005)
                {
                    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4009 = _3522 + _4007;
                    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4013 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4011;
                    float _4015 = 1.0 / _4013;
                    float _4017 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4019 = _4017 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4021 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4023 = _4021 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4025 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4027 = _4025 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4029 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4031 = _4029 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4033 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4035 = _4033 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4037 = _4009 * _4015;
                    float _4039 = precise::clamp(_4037, 0.0, 1.0);
                    float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4045 = fma(_4039, _4019, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4047 = fma(_4039, _4043, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4049 = fma(_4039, _4023, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4051 = fma(_4039, _4027, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4053 = fma(_4039, _4031, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4055 = fma(_4039, _4035, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3877 = _4047;
                    _3901 = _4053;
                    _3841 = _4045;
                    _3895 = _4051;
                    _3889 = _4049;
                    _3909 = _4055;
                    _3971 = true;
                }
                else
                {
                    _3877 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3901 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3841 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3895 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3889 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3909 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3971 = false;
    float _4057 = _3877;
    float _4059 = _3901;
    float _4061 = _3841;
    float _4063 = _3895;
    float _4065 = _3889;
    float _4067 = _3909;
    float _4069 = fma(_3098, -0.5, 0.5);
    float _4071 = precise::clamp(_4069, 0.0, 1.0);
    float _4073 = -_4057;
    float _4075 = _4073 + _4059;
    float _4077 = -_4061;
    float _4079 = _4077 + _4063;
    float _4081 = -_4065;
    float _4083 = _4081 + _4067;
    bool _4085 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4087 = fma(_4071, _4075, _4057);
    float _4089 = fma(_4071, _4079, _4061);
    float _4091 = fma(_4071, _4083, _4065);
    float _4093 = _4087 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _4095 = fma(_4089, 0.298911988735198974609375, _4093);
    float _4097 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4099 = fma(_4091, 0.114477999508380889892578125, _4095);
    out.m_51.x = _4097;
    float _4101 = -_4099;
    float _4103 = _4089 + _4101;
    float _4105 = -_4099;
    float _4107 = _4087 + _4105;
    float _4109 = -_4099;
    float _4111 = _4091 + _4109;
    float _4113 = fma(_4103, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    float _4115 = fma(_4107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    float _4117 = fma(_4111, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4099);
    out.m_92.x = _4113;
    out.m_92.y = _4115;
    out.m_92.z = _4117;
    if (!_4085)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4119 = -_3360;
    float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4123 = -_3362;
    float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4127 = -_3364;
    float _4129 = _4127 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4131 = _4121 * _4121;
    float _4133 = fma(_4125, _4125, _4131);
    float _4135 = fma(_4129, _4129, _4133);
    float _4137 = sqrt(_4135);
    float _4139 = rsqrt(_4135);
    float _4141 = -_4137;
    float _4143 = _4141 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4145 = _4143 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4147 = precise::clamp(_4145, 0.0, 1.0);
    float _4149 = _4125 * _4139;
    float _4151 = _4121 * _4139;
    float _4153 = abs(_4147);
    float _4155 = log2(_4153);
    float _4157 = _4129 * _4139;
    float _4159 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4161 = _3098 * _4151;
    float _4163 = -_4151;
    float _4165 = -_4159;
    float _4167 = fma(_4163, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4165);
    float _4169 = fma(_3094, _4149, _4161);
    float _4171 = -_4157;
    float _4173 = fma(_4171, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4167);
    float _4175 = fma(_3102, _4157, _4169);
    float _4177 = precise::clamp(_4175, 0.0, 1.0);
    float _4179 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4181 = _4173 + _4179;
    float _4183 = _4155 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4185 = _4181 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4187 = precise::clamp(_4185, 0.0, 1.0);
    float _4189 = exp2(_4183);
    float _4191 = _4189 * _4187;
    float _4193 = _4177 * _4191;
    float _4195 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4197 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4199 = _4193 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _4195;
    out.m_90.y = _4197;
    out.m_90.z = _4199;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

