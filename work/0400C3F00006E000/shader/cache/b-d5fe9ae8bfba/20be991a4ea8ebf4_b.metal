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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_59 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_92 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_70 [[user(locn13)]];
    float4 m_80 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
    bool _1897 = false;
    bool _961 = false;
    bool _793 = false;
    bool _613 = false;
    bool _391 = false;
    bool _189 = false;
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
        float _2841 = as_type<float>(_127);
        out.gl_Position.z = _2841;
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_165);
        out.gl_Position.z = _2910;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _145 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _215;
    bool _219 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_197);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = 1.0 / _209;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _235 = -_229;
    float _237 = _235 + 1.0;
    float _239 = 1.0 / _213;
    float _241 = 1.0 / _217;
    float _243 = _201 * _231;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _197 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = _247 * _239;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_251, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _265 = _205 * _241;
    bool _267 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _269 = isnan(_197);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = fma(_257, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _281 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_197);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _277 * _237;
    float _307 = -_277;
    float _309 = _307 + 1.0;
    float _311 = -_291;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _291 * _309;
    float _321 = fma(_263, _253, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = _303 * _313;
    float _325 = in.m_57.x;
    float _327 = in.m_57.y;
    float _329 = fma(_317, _253, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _331 = -_303;
    float _333 = _331 + 1.0;
    float _335 = _259 * _323;
    float _337 = _279 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _265, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_345, _265, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = fma(_329, _319, _347);
    float _357 = fma(_321, _319, _349);
    float _359 = fma(_351, _305, _355);
    float _361 = fma(_353, _305, _357);
    float _363 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    float _367 = _363 * _325;
    float _369 = _365 * _327;
    bool _371 = !_233;
    float _389;
    if (!_371)
    {
        float _373 = in.m_55.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_111);
        float _395 = 1.0 / _393;
        float _397 = _145 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _411 = _399 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _425 = 1.0 / _415;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _423;
    bool _431 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _433 = isnan(_399);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _419;
    float _445 = _403 * _425;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _461 = isnan(_399);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_457;
    float _473 = _471 + 1.0;
    float _475 = _407 * _429;
    bool _477 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _479 = isnan(_399);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _489;
    float _493 = _441 * _473;
    float _495 = -_441;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _503 = -_487;
    float _505 = _503 + 1.0;
    float _507 = _411 * _443;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = _469 * _505;
    float _519 = fma(_491, _507, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _521 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = fma(_515, _507, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _525 = _487 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _535 = _521 * _517;
    float _537 = _523 * _517;
    float _539 = _519 * _517;
    float _541 = fma(_501, _475, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_529, _475, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _545 = fma(_533, _475, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = -_469;
    float _549 = _547 + 1.0;
    float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].y, _537);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _553;
    float _557 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].x, _535);
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].z, _539);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _565;
    float _569 = fma(_541, _525, _557);
    float _571 = fma(_555, _445, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _573 = fma(_563, _445, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _575 = fma(_567, _445, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _577 = fma(_543, _525, _551);
    float _579 = fma(_545, _525, _559);
    float _581 = fma(_573, _493, _569);
    float _583 = fma(_571, _493, _577);
    float _585 = fma(_575, _493, _579);
    float _587 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].x, _581);
    float _589 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].y, _583);
    float _591 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].z, _585);
    bool _593 = !_427;
    float _611;
    if (!_593)
    {
        float _595 = in.m_55.x;
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_111);
        float _617 = 1.0 / _615;
        float _619 = _145 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _621 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_621);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _651 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _653 = isnan(_621);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = 1.0 / _629;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _669;
    bool _673 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_621);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _661 * _667;
    float _687 = -_661;
    float _689 = _687 + 1.0;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _693 = 1.0 / _645;
    float _695 = _683 * _689;
    float _697 = -_683;
    float _699 = _697 + 1.0;
    float _701 = 1.0 / _649;
    float _703 = _671 * _663;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _709 = fma(_703, _625, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _711 = _707 * _693;
    bool _713 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _715 = isnan(_621);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _621 + _729;
    float _733 = _709 * _695;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _621 + _735;
    float _739 = -_723;
    float _741 = _739 + 1.0;
    float _743 = fma(_711, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = _727 * _701;
    float _747 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _749 = _641 * _741;
    float _751 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = fma(_745, _737, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _755 = fma(_743, _685, _747);
    float _757 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_753, _749, _755);
    float _763 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[118].x, _761);
    float _769 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _759;
    out.m_59.y = _769;
    out.m_59.z = _765;
    out.m_59.w = _771;
    bool _773 = !_691;
    float _791;
    if (!_773)
    {
        float _775 = in.m_55.x;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _779 = _775 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _783 = _781 * _777;
        float _785 = floor(_783);
        float _787 = -_785;
        float _789 = _783 + _787;
        _791 = _789;
        _793 = true;
    }
    else
    {
        float _795 = float(_111);
        float _797 = 1.0 / _795;
        float _799 = _145 * _797;
        _791 = _799;
    }
    _793 = false;
    float _801 = _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _805 = _801 + _803;
    bool _807 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _809 = isnan(_801);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _801 + _819;
    bool _823 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _825 = isnan(_801);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _843 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _845 = isnan(_801);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -_817;
    float _857 = _855 + 1.0;
    float _859 = 1.0 / _841;
    float _861 = _853 * _857;
    float _863 = -_853;
    float _865 = _863 + 1.0;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _867;
    bool _871 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _873 = 1.0 / _837;
    float _875 = _833 * _865;
    float _877 = -_833;
    float _879 = _877 + 1.0;
    float _881 = _821 * _859;
    float _883 = _805 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    float _893 = fma(_869, _883, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _895 = fma(_887, _883, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _897 = fma(_891, _883, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _899 = _893 * _875;
    float _901 = _895 * _875;
    float _903 = _897 * _875;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].x, _899);
    float _919 = fma(_907, _881, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _921 = fma(_911, _881, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _923 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].y, _901);
    float _925 = fma(_915, _881, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _927 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].z, _903);
    float _929 = fma(_919, _861, _917);
    float _931 = fma(_921, _861, _923);
    float _933 = fma(_925, _861, _927);
    float _935 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].x, _929);
    float _937 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].y, _931);
    float _939 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].z, _933);
    bool _941 = !_871;
    float _959;
    if (!_941)
    {
        float _943 = in.m_55.x;
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _947 = _943 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _951 = _949 * _945;
        float _953 = floor(_951);
        float _955 = -_953;
        float _957 = _951 + _955;
        _959 = _957;
        _961 = true;
    }
    else
    {
        float _963 = float(_111);
        float _965 = 1.0 / _963;
        float _967 = _145 * _965;
        _959 = _967;
    }
    _961 = false;
    float _969 = _959;
    float _971 = in.m_55.x;
    float _973 = in.m_55.y;
    float _975 = in.m_55.z;
    float _977 = in.m_55.w;
    float _979 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _981 = log2(_979);
    float _983 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _985 = as_type<float>(int(gl_VertexIndex));
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _991 = in.m_48.x;
    float _993 = in.m_48.y;
    float _995 = in.m_48.z;
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _999;
    float _1003 = _981 * _145;
    float _1005 = 1.0 / _989;
    float _1007 = _975 * 2.0;
    float _1009 = _973 * 2.0;
    float _1011 = exp2(_1003);
    int _1013 = as_type<int>(_985) & 1;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>(_985) & 2;
    bool _1019 = _1017 != 0;
    float _1021 = _971 * 2.0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1033 = _1031 != 0;
    float _1035 = floor(_1007);
    float _1037 = _993 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1039 = _1001 * _1005;
    float _1041 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1037);
    float _1043 = floor(_1021);
    float _1045 = -_1011;
    float _1047 = _1045 + 1.0;
    bool _1049 = _1035 > 0.0;
    float _1051 = floor(_1009);
    bool _1053 = _1035 >= 0.0;
    bool _1055 = isnan(_1035);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    float _1063 = _993 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1065 = _993 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1067 = _1061 ? 0 : 1;
    float _1069 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1063);
    float _1071 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1065);
    float _1073 = _973 + _971;
    int _1075 = ~_1067;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    float _1081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1083 = _1043 >= 0.0;
    bool _1085 = isnan(_1043);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = _1073 + (-1.0);
    int _1095 = _1079;
    if (!_1049)
    {
        int _1097 = ~_1067;
        int _1099 = _1097 + 1;
        _1095 = _1099;
    }
    int _1101 = _1095;
    float _1103 = _973 + _975;
    bool _1105 = _1043 > 0.0;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1109 = _1091 ? 0 : 1;
    float _1111 = _1103 + (-1.0);
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_1025;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1131 = ~_1109;
    int _1133 = _1131 + 1;
    int _1135 = _1133 + 1;
    float _1137 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1071);
    float _1139 = _1121 ? _1047 : 0.0;
    float _1141 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1069);
    bool _1143 = _1051 >= 0.0;
    bool _1145 = isnan(_1051);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1041);
    int _1155 = _1135;
    if (!_1105)
    {
        int _1157 = ~_1109;
        int _1159 = _1157 + 1;
        _1155 = _1159;
    }
    int _1161 = _1155;
    float _1163 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1165 = _1051 > 0.0;
    float _1167 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1169 = abs(_1127);
    float _1171 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = in.m_64.x;
    float _1175 = in.m_64.y;
    float _1177 = in.m_64.z;
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1181 = float(_1169);
    bool _1183 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1185 = isnan(1.0);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1191 = _1187 || _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1195 = 1.0 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _1167 + _1197;
    float _1201 = float(_1101);
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1205 = _1163 + _1203;
    float _1207 = 1.0 / _1195;
    float _1209 = _1199 * _1199;
    bool _1211 = !_1029;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1181 * _1201;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1219 = _1171 + _1217;
    float _1221 = fma(_1205, _1205, _1209);
    int _1223 = abs(_1213);
    float _1225 = _1215 * (-2.0);
    float _1227 = float(_1161);
    float _1229 = fma(_1219, _1219, _1221);
    float _1231 = _971 + (-0.5);
    float _1233 = float(_1223);
    float _1235 = sqrt(_1229);
    float _1237 = fma(_1225, _1173, _1173);
    float _1239 = fma(_1107, _1225, _1107);
    if (_1191)
    {
        float _1241 = _1139 * _1207;
        _149 = _1241;
    }
    float _1243 = _149;
    float _1245 = _1233 * _1227;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1237);
    float _1249 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1251 = _1151 ? 0 : 1;
    float _1253 = _1245 * (-2.0);
    float _1255 = fma(_1239, _1243, _1247);
    float _1257 = _1249 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1259 = rsqrt(_1229);
    float _1261 = _973 + (-0.5);
    float _1263 = fma(_1253, _1175, _1175);
    int _1265 = ~_1251;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    float _1271 = fma(_1129, _1253, _1129);
    float _1273 = _1235 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1275 = !_1033;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1263);
    int _1281 = _1269;
    if (!_1165)
    {
        int _1283 = ~_1251;
        int _1285 = _1283 + 1;
        _1281 = _1285;
    }
    int _1287 = _1281;
    float _1289 = _1255 * 0.15915493667125701904296875;
    float _1291 = precise::min(_1257, _1273);
    float _1293 = fma(_1271, _1243, _1279);
    int _1295 = abs(_1277);
    float _1297 = _975 + _971;
    float _1299 = float(_1287);
    float _1301 = _1293 * 0.15915493667125701904296875;
    float _1303 = float(_1295);
    float _1305 = _1259 * _1291;
    float _1307 = _1297 + (-1.0);
    float _1309 = _1289 * 6.283185482025146484375;
    float _1311 = sin(_1309);
    float _1313 = _1199 * _1305;
    float _1315 = _1303 * _1299;
    float _1317 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1319 = _1205 * _1305;
    float _1321 = -_1313;
    float _1323 = _1199 + _1321;
    float _1325 = _1315 * (-2.0);
    bool _1327 = _977 > 0.5;
    float _1329 = -_1319;
    float _1331 = _1205 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1317, _1325, _1317);
    float _1337 = fma(_1325, _1177, _1177);
    float _1339 = _1219 * _1305;
    float _1341 = _1289 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = _975 + (-0.5);
    bool _1347 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1349 = isnan(_969);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1355 = _1351 || _1353;
    float _1357 = float(_1355);
    float _1359 = -_1339;
    float _1361 = _1219 + _1359;
    bool _1363 = _971 > 0.5;
    bool _1365 = _973 > 0.5;
    float _1367 = _1301 * 6.283185482025146484375;
    float _1369 = sin(_1367);
    float _1371 = fma(_1331, _1331, _1333);
    float _1373 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1337);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1377 = _969 + _1375;
    bool _1379 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1381 = isnan(_969);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = fma(_1361, _1361, _1371);
    float _1393 = fma(_1335, _1243, _1373);
    float _1395 = -_1357;
    float _1397 = _1395 + 1.0;
    float _1399 = _1301 * 6.283185482025146484375;
    float _1401 = cos(_1399);
    float _1403 = fma(_1039, _1377, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1405 = _1393 * 0.15915493667125701904296875;
    float _1407 = _1389 * _1397;
    float _1409 = -_1389;
    float _1411 = _1409 + 1.0;
    float _1413 = _1403 * _1407;
    float _1415 = sqrt(_1391);
    bool _1417 = !_1019;
    float _1419 = _1417 ? (-0.5) : 0.5;
    float _1421 = _1311 * _1369;
    float _1423 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1413);
    bool _1425 = !_1015;
    float _1427 = _1425 ? (-0.5) : 0.5;
    float _1429 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1423);
    float _1431 = _1405 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1419);
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1439 = _1437 != 0;
    float _1441 = _1343 * _1369;
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1445 = _1443 != 0;
    float _1447 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1451 = _1449 != 0;
    float _1453 = _1405 * 6.283185482025146484375;
    float _1455 = sin(_1453);
    float _1457 = _1259 * _1415;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1461 = _1459 != 0;
    float _1463 = _1311 * _1401;
    float _1465 = -_1427;
    int _1467 = _1363 ? as_type<int>(_1465) : as_type<int>(_1427);
    float _1469 = _983 * _1457;
    bool _1471 = _975 > 0.5;
    float _1473 = _1249 * _1457;
    float _1475 = _1311 * _1433;
    float _1477 = _1343 * _1401;
    float _1479 = _1469 * _1435;
    float _1481 = _1343 * _1433;
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1427);
    float _1485 = _1401 * _1433;
    float _1487 = _1369 * _1433;
    float _1489 = _1481 * _1479;
    float _1491 = fma(_1455, _1477, _1421);
    float _1493 = fma(_1455, _1421, _1477);
    float _1495 = _1473 * _1483;
    float _1497 = -_1479;
    float _1499 = _1455 * _1497;
    float _1501 = -_1441;
    float _1503 = fma(_1455, _1463, _1501);
    float _1505 = _1475 * _1479;
    float _1507 = -_1463;
    float _1509 = fma(_1455, _1441, _1507);
    float _1511 = fma(_1485, _1495, _1499);
    float _1513 = fma(_1491, _1495, _1489);
    float _1515 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1517 = _1515 * 0.5;
    float _1519 = fma(_1503, _1495, _1505);
    float _1521 = -_1419;
    int _1523 = _1365 ? as_type<int>(_1521) : as_type<int>(_1419);
    float _1525 = fma(_1509, _1517, _1513);
    float _1527 = fma(_1487, _1517, _1511);
    bool _1529 = !_1445;
    float _1531 = _1529 ? _1419 : as_type<float>(_1523);
    float _1533 = fma(_1493, _1517, _1519);
    float _1535 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1537 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1539 = !_1439;
    float _1541 = _1539 ? _1427 : as_type<float>(_1467);
    float _1543 = -_1531;
    float _1545 = _1543 + 0.5;
    float _1547 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1535);
    float _1549 = -_1427;
    int _1551 = _1471 ? as_type<int>(_1549) : as_type<int>(_1427);
    float _1553 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1557 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1537);
    float _1559 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1547);
    float _1561 = _1541 + 0.5;
    bool _1563 = !_1451;
    float _1565 = _1563 ? _1427 : as_type<float>(_1551);
    float _1567 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1557);
    float _1569 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1573 = -_1419;
    int _1575 = _1327 ? as_type<int>(_1573) : as_type<int>(_1419);
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1579 = _1171 + _1569;
    float _1581 = _1565 + 0.5;
    float _1583 = _1555 * _997;
    float _1585 = _1163 + _1577;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1589 = _1579 + _1587;
    bool _1591 = !_1461;
    float _1593 = _1591 ? _1419 : as_type<float>(_1575);
    float _1595 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1597 = _1571 * _1081;
    float _1599 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1603 = _1585 + _1601;
    float _1605 = _1589 * _1589;
    float _1607 = -_1593;
    float _1609 = _1607 + 0.5;
    float _1611 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1613 = _1595 * _1123;
    float _1615 = fma(_1603, _1603, _1605);
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1619 = _939 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1621 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1553);
    float _1623 = sqrt(_1615);
    float _1625 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1627 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1629 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1631 = _1617 * _1179;
    float _1633 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1621);
    float _1635 = -_1455;
    float _1637 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1625);
    float _1639 = -_1455;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1627);
    float _1643 = -_1455;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1629);
    float _1647 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1655 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_66.x = _1597;
    out.m_66.y = _1583;
    out.m_66.z = _1613;
    out.m_66.w = _1631;
    bool _1657 = _1623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_68.x = _1647;
    out.m_68.y = _1649;
    out.m_68.z = _1651;
    out.m_68.w = _1447;
    float _1659 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1661 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1663 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1653);
    float _1665 = _1167 + _1655;
    float _1667 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1669 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1659);
    float _1671 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1661);
    float _1673 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1637);
    float _1675 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1641);
    float _1677 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1645);
    float _1679 = fma(_1667, _1667, 1.0);
    float _1681 = _1447;
    float _1683 = _1585;
    float _1685 = _1579;
    float _1687 = _1673;
    float _1689 = _1313;
    float _1691 = _1339;
    if (!_1657)
    {
        _1681 = _1665;
    }
    float _1693 = _1681;
    bool _1695 = !_1657;
    float _1697 = _1693;
    if (!_1695)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1703 = _1623 + _1701;
        float _1705 = rsqrt(_1615);
        float _1707 = _1703 * _1699;
        float _1709 = _1665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = _1707 * 0.15915493667125701904296875;
        float _1713 = _1711 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = _1711 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1715 + (-1.0);
        float _1723 = fma(_1719, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = _1705 * _1723;
        float _1729 = fma(_1665, _1715, _1725);
        float _1731 = fma(_1603, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1733 = fma(_1589, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1697 = _1729;
        _1683 = _1731;
        _1685 = _1733;
    }
    float _1735 = _1697;
    float _1737 = _1683;
    float _1739 = _1685;
    float _1741 = -_1313;
    float _1743 = _1741 + _1735;
    float _1745 = rsqrt(_1679);
    float _1747 = -_1319;
    float _1749 = _1747 + _1737;
    float _1751 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1755 = _1743 + _1753;
    float _1757 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1759 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1763 = _1749 + _1761;
    float _1765 = _1755 * _1755;
    float _1767 = -_1339;
    float _1769 = _1767 + _1739;
    float _1771 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1751);
    float _1773 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1757);
    float _1775 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1759);
    float _1777 = fma(_1763, _1763, _1765);
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1771);
    float _1785 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1773);
    float _1787 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1789 = fma(_1781, _1781, _1777);
    float _1791 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1669);
    float _1793 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1671);
    float _1795 = _1667 * _1673;
    float _1797 = _1667 * _1675;
    float _1799 = _1667 * _1745;
    float _1801 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1775);
    float _1803 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1663);
    float _1805 = _1667 * _1677;
    float _1807 = sqrt(_1789);
    float _1809 = fma(_1787, _1791, _1797);
    float _1811 = -_1783;
    float _1813 = _1799 * _1811;
    float _1815 = -_1785;
    float _1817 = _1799 * _1815;
    float _1819 = fma(_1787, _1803, _1795);
    float _1821 = -_1801;
    float _1823 = _1799 * _1821;
    float _1825 = fma(_1787, _1793, _1805);
    float _1827 = fma(_1745, _1673, _1813);
    float _1829 = fma(_1745, _1675, _1817);
    float _1831 = fma(_1745, _1677, _1823);
    float _1833 = _1783 + _1819;
    float _1835 = _1785 + _1809;
    float _1837 = _1801 + _1825;
    out.m_70.w = _1291;
    float _1839 = -_1319;
    float _1841 = _1163 + _1839;
    bool _1843 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1845 = isnan(_1807);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1851 = _1847 || _1849;
    out.m_72.x = _1803;
    out.m_72.y = _1791;
    out.m_72.z = _1793;
    float _1853 = -_1313;
    float _1855 = _1167 + _1853;
    float _1857 = -_1339;
    float _1859 = _1171 + _1857;
    out.m_74.x = _1473;
    out.m_76.x = _1827;
    out.m_76.y = _1829;
    out.m_76.z = _1831;
    out.m_78.x = _1833;
    out.m_78.y = _1835;
    out.m_78.z = _1837;
    float _1861 = _1769;
    if (!_1851)
    {
        _1687 = 1.0;
    }
    float _1863 = _1687;
    bool _1865 = !_1851;
    float _1867 = _1863;
    if (!_1865)
    {
        bool _1869 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1871 = isnan(_1807);
        bool _1873 = _1869 || _1871;
        bool _1875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1877 = _1873 || _1875;
        if (!_1877)
        {
            float _1879 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1881 = _1807 + _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1885 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1883;
            float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1891 = 1.0 / _1885;
            float _1893 = _1881 * _1891;
            float _1895 = fma(_1893, _1889, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1867 = _1895;
            _1897 = true;
        }
        else
        {
            bool _1899 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1901 = isnan(_1807);
            bool _1903 = _1899 || _1901;
            bool _1905 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1907 = _1903 || _1905;
            if (!_1907)
            {
                float _1909 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1911 = _1807 + _1909;
                float _1913 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1915 = _1913 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1917 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1919 = _1917 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1921 = 1.0 / _1915;
                float _1923 = _1911 * _1921;
                float _1925 = fma(_1923, _1919, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1867 = _1925;
                _1897 = true;
            }
            else
            {
                _1867 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1897 = false;
    float _1927 = _1867;
    float _1929 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1931 = _1743 + _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1935 = _1749 + _1933;
    float _1937 = fma(_1931, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1941 = _1769 + _1939;
    float _1943 = fma(_1935, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1937 + _1945;
    float _1949 = fma(_1941, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1953 = _1943 + _1951;
    float _1955 = _1947 * _1947;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1959 = _1949 + _1957;
    float _1961 = fma(_1953, _1953, _1955);
    float _1963 = fma(_1959, _1959, _1961);
    float _1965 = rsqrt(_1963);
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1953 * _1967;
    float _1971 = _1959 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1959;
    float _1989 = _1985;
    float _1991 = _1947;
    if (_1981)
    {
        float _1993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _1993;
    }
    float _1995 = _1987;
    if (_1981)
    {
        float _1997 = rsqrt(_1977);
        _1689 = _1997;
    }
    float _1999 = _1689;
    float _2001 = _1999;
    if (_1981)
    {
        float _2003 = _1985 * _1995;
        _1989 = _2003;
    }
    float _2005 = _1989;
    if (_1981)
    {
        float _2007 = _2005 * 0.15915493667125701904296875;
        _1691 = _2007;
    }
    float _2009 = _1691;
    float _2011 = _1955;
    if (_1981)
    {
        float _2013 = _2009 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2021 = precise::max(0.0, _2019);
    float _2023 = _1965;
    float _2025 = _2019;
    float _2027 = _2021;
    if (_1981)
    {
        float _2029 = _2009 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        _2023 = _2031;
    }
    float _2033 = _2023;
    float _2035 = -_1967;
    float _2037 = -_2021;
    float _2039 = fma(_1947, _2035, _2037);
    float _2041 = _2039;
    if (_1981)
    {
        float _2043 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2043;
    }
    float _2045 = _2025;
    float _2047 = _2045;
    float _2049 = _2017;
    if (_1981)
    {
        float _2051 = fma(_2017, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2047 = _2051;
    }
    float _2053 = _2047;
    if (!_1981)
    {
        _2049 = _1973;
    }
    float _2055 = _2049;
    float _2057 = _2033;
    float _2059 = _2055;
    if (_1981)
    {
        float _2061 = _2033 + (-1.0);
        _1991 = _2061;
    }
    float _2063 = _1991;
    if (_1981)
    {
        float _2065 = _1999 * _2053;
        _1861 = _2065;
    }
    float _2067 = _1861;
    if (!_1981)
    {
        _2001 = _1969;
    }
    float _2069 = _2001;
    float _2071 = sqrt(_1963);
    float _2073 = _2069;
    if (_1981)
    {
        float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2027 = _2075;
    }
    float _2077 = _2027;
    if (_1981)
    {
        float _2079 = _1969 * _2067;
        _2073 = _2079;
    }
    float _2081 = _2073;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1981)
    {
        float _2085 = fma(_2039, _2033, _2077);
        _2041 = _2085;
    }
    float _2087 = _2041;
    if (!_1981)
    {
        _2057 = _1971;
    }
    float _2089 = _2057;
    float _2091 = _2089;
    if (_1981)
    {
        float _2093 = _1971 * _2067;
        _2091 = _2093;
    }
    float _2095 = _2091;
    if (_1981)
    {
        float _2097 = _2081 * _2081;
        _2059 = _2097;
    }
    float _2099 = _2059;
    float _2101 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1981)
    {
        _2083 = _1975;
    }
    float _2103 = _2083;
    float _2105 = _2103;
    if (_1981)
    {
        float _2107 = _2095 * _2095;
        _2105 = _2107;
    }
    float _2109 = _2105;
    float _2111 = fma(_2087, _2087, _2099);
    float _2113 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2115 = floor(_2101);
    float _2117 = _2111 + _2109;
    float _2119 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2113);
    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2123 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2121);
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2119);
    float _2129 = rsqrt(_2117);
    float _2131 = -_2125;
    float _2133 = _2131 + 1.0;
    float _2135 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2139 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2141 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = abs(_2133);
    float _2147 = log2(_2145);
    float _2149 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2151 = -_2143;
    float _2153 = fma(_2151, _2137, 1.0);
    float _2155 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = -_2115;
    float _2159 = _2101 + _2157;
    float _2161 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2149);
    float _2163 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2155);
    float _2165 = _2129 * _2081;
    float _2167 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2161);
    float _2169 = _2129 * _2087;
    float _2171 = _2129 * _2095;
    float _2173 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2141);
    float _2175 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2177 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2163);
    float _2179 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2181 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2173);
    float _2183 = -_2175;
    float _2185 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2183);
    float _2187 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2189 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2191 = floor(_2139);
    float _2193 = -_2171;
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2185);
    float _2197 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2199 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2189);
    float _2201 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2203 = fma(_2195, -0.5, 0.5);
    float _2205 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2199);
    float _2209 = log2(_2153);
    float _2211 = fma(_2195, 0.5, 0.5);
    float _2213 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2215 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2213);
    float _2217 = exp2(_2197);
    float _2219 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2201);
    float _2223 = -_2191;
    float _2225 = _2139 + _2223;
    float _2227 = _2169 + 1.0;
    float _2229 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2207);
    float _2231 = fma(_2211, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2221);
    float _2235 = sqrt(_2203);
    float _2237 = _2209 * 0.693147182464599609375;
    float _2239 = fma(_2211, _2231, -0.212114393711090087890625);
    float2 _6281 = float2(_2159, _2225);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6281, float2(0.0), isnan(_6281)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6281, float2(0.0), isnan(_6281)), level(0.0)).x;
    float _2243 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = fma(_2211, _2239, 1.570728778839111328125);
    float _2247 = 1.0 / _2229;
    float _2249 = -_2169;
    float _2251 = fma(_2217, _2227, _2249);
    float _2253 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2233);
    float _2255 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2257 = _2235 * 0.636619746685028076171875;
    float _2259 = -_2245;
    float _2261 = fma(_2257, _2259, 1.0);
    float _2263 = fma(_2251, 0.5, 0.5);
    float _2265 = _2253 * _2247;
    float _2267 = _2255 * _2247;
    float _2269 = fma(_2265, 0.5, 0.5);
    float _2271 = fma(_2267, -0.5, 0.5);
    float3 _6338 = float3(_2269, _2271, _2243);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6338, float3(0.0), isnan(_6338)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6338, float3(0.0), isnan(_6338)), level(0.0)).x;
    float3 _6349 = float3(_2269, _2271, _2243);
    float4 _2276 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).xyzw;
    float _2278 = _2276.x;
    float _2280 = _2276.y;
    float _2282 = _2276.z;
    float _2284 = _2276.w;
    float2 _6365 = float2(_2261, _2263);
    float3 _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).xyz;
    float _2290 = _2288.x;
    float _2292 = _2288.y;
    float _2294 = _2288.z;
    float _2296 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_80.x = _1841;
    out.m_80.y = _1855;
    out.m_80.z = _1859;
    bool _2298 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2300 = isnan(_2071);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2306 = _2302 || _2304;
    float _2308 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2296);
    out.m_82.x = _1943;
    out.m_82.y = _1937;
    out.m_82.z = _1949;
    float _2310 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2308);
    float _2312 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2314 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2316 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2312);
    float _2318 = 1.0 / _2314;
    float _2320 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2316);
    float _2322 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2324 = _2322 + _2314;
    float _2326 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2328 = in.m_84.x;
    float _2330 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2326);
    float _2332 = _2324 * _2318;
    float _2334 = _2332 * 0.5;
    float _2336 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2330);
    float _2338 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2340 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2338);
    float _2342 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2336);
    float _2344 = _2253 + _2229;
    float _2346 = 1.0 / _2340;
    out.gl_Position.x = _2253;
    out.gl_Position.y = _2255;
    out.gl_Position.z = _2342;
    out.gl_Position.w = _2229;
    float _2348 = _2344 * 0.5;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2346 * _2350;
    float _2354 = abs(_2352);
    float _2356 = log2(_2354);
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2360 = exp2(_2358);
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = fma(_2364, -2.0, 3.0);
    float _2368 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2370 = _2364 * _2364;
    bool _2372 = _2352 <= 8000.0;
    bool _2374 = isnan(_2352);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(8000.0);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = _2229 * 0.5;
    float _2386 = _2370 * _2366;
    float _2388 = exp2(_2368);
    float _2390 = -_2386;
    float _2392 = _2390 + 1.0;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2386);
    float _2396 = fma(_2255, -0.5, _2384);
    float _2398 = _2342 + _2229;
    float _2400 = _2229;
    float _2402 = _2342;
    float _2404 = _2255;
    if (!_2306)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2406 = _2400;
    float _2408 = _2382 * _2394;
    float _2410 = _2398 * 0.5;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2306)
    {
        _2402 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2416 = _2402;
    float _2418 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2420 = -_2388;
    float _2422 = _2420 + 1.0;
    float _2424 = _2416;
    float _2426 = _2416;
    if (!_2306)
    {
        _2404 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2404;
    out.m_86.x = _2348;
    out.m_86.y = _2396;
    out.m_86.z = _2410;
    out.m_86.w = _2229;
    float _2430 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2432 = -_2430;
    float _2434 = _2432 + 1.0;
    float _2436 = -_2241;
    float _2438 = _2436 + 1.0;
    float _2440 = _2438 * _2418;
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = -_2442;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2448 = _2446 * _2328;
    float _2450 = _2448 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2450;
    float _2452 = _2430 * _2273;
    float _2454 = _2284 * _2452;
    float _2456 = _2294 * _2452;
    float _2458 = fma(_2290, _2454, _2278);
    float _2460 = fma(_2292, _2454, _2280);
    float _2462 = _2284 * _2434;
    float _2464 = fma(_2284, _2456, _2282);
    float _2466 = _2282;
    float _2468 = _2434;
    float _2470 = _2454;
    float _2472 = _2428;
    float _2474 = _2428;
    if (!_2306)
    {
        _2466 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2476 = _2466;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2306)
    {
        _2468 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2468;
    out.m_90.x = _2458;
    out.m_90.y = _2460;
    out.m_90.z = _2464;
    out.m_90.w = _2462;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2306)
    {
        _2470 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2470;
    bool _2490 = !_2306;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_2071);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _2071 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = 1.0 / _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2514;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2544 = fma(_2538, _2518, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2414 = _2546;
            _2486 = _2552;
            _2480 = _2544;
            _2474 = _2550;
            _2426 = _2548;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_2071);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2478;
            _2480 = _2568;
            if (!_2566)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2412;
            _2414 = _2570;
            if (!_2566)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2424;
            _2426 = _2572;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2472;
            _2474 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_2071);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _2071 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = 1.0 / _2598;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2600;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2630 = fma(_2624, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2414 = _2632;
                    _2486 = _2638;
                    _2480 = _2630;
                    _2474 = _2636;
                    _2426 = _2634;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2414;
    float _2644 = _2486;
    float _2646 = _2480;
    float _2648 = _2474;
    float _2650 = _2426;
    float _2652 = _2494;
    float _2654 = fma(_1835, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_51.x = _2682;
    float _2686 = -_2684;
    float _2688 = _2674 + _2686;
    float _2690 = -_2684;
    float _2692 = _2672 + _2690;
    float _2694 = -_2684;
    float _2696 = _2676 + _2694;
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    float _2702 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    out.m_70.x = _2698;
    out.m_70.y = _2700;
    out.m_70.z = _2702;
    if (!_2670)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2704 = -_1937;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1943;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1949;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _1835 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_1833, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_1837, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _2780;
    out.m_92.y = _2782;
    out.m_92.z = _2784;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
    bool _1897 = false;
    bool _961 = false;
    bool _793 = false;
    bool _613 = false;
    bool _391 = false;
    bool _189 = false;
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
        float _2841 = as_type<float>(_127);
        out.gl_Position.z = _2841;
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_165);
        out.gl_Position.z = _2910;
    }
    if (_159)
    {
        return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _145 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _215;
    bool _219 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_197);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = 1.0 / _209;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _235 = -_229;
    float _237 = _235 + 1.0;
    float _239 = 1.0 / _213;
    float _241 = 1.0 / _217;
    float _243 = _201 * _231;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _197 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = _247 * _239;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_251, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _265 = _205 * _241;
    bool _267 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _269 = isnan(_197);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = fma(_257, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _281 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_197);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _277 * _237;
    float _307 = -_277;
    float _309 = _307 + 1.0;
    float _311 = -_291;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _291 * _309;
    float _321 = fma(_263, _253, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = _303 * _313;
    float _325 = in.m_57.x;
    float _327 = in.m_57.y;
    float _329 = fma(_317, _253, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _331 = -_303;
    float _333 = _331 + 1.0;
    float _335 = _259 * _323;
    float _337 = _279 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _265, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_345, _265, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = fma(_329, _319, _347);
    float _357 = fma(_321, _319, _349);
    float _359 = fma(_351, _305, _355);
    float _361 = fma(_353, _305, _357);
    float _363 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    float _367 = _363 * _325;
    float _369 = _365 * _327;
    bool _371 = !_233;
    float _389;
    if (!_371)
    {
        float _373 = in.m_55.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_111);
        float _395 = 1.0 / _393;
        float _397 = _145 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _411 = _399 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _425 = 1.0 / _415;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _423;
    bool _431 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _433 = isnan(_399);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _419;
    float _445 = _403 * _425;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _461 = isnan(_399);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_457;
    float _473 = _471 + 1.0;
    float _475 = _407 * _429;
    bool _477 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _479 = isnan(_399);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _489;
    float _493 = _441 * _473;
    float _495 = -_441;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _503 = -_487;
    float _505 = _503 + 1.0;
    float _507 = _411 * _443;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = _469 * _505;
    float _519 = fma(_491, _507, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _521 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = fma(_515, _507, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _525 = _487 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _535 = _521 * _517;
    float _537 = _523 * _517;
    float _539 = _519 * _517;
    float _541 = fma(_501, _475, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_529, _475, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _545 = fma(_533, _475, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = -_469;
    float _549 = _547 + 1.0;
    float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].y, _537);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _553;
    float _557 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].x, _535);
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].z, _539);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _565;
    float _569 = fma(_541, _525, _557);
    float _571 = fma(_555, _445, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _573 = fma(_563, _445, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _575 = fma(_567, _445, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _577 = fma(_543, _525, _551);
    float _579 = fma(_545, _525, _559);
    float _581 = fma(_573, _493, _569);
    float _583 = fma(_571, _493, _577);
    float _585 = fma(_575, _493, _579);
    float _587 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].x, _581);
    float _589 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].y, _583);
    float _591 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].z, _585);
    bool _593 = !_427;
    float _611;
    if (!_593)
    {
        float _595 = in.m_55.x;
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_111);
        float _617 = 1.0 / _615;
        float _619 = _145 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _621 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_621);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _651 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _653 = isnan(_621);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = 1.0 / _629;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _669;
    bool _673 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_621);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _661 * _667;
    float _687 = -_661;
    float _689 = _687 + 1.0;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _693 = 1.0 / _645;
    float _695 = _683 * _689;
    float _697 = -_683;
    float _699 = _697 + 1.0;
    float _701 = 1.0 / _649;
    float _703 = _671 * _663;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _709 = fma(_703, _625, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _711 = _707 * _693;
    bool _713 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _715 = isnan(_621);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _621 + _729;
    float _733 = _709 * _695;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _621 + _735;
    float _739 = -_723;
    float _741 = _739 + 1.0;
    float _743 = fma(_711, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = _727 * _701;
    float _747 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _749 = _641 * _741;
    float _751 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = fma(_745, _737, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _755 = fma(_743, _685, _747);
    float _757 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_753, _749, _755);
    float _763 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[118].x, _761);
    float _769 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _759;
    out.m_59.y = _769;
    out.m_59.z = _765;
    out.m_59.w = _771;
    bool _773 = !_691;
    float _791;
    if (!_773)
    {
        float _775 = in.m_55.x;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _779 = _775 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _783 = _781 * _777;
        float _785 = floor(_783);
        float _787 = -_785;
        float _789 = _783 + _787;
        _791 = _789;
        _793 = true;
    }
    else
    {
        float _795 = float(_111);
        float _797 = 1.0 / _795;
        float _799 = _145 * _797;
        _791 = _799;
    }
    _793 = false;
    float _801 = _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _805 = _801 + _803;
    bool _807 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _809 = isnan(_801);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _801 + _819;
    bool _823 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _825 = isnan(_801);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _843 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _845 = isnan(_801);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -_817;
    float _857 = _855 + 1.0;
    float _859 = 1.0 / _841;
    float _861 = _853 * _857;
    float _863 = -_853;
    float _865 = _863 + 1.0;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _867;
    bool _871 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _873 = 1.0 / _837;
    float _875 = _833 * _865;
    float _877 = -_833;
    float _879 = _877 + 1.0;
    float _881 = _821 * _859;
    float _883 = _805 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    float _893 = fma(_869, _883, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _895 = fma(_887, _883, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _897 = fma(_891, _883, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _899 = _893 * _875;
    float _901 = _895 * _875;
    float _903 = _897 * _875;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].x, _899);
    float _919 = fma(_907, _881, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _921 = fma(_911, _881, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _923 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].y, _901);
    float _925 = fma(_915, _881, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _927 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].z, _903);
    float _929 = fma(_919, _861, _917);
    float _931 = fma(_921, _861, _923);
    float _933 = fma(_925, _861, _927);
    float _935 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].x, _929);
    float _937 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].y, _931);
    float _939 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].z, _933);
    bool _941 = !_871;
    float _959;
    if (!_941)
    {
        float _943 = in.m_55.x;
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _947 = _943 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _951 = _949 * _945;
        float _953 = floor(_951);
        float _955 = -_953;
        float _957 = _951 + _955;
        _959 = _957;
        _961 = true;
    }
    else
    {
        float _963 = float(_111);
        float _965 = 1.0 / _963;
        float _967 = _145 * _965;
        _959 = _967;
    }
    _961 = false;
    float _969 = _959;
    float _971 = in.m_55.x;
    float _973 = in.m_55.y;
    float _975 = in.m_55.z;
    float _977 = in.m_55.w;
    float _979 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _981 = log2(_979);
    float _983 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _985 = as_type<float>(int(gl_VertexIndex));
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _991 = in.m_48.x;
    float _993 = in.m_48.y;
    float _995 = in.m_48.z;
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _999;
    float _1003 = _981 * _145;
    float _1005 = 1.0 / _989;
    float _1007 = _975 * 2.0;
    float _1009 = _973 * 2.0;
    float _1011 = exp2(_1003);
    int _1013 = as_type<int>(_985) & 1;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>(_985) & 2;
    bool _1019 = _1017 != 0;
    float _1021 = _971 * 2.0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1033 = _1031 != 0;
    float _1035 = floor(_1007);
    float _1037 = _993 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1039 = _1001 * _1005;
    float _1041 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1037);
    float _1043 = floor(_1021);
    float _1045 = -_1011;
    float _1047 = _1045 + 1.0;
    bool _1049 = _1035 > 0.0;
    float _1051 = floor(_1009);
    bool _1053 = _1035 >= 0.0;
    bool _1055 = isnan(_1035);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    float _1063 = _993 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1065 = _993 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1067 = _1061 ? 0 : 1;
    float _1069 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1063);
    float _1071 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1065);
    float _1073 = _973 + _971;
    int _1075 = ~_1067;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    float _1081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1083 = _1043 >= 0.0;
    bool _1085 = isnan(_1043);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = _1073 + (-1.0);
    int _1095 = _1079;
    if (!_1049)
    {
        int _1097 = ~_1067;
        int _1099 = _1097 + 1;
        _1095 = _1099;
    }
    int _1101 = _1095;
    float _1103 = _973 + _975;
    bool _1105 = _1043 > 0.0;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1109 = _1091 ? 0 : 1;
    float _1111 = _1103 + (-1.0);
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_1025;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1131 = ~_1109;
    int _1133 = _1131 + 1;
    int _1135 = _1133 + 1;
    float _1137 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1071);
    float _1139 = _1121 ? _1047 : 0.0;
    float _1141 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1069);
    bool _1143 = _1051 >= 0.0;
    bool _1145 = isnan(_1051);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1041);
    int _1155 = _1135;
    if (!_1105)
    {
        int _1157 = ~_1109;
        int _1159 = _1157 + 1;
        _1155 = _1159;
    }
    int _1161 = _1155;
    float _1163 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1165 = _1051 > 0.0;
    float _1167 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1169 = abs(_1127);
    float _1171 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = in.m_64.x;
    float _1175 = in.m_64.y;
    float _1177 = in.m_64.z;
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1181 = float(_1169);
    bool _1183 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1185 = isnan(1.0);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1191 = _1187 || _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1195 = 1.0 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _1167 + _1197;
    float _1201 = float(_1101);
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1205 = _1163 + _1203;
    float _1207 = 1.0 / _1195;
    float _1209 = _1199 * _1199;
    bool _1211 = !_1029;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1181 * _1201;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1219 = _1171 + _1217;
    float _1221 = fma(_1205, _1205, _1209);
    int _1223 = abs(_1213);
    float _1225 = _1215 * (-2.0);
    float _1227 = float(_1161);
    float _1229 = fma(_1219, _1219, _1221);
    float _1231 = _971 + (-0.5);
    float _1233 = float(_1223);
    float _1235 = sqrt(_1229);
    float _1237 = fma(_1225, _1173, _1173);
    float _1239 = fma(_1107, _1225, _1107);
    if (_1191)
    {
        float _1241 = _1139 * _1207;
        _149 = _1241;
    }
    float _1243 = _149;
    float _1245 = _1233 * _1227;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1237);
    float _1249 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1251 = _1151 ? 0 : 1;
    float _1253 = _1245 * (-2.0);
    float _1255 = fma(_1239, _1243, _1247);
    float _1257 = _1249 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1259 = rsqrt(_1229);
    float _1261 = _973 + (-0.5);
    float _1263 = fma(_1253, _1175, _1175);
    int _1265 = ~_1251;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    float _1271 = fma(_1129, _1253, _1129);
    float _1273 = _1235 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1275 = !_1033;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1263);
    int _1281 = _1269;
    if (!_1165)
    {
        int _1283 = ~_1251;
        int _1285 = _1283 + 1;
        _1281 = _1285;
    }
    int _1287 = _1281;
    float _1289 = _1255 * 0.15915493667125701904296875;
    float _1291 = precise::min(_1257, _1273);
    float _1293 = fma(_1271, _1243, _1279);
    int _1295 = abs(_1277);
    float _1297 = _975 + _971;
    float _1299 = float(_1287);
    float _1301 = _1293 * 0.15915493667125701904296875;
    float _1303 = float(_1295);
    float _1305 = _1259 * _1291;
    float _1307 = _1297 + (-1.0);
    float _1309 = _1289 * 6.283185482025146484375;
    float _1311 = sin(_1309);
    float _1313 = _1199 * _1305;
    float _1315 = _1303 * _1299;
    float _1317 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1319 = _1205 * _1305;
    float _1321 = -_1313;
    float _1323 = _1199 + _1321;
    float _1325 = _1315 * (-2.0);
    bool _1327 = _977 > 0.5;
    float _1329 = -_1319;
    float _1331 = _1205 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1317, _1325, _1317);
    float _1337 = fma(_1325, _1177, _1177);
    float _1339 = _1219 * _1305;
    float _1341 = _1289 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = _975 + (-0.5);
    bool _1347 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1349 = isnan(_969);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1355 = _1351 || _1353;
    float _1357 = float(_1355);
    float _1359 = -_1339;
    float _1361 = _1219 + _1359;
    bool _1363 = _971 > 0.5;
    bool _1365 = _973 > 0.5;
    float _1367 = _1301 * 6.283185482025146484375;
    float _1369 = sin(_1367);
    float _1371 = fma(_1331, _1331, _1333);
    float _1373 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1337);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1377 = _969 + _1375;
    bool _1379 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1381 = isnan(_969);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = fma(_1361, _1361, _1371);
    float _1393 = fma(_1335, _1243, _1373);
    float _1395 = -_1357;
    float _1397 = _1395 + 1.0;
    float _1399 = _1301 * 6.283185482025146484375;
    float _1401 = cos(_1399);
    float _1403 = fma(_1039, _1377, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1405 = _1393 * 0.15915493667125701904296875;
    float _1407 = _1389 * _1397;
    float _1409 = -_1389;
    float _1411 = _1409 + 1.0;
    float _1413 = _1403 * _1407;
    float _1415 = sqrt(_1391);
    bool _1417 = !_1019;
    float _1419 = _1417 ? (-0.5) : 0.5;
    float _1421 = _1311 * _1369;
    float _1423 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1413);
    bool _1425 = !_1015;
    float _1427 = _1425 ? (-0.5) : 0.5;
    float _1429 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1423);
    float _1431 = _1405 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1419);
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1439 = _1437 != 0;
    float _1441 = _1343 * _1369;
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1445 = _1443 != 0;
    float _1447 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1451 = _1449 != 0;
    float _1453 = _1405 * 6.283185482025146484375;
    float _1455 = sin(_1453);
    float _1457 = _1259 * _1415;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1461 = _1459 != 0;
    float _1463 = _1311 * _1401;
    float _1465 = -_1427;
    int _1467 = _1363 ? as_type<int>(_1465) : as_type<int>(_1427);
    float _1469 = _983 * _1457;
    bool _1471 = _975 > 0.5;
    float _1473 = _1249 * _1457;
    float _1475 = _1311 * _1433;
    float _1477 = _1343 * _1401;
    float _1479 = _1469 * _1435;
    float _1481 = _1343 * _1433;
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1427);
    float _1485 = _1401 * _1433;
    float _1487 = _1369 * _1433;
    float _1489 = _1481 * _1479;
    float _1491 = fma(_1455, _1477, _1421);
    float _1493 = fma(_1455, _1421, _1477);
    float _1495 = _1473 * _1483;
    float _1497 = -_1479;
    float _1499 = _1455 * _1497;
    float _1501 = -_1441;
    float _1503 = fma(_1455, _1463, _1501);
    float _1505 = _1475 * _1479;
    float _1507 = -_1463;
    float _1509 = fma(_1455, _1441, _1507);
    float _1511 = fma(_1485, _1495, _1499);
    float _1513 = fma(_1491, _1495, _1489);
    float _1515 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1517 = _1515 * 0.5;
    float _1519 = fma(_1503, _1495, _1505);
    float _1521 = -_1419;
    int _1523 = _1365 ? as_type<int>(_1521) : as_type<int>(_1419);
    float _1525 = fma(_1509, _1517, _1513);
    float _1527 = fma(_1487, _1517, _1511);
    bool _1529 = !_1445;
    float _1531 = _1529 ? _1419 : as_type<float>(_1523);
    float _1533 = fma(_1493, _1517, _1519);
    float _1535 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1537 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1539 = !_1439;
    float _1541 = _1539 ? _1427 : as_type<float>(_1467);
    float _1543 = -_1531;
    float _1545 = _1543 + 0.5;
    float _1547 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1535);
    float _1549 = -_1427;
    int _1551 = _1471 ? as_type<int>(_1549) : as_type<int>(_1427);
    float _1553 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1557 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1537);
    float _1559 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1547);
    float _1561 = _1541 + 0.5;
    bool _1563 = !_1451;
    float _1565 = _1563 ? _1427 : as_type<float>(_1551);
    float _1567 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1557);
    float _1569 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1573 = -_1419;
    int _1575 = _1327 ? as_type<int>(_1573) : as_type<int>(_1419);
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1579 = _1171 + _1569;
    float _1581 = _1565 + 0.5;
    float _1583 = _1555 * _997;
    float _1585 = _1163 + _1577;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1589 = _1579 + _1587;
    bool _1591 = !_1461;
    float _1593 = _1591 ? _1419 : as_type<float>(_1575);
    float _1595 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1597 = _1571 * _1081;
    float _1599 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1603 = _1585 + _1601;
    float _1605 = _1589 * _1589;
    float _1607 = -_1593;
    float _1609 = _1607 + 0.5;
    float _1611 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1613 = _1595 * _1123;
    float _1615 = fma(_1603, _1603, _1605);
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1619 = _939 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1621 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1553);
    float _1623 = sqrt(_1615);
    float _1625 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1627 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1629 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1631 = _1617 * _1179;
    float _1633 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1621);
    float _1635 = -_1455;
    float _1637 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1625);
    float _1639 = -_1455;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1627);
    float _1643 = -_1455;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1629);
    float _1647 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1655 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_66.x = _1597;
    out.m_66.y = _1583;
    out.m_66.z = _1613;
    out.m_66.w = _1631;
    bool _1657 = _1623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_68.x = _1647;
    out.m_68.y = _1649;
    out.m_68.z = _1651;
    out.m_68.w = _1447;
    float _1659 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1661 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1663 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1653);
    float _1665 = _1167 + _1655;
    float _1667 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1669 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1659);
    float _1671 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1661);
    float _1673 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1637);
    float _1675 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1641);
    float _1677 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1645);
    float _1679 = fma(_1667, _1667, 1.0);
    float _1681 = _1447;
    float _1683 = _1585;
    float _1685 = _1579;
    float _1687 = _1673;
    float _1689 = _1313;
    float _1691 = _1339;
    if (!_1657)
    {
        _1681 = _1665;
    }
    float _1693 = _1681;
    bool _1695 = !_1657;
    float _1697 = _1693;
    if (!_1695)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1703 = _1623 + _1701;
        float _1705 = rsqrt(_1615);
        float _1707 = _1703 * _1699;
        float _1709 = _1665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = _1707 * 0.15915493667125701904296875;
        float _1713 = _1711 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = _1711 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1715 + (-1.0);
        float _1723 = fma(_1719, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = _1705 * _1723;
        float _1729 = fma(_1665, _1715, _1725);
        float _1731 = fma(_1603, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1733 = fma(_1589, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1697 = _1729;
        _1683 = _1731;
        _1685 = _1733;
    }
    float _1735 = _1697;
    float _1737 = _1683;
    float _1739 = _1685;
    float _1741 = -_1313;
    float _1743 = _1741 + _1735;
    float _1745 = rsqrt(_1679);
    float _1747 = -_1319;
    float _1749 = _1747 + _1737;
    float _1751 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1755 = _1743 + _1753;
    float _1757 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1759 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1763 = _1749 + _1761;
    float _1765 = _1755 * _1755;
    float _1767 = -_1339;
    float _1769 = _1767 + _1739;
    float _1771 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1751);
    float _1773 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1757);
    float _1775 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1759);
    float _1777 = fma(_1763, _1763, _1765);
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1771);
    float _1785 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1773);
    float _1787 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1789 = fma(_1781, _1781, _1777);
    float _1791 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1669);
    float _1793 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1671);
    float _1795 = _1667 * _1673;
    float _1797 = _1667 * _1675;
    float _1799 = _1667 * _1745;
    float _1801 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1775);
    float _1803 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1663);
    float _1805 = _1667 * _1677;
    float _1807 = sqrt(_1789);
    float _1809 = fma(_1787, _1791, _1797);
    float _1811 = -_1783;
    float _1813 = _1799 * _1811;
    float _1815 = -_1785;
    float _1817 = _1799 * _1815;
    float _1819 = fma(_1787, _1803, _1795);
    float _1821 = -_1801;
    float _1823 = _1799 * _1821;
    float _1825 = fma(_1787, _1793, _1805);
    float _1827 = fma(_1745, _1673, _1813);
    float _1829 = fma(_1745, _1675, _1817);
    float _1831 = fma(_1745, _1677, _1823);
    float _1833 = _1783 + _1819;
    float _1835 = _1785 + _1809;
    float _1837 = _1801 + _1825;
    out.m_70.w = _1291;
    float _1839 = -_1319;
    float _1841 = _1163 + _1839;
    bool _1843 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1845 = isnan(_1807);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1851 = _1847 || _1849;
    out.m_72.x = _1803;
    out.m_72.y = _1791;
    out.m_72.z = _1793;
    float _1853 = -_1313;
    float _1855 = _1167 + _1853;
    float _1857 = -_1339;
    float _1859 = _1171 + _1857;
    out.m_74.x = _1473;
    out.m_76.x = _1827;
    out.m_76.y = _1829;
    out.m_76.z = _1831;
    out.m_78.x = _1833;
    out.m_78.y = _1835;
    out.m_78.z = _1837;
    float _1861 = _1769;
    if (!_1851)
    {
        _1687 = 1.0;
    }
    float _1863 = _1687;
    bool _1865 = !_1851;
    float _1867 = _1863;
    if (!_1865)
    {
        bool _1869 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1871 = isnan(_1807);
        bool _1873 = _1869 || _1871;
        bool _1875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1877 = _1873 || _1875;
        if (!_1877)
        {
            float _1879 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1881 = _1807 + _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1885 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1883;
            float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1891 = 1.0 / _1885;
            float _1893 = _1881 * _1891;
            float _1895 = fma(_1893, _1889, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1867 = _1895;
            _1897 = true;
        }
        else
        {
            bool _1899 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1901 = isnan(_1807);
            bool _1903 = _1899 || _1901;
            bool _1905 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1907 = _1903 || _1905;
            if (!_1907)
            {
                float _1909 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1911 = _1807 + _1909;
                float _1913 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1915 = _1913 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1917 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1919 = _1917 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1921 = 1.0 / _1915;
                float _1923 = _1911 * _1921;
                float _1925 = fma(_1923, _1919, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1867 = _1925;
                _1897 = true;
            }
            else
            {
                _1867 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1897 = false;
    float _1927 = _1867;
    float _1929 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1931 = _1743 + _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1935 = _1749 + _1933;
    float _1937 = fma(_1931, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1941 = _1769 + _1939;
    float _1943 = fma(_1935, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1937 + _1945;
    float _1949 = fma(_1941, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1953 = _1943 + _1951;
    float _1955 = _1947 * _1947;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1959 = _1949 + _1957;
    float _1961 = fma(_1953, _1953, _1955);
    float _1963 = fma(_1959, _1959, _1961);
    float _1965 = rsqrt(_1963);
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1953 * _1967;
    float _1971 = _1959 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1959;
    float _1989 = _1985;
    float _1991 = _1947;
    if (_1981)
    {
        float _1993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _1993;
    }
    float _1995 = _1987;
    if (_1981)
    {
        float _1997 = rsqrt(_1977);
        _1689 = _1997;
    }
    float _1999 = _1689;
    float _2001 = _1999;
    if (_1981)
    {
        float _2003 = _1985 * _1995;
        _1989 = _2003;
    }
    float _2005 = _1989;
    if (_1981)
    {
        float _2007 = _2005 * 0.15915493667125701904296875;
        _1691 = _2007;
    }
    float _2009 = _1691;
    float _2011 = _1955;
    if (_1981)
    {
        float _2013 = _2009 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2021 = precise::max(0.0, _2019);
    float _2023 = _1965;
    float _2025 = _2019;
    float _2027 = _2021;
    if (_1981)
    {
        float _2029 = _2009 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        _2023 = _2031;
    }
    float _2033 = _2023;
    float _2035 = -_1967;
    float _2037 = -_2021;
    float _2039 = fma(_1947, _2035, _2037);
    float _2041 = _2039;
    if (_1981)
    {
        float _2043 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2043;
    }
    float _2045 = _2025;
    float _2047 = _2045;
    float _2049 = _2017;
    if (_1981)
    {
        float _2051 = fma(_2017, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2047 = _2051;
    }
    float _2053 = _2047;
    if (!_1981)
    {
        _2049 = _1973;
    }
    float _2055 = _2049;
    float _2057 = _2033;
    float _2059 = _2055;
    if (_1981)
    {
        float _2061 = _2033 + (-1.0);
        _1991 = _2061;
    }
    float _2063 = _1991;
    if (_1981)
    {
        float _2065 = _1999 * _2053;
        _1861 = _2065;
    }
    float _2067 = _1861;
    if (!_1981)
    {
        _2001 = _1969;
    }
    float _2069 = _2001;
    float _2071 = sqrt(_1963);
    float _2073 = _2069;
    if (_1981)
    {
        float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2027 = _2075;
    }
    float _2077 = _2027;
    if (_1981)
    {
        float _2079 = _1969 * _2067;
        _2073 = _2079;
    }
    float _2081 = _2073;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1981)
    {
        float _2085 = fma(_2039, _2033, _2077);
        _2041 = _2085;
    }
    float _2087 = _2041;
    if (!_1981)
    {
        _2057 = _1971;
    }
    float _2089 = _2057;
    float _2091 = _2089;
    if (_1981)
    {
        float _2093 = _1971 * _2067;
        _2091 = _2093;
    }
    float _2095 = _2091;
    if (_1981)
    {
        float _2097 = _2081 * _2081;
        _2059 = _2097;
    }
    float _2099 = _2059;
    float _2101 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1981)
    {
        _2083 = _1975;
    }
    float _2103 = _2083;
    float _2105 = _2103;
    if (_1981)
    {
        float _2107 = _2095 * _2095;
        _2105 = _2107;
    }
    float _2109 = _2105;
    float _2111 = fma(_2087, _2087, _2099);
    float _2113 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2115 = floor(_2101);
    float _2117 = _2111 + _2109;
    float _2119 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2113);
    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2123 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2121);
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2119);
    float _2129 = rsqrt(_2117);
    float _2131 = -_2125;
    float _2133 = _2131 + 1.0;
    float _2135 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2139 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2141 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = abs(_2133);
    float _2147 = log2(_2145);
    float _2149 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2151 = -_2143;
    float _2153 = fma(_2151, _2137, 1.0);
    float _2155 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = -_2115;
    float _2159 = _2101 + _2157;
    float _2161 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2149);
    float _2163 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2155);
    float _2165 = _2129 * _2081;
    float _2167 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2161);
    float _2169 = _2129 * _2087;
    float _2171 = _2129 * _2095;
    float _2173 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2141);
    float _2175 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2177 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2163);
    float _2179 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2181 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2173);
    float _2183 = -_2175;
    float _2185 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2183);
    float _2187 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2189 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2191 = floor(_2139);
    float _2193 = -_2171;
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2185);
    float _2197 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2199 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2189);
    float _2201 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2203 = fma(_2195, -0.5, 0.5);
    float _2205 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2199);
    float _2209 = log2(_2153);
    float _2211 = fma(_2195, 0.5, 0.5);
    float _2213 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2215 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2213);
    float _2217 = exp2(_2197);
    float _2219 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2201);
    float _2223 = -_2191;
    float _2225 = _2139 + _2223;
    float _2227 = _2169 + 1.0;
    float _2229 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2207);
    float _2231 = fma(_2211, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2221);
    float _2235 = sqrt(_2203);
    float _2237 = _2209 * 0.693147182464599609375;
    float _2239 = fma(_2211, _2231, -0.212114393711090087890625);
    float2 _6281 = float2(_2159, _2225);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6281, float2(0.0), isnan(_6281)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6281, float2(0.0), isnan(_6281)), level(0.0)).x;
    float _2243 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = fma(_2211, _2239, 1.570728778839111328125);
    float _2247 = 1.0 / _2229;
    float _2249 = -_2169;
    float _2251 = fma(_2217, _2227, _2249);
    float _2253 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2233);
    float _2255 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2257 = _2235 * 0.636619746685028076171875;
    float _2259 = -_2245;
    float _2261 = fma(_2257, _2259, 1.0);
    float _2263 = fma(_2251, 0.5, 0.5);
    float _2265 = _2253 * _2247;
    float _2267 = _2255 * _2247;
    float _2269 = fma(_2265, 0.5, 0.5);
    float _2271 = fma(_2267, -0.5, 0.5);
    float3 _6338 = float3(_2269, _2271, _2243);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6338, float3(0.0), isnan(_6338)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6338, float3(0.0), isnan(_6338)), level(0.0)).x;
    float3 _6349 = float3(_2269, _2271, _2243);
    float4 _2276 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).xyzw;
    float _2278 = _2276.x;
    float _2280 = _2276.y;
    float _2282 = _2276.z;
    float _2284 = _2276.w;
    float2 _6365 = float2(_2261, _2263);
    float3 _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).xyz;
    float _2290 = _2288.x;
    float _2292 = _2288.y;
    float _2294 = _2288.z;
    float _2296 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_80.x = _1841;
    out.m_80.y = _1855;
    out.m_80.z = _1859;
    bool _2298 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2300 = isnan(_2071);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2306 = _2302 || _2304;
    float _2308 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2296);
    out.m_82.x = _1943;
    out.m_82.y = _1937;
    out.m_82.z = _1949;
    float _2310 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2308);
    float _2312 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2314 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2316 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2312);
    float _2318 = 1.0 / _2314;
    float _2320 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2316);
    float _2322 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2324 = _2322 + _2314;
    float _2326 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2328 = in.m_84.x;
    float _2330 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2326);
    float _2332 = _2324 * _2318;
    float _2334 = _2332 * 0.5;
    float _2336 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2330);
    float _2338 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2340 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2338);
    float _2342 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2336);
    float _2344 = _2253 + _2229;
    float _2346 = 1.0 / _2340;
    out.gl_Position.x = _2253;
    out.gl_Position.y = _2255;
    out.gl_Position.z = _2342;
    out.gl_Position.w = _2229;
    float _2348 = _2344 * 0.5;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2346 * _2350;
    float _2354 = abs(_2352);
    float _2356 = log2(_2354);
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2360 = exp2(_2358);
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = fma(_2364, -2.0, 3.0);
    float _2368 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2370 = _2364 * _2364;
    bool _2372 = _2352 <= 8000.0;
    bool _2374 = isnan(_2352);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(8000.0);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = _2229 * 0.5;
    float _2386 = _2370 * _2366;
    float _2388 = exp2(_2368);
    float _2390 = -_2386;
    float _2392 = _2390 + 1.0;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2386);
    float _2396 = fma(_2255, -0.5, _2384);
    float _2398 = _2342 + _2229;
    float _2400 = _2229;
    float _2402 = _2342;
    float _2404 = _2255;
    if (!_2306)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2406 = _2400;
    float _2408 = _2382 * _2394;
    float _2410 = _2398 * 0.5;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2306)
    {
        _2402 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2416 = _2402;
    float _2418 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2420 = -_2388;
    float _2422 = _2420 + 1.0;
    float _2424 = _2416;
    float _2426 = _2416;
    if (!_2306)
    {
        _2404 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2404;
    out.m_86.x = _2348;
    out.m_86.y = _2396;
    out.m_86.z = _2410;
    out.m_86.w = _2229;
    float _2430 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2432 = -_2430;
    float _2434 = _2432 + 1.0;
    float _2436 = -_2241;
    float _2438 = _2436 + 1.0;
    float _2440 = _2438 * _2418;
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = -_2442;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2448 = _2446 * _2328;
    float _2450 = _2448 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2450;
    float _2452 = _2430 * _2273;
    float _2454 = _2284 * _2452;
    float _2456 = _2294 * _2452;
    float _2458 = fma(_2290, _2454, _2278);
    float _2460 = fma(_2292, _2454, _2280);
    float _2462 = _2284 * _2434;
    float _2464 = fma(_2284, _2456, _2282);
    float _2466 = _2282;
    float _2468 = _2434;
    float _2470 = _2454;
    float _2472 = _2428;
    float _2474 = _2428;
    if (!_2306)
    {
        _2466 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2476 = _2466;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2306)
    {
        _2468 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2468;
    out.m_90.x = _2458;
    out.m_90.y = _2460;
    out.m_90.z = _2464;
    out.m_90.w = _2462;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2306)
    {
        _2470 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2470;
    bool _2490 = !_2306;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_2071);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _2071 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = 1.0 / _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2514;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2544 = fma(_2538, _2518, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2414 = _2546;
            _2486 = _2552;
            _2480 = _2544;
            _2474 = _2550;
            _2426 = _2548;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_2071);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2478;
            _2480 = _2568;
            if (!_2566)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2412;
            _2414 = _2570;
            if (!_2566)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2424;
            _2426 = _2572;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2472;
            _2474 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_2071);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _2071 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = 1.0 / _2598;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2600;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2630 = fma(_2624, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2414 = _2632;
                    _2486 = _2638;
                    _2480 = _2630;
                    _2474 = _2636;
                    _2426 = _2634;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2414;
    float _2644 = _2486;
    float _2646 = _2480;
    float _2648 = _2474;
    float _2650 = _2426;
    float _2652 = _2494;
    float _2654 = fma(_1835, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_51.x = _2682;
    float _2686 = -_2684;
    float _2688 = _2674 + _2686;
    float _2690 = -_2684;
    float _2692 = _2672 + _2690;
    float _2694 = -_2684;
    float _2696 = _2676 + _2694;
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    float _2702 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    out.m_70.x = _2698;
    out.m_70.y = _2700;
    out.m_70.z = _2702;
    if (!_2670)
    {
        return out;
    }
    float _2704 = -_1937;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1943;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1949;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _1835 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_1833, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_1837, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _2780;
    out.m_92.y = _2782;
    out.m_92.z = _2784;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
    bool _1897 = false;
    bool _961 = false;
    bool _793 = false;
    bool _613 = false;
    bool _391 = false;
    bool _189 = false;
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
        float _2841 = as_type<float>(_127);
        out.gl_Position.z = _2841;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_53.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_111);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_159)
    {
        out.m_51.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2910 = as_type<float>(_165);
        out.gl_Position.z = _2910;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_55.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_111);
        float _193 = 1.0 / _191;
        float _195 = _145 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _211 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _215;
    bool _219 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_197);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = 1.0 / _209;
    bool _233 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _235 = -_229;
    float _237 = _235 + 1.0;
    float _239 = 1.0 / _213;
    float _241 = 1.0 / _217;
    float _243 = _201 * _231;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _247 = _197 + _245;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _249;
    float _253 = _247 * _239;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _255;
    float _259 = fma(_251, _243, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _263 = _261 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _265 = _205 * _241;
    bool _267 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _269 = isnan(_197);
    bool _271 = _267 || _269;
    bool _273 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _275 = _271 || _273;
    float _277 = float(_275);
    float _279 = fma(_257, _243, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _281 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_197);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    bool _293 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_197);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _277 * _237;
    float _307 = -_277;
    float _309 = _307 + 1.0;
    float _311 = -_291;
    float _313 = _311 + 1.0;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _319 = _291 * _309;
    float _321 = fma(_263, _253, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = _303 * _313;
    float _325 = in.m_57.x;
    float _327 = in.m_57.y;
    float _329 = fma(_317, _253, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _331 = -_303;
    float _333 = _331 + 1.0;
    float _335 = _259 * _323;
    float _337 = _279 * _323;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].x, _335);
    float _349 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[143].y, _337);
    float _351 = fma(_341, _265, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_345, _265, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = fma(_329, _319, _347);
    float _357 = fma(_321, _319, _349);
    float _359 = fma(_351, _305, _355);
    float _361 = fma(_353, _305, _357);
    float _363 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    float _367 = _363 * _325;
    float _369 = _365 * _327;
    bool _371 = !_233;
    float _389;
    if (!_371)
    {
        float _373 = in.m_55.x;
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _377 = _373 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[11].x, _145);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_111);
        float _395 = 1.0 / _393;
        float _397 = _145 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _399 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _407 = _399 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _411 = _399 + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _413;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _425 = 1.0 / _415;
    bool _427 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _429 = 1.0 / _423;
    bool _431 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _433 = isnan(_399);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _419;
    float _445 = _403 * _425;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    bool _459 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _461 = isnan(_399);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -_457;
    float _473 = _471 + 1.0;
    float _475 = _407 * _429;
    bool _477 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _479 = isnan(_399);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _489;
    float _493 = _441 * _473;
    float _495 = -_441;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _503 = -_487;
    float _505 = _503 + 1.0;
    float _507 = _411 * _443;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _513;
    float _517 = _469 * _505;
    float _519 = fma(_491, _507, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _521 = fma(_511, _507, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = fma(_515, _507, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _525 = _487 * _497;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _535 = _521 * _517;
    float _537 = _523 * _517;
    float _539 = _519 * _517;
    float _541 = fma(_501, _475, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _543 = fma(_529, _475, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _545 = fma(_533, _475, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _547 = -_469;
    float _549 = _547 + 1.0;
    float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].y, _537);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _553;
    float _557 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].x, _535);
    float _559 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[107].z, _539);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _565;
    float _569 = fma(_541, _525, _557);
    float _571 = fma(_555, _445, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _573 = fma(_563, _445, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _575 = fma(_567, _445, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _577 = fma(_543, _525, _551);
    float _579 = fma(_545, _525, _559);
    float _581 = fma(_573, _493, _569);
    float _583 = fma(_571, _493, _577);
    float _585 = fma(_575, _493, _579);
    float _587 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].x, _581);
    float _589 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].y, _583);
    float _591 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[110].z, _585);
    bool _593 = !_427;
    float _611;
    if (!_593)
    {
        float _595 = in.m_55.x;
        float _597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _599 = _595 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _603 = _601 * _597;
        float _605 = floor(_603);
        float _607 = -_605;
        float _609 = _603 + _607;
        _611 = _609;
        _613 = true;
    }
    else
    {
        float _615 = float(_111);
        float _617 = 1.0 / _615;
        float _619 = _145 * _617;
        _611 = _619;
    }
    _613 = false;
    float _621 = _611;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _621 + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _631 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_621);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _651 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _653 = isnan(_621);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = 1.0 / _629;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _669;
    bool _673 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _675 = isnan(_621);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _661 * _667;
    float _687 = -_661;
    float _689 = _687 + 1.0;
    bool _691 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _693 = 1.0 / _645;
    float _695 = _683 * _689;
    float _697 = -_683;
    float _699 = _697 + 1.0;
    float _701 = 1.0 / _649;
    float _703 = _671 * _663;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _709 = fma(_703, _625, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _711 = _707 * _693;
    bool _713 = _621 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _715 = isnan(_621);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _731 = _621 + _729;
    float _733 = _709 * _695;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _621 + _735;
    float _739 = -_723;
    float _741 = _739 + 1.0;
    float _743 = fma(_711, _731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _745 = _727 * _701;
    float _747 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[115].x, _733);
    float _749 = _641 * _741;
    float _751 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _753 = fma(_745, _737, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _755 = fma(_743, _685, _747);
    float _757 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_753, _749, _755);
    float _763 = _589 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _765 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _767 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[118].x, _761);
    float _769 = _763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _771 = _767 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _759;
    out.m_59.y = _769;
    out.m_59.z = _765;
    out.m_59.w = _771;
    bool _773 = !_691;
    float _791;
    if (!_773)
    {
        float _775 = in.m_55.x;
        float _777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _779 = _775 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _781 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[11].z, _145);
        float _783 = _781 * _777;
        float _785 = floor(_783);
        float _787 = -_785;
        float _789 = _783 + _787;
        _791 = _789;
        _793 = true;
    }
    else
    {
        float _795 = float(_111);
        float _797 = 1.0 / _795;
        float _799 = _145 * _797;
        _791 = _799;
    }
    _793 = false;
    float _801 = _791;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _805 = _801 + _803;
    bool _807 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _809 = isnan(_801);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _815 = _811 || _813;
    float _817 = float(_815);
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _821 = _801 + _819;
    bool _823 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _825 = isnan(_801);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _835;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _843 = _801 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _845 = isnan(_801);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = -_817;
    float _857 = _855 + 1.0;
    float _859 = 1.0 / _841;
    float _861 = _853 * _857;
    float _863 = -_853;
    float _865 = _863 + 1.0;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _867;
    bool _871 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _873 = 1.0 / _837;
    float _875 = _833 * _865;
    float _877 = -_833;
    float _879 = _877 + 1.0;
    float _881 = _821 * _859;
    float _883 = _805 * _873;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    float _893 = fma(_869, _883, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _895 = fma(_887, _883, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _897 = fma(_891, _883, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _899 = _893 * _875;
    float _901 = _895 * _875;
    float _903 = _897 * _875;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _915 = _913 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _917 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].x, _899);
    float _919 = fma(_907, _881, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _921 = fma(_911, _881, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _923 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].y, _901);
    float _925 = fma(_915, _881, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _927 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[123].z, _903);
    float _929 = fma(_919, _861, _917);
    float _931 = fma(_921, _861, _923);
    float _933 = fma(_925, _861, _927);
    float _935 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].x, _929);
    float _937 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].y, _931);
    float _939 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[125].z, _933);
    bool _941 = !_871;
    float _959;
    if (!_941)
    {
        float _943 = in.m_55.x;
        float _945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _947 = _943 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _949 = fma(_947, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _951 = _949 * _945;
        float _953 = floor(_951);
        float _955 = -_953;
        float _957 = _951 + _955;
        _959 = _957;
        _961 = true;
    }
    else
    {
        float _963 = float(_111);
        float _965 = 1.0 / _963;
        float _967 = _145 * _965;
        _959 = _967;
    }
    _961 = false;
    float _969 = _959;
    float _971 = in.m_55.x;
    float _973 = in.m_55.y;
    float _975 = in.m_55.z;
    float _977 = in.m_55.w;
    float _979 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _981 = log2(_979);
    float _983 = _369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _985 = as_type<float>(int(gl_VertexIndex));
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _991 = in.m_48.x;
    float _993 = in.m_48.y;
    float _995 = in.m_48.z;
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _999;
    float _1003 = _981 * _145;
    float _1005 = 1.0 / _989;
    float _1007 = _975 * 2.0;
    float _1009 = _973 * 2.0;
    float _1011 = exp2(_1003);
    int _1013 = as_type<int>(_985) & 1;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>(_985) & 2;
    bool _1019 = _1017 != 0;
    float _1021 = _971 * 2.0;
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1025 = _1023 != 0;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1033 = _1031 != 0;
    float _1035 = floor(_1007);
    float _1037 = _993 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1039 = _1001 * _1005;
    float _1041 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1037);
    float _1043 = floor(_1021);
    float _1045 = -_1011;
    float _1047 = _1045 + 1.0;
    bool _1049 = _1035 > 0.0;
    float _1051 = floor(_1009);
    bool _1053 = _1035 >= 0.0;
    bool _1055 = isnan(_1035);
    bool _1057 = _1053 || _1055;
    bool _1059 = isnan(0.0);
    bool _1061 = _1057 || _1059;
    float _1063 = _993 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1065 = _993 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1067 = _1061 ? 0 : 1;
    float _1069 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1063);
    float _1071 = fma(_991, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1065);
    float _1073 = _973 + _971;
    int _1075 = ~_1067;
    int _1077 = _1075 + 1;
    int _1079 = _1077 + 1;
    float _1081 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1083 = _1043 >= 0.0;
    bool _1085 = isnan(_1043);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = _1073 + (-1.0);
    int _1095 = _1079;
    if (!_1049)
    {
        int _1097 = ~_1067;
        int _1099 = _1097 + 1;
        _1095 = _1099;
    }
    int _1101 = _1095;
    float _1103 = _973 + _975;
    bool _1105 = _1043 > 0.0;
    float _1107 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1109 = _1091 ? 0 : 1;
    float _1111 = _1103 + (-1.0);
    bool _1113 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1115 = isnan(0.0);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1121 = _1117 || _1119;
    float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1125 = !_1025;
    int _1127 = _1125 ? 0 : 1;
    float _1129 = fma(_1111, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1131 = ~_1109;
    int _1133 = _1131 + 1;
    int _1135 = _1133 + 1;
    float _1137 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1071);
    float _1139 = _1121 ? _1047 : 0.0;
    float _1141 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1069);
    bool _1143 = _1051 >= 0.0;
    bool _1145 = isnan(_1051);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = fma(_995, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1041);
    int _1155 = _1135;
    if (!_1105)
    {
        int _1157 = ~_1109;
        int _1159 = _1157 + 1;
        _1155 = _1159;
    }
    int _1161 = _1155;
    float _1163 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1165 = _1051 > 0.0;
    float _1167 = _1153 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1169 = abs(_1127);
    float _1171 = _1137 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1173 = in.m_64.x;
    float _1175 = in.m_64.y;
    float _1177 = in.m_64.z;
    float _1179 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1181 = float(_1169);
    bool _1183 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1185 = isnan(1.0);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1191 = _1187 || _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1195 = 1.0 + _1193;
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1199 = _1167 + _1197;
    float _1201 = float(_1101);
    float _1203 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1205 = _1163 + _1203;
    float _1207 = 1.0 / _1195;
    float _1209 = _1199 * _1199;
    bool _1211 = !_1029;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = _1181 * _1201;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1219 = _1171 + _1217;
    float _1221 = fma(_1205, _1205, _1209);
    int _1223 = abs(_1213);
    float _1225 = _1215 * (-2.0);
    float _1227 = float(_1161);
    float _1229 = fma(_1219, _1219, _1221);
    float _1231 = _971 + (-0.5);
    float _1233 = float(_1223);
    float _1235 = sqrt(_1229);
    float _1237 = fma(_1225, _1173, _1173);
    float _1239 = fma(_1107, _1225, _1107);
    if (_1191)
    {
        float _1241 = _1139 * _1207;
        _149 = _1241;
    }
    float _1243 = _149;
    float _1245 = _1233 * _1227;
    float _1247 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1237);
    float _1249 = _367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1251 = _1151 ? 0 : 1;
    float _1253 = _1245 * (-2.0);
    float _1255 = fma(_1239, _1243, _1247);
    float _1257 = _1249 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1259 = rsqrt(_1229);
    float _1261 = _973 + (-0.5);
    float _1263 = fma(_1253, _1175, _1175);
    int _1265 = ~_1251;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    float _1271 = fma(_1129, _1253, _1129);
    float _1273 = _1235 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1275 = !_1033;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = fma(_1261, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1263);
    int _1281 = _1269;
    if (!_1165)
    {
        int _1283 = ~_1251;
        int _1285 = _1283 + 1;
        _1281 = _1285;
    }
    int _1287 = _1281;
    float _1289 = _1255 * 0.15915493667125701904296875;
    float _1291 = precise::min(_1257, _1273);
    float _1293 = fma(_1271, _1243, _1279);
    int _1295 = abs(_1277);
    float _1297 = _975 + _971;
    float _1299 = float(_1287);
    float _1301 = _1293 * 0.15915493667125701904296875;
    float _1303 = float(_1295);
    float _1305 = _1259 * _1291;
    float _1307 = _1297 + (-1.0);
    float _1309 = _1289 * 6.283185482025146484375;
    float _1311 = sin(_1309);
    float _1313 = _1199 * _1305;
    float _1315 = _1303 * _1299;
    float _1317 = fma(_1307, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1319 = _1205 * _1305;
    float _1321 = -_1313;
    float _1323 = _1199 + _1321;
    float _1325 = _1315 * (-2.0);
    bool _1327 = _977 > 0.5;
    float _1329 = -_1319;
    float _1331 = _1205 + _1329;
    float _1333 = _1323 * _1323;
    float _1335 = fma(_1317, _1325, _1317);
    float _1337 = fma(_1325, _1177, _1177);
    float _1339 = _1219 * _1305;
    float _1341 = _1289 * 6.283185482025146484375;
    float _1343 = cos(_1341);
    float _1345 = _975 + (-0.5);
    bool _1347 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1349 = isnan(_969);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1355 = _1351 || _1353;
    float _1357 = float(_1355);
    float _1359 = -_1339;
    float _1361 = _1219 + _1359;
    bool _1363 = _971 > 0.5;
    bool _1365 = _973 > 0.5;
    float _1367 = _1301 * 6.283185482025146484375;
    float _1369 = sin(_1367);
    float _1371 = fma(_1331, _1331, _1333);
    float _1373 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1337);
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1377 = _969 + _1375;
    bool _1379 = _969 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1381 = isnan(_969);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1387 = _1383 || _1385;
    float _1389 = float(_1387);
    float _1391 = fma(_1361, _1361, _1371);
    float _1393 = fma(_1335, _1243, _1373);
    float _1395 = -_1357;
    float _1397 = _1395 + 1.0;
    float _1399 = _1301 * 6.283185482025146484375;
    float _1401 = cos(_1399);
    float _1403 = fma(_1039, _1377, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1405 = _1393 * 0.15915493667125701904296875;
    float _1407 = _1389 * _1397;
    float _1409 = -_1389;
    float _1411 = _1409 + 1.0;
    float _1413 = _1403 * _1407;
    float _1415 = sqrt(_1391);
    bool _1417 = !_1019;
    float _1419 = _1417 ? (-0.5) : 0.5;
    float _1421 = _1311 * _1369;
    float _1423 = fma(_1411, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1413);
    bool _1425 = !_1015;
    float _1427 = _1425 ? (-0.5) : 0.5;
    float _1429 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1423);
    float _1431 = _1405 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1419);
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1439 = _1437 != 0;
    float _1441 = _1343 * _1369;
    int _1443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1445 = _1443 != 0;
    float _1447 = _1429 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1451 = _1449 != 0;
    float _1453 = _1405 * 6.283185482025146484375;
    float _1455 = sin(_1453);
    float _1457 = _1259 * _1415;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1461 = _1459 != 0;
    float _1463 = _1311 * _1401;
    float _1465 = -_1427;
    int _1467 = _1363 ? as_type<int>(_1465) : as_type<int>(_1427);
    float _1469 = _983 * _1457;
    bool _1471 = _975 > 0.5;
    float _1473 = _1249 * _1457;
    float _1475 = _1311 * _1433;
    float _1477 = _1343 * _1401;
    float _1479 = _1469 * _1435;
    float _1481 = _1343 * _1433;
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1427);
    float _1485 = _1401 * _1433;
    float _1487 = _1369 * _1433;
    float _1489 = _1481 * _1479;
    float _1491 = fma(_1455, _1477, _1421);
    float _1493 = fma(_1455, _1421, _1477);
    float _1495 = _1473 * _1483;
    float _1497 = -_1479;
    float _1499 = _1455 * _1497;
    float _1501 = -_1441;
    float _1503 = fma(_1455, _1463, _1501);
    float _1505 = _1475 * _1479;
    float _1507 = -_1463;
    float _1509 = fma(_1455, _1441, _1507);
    float _1511 = fma(_1485, _1495, _1499);
    float _1513 = fma(_1491, _1495, _1489);
    float _1515 = _1457 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1517 = _1515 * 0.5;
    float _1519 = fma(_1503, _1495, _1505);
    float _1521 = -_1419;
    int _1523 = _1365 ? as_type<int>(_1521) : as_type<int>(_1419);
    float _1525 = fma(_1509, _1517, _1513);
    float _1527 = fma(_1487, _1517, _1511);
    bool _1529 = !_1445;
    float _1531 = _1529 ? _1419 : as_type<float>(_1523);
    float _1533 = fma(_1493, _1517, _1519);
    float _1535 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1537 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _1539 = !_1439;
    float _1541 = _1539 ? _1427 : as_type<float>(_1467);
    float _1543 = -_1531;
    float _1545 = _1543 + 0.5;
    float _1547 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1535);
    float _1549 = -_1427;
    int _1551 = _1471 ? as_type<int>(_1549) : as_type<int>(_1427);
    float _1553 = _1525 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1555 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1557 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1537);
    float _1559 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1547);
    float _1561 = _1541 + 0.5;
    bool _1563 = !_1451;
    float _1565 = _1563 ? _1427 : as_type<float>(_1551);
    float _1567 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1557);
    float _1569 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1571 = _1561 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1573 = -_1419;
    int _1575 = _1327 ? as_type<int>(_1573) : as_type<int>(_1419);
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1579 = _1171 + _1569;
    float _1581 = _1565 + 0.5;
    float _1583 = _1555 * _997;
    float _1585 = _1163 + _1577;
    float _1587 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1589 = _1579 + _1587;
    bool _1591 = !_1461;
    float _1593 = _1591 ? _1419 : as_type<float>(_1575);
    float _1595 = _1581 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1597 = _1571 * _1081;
    float _1599 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1603 = _1585 + _1601;
    float _1605 = _1589 * _1589;
    float _1607 = -_1593;
    float _1609 = _1607 + 0.5;
    float _1611 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1613 = _1595 * _1123;
    float _1615 = fma(_1603, _1603, _1605);
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1619 = _939 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1621 = fma(_1527, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1553);
    float _1623 = sqrt(_1615);
    float _1625 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1627 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1629 = _1481 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1631 = _1617 * _1179;
    float _1633 = fma(_1533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1621);
    float _1635 = -_1455;
    float _1637 = fma(_1635, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1625);
    float _1639 = -_1455;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1627);
    float _1643 = -_1455;
    float _1645 = fma(_1643, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1629);
    float _1647 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1651 = _1619 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1655 = _1633 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    out.m_66.x = _1597;
    out.m_66.y = _1583;
    out.m_66.z = _1613;
    out.m_66.w = _1631;
    bool _1657 = _1623 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    out.m_68.x = _1647;
    out.m_68.y = _1649;
    out.m_68.z = _1651;
    out.m_68.w = _1447;
    float _1659 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1661 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1663 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1653);
    float _1665 = _1167 + _1655;
    float _1667 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1669 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1659);
    float _1671 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1661);
    float _1673 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1637);
    float _1675 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1641);
    float _1677 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1645);
    float _1679 = fma(_1667, _1667, 1.0);
    float _1681 = _1447;
    float _1683 = _1585;
    float _1685 = _1579;
    float _1687 = _1673;
    float _1689 = _1313;
    float _1691 = _1339;
    if (!_1657)
    {
        _1681 = _1665;
    }
    float _1693 = _1681;
    bool _1695 = !_1657;
    float _1697 = _1693;
    if (!_1695)
    {
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1701 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1703 = _1623 + _1701;
        float _1705 = rsqrt(_1615);
        float _1707 = _1703 * _1699;
        float _1709 = _1665 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1711 = _1707 * 0.15915493667125701904296875;
        float _1713 = _1711 * 6.283185482025146484375;
        float _1715 = cos(_1713);
        float _1717 = _1711 * 6.283185482025146484375;
        float _1719 = sin(_1717);
        float _1721 = _1715 + (-1.0);
        float _1723 = fma(_1719, _1709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1727 = _1705 * _1723;
        float _1729 = fma(_1665, _1715, _1725);
        float _1731 = fma(_1603, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1733 = fma(_1589, _1727, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1697 = _1729;
        _1683 = _1731;
        _1685 = _1733;
    }
    float _1735 = _1697;
    float _1737 = _1683;
    float _1739 = _1685;
    float _1741 = -_1313;
    float _1743 = _1741 + _1735;
    float _1745 = rsqrt(_1679);
    float _1747 = -_1319;
    float _1749 = _1747 + _1737;
    float _1751 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1753 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1755 = _1743 + _1753;
    float _1757 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1759 = _1509 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1761 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1763 = _1749 + _1761;
    float _1765 = _1755 * _1755;
    float _1767 = -_1339;
    float _1769 = _1767 + _1739;
    float _1771 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1751);
    float _1773 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1757);
    float _1775 = fma(_1487, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1759);
    float _1777 = fma(_1763, _1763, _1765);
    float _1779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1781 = _1769 + _1779;
    float _1783 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1771);
    float _1785 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1773);
    float _1787 = _1427 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1789 = fma(_1781, _1781, _1777);
    float _1791 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1669);
    float _1793 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1671);
    float _1795 = _1667 * _1673;
    float _1797 = _1667 * _1675;
    float _1799 = _1667 * _1745;
    float _1801 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1775);
    float _1803 = fma(_1503, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1663);
    float _1805 = _1667 * _1677;
    float _1807 = sqrt(_1789);
    float _1809 = fma(_1787, _1791, _1797);
    float _1811 = -_1783;
    float _1813 = _1799 * _1811;
    float _1815 = -_1785;
    float _1817 = _1799 * _1815;
    float _1819 = fma(_1787, _1803, _1795);
    float _1821 = -_1801;
    float _1823 = _1799 * _1821;
    float _1825 = fma(_1787, _1793, _1805);
    float _1827 = fma(_1745, _1673, _1813);
    float _1829 = fma(_1745, _1675, _1817);
    float _1831 = fma(_1745, _1677, _1823);
    float _1833 = _1783 + _1819;
    float _1835 = _1785 + _1809;
    float _1837 = _1801 + _1825;
    out.m_70.w = _1291;
    float _1839 = -_1319;
    float _1841 = _1163 + _1839;
    bool _1843 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1845 = isnan(_1807);
    bool _1847 = _1843 || _1845;
    bool _1849 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1851 = _1847 || _1849;
    out.m_72.x = _1803;
    out.m_72.y = _1791;
    out.m_72.z = _1793;
    float _1853 = -_1313;
    float _1855 = _1167 + _1853;
    float _1857 = -_1339;
    float _1859 = _1171 + _1857;
    out.m_74.x = _1473;
    out.m_76.x = _1827;
    out.m_76.y = _1829;
    out.m_76.z = _1831;
    out.m_78.x = _1833;
    out.m_78.y = _1835;
    out.m_78.z = _1837;
    float _1861 = _1769;
    if (!_1851)
    {
        _1687 = 1.0;
    }
    float _1863 = _1687;
    bool _1865 = !_1851;
    float _1867 = _1863;
    if (!_1865)
    {
        bool _1869 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1871 = isnan(_1807);
        bool _1873 = _1869 || _1871;
        bool _1875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1877 = _1873 || _1875;
        if (!_1877)
        {
            float _1879 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1881 = _1807 + _1879;
            float _1883 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1885 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1883;
            float _1887 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1889 = _1887 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1891 = 1.0 / _1885;
            float _1893 = _1881 * _1891;
            float _1895 = fma(_1893, _1889, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1867 = _1895;
            _1897 = true;
        }
        else
        {
            bool _1899 = _1807 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1901 = isnan(_1807);
            bool _1903 = _1899 || _1901;
            bool _1905 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1907 = _1903 || _1905;
            if (!_1907)
            {
                float _1909 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1911 = _1807 + _1909;
                float _1913 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1915 = _1913 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1917 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1919 = _1917 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1921 = 1.0 / _1915;
                float _1923 = _1911 * _1921;
                float _1925 = fma(_1923, _1919, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1867 = _1925;
                _1897 = true;
            }
            else
            {
                _1867 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1897 = false;
    float _1927 = _1867;
    float _1929 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1931 = _1743 + _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1935 = _1749 + _1933;
    float _1937 = fma(_1931, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1941 = _1769 + _1939;
    float _1943 = fma(_1935, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1945 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1947 = _1937 + _1945;
    float _1949 = fma(_1941, _1927, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1953 = _1943 + _1951;
    float _1955 = _1947 * _1947;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1959 = _1949 + _1957;
    float _1961 = fma(_1953, _1953, _1955);
    float _1963 = fma(_1959, _1959, _1961);
    float _1965 = rsqrt(_1963);
    float _1967 = _1965 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1969 = _1953 * _1967;
    float _1971 = _1959 * _1967;
    float _1973 = _1969 * _1969;
    float _1975 = _1971 * _1971;
    float _1977 = _1973 + _1975;
    float _1979 = sqrt(_1977);
    bool _1981 = _1979 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1985 = _1979 + _1983;
    float _1987 = _1959;
    float _1989 = _1985;
    float _1991 = _1947;
    if (_1981)
    {
        float _1993 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1987 = _1993;
    }
    float _1995 = _1987;
    if (_1981)
    {
        float _1997 = rsqrt(_1977);
        _1689 = _1997;
    }
    float _1999 = _1689;
    float _2001 = _1999;
    if (_1981)
    {
        float _2003 = _1985 * _1995;
        _1989 = _2003;
    }
    float _2005 = _1989;
    if (_1981)
    {
        float _2007 = _2005 * 0.15915493667125701904296875;
        _1691 = _2007;
    }
    float _2009 = _1691;
    float _2011 = _1955;
    if (_1981)
    {
        float _2013 = _2009 * 6.283185482025146484375;
        float _2015 = sin(_2013);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2021 = precise::max(0.0, _2019);
    float _2023 = _1965;
    float _2025 = _2019;
    float _2027 = _2021;
    if (_1981)
    {
        float _2029 = _2009 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        _2023 = _2031;
    }
    float _2033 = _2023;
    float _2035 = -_1967;
    float _2037 = -_2021;
    float _2039 = fma(_1947, _2035, _2037);
    float _2041 = _2039;
    if (_1981)
    {
        float _2043 = _2039 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2025 = _2043;
    }
    float _2045 = _2025;
    float _2047 = _2045;
    float _2049 = _2017;
    if (_1981)
    {
        float _2051 = fma(_2017, _2045, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2047 = _2051;
    }
    float _2053 = _2047;
    if (!_1981)
    {
        _2049 = _1973;
    }
    float _2055 = _2049;
    float _2057 = _2033;
    float _2059 = _2055;
    if (_1981)
    {
        float _2061 = _2033 + (-1.0);
        _1991 = _2061;
    }
    float _2063 = _1991;
    if (_1981)
    {
        float _2065 = _1999 * _2053;
        _1861 = _2065;
    }
    float _2067 = _1861;
    if (!_1981)
    {
        _2001 = _1969;
    }
    float _2069 = _2001;
    float _2071 = sqrt(_1963);
    float _2073 = _2069;
    if (_1981)
    {
        float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2027 = _2075;
    }
    float _2077 = _2027;
    if (_1981)
    {
        float _2079 = _1969 * _2067;
        _2073 = _2079;
    }
    float _2081 = _2073;
    float _2083 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1981)
    {
        float _2085 = fma(_2039, _2033, _2077);
        _2041 = _2085;
    }
    float _2087 = _2041;
    if (!_1981)
    {
        _2057 = _1971;
    }
    float _2089 = _2057;
    float _2091 = _2089;
    if (_1981)
    {
        float _2093 = _1971 * _2067;
        _2091 = _2093;
    }
    float _2095 = _2091;
    if (_1981)
    {
        float _2097 = _2081 * _2081;
        _2059 = _2097;
    }
    float _2099 = _2059;
    float _2101 = fma(_1841, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (!_1981)
    {
        _2083 = _1975;
    }
    float _2103 = _2083;
    float _2105 = _2103;
    if (_1981)
    {
        float _2107 = _2095 * _2095;
        _2105 = _2107;
    }
    float _2109 = _2105;
    float _2111 = fma(_2087, _2087, _2099);
    float _2113 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2115 = floor(_2101);
    float _2117 = _2111 + _2109;
    float _2119 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2113);
    float _2121 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2123 = fma(_2071, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2121);
    float _2125 = precise::clamp(_2123, 0.0, 1.0);
    float _2127 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2119);
    float _2129 = rsqrt(_2117);
    float _2131 = -_2125;
    float _2133 = _2131 + 1.0;
    float _2135 = _2127 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2139 = fma(_1859, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2141 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2143 = _2135 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2145 = abs(_2133);
    float _2147 = log2(_2145);
    float _2149 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2151 = -_2143;
    float _2153 = fma(_2151, _2137, 1.0);
    float _2155 = _1937 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2157 = -_2115;
    float _2159 = _2101 + _2157;
    float _2161 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2149);
    float _2163 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2155);
    float _2165 = _2129 * _2081;
    float _2167 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2161);
    float _2169 = _2129 * _2087;
    float _2171 = _2129 * _2095;
    float _2173 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2141);
    float _2175 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2177 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2163);
    float _2179 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2181 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2173);
    float _2183 = -_2175;
    float _2185 = fma(_2169, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2183);
    float _2187 = _2177 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2189 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2191 = floor(_2139);
    float _2193 = -_2171;
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2185);
    float _2197 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2199 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2189);
    float _2201 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2203 = fma(_2195, -0.5, 0.5);
    float _2205 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2207 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2199);
    float _2209 = log2(_2153);
    float _2211 = fma(_2195, 0.5, 0.5);
    float _2213 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2205);
    float _2215 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2213);
    float _2217 = exp2(_2197);
    float _2219 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2221 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2201);
    float _2223 = -_2191;
    float _2225 = _2139 + _2223;
    float _2227 = _2169 + 1.0;
    float _2229 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2207);
    float _2231 = fma(_2211, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2233 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2221);
    float _2235 = sqrt(_2203);
    float _2237 = _2209 * 0.693147182464599609375;
    float _2239 = fma(_2211, _2231, -0.212114393711090087890625);
    float2 _6281 = float2(_2159, _2225);
    float _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6281, float2(0.0), isnan(_6281)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6281, float2(0.0), isnan(_6281)), level(0.0)).x;
    float _2243 = _2237 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2245 = fma(_2211, _2239, 1.570728778839111328125);
    float _2247 = 1.0 / _2229;
    float _2249 = -_2169;
    float _2251 = fma(_2217, _2227, _2249);
    float _2253 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2233);
    float _2255 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2257 = _2235 * 0.636619746685028076171875;
    float _2259 = -_2245;
    float _2261 = fma(_2257, _2259, 1.0);
    float _2263 = fma(_2251, 0.5, 0.5);
    float _2265 = _2253 * _2247;
    float _2267 = _2255 * _2247;
    float _2269 = fma(_2265, 0.5, 0.5);
    float _2271 = fma(_2267, -0.5, 0.5);
    float3 _6338 = float3(_2269, _2271, _2243);
    float _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6338, float3(0.0), isnan(_6338)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6338, float3(0.0), isnan(_6338)), level(0.0)).x;
    float3 _6349 = float3(_2269, _2271, _2243);
    float4 _2276 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).xyzw;
    float _2278 = _2276.x;
    float _2280 = _2276.y;
    float _2282 = _2276.z;
    float _2284 = _2276.w;
    float2 _6365 = float2(_2261, _2263);
    float3 _2288 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).xyz;
    float _2290 = _2288.x;
    float _2292 = _2288.y;
    float _2294 = _2288.z;
    float _2296 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_80.x = _1841;
    out.m_80.y = _1855;
    out.m_80.z = _1859;
    bool _2298 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2300 = isnan(_2071);
    bool _2302 = _2298 || _2300;
    bool _2304 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2306 = _2302 || _2304;
    float _2308 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2296);
    out.m_82.x = _1943;
    out.m_82.y = _1937;
    out.m_82.z = _1949;
    float _2310 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2308);
    float _2312 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2314 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2316 = fma(_1841, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2312);
    float _2318 = 1.0 / _2314;
    float _2320 = fma(_1859, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2316);
    float _2322 = _2320 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2324 = _2322 + _2314;
    float _2326 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2328 = in.m_84.x;
    float _2330 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2326);
    float _2332 = _2324 * _2318;
    float _2334 = _2332 * 0.5;
    float _2336 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2330);
    float _2338 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2340 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2338);
    float _2342 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2336);
    float _2344 = _2253 + _2229;
    float _2346 = 1.0 / _2340;
    out.gl_Position.x = _2253;
    out.gl_Position.y = _2255;
    out.gl_Position.z = _2342;
    out.gl_Position.w = _2229;
    float _2348 = _2344 * 0.5;
    float _2350 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2352 = _2346 * _2350;
    float _2354 = abs(_2352);
    float _2356 = log2(_2354);
    float _2358 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2360 = exp2(_2358);
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2364 = precise::clamp(_2362, 0.0, 1.0);
    float _2366 = fma(_2364, -2.0, 3.0);
    float _2368 = _2147 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2370 = _2364 * _2364;
    bool _2372 = _2352 <= 8000.0;
    bool _2374 = isnan(_2352);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(8000.0);
    bool _2380 = _2376 || _2378;
    float _2382 = float(_2380);
    float _2384 = _2229 * 0.5;
    float _2386 = _2370 * _2366;
    float _2388 = exp2(_2368);
    float _2390 = -_2386;
    float _2392 = _2390 + 1.0;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2386);
    float _2396 = fma(_2255, -0.5, _2384);
    float _2398 = _2342 + _2229;
    float _2400 = _2229;
    float _2402 = _2342;
    float _2404 = _2255;
    if (!_2306)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2406 = _2400;
    float _2408 = _2382 * _2394;
    float _2410 = _2398 * 0.5;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2306)
    {
        _2402 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2416 = _2402;
    float _2418 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2420 = -_2388;
    float _2422 = _2420 + 1.0;
    float _2424 = _2416;
    float _2426 = _2416;
    if (!_2306)
    {
        _2404 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2428 = _2404;
    out.m_86.x = _2348;
    out.m_86.y = _2396;
    out.m_86.z = _2410;
    out.m_86.w = _2229;
    float _2430 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2432 = -_2430;
    float _2434 = _2432 + 1.0;
    float _2436 = -_2241;
    float _2438 = _2436 + 1.0;
    float _2440 = _2438 * _2418;
    float _2442 = precise::clamp(_2440, 0.0, 1.0);
    float _2444 = -_2442;
    float _2446 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2448 = _2446 * _2328;
    float _2450 = _2448 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _2450;
    float _2452 = _2430 * _2273;
    float _2454 = _2284 * _2452;
    float _2456 = _2294 * _2452;
    float _2458 = fma(_2290, _2454, _2278);
    float _2460 = fma(_2292, _2454, _2280);
    float _2462 = _2284 * _2434;
    float _2464 = fma(_2284, _2456, _2282);
    float _2466 = _2282;
    float _2468 = _2434;
    float _2470 = _2454;
    float _2472 = _2428;
    float _2474 = _2428;
    if (!_2306)
    {
        _2466 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2476 = _2466;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2306)
    {
        _2468 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2468;
    out.m_90.x = _2458;
    out.m_90.y = _2460;
    out.m_90.z = _2464;
    out.m_90.w = _2462;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2306)
    {
        _2470 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2470;
    bool _2490 = !_2306;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_2071);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _2071 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = 1.0 / _2512;
            float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2514;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2544 = fma(_2538, _2518, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2414 = _2546;
            _2486 = _2552;
            _2480 = _2544;
            _2474 = _2550;
            _2426 = _2548;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_2071);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2478;
            _2480 = _2568;
            if (!_2566)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2412;
            _2414 = _2570;
            if (!_2566)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2424;
            _2426 = _2572;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2472;
            _2474 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _2071 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_2071);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _2071 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = 1.0 / _2598;
                    float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2604 = _2602 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2600;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2630 = fma(_2624, _2604, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2414 = _2632;
                    _2486 = _2638;
                    _2480 = _2630;
                    _2474 = _2636;
                    _2426 = _2634;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2414;
    float _2644 = _2486;
    float _2646 = _2480;
    float _2648 = _2474;
    float _2650 = _2426;
    float _2652 = _2494;
    float _2654 = fma(_1835, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2684 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_51.x = _2682;
    float _2686 = -_2684;
    float _2688 = _2674 + _2686;
    float _2690 = -_2684;
    float _2692 = _2672 + _2690;
    float _2694 = -_2684;
    float _2696 = _2676 + _2694;
    float _2698 = fma(_2688, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    float _2700 = fma(_2692, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    float _2702 = fma(_2696, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2684);
    out.m_70.x = _2698;
    out.m_70.y = _2700;
    out.m_70.z = _2702;
    if (!_2670)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2704 = -_1937;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1943;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1949;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _1835 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_1833, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_1837, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _2780;
    out.m_92.y = _2782;
    out.m_92.z = _2784;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

