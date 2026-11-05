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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_60 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_66 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_62 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _457 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2236 = as_type<float>(_113);
        out.gl_Position.z = _2236;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_47.w;
    float _119 = float(_97);
    float _121 = -_117;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = 1.0 / _119;
    bool _137 = _123 >= _119;
    bool _139 = !_133;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    float _145 = _123 * _135;
    float _147 = _145;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _149 = _143 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    out.m_49.x = _145;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_151);
        out.gl_Position.z = _2307;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_54.x;
    float _157 = in.m_54.y;
    float _159 = in.m_54.z;
    int _161 = as_type<int>(_153) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_153) & 2;
    bool _167 = _165 != 0;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_163;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_167;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_169;
    float _199 = _185;
    float _201 = _187;
    float _203 = _183;
    float _221;
    if (!_197)
    {
        float _205 = in.m_56.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _145;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _263 = _225 + _261;
    float _265 = 1.0 / _245;
    float _267 = _237 * _255;
    float _269 = 1.0 / _253;
    float _271 = _229 * _259;
    bool _273 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _275 = isnan(_225);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_283;
    float _287 = _285 + 1.0;
    float _289 = _233 * _265;
    bool _291 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_225);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_225);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_301;
    float _317 = _315 + 1.0;
    float _319 = _301 * _287;
    float _321 = _263 * _269;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    bool _327 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_225);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _313 * _317;
    float _341 = -_313;
    float _343 = _341 + 1.0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_325, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _351 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_225);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = fma(_347, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = _337 * _343;
    float _371 = -_337;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = -_361;
    float _381 = _379 + 1.0;
    float _383 = fma(_365, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _361 * _373;
    float _387 = fma(_377, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = _349 * _385;
    float _399 = _367 * _385;
    float _401 = fma(_391, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = fma(_383, _369, _405);
    float _419 = fma(_387, _369, _407);
    float _421 = fma(_411, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _423 = fma(_415, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _425 = fma(_401, _339, _417);
    float _427 = fma(_403, _339, _419);
    float _429 = fma(_421, _319, _425);
    float _431 = fma(_423, _319, _427);
    float _433 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[147].x, _429);
    float _435 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[147].y, _431);
    bool _437 = !_257;
    float _455;
    if (!_437)
    {
        float _439 = in.m_56.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _145;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _463 = _459 + _461;
    bool _465 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _467 = isnan(_459);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _459 + _477;
    bool _481 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _483 = isnan(_459);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _501 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _503 = isnan(_459);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_475;
    float _515 = _513 + 1.0;
    float _517 = 1.0 / _499;
    float _519 = _511 * _515;
    float _521 = -_511;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _525;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _531 = 1.0 / _495;
    float _533 = _491 * _523;
    float _535 = -_491;
    float _537 = _535 + 1.0;
    float _539 = _479 * _517;
    float _541 = _463 * _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _547;
    float _551 = fma(_527, _541, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _553 = fma(_545, _541, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_549, _541, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = _551 * _533;
    float _559 = _553 * _533;
    float _561 = _555 * _533;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].x, _557);
    float _577 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _579 = fma(_565, _539, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _581 = fma(_569, _539, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _583 = fma(_573, _539, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _585 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].z, _561);
    float _587 = fma(_579, _519, _575);
    float _589 = fma(_581, _519, _577);
    float _591 = fma(_583, _519, _585);
    float _593 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].x, _587);
    float _595 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = in.m_58.x;
    float _599 = in.m_58.y;
    float _601 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].z, _591);
    float _603 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _609;
    out.m_60.y = _611;
    out.m_60.z = _613;
    float _615 = _435 * _599;
    float _617 = _433 * _597;
    bool _619 = !_529;
    if (!_619)
    {
        float _621 = in.m_56.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _147 = _635;
    }
    float _637 = _147;
    float _639 = in.m_42.x;
    float _641 = in.m_42.y;
    float _643 = in.m_42.z;
    float _645 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _649 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _651 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _653 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _655 = _645 * _647;
    float _657 = _649 * _651;
    float _659 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _661 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _665 = _663 != 0;
    float _667 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _659);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _675 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _671);
    float _679 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _673);
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _685 = _641 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _687 = _641 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _689 = _641 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _691 = 0;
    int _693 = 0;
    float _695 = _667;
    if (_665)
    {
        _691 = 0;
        _693 = 0;
    }
    int _697 = _691;
    int _699 = _693;
    float _701 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].x, _685);
    float _703 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].x, _687);
    float _705 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    float _707 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[6].z, _701);
    float _709 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[4].z, _703);
    float _711 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _709 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _715 = _711 + _681;
    float _717 = _713 + _683;
    float _719 = in.m_56.z;
    float _721 = in.m_56.w;
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _725 = _715 + _723;
    float _727 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _729 = _717 + _727;
    float _731 = _725 * _725;
    float _733 = fma(_729, _729, _731);
    float _735 = _731;
    float _737 = _615;
    int _739 = _697;
    int _741 = _699;
    float _743 = _733;
    float _745 = _713;
    if (_665)
    {
        float _747 = in.m_56.x;
        float _749 = in.m_56.y;
        _735 = _747;
        _737 = _749;
    }
    float _751 = _735;
    float _753 = _737;
    float _755 = sqrt(_733);
    bool _757 = _721 > 0.5;
    float _759 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[5].z, _705);
    bool _761 = _719 > 0.5;
    float _763 = _759 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _765 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = 0.0;
    float _769 = _753;
    float _771 = _751;
    float _773 = _719;
    if (_665)
    {
        _767 = _751;
    }
    float _775 = _767;
    float _777 = 0.0;
    float _779 = _775;
    if (_665)
    {
        _777 = _753;
    }
    float _781 = _777;
    float _783 = _781;
    if (!_665)
    {
        float _785 = in.m_56.x;
        float _787 = in.m_56.y;
        float _789 = _785 * 3.1415927410125732421875;
        float _791 = _789 * 0.15915493667125701904296875;
        float _793 = _787 * 3.1415927410125732421875;
        float _795 = _793 * 0.15915493667125701904296875;
        float _797 = _791 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = sin(_801);
        _769 = _787;
        _771 = _785;
        _783 = _803;
        _739 = 2;
        _741 = 1;
        _779 = _799;
    }
    float _805 = _769;
    float _807 = _771;
    float _809 = _783;
    int _811 = _739;
    int _813 = _741;
    float _815 = _779;
    bool _817 = _805 > 0.5;
    float _819 = _679 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _821 = -_195;
    float _823 = _761 ? _821 : _195;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _835 = _833 != 0;
    float _837 = _763 + _819;
    float _839 = -_195;
    int _841 = _757 ? as_type<int>(_839) : as_type<int>(_195);
    float _843 = -_191;
    int _845 = _817 ? as_type<int>(_843) : as_type<int>(_191);
    bool _847 = !_835;
    float _849 = _847 ? _195 : _823;
    bool _851 = !_827;
    float _853 = _851 ? _195 : as_type<float>(_841);
    bool _855 = !_831;
    float _857 = _855 ? _191 : as_type<float>(_845);
    float _859 = _819;
    float _861 = _823;
    if (!_765)
    {
        _859 = _717;
    }
    float _863 = _859;
    float _865 = _863;
    if (!_765)
    {
        _861 = _715;
    }
    float _867 = _861;
    float _869 = _867;
    if (!_765)
    {
        _695 = _837;
    }
    float _871 = _695;
    bool _873 = !_765;
    float _875 = _871;
    if (!_873)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _881 = _755 + _879;
        float _883 = _837 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _885 = rsqrt(_733);
        float _887 = _881 * _877;
        float _889 = _887 * 0.15915493667125701904296875;
        float _891 = _889 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 + (-1.0);
        float _901 = fma(_897, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _905 = _885 * _901;
        float _907 = fma(_837, _893, _903);
        float _909 = fma(_729, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_725, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _875 = _907;
        _865 = _909;
        _869 = _911;
    }
    float _913 = _875;
    float _915 = _865;
    float _917 = _869;
    float _919 = -_763;
    float _921 = _919 + _913;
    float _923 = -_713;
    float _925 = _923 + _915;
    float _927 = -_711;
    float _929 = _927 + _917;
    float _931 = _763 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _933 = _921 * _921;
    bool _935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _937 = isnan(0.5);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _943 = _939 || _941;
    float _945 = fma(_925, _925, _933);
    bool _947 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _949 = isnan(0.5);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _955 = _951 || _953;
    float _957 = fma(_929, _929, _945);
    float _959 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _931);
    float _961 = _763 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _963 = sqrt(_957);
    float _965 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _959);
    float _967 = _965 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _969 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _961);
    float _971 = 1.0 / _967;
    float _973 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _969);
    float _975 = _973 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _977 = _963 > 0.0;
    float _979 = _975 + _967;
    float _981 = _979 * _971;
    float _983 = _981 * 0.5;
    bool _985 = !_977;
    float _987 = _915;
    float _989 = _913;
    float _991 = _917;
    float _993 = _971;
    float _995 = _963;
    if (!_985)
    {
        float _997 = _185 * _185;
        float _999 = fma(_183, _183, _997);
        float _1001 = fma(_187, _187, _999);
        float _1003 = rsqrt(_957);
        float _1005 = sqrt(_1001);
        float _1007 = _925 * _1003;
        float _1009 = _921 * _1003;
        float _1011 = _929 * _1003;
        bool _1013 = _1005 > 0.0;
        bool _1015 = !_1013;
        _993 = _1003;
        _995 = _1001;
        _743 = _1007;
        if (!_1015)
        {
            float _1017 = rsqrt(_1001);
            float _1019 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1021 = _185 * _1017;
            float _1023 = _183 * _1017;
            float _1025 = _1009 * _1021;
            float _1027 = _187 * _1017;
            float _1029 = fma(_1007, _1023, _1025);
            float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1033 = fma(_1011, _1027, _1029);
            float _1035 = _1033 * _1031;
            float _1037 = fma(_183, _1035, _915);
            float _1039 = fma(_185, _1035, _913);
            float _1041 = fma(_187, _1035, _917);
            _987 = _1037;
            _989 = _1039;
            _991 = _1041;
            _993 = _1023;
            _995 = _1017;
        }
    }
    float _1043 = _987;
    float _1045 = _989;
    float _1047 = _991;
    float _1049 = _993;
    float _1051 = _995;
    float _1053 = _743;
    float _1055 = _1051;
    float _1057 = _1049;
    float _1059 = _1053;
    if (_955)
    {
        _1055 = 1.0;
    }
    float _1061 = _1055;
    float _1063 = _1061;
    if (_943)
    {
        _199 = _1043;
    }
    float _1065 = _199;
    float _1067 = _1065;
    if (_943)
    {
        _201 = _1045;
    }
    float _1069 = _201;
    float _1071 = _1069;
    if (_943)
    {
        _203 = _1047;
    }
    float _1073 = _203;
    float _1075 = _1073;
    if (!_943)
    {
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1079 = _763 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1083 = _713 + _1081;
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = _1079 * _1079;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1091 = _711 + _1089;
        float _1093 = fma(_1083, _1083, _1087);
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1097 = fma(_1091, _1091, _1093);
        float _1099 = sqrt(_1097);
        float _1101 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1103 = precise::min(_1099, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1105 = _1103 * _1095;
        float _1107 = -_713;
        float _1109 = _1107 + _1043;
        float _1111 = -_711;
        float _1113 = _1111 + _1047;
        float _1115 = _1101 * _1105;
        float _1117 = -_763;
        float _1119 = _1117 + _1045;
        float _1121 = fma(_1109, _1115, _713);
        float _1123 = fma(_1119, _1115, _763);
        float _1125 = fma(_1113, _1115, _711);
        _1071 = _1123;
        _1067 = _1121;
        _1075 = _1125;
        _1057 = _1115;
    }
    float _1127 = _1071;
    float _1129 = _1067;
    float _1131 = _1075;
    float _1133 = _1057;
    float _1135 = _1133;
    if (!_955)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1145 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1143);
        float _1147 = _1139 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1141 * 0.15915493667125701904296875;
        float _1153 = _1139 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1145;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1175 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1173;
        float _1177 = 1.0 / _1169;
        float _1179 = 1.0 / _1175;
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1183 = _1171 * _1181;
        float _1185 = _1167 * _1177;
        float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1189 = fma(_1185, _1183, _1187);
        float _1191 = _1189 * _1179;
        float _1193 = precise::clamp(_1191, 0.0, 1.0);
        _745 = _1177;
        _1135 = _1151;
        _1063 = _1193;
    }
    float _1195 = _745;
    float _1197 = _1135;
    float _1199 = _1063;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1127 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1129 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1131 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1223 = _1207 * _1221;
    float _1225 = _1211 * _1221;
    float _1227 = _1223 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 + _1229;
    float _1233 = sqrt(_1231);
    bool _1235 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = _1233 + _1237;
    float _1241 = _1219;
    float _1243 = _1231;
    float _1245 = _1239;
    float _1247 = _1195;
    float _1249 = _1203;
    float _1251 = _1197;
    bool _1253 = _1235;
    if (_1235)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1255;
    }
    float _1257 = _1241;
    if (_1235)
    {
        float _1259 = rsqrt(_1231);
        _1243 = _1259;
    }
    float _1261 = _1243;
    float _1263 = _1261;
    if (_1235)
    {
        float _1265 = _1239 * _1257;
        _1245 = _1265;
    }
    float _1267 = _1245;
    if (_1235)
    {
        float _1269 = _1267 * 0.15915493667125701904296875;
        _1247 = _1269;
    }
    float _1271 = _1247;
    float _1273 = _1211;
    if (_1235)
    {
        float _1275 = _1271 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        _1273 = _1277;
    }
    float _1279 = _1273;
    float _1281 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1283 = precise::max(0.0, _1281);
    float _1285 = _1257;
    float _1287 = _1283;
    if (_1235)
    {
        float _1289 = _1271 * 6.283185482025146484375;
        float _1291 = cos(_1289);
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = -_1221;
    float _1297 = -_1283;
    float _1299 = fma(_1203, _1295, _1297);
    if (_1235)
    {
        float _1301 = _1299 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1249 = _1301;
    }
    float _1303 = _1249;
    float _1305 = sqrt(_1217);
    float _1307 = _1303;
    float _1309 = _1279;
    if (_1235)
    {
        float _1311 = fma(_1279, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = _1313;
    if (!_1235)
    {
        _1309 = _1223;
    }
    float _1317 = _1309;
    float _1319 = _1317;
    float _1321 = _1293;
    if (_1235)
    {
        float _1323 = _1293 + (-1.0);
        _1287 = _1323;
    }
    float _1325 = _1287;
    float _1327 = _1325;
    if (_1235)
    {
        float _1329 = _1261 * _1313;
        _1059 = _1329;
    }
    float _1331 = _1059;
    if (!_1235)
    {
        _1315 = _1299;
    }
    float _1333 = _1315;
    float _1335 = _1333;
    if (_1235)
    {
        float _1337 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1251 = _1337;
    }
    float _1339 = _1251;
    if (_1235)
    {
        float _1341 = _1223 * _1331;
        _1319 = _1341;
    }
    float _1343 = _1319;
    if (!_1235)
    {
        _1327 = _1225;
    }
    float _1345 = _1327;
    float _1347 = _1345;
    if (_1235)
    {
        float _1349 = _1225 * _1331;
        _1347 = _1349;
    }
    float _1351 = _1347;
    if (!_1235)
    {
        _1263 = _1227;
    }
    float _1353 = _1263;
    float _1355 = _1353;
    if (_1235)
    {
        float _1357 = fma(_1299, _1293, _1339);
        _1335 = _1357;
    }
    float _1359 = _1335;
    if (_1235)
    {
        float _1361 = _1343 * _1343;
        _1355 = _1361;
    }
    float _1363 = _1355;
    if (!_1235)
    {
        _1321 = _1229;
    }
    float _1365 = _1321;
    float _1367 = _1365;
    if (_1235)
    {
        float _1369 = _1351 * _1351;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = fma(_1359, _1359, _1363);
    float _1375 = _1373 + _1371;
    float _1377 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1381 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1379);
    float _1383 = precise::clamp(_1381, 0.0, 1.0);
    float _1385 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1387 = rsqrt(_1375);
    float _1389 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1377);
    float _1391 = -_1383;
    float _1393 = _1391 + 1.0;
    float _1395 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1385);
    float _1397 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1399 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1389);
    float _1401 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1403 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1405 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1395);
    float _1407 = abs(_1393);
    float _1409 = log2(_1407);
    float _1411 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1401);
    float _1413 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1403);
    float _1415 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1417 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1419 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1411);
    float _1421 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1413);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1425 = _1387 * _1343;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1431 = _1387 * _1359;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1423);
    float _1437 = _1387 * _1351;
    float _1439 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1441 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1443 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1435);
    float _1445 = -_1433;
    float _1447 = fma(_1431, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1445);
    float _1449 = -_1439;
    float _1451 = fma(_1449, _1397, 1.0);
    float _1453 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1455 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1443);
    float _1457 = -_1437;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1447);
    float _1461 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1463 = exp2(_1441);
    float _1465 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1453);
    float _1467 = fma(_1459, -0.5, 0.5);
    float _1469 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1461);
    float _1471 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1465);
    float _1473 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1469);
    float _1475 = 1.0 / _1455;
    float _1477 = fma(_1459, 0.5, 0.5);
    float _1479 = _1431 + 1.0;
    float _1481 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1473);
    float _1483 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1471);
    float _1485 = fma(_1477, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1487 = log2(_1451);
    float _1489 = fma(_1477, _1485, -0.212114393711090087890625);
    float _1491 = -_1431;
    float _1493 = fma(_1463, _1479, _1491);
    float _1495 = fma(_1477, _1489, 1.570728778839111328125);
    float _1497 = fma(_1493, 0.5, 0.5);
    float _1499 = sqrt(_1467);
    float _1501 = _1481 * _1475;
    float _1503 = _1483 * _1475;
    float _1505 = fma(_1501, 0.5, 0.5);
    float _1507 = fma(_1503, -0.5, 0.5);
    float _1509 = _1487 * 0.693147182464599609375;
    float _1511 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1513 = _1499 * 0.636619746685028076171875;
    float3 _4473 = float3(_1505, _1507, _1511);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4473, float3(0.0), isnan(_4473)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4473, float3(0.0), isnan(_4473)), level(0.0)).x;
    float3 _4484 = float3(_1505, _1507, _1511);
    float4 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4484, float3(0.0), isnan(_4484)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4484, float3(0.0), isnan(_4484)), level(0.0)).xyzw;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _1518.w;
    float _1528 = -_1495;
    float _1530 = fma(_1513, _1528, 1.0);
    float2 _4506 = float2(_1530, _1497);
    float3 _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4506, float2(0.0), isnan(_4506)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4506, float2(0.0), isnan(_4506)), level(0.0)).xyz;
    float _1536 = _1534.x;
    float _1538 = _1534.y;
    float _1540 = _1534.z;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1544 = _1542 != 0;
    float _1546 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1550 = _1548 != 0;
    float _1552 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1554 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1556 = exp2(_1546);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1558;
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1564 = _1562 != 0;
    float _1566 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1570 = _1568 != 0;
    float _1572 = 0.5;
    if (_1544)
    {
        float _1574 = in.m_56.w;
        _1572 = _1574;
    }
    float _1576 = _1572;
    float _1578 = fma(_1554, _1554, 1.0);
    float _1580 = 1.0 / _1560;
    float _1582 = 0.0;
    if (_1550)
    {
        float _1584 = in.m_56.x;
        _1582 = _1584;
    }
    float _1586 = _1582;
    float _1588 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1552);
    float _1590 = rsqrt(_1578);
    float _1592 = -_1556;
    float _1594 = _1592 + 1.0;
    float _1596 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1588);
    float _1598 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1600;
    float _1604 = _1576;
    if (_1544)
    {
        float _1606 = _1576 * 3.1415927410125732421875;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = 0.0;
    if (_1544)
    {
        float _1612 = _1608 * 0.15915493667125701904296875;
        _1610 = _1612;
    }
    float _1614 = _1610;
    float _1616 = _1614;
    if (_1544)
    {
        float _1618 = _1614 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        _1616 = _1620;
    }
    float _1622 = _1616;
    out.m_62.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_62.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_62.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _1624 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1626 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1628 = _1622;
    if (_1544)
    {
        bool _1630 = _1622 > 0.5;
        _1253 = _1630;
    }
    bool _1632 = _1253;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1566);
    if (!_1544)
    {
        _1628 = _191;
    }
    float _1636 = _1628;
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1626);
    float _1640 = _1636;
    if (_1544)
    {
        float _1642 = -_191;
        float _1644 = _1632 ? _1642 : _191;
        _1640 = _1644;
    }
    float _1646 = _1640;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1650 = _1648 != 0;
    float _1652 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1654 = _1554 * _1590;
    bool _1656 = _807 > 0.5;
    float _1658 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1652);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1662 = _637 + _1660;
    float _1664 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1668 = _1654 * _1666;
    float _1670 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1672 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1674 = _1662 * _1580;
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1678 = _1654 * _1676;
    float _1680 = fma(_1602, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1682 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1684 = isnan(_637);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1694;
    out.m_64.x = _1664;
    out.m_64.y = _1670;
    out.m_64.z = _1672;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1698;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1704 = _1674;
    bool _1706 = _1656;
    if (_1550)
    {
        float _1708 = _1586 * 3.1415927410125732421875;
        _1702 = _1708;
    }
    float _1710 = _1702;
    float _1712 = fma(_1696, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1714 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1716 = isnan(_637);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = fma(_1700, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    if (_1550)
    {
        float _1728 = _1710 * 0.15915493667125701904296875;
        _1704 = _1728;
    }
    float _1730 = _1704;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1734 = _1654 * _1732;
    float _1736 = _1730;
    if (_1550)
    {
        float _1738 = _1730 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = -_1692;
    float _1746 = _1744 + 1.0;
    float _1748 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1734);
    float _1750 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1678);
    float _1752 = _1724 * _1746;
    float _1754 = -_1724;
    float _1756 = _1754 + 1.0;
    float _1758 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1668);
    float _1760 = _809 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1762 = _1712 * _1752;
    float _1764 = _1680 * _1752;
    float _1766 = _1726 * _1752;
    float _1768 = -_191;
    int _1770 = _761 ? as_type<int>(_1768) : as_type<int>(_191);
    float _1772 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1762);
    float _1774 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1764);
    float _1776 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1766);
    float _1778 = -_191;
    int _1780 = _1656 ? as_type<int>(_1778) : as_type<int>(_191);
    out.m_66.x = _1748;
    out.m_66.y = _1758;
    out.m_66.z = _1750;
    if (_1550)
    {
        bool _1782 = _1742 > 0.5;
        _1706 = _1782;
    }
    bool _1784 = _1706;
    bool _1786 = _811 != 2;
    float _1788 = _807 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1792 = -_195;
    int _1794 = _817 ? as_type<int>(_1792) : as_type<int>(_195);
    float _1796 = -_1790;
    float _1798 = fma(_1788, 2.0, _1796);
    float _1800 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1772);
    float _1802 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1774);
    float _1804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1806 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1776);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1812 = _813 != 1;
    float _1814 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1808);
    float _1816 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1824 = fma(_1816, -2.0, _1810);
    float _1826 = _1816;
    if (!_1550)
    {
        _1826 = _195;
    }
    float _1828 = _1826;
    float _1830 = fma(_1760, -2.0, _1818);
    float _1832 = _1828;
    if (_1550)
    {
        float _1834 = -_195;
        float _1836 = _1784 ? _1834 : _195;
        _1832 = _1836;
    }
    float _1838 = _1832;
    float _1840 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1820);
    float _1842 = _815 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1844 = !_1650;
    float _1846 = _1844 ? _191 : as_type<float>(_1770);
    float _1848 = _1838 + (-0.5);
    bool _1850 = !_1564;
    float _1852 = _1850 ? _191 : as_type<float>(_1780);
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1856 = !_1570;
    float _1858 = _1856 ? _195 : as_type<float>(_1794);
    float _1860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1862 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1864 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1830);
    float _1866 = -_1854;
    float _1868 = fma(_1842, 2.0, _1866);
    float _1870 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1872 = -_1862;
    float _1874 = -_1864;
    float _1876 = fma(_1872, _1848, _1874);
    float _1878 = -_123;
    float _1880 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1868);
    float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1884 = _1646 + 0.5;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1890 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1892 = fma(_1870, _1884, _1880);
    float _1894 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1896 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1888);
    float _1898 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1900 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1902 = -_123;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    float _1906 = _1852 + 0.5;
    float _1908 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = fma(_1900, _1906, _1904);
    float _1916 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1918 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1814);
    float _1920 = _1898;
    float _1922 = _1886;
    float _1924 = _1892;
    if (_1786)
    {
        _1920 = _807;
    }
    float _1926 = _1920;
    out.m_68.x = _1908;
    out.m_68.y = _1910;
    out.m_68.z = _1912;
    float _1928 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1824);
    float _1930 = _1926;
    if (!_1786)
    {
        _1930 = _719;
    }
    float _1932 = _1930;
    float _1934 = _1858 + (-0.5);
    float _1936 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1840);
    float _1938 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1886);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1942 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1944 = _1942;
    if (!_1812)
    {
        _1922 = _805;
    }
    float _1946 = _1922;
    float _1948 = -_1916;
    float _1950 = -_1928;
    float _1952 = fma(_1948, _1934, _1950);
    float _1954 = -_1918;
    float _1956 = _1954 + 1.0;
    float _1958 = -_1936;
    float _1960 = _1958 + 1.0;
    float _1962 = -_1940;
    float _1964 = fma(_1942, 2.0, _1962);
    float _1966 = _1946;
    if (!_1812)
    {
        _1944 = _1946;
    }
    float _1968 = _1944;
    float _1970 = -_1956;
    float _1972 = fma(_1970, _1646, _1892);
    float _1974 = fma(_1960, _1838, _1876);
    float _1976 = _1968;
    float _1978 = _1972;
    if (!_1812)
    {
        _1924 = _719;
    }
    float _1980 = _1924;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = _1980;
    if (_1812)
    {
        _1966 = _807;
    }
    float _1986 = _1966;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1812)
    {
        _1984 = _805;
    }
    float _1990 = _1984;
    float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1988);
    float _1996 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    if (_1812)
    {
        _1976 = _807;
    }
    float _1998 = _1976;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1812)
    {
        _773 = _805;
    }
    float _2002 = _773;
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_70.x = _1972;
    out.m_70.y = _1974;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2008 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2012 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1938);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2018 = fma(_2008, -2.0, _2010);
    float _2020 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2000);
    float _2024 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1786)
    {
        _1978 = _805;
    }
    float _2026 = _1978;
    float _2028 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2016);
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2032 = _2026;
    if (!_1786)
    {
        _2032 = _807;
    }
    float _2034 = _2032;
    float _2036 = -_2006;
    float _2038 = fma(_2024, 2.0, _2036);
    float _2040 = -_123;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1964);
    float _2044 = _1846 + 0.5;
    float _2046 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2048 = -_123;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2038);
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2054 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2056 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2058 = _853 + (-0.5);
    float _2060 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2018);
    float _2062 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1994);
    float _2064 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1996);
    float _2066 = fma(_2046, -2.0, _2052);
    float _2068 = fma(_2020, _2044, _2050);
    float _2070 = -_2054;
    float _2072 = _2070 + 1.0;
    float _2074 = -_2056;
    float _2076 = -_2060;
    float _2078 = fma(_2074, _2058, _2076);
    float _2080 = -_2012;
    float _2082 = _2080 + 1.0;
    float _2084 = -_2062;
    float _2086 = _2084 + 1.0;
    float _2088 = -_2064;
    float _2090 = _2088 + 1.0;
    float _2092 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2094 = _857 + 0.5;
    float _2096 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2028);
    float _2098 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1896);
    float _2100 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2066);
    float _2102 = -_2072;
    float _2104 = fma(_1852, _2102, _1914);
    float _2106 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2108 = _849 + (-0.5);
    float _2110 = fma(_1858, _2082, _1952);
    float _2112 = -_2086;
    float _2114 = fma(_1846, _2112, _2068);
    float _2116 = fma(_853, _2090, _2078);
    float _2118 = fma(_2092, _2094, _2042);
    float _2120 = -_2096;
    float _2122 = _2120 + 1.0;
    float _2124 = -_2106;
    float _2126 = -_2100;
    float _2128 = fma(_2124, _2108, _2126);
    float _2130 = -_2098;
    float _2132 = _2130 + 1.0;
    out.m_72.x = _2104;
    out.m_72.y = _2110;
    out.m_72.z = _2114;
    out.m_72.w = _2116;
    float _2134 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1596);
    float _2136 = -_2122;
    float _2138 = fma(_857, _2136, _2118);
    bool _2140 = _1199 > 0.0;
    bool _2142 = isnan(_1199);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = fma(_849, _2132, _2128);
    float _2152 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2154 = _2134 + _1455;
    out.m_74.x = _2138;
    out.m_74.y = _2150;
    float _2156 = _2154 * 0.5;
    out.gl_Position.x = _1481;
    out.gl_Position.y = _1483;
    out.gl_Position.z = _2134;
    out.gl_Position.w = _1455;
    float _2158 = _2152 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_76.z = _2156;
    out.m_76.w = _1455;
    out.m_45.x = _2158;
    float _2160 = _1598 * _1515;
    float _2162 = -_1598;
    float _2164 = _2162 + 1.0;
    float _2166 = _1526 * _2160;
    float _2168 = _1526 * _2164;
    float _2170 = _1540 * _2160;
    float _2172 = fma(_1536, _2166, _1520);
    float _2174 = fma(_1538, _2166, _1522);
    float _2176 = fma(_1526, _2170, _1524);
    out.m_78.x = _2172;
    out.m_78.y = _2174;
    out.m_78.z = _2176;
    out.m_78.w = _2168;
    if (_2148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2178;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _457 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2236 = as_type<float>(_113);
        out.gl_Position.z = _2236;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_47.w;
    float _119 = float(_97);
    float _121 = -_117;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = 1.0 / _119;
    bool _137 = _123 >= _119;
    bool _139 = !_133;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    float _145 = _123 * _135;
    float _147 = _145;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _149 = _143 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    out.m_49.x = _145;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_151);
        out.gl_Position.z = _2307;
    }
    if (_141)
    {
        return out;
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_54.x;
    float _157 = in.m_54.y;
    float _159 = in.m_54.z;
    int _161 = as_type<int>(_153) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_153) & 2;
    bool _167 = _165 != 0;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_163;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_167;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_169;
    float _199 = _185;
    float _201 = _187;
    float _203 = _183;
    float _221;
    if (!_197)
    {
        float _205 = in.m_56.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _145;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _263 = _225 + _261;
    float _265 = 1.0 / _245;
    float _267 = _237 * _255;
    float _269 = 1.0 / _253;
    float _271 = _229 * _259;
    bool _273 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _275 = isnan(_225);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_283;
    float _287 = _285 + 1.0;
    float _289 = _233 * _265;
    bool _291 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_225);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_225);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_301;
    float _317 = _315 + 1.0;
    float _319 = _301 * _287;
    float _321 = _263 * _269;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    bool _327 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_225);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _313 * _317;
    float _341 = -_313;
    float _343 = _341 + 1.0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_325, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _351 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_225);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = fma(_347, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = _337 * _343;
    float _371 = -_337;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = -_361;
    float _381 = _379 + 1.0;
    float _383 = fma(_365, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _361 * _373;
    float _387 = fma(_377, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = _349 * _385;
    float _399 = _367 * _385;
    float _401 = fma(_391, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = fma(_383, _369, _405);
    float _419 = fma(_387, _369, _407);
    float _421 = fma(_411, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _423 = fma(_415, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _425 = fma(_401, _339, _417);
    float _427 = fma(_403, _339, _419);
    float _429 = fma(_421, _319, _425);
    float _431 = fma(_423, _319, _427);
    float _433 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[147].x, _429);
    float _435 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[147].y, _431);
    bool _437 = !_257;
    float _455;
    if (!_437)
    {
        float _439 = in.m_56.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _145;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _463 = _459 + _461;
    bool _465 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _467 = isnan(_459);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _459 + _477;
    bool _481 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _483 = isnan(_459);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _501 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _503 = isnan(_459);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_475;
    float _515 = _513 + 1.0;
    float _517 = 1.0 / _499;
    float _519 = _511 * _515;
    float _521 = -_511;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _525;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _531 = 1.0 / _495;
    float _533 = _491 * _523;
    float _535 = -_491;
    float _537 = _535 + 1.0;
    float _539 = _479 * _517;
    float _541 = _463 * _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _547;
    float _551 = fma(_527, _541, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _553 = fma(_545, _541, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_549, _541, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = _551 * _533;
    float _559 = _553 * _533;
    float _561 = _555 * _533;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].x, _557);
    float _577 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _579 = fma(_565, _539, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _581 = fma(_569, _539, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _583 = fma(_573, _539, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _585 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].z, _561);
    float _587 = fma(_579, _519, _575);
    float _589 = fma(_581, _519, _577);
    float _591 = fma(_583, _519, _585);
    float _593 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].x, _587);
    float _595 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = in.m_58.x;
    float _599 = in.m_58.y;
    float _601 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].z, _591);
    float _603 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _609;
    out.m_60.y = _611;
    out.m_60.z = _613;
    float _615 = _435 * _599;
    float _617 = _433 * _597;
    bool _619 = !_529;
    if (!_619)
    {
        float _621 = in.m_56.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _147 = _635;
    }
    float _637 = _147;
    float _639 = in.m_42.x;
    float _641 = in.m_42.y;
    float _643 = in.m_42.z;
    float _645 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _649 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _651 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _653 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _655 = _645 * _647;
    float _657 = _649 * _651;
    float _659 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _661 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _665 = _663 != 0;
    float _667 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _659);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _675 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _671);
    float _679 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _673);
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _685 = _641 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _687 = _641 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _689 = _641 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _691 = 0;
    int _693 = 0;
    float _695 = _667;
    if (_665)
    {
        _691 = 0;
        _693 = 0;
    }
    int _697 = _691;
    int _699 = _693;
    float _701 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].x, _685);
    float _703 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].x, _687);
    float _705 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    float _707 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[6].z, _701);
    float _709 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[4].z, _703);
    float _711 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _709 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _715 = _711 + _681;
    float _717 = _713 + _683;
    float _719 = in.m_56.z;
    float _721 = in.m_56.w;
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _725 = _715 + _723;
    float _727 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _729 = _717 + _727;
    float _731 = _725 * _725;
    float _733 = fma(_729, _729, _731);
    float _735 = _731;
    float _737 = _615;
    int _739 = _697;
    int _741 = _699;
    float _743 = _733;
    float _745 = _713;
    if (_665)
    {
        float _747 = in.m_56.x;
        float _749 = in.m_56.y;
        _735 = _747;
        _737 = _749;
    }
    float _751 = _735;
    float _753 = _737;
    float _755 = sqrt(_733);
    bool _757 = _721 > 0.5;
    float _759 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[5].z, _705);
    bool _761 = _719 > 0.5;
    float _763 = _759 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _765 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = 0.0;
    float _769 = _753;
    float _771 = _751;
    float _773 = _719;
    if (_665)
    {
        _767 = _751;
    }
    float _775 = _767;
    float _777 = 0.0;
    float _779 = _775;
    if (_665)
    {
        _777 = _753;
    }
    float _781 = _777;
    float _783 = _781;
    if (!_665)
    {
        float _785 = in.m_56.x;
        float _787 = in.m_56.y;
        float _789 = _785 * 3.1415927410125732421875;
        float _791 = _789 * 0.15915493667125701904296875;
        float _793 = _787 * 3.1415927410125732421875;
        float _795 = _793 * 0.15915493667125701904296875;
        float _797 = _791 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = sin(_801);
        _769 = _787;
        _771 = _785;
        _783 = _803;
        _739 = 2;
        _741 = 1;
        _779 = _799;
    }
    float _805 = _769;
    float _807 = _771;
    float _809 = _783;
    int _811 = _739;
    int _813 = _741;
    float _815 = _779;
    bool _817 = _805 > 0.5;
    float _819 = _679 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _821 = -_195;
    float _823 = _761 ? _821 : _195;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _835 = _833 != 0;
    float _837 = _763 + _819;
    float _839 = -_195;
    int _841 = _757 ? as_type<int>(_839) : as_type<int>(_195);
    float _843 = -_191;
    int _845 = _817 ? as_type<int>(_843) : as_type<int>(_191);
    bool _847 = !_835;
    float _849 = _847 ? _195 : _823;
    bool _851 = !_827;
    float _853 = _851 ? _195 : as_type<float>(_841);
    bool _855 = !_831;
    float _857 = _855 ? _191 : as_type<float>(_845);
    float _859 = _819;
    float _861 = _823;
    if (!_765)
    {
        _859 = _717;
    }
    float _863 = _859;
    float _865 = _863;
    if (!_765)
    {
        _861 = _715;
    }
    float _867 = _861;
    float _869 = _867;
    if (!_765)
    {
        _695 = _837;
    }
    float _871 = _695;
    bool _873 = !_765;
    float _875 = _871;
    if (!_873)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _881 = _755 + _879;
        float _883 = _837 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _885 = rsqrt(_733);
        float _887 = _881 * _877;
        float _889 = _887 * 0.15915493667125701904296875;
        float _891 = _889 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 + (-1.0);
        float _901 = fma(_897, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _905 = _885 * _901;
        float _907 = fma(_837, _893, _903);
        float _909 = fma(_729, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_725, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _875 = _907;
        _865 = _909;
        _869 = _911;
    }
    float _913 = _875;
    float _915 = _865;
    float _917 = _869;
    float _919 = -_763;
    float _921 = _919 + _913;
    float _923 = -_713;
    float _925 = _923 + _915;
    float _927 = -_711;
    float _929 = _927 + _917;
    float _931 = _763 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _933 = _921 * _921;
    bool _935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _937 = isnan(0.5);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _943 = _939 || _941;
    float _945 = fma(_925, _925, _933);
    bool _947 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _949 = isnan(0.5);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _955 = _951 || _953;
    float _957 = fma(_929, _929, _945);
    float _959 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _931);
    float _961 = _763 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _963 = sqrt(_957);
    float _965 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _959);
    float _967 = _965 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _969 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _961);
    float _971 = 1.0 / _967;
    float _973 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _969);
    float _975 = _973 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _977 = _963 > 0.0;
    float _979 = _975 + _967;
    float _981 = _979 * _971;
    float _983 = _981 * 0.5;
    bool _985 = !_977;
    float _987 = _915;
    float _989 = _913;
    float _991 = _917;
    float _993 = _971;
    float _995 = _963;
    if (!_985)
    {
        float _997 = _185 * _185;
        float _999 = fma(_183, _183, _997);
        float _1001 = fma(_187, _187, _999);
        float _1003 = rsqrt(_957);
        float _1005 = sqrt(_1001);
        float _1007 = _925 * _1003;
        float _1009 = _921 * _1003;
        float _1011 = _929 * _1003;
        bool _1013 = _1005 > 0.0;
        bool _1015 = !_1013;
        _993 = _1003;
        _995 = _1001;
        _743 = _1007;
        if (!_1015)
        {
            float _1017 = rsqrt(_1001);
            float _1019 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1021 = _185 * _1017;
            float _1023 = _183 * _1017;
            float _1025 = _1009 * _1021;
            float _1027 = _187 * _1017;
            float _1029 = fma(_1007, _1023, _1025);
            float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1033 = fma(_1011, _1027, _1029);
            float _1035 = _1033 * _1031;
            float _1037 = fma(_183, _1035, _915);
            float _1039 = fma(_185, _1035, _913);
            float _1041 = fma(_187, _1035, _917);
            _987 = _1037;
            _989 = _1039;
            _991 = _1041;
            _993 = _1023;
            _995 = _1017;
        }
    }
    float _1043 = _987;
    float _1045 = _989;
    float _1047 = _991;
    float _1049 = _993;
    float _1051 = _995;
    float _1053 = _743;
    float _1055 = _1051;
    float _1057 = _1049;
    float _1059 = _1053;
    if (_955)
    {
        _1055 = 1.0;
    }
    float _1061 = _1055;
    float _1063 = _1061;
    if (_943)
    {
        _199 = _1043;
    }
    float _1065 = _199;
    float _1067 = _1065;
    if (_943)
    {
        _201 = _1045;
    }
    float _1069 = _201;
    float _1071 = _1069;
    if (_943)
    {
        _203 = _1047;
    }
    float _1073 = _203;
    float _1075 = _1073;
    if (!_943)
    {
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1079 = _763 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1083 = _713 + _1081;
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = _1079 * _1079;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1091 = _711 + _1089;
        float _1093 = fma(_1083, _1083, _1087);
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1097 = fma(_1091, _1091, _1093);
        float _1099 = sqrt(_1097);
        float _1101 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1103 = precise::min(_1099, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1105 = _1103 * _1095;
        float _1107 = -_713;
        float _1109 = _1107 + _1043;
        float _1111 = -_711;
        float _1113 = _1111 + _1047;
        float _1115 = _1101 * _1105;
        float _1117 = -_763;
        float _1119 = _1117 + _1045;
        float _1121 = fma(_1109, _1115, _713);
        float _1123 = fma(_1119, _1115, _763);
        float _1125 = fma(_1113, _1115, _711);
        _1071 = _1123;
        _1067 = _1121;
        _1075 = _1125;
        _1057 = _1115;
    }
    float _1127 = _1071;
    float _1129 = _1067;
    float _1131 = _1075;
    float _1133 = _1057;
    float _1135 = _1133;
    if (!_955)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1145 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1143);
        float _1147 = _1139 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1141 * 0.15915493667125701904296875;
        float _1153 = _1139 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1145;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1175 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1173;
        float _1177 = 1.0 / _1169;
        float _1179 = 1.0 / _1175;
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1183 = _1171 * _1181;
        float _1185 = _1167 * _1177;
        float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1189 = fma(_1185, _1183, _1187);
        float _1191 = _1189 * _1179;
        float _1193 = precise::clamp(_1191, 0.0, 1.0);
        _745 = _1177;
        _1135 = _1151;
        _1063 = _1193;
    }
    float _1195 = _745;
    float _1197 = _1135;
    float _1199 = _1063;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1127 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1129 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1131 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1223 = _1207 * _1221;
    float _1225 = _1211 * _1221;
    float _1227 = _1223 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 + _1229;
    float _1233 = sqrt(_1231);
    bool _1235 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = _1233 + _1237;
    float _1241 = _1219;
    float _1243 = _1231;
    float _1245 = _1239;
    float _1247 = _1195;
    float _1249 = _1203;
    float _1251 = _1197;
    bool _1253 = _1235;
    if (_1235)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1255;
    }
    float _1257 = _1241;
    if (_1235)
    {
        float _1259 = rsqrt(_1231);
        _1243 = _1259;
    }
    float _1261 = _1243;
    float _1263 = _1261;
    if (_1235)
    {
        float _1265 = _1239 * _1257;
        _1245 = _1265;
    }
    float _1267 = _1245;
    if (_1235)
    {
        float _1269 = _1267 * 0.15915493667125701904296875;
        _1247 = _1269;
    }
    float _1271 = _1247;
    float _1273 = _1211;
    if (_1235)
    {
        float _1275 = _1271 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        _1273 = _1277;
    }
    float _1279 = _1273;
    float _1281 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1283 = precise::max(0.0, _1281);
    float _1285 = _1257;
    float _1287 = _1283;
    if (_1235)
    {
        float _1289 = _1271 * 6.283185482025146484375;
        float _1291 = cos(_1289);
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = -_1221;
    float _1297 = -_1283;
    float _1299 = fma(_1203, _1295, _1297);
    if (_1235)
    {
        float _1301 = _1299 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1249 = _1301;
    }
    float _1303 = _1249;
    float _1305 = sqrt(_1217);
    float _1307 = _1303;
    float _1309 = _1279;
    if (_1235)
    {
        float _1311 = fma(_1279, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = _1313;
    if (!_1235)
    {
        _1309 = _1223;
    }
    float _1317 = _1309;
    float _1319 = _1317;
    float _1321 = _1293;
    if (_1235)
    {
        float _1323 = _1293 + (-1.0);
        _1287 = _1323;
    }
    float _1325 = _1287;
    float _1327 = _1325;
    if (_1235)
    {
        float _1329 = _1261 * _1313;
        _1059 = _1329;
    }
    float _1331 = _1059;
    if (!_1235)
    {
        _1315 = _1299;
    }
    float _1333 = _1315;
    float _1335 = _1333;
    if (_1235)
    {
        float _1337 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1251 = _1337;
    }
    float _1339 = _1251;
    if (_1235)
    {
        float _1341 = _1223 * _1331;
        _1319 = _1341;
    }
    float _1343 = _1319;
    if (!_1235)
    {
        _1327 = _1225;
    }
    float _1345 = _1327;
    float _1347 = _1345;
    if (_1235)
    {
        float _1349 = _1225 * _1331;
        _1347 = _1349;
    }
    float _1351 = _1347;
    if (!_1235)
    {
        _1263 = _1227;
    }
    float _1353 = _1263;
    float _1355 = _1353;
    if (_1235)
    {
        float _1357 = fma(_1299, _1293, _1339);
        _1335 = _1357;
    }
    float _1359 = _1335;
    if (_1235)
    {
        float _1361 = _1343 * _1343;
        _1355 = _1361;
    }
    float _1363 = _1355;
    if (!_1235)
    {
        _1321 = _1229;
    }
    float _1365 = _1321;
    float _1367 = _1365;
    if (_1235)
    {
        float _1369 = _1351 * _1351;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = fma(_1359, _1359, _1363);
    float _1375 = _1373 + _1371;
    float _1377 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1381 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1379);
    float _1383 = precise::clamp(_1381, 0.0, 1.0);
    float _1385 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1387 = rsqrt(_1375);
    float _1389 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1377);
    float _1391 = -_1383;
    float _1393 = _1391 + 1.0;
    float _1395 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1385);
    float _1397 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1399 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1389);
    float _1401 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1403 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1405 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1395);
    float _1407 = abs(_1393);
    float _1409 = log2(_1407);
    float _1411 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1401);
    float _1413 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1403);
    float _1415 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1417 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1419 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1411);
    float _1421 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1413);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1425 = _1387 * _1343;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1431 = _1387 * _1359;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1423);
    float _1437 = _1387 * _1351;
    float _1439 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1441 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1443 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1435);
    float _1445 = -_1433;
    float _1447 = fma(_1431, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1445);
    float _1449 = -_1439;
    float _1451 = fma(_1449, _1397, 1.0);
    float _1453 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1455 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1443);
    float _1457 = -_1437;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1447);
    float _1461 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1463 = exp2(_1441);
    float _1465 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1453);
    float _1467 = fma(_1459, -0.5, 0.5);
    float _1469 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1461);
    float _1471 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1465);
    float _1473 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1469);
    float _1475 = 1.0 / _1455;
    float _1477 = fma(_1459, 0.5, 0.5);
    float _1479 = _1431 + 1.0;
    float _1481 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1473);
    float _1483 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1471);
    float _1485 = fma(_1477, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1487 = log2(_1451);
    float _1489 = fma(_1477, _1485, -0.212114393711090087890625);
    float _1491 = -_1431;
    float _1493 = fma(_1463, _1479, _1491);
    float _1495 = fma(_1477, _1489, 1.570728778839111328125);
    float _1497 = fma(_1493, 0.5, 0.5);
    float _1499 = sqrt(_1467);
    float _1501 = _1481 * _1475;
    float _1503 = _1483 * _1475;
    float _1505 = fma(_1501, 0.5, 0.5);
    float _1507 = fma(_1503, -0.5, 0.5);
    float _1509 = _1487 * 0.693147182464599609375;
    float _1511 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1513 = _1499 * 0.636619746685028076171875;
    float3 _4473 = float3(_1505, _1507, _1511);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4473, float3(0.0), isnan(_4473)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4473, float3(0.0), isnan(_4473)), level(0.0)).x;
    float3 _4484 = float3(_1505, _1507, _1511);
    float4 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4484, float3(0.0), isnan(_4484)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4484, float3(0.0), isnan(_4484)), level(0.0)).xyzw;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _1518.w;
    float _1528 = -_1495;
    float _1530 = fma(_1513, _1528, 1.0);
    float2 _4506 = float2(_1530, _1497);
    float3 _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4506, float2(0.0), isnan(_4506)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4506, float2(0.0), isnan(_4506)), level(0.0)).xyz;
    float _1536 = _1534.x;
    float _1538 = _1534.y;
    float _1540 = _1534.z;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1544 = _1542 != 0;
    float _1546 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1550 = _1548 != 0;
    float _1552 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1554 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1556 = exp2(_1546);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1558;
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1564 = _1562 != 0;
    float _1566 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1570 = _1568 != 0;
    float _1572 = 0.5;
    if (_1544)
    {
        float _1574 = in.m_56.w;
        _1572 = _1574;
    }
    float _1576 = _1572;
    float _1578 = fma(_1554, _1554, 1.0);
    float _1580 = 1.0 / _1560;
    float _1582 = 0.0;
    if (_1550)
    {
        float _1584 = in.m_56.x;
        _1582 = _1584;
    }
    float _1586 = _1582;
    float _1588 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1552);
    float _1590 = rsqrt(_1578);
    float _1592 = -_1556;
    float _1594 = _1592 + 1.0;
    float _1596 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1588);
    float _1598 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1600;
    float _1604 = _1576;
    if (_1544)
    {
        float _1606 = _1576 * 3.1415927410125732421875;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = 0.0;
    if (_1544)
    {
        float _1612 = _1608 * 0.15915493667125701904296875;
        _1610 = _1612;
    }
    float _1614 = _1610;
    float _1616 = _1614;
    if (_1544)
    {
        float _1618 = _1614 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        _1616 = _1620;
    }
    float _1622 = _1616;
    out.m_62.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_62.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_62.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _1624 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1626 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1628 = _1622;
    if (_1544)
    {
        bool _1630 = _1622 > 0.5;
        _1253 = _1630;
    }
    bool _1632 = _1253;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1566);
    if (!_1544)
    {
        _1628 = _191;
    }
    float _1636 = _1628;
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1626);
    float _1640 = _1636;
    if (_1544)
    {
        float _1642 = -_191;
        float _1644 = _1632 ? _1642 : _191;
        _1640 = _1644;
    }
    float _1646 = _1640;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1650 = _1648 != 0;
    float _1652 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1654 = _1554 * _1590;
    bool _1656 = _807 > 0.5;
    float _1658 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1652);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1662 = _637 + _1660;
    float _1664 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1668 = _1654 * _1666;
    float _1670 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1672 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1674 = _1662 * _1580;
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1678 = _1654 * _1676;
    float _1680 = fma(_1602, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1682 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1684 = isnan(_637);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1694;
    out.m_64.x = _1664;
    out.m_64.y = _1670;
    out.m_64.z = _1672;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1698;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1704 = _1674;
    bool _1706 = _1656;
    if (_1550)
    {
        float _1708 = _1586 * 3.1415927410125732421875;
        _1702 = _1708;
    }
    float _1710 = _1702;
    float _1712 = fma(_1696, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1714 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1716 = isnan(_637);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = fma(_1700, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    if (_1550)
    {
        float _1728 = _1710 * 0.15915493667125701904296875;
        _1704 = _1728;
    }
    float _1730 = _1704;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1734 = _1654 * _1732;
    float _1736 = _1730;
    if (_1550)
    {
        float _1738 = _1730 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = -_1692;
    float _1746 = _1744 + 1.0;
    float _1748 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1734);
    float _1750 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1678);
    float _1752 = _1724 * _1746;
    float _1754 = -_1724;
    float _1756 = _1754 + 1.0;
    float _1758 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1668);
    float _1760 = _809 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1762 = _1712 * _1752;
    float _1764 = _1680 * _1752;
    float _1766 = _1726 * _1752;
    float _1768 = -_191;
    int _1770 = _761 ? as_type<int>(_1768) : as_type<int>(_191);
    float _1772 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1762);
    float _1774 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1764);
    float _1776 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1766);
    float _1778 = -_191;
    int _1780 = _1656 ? as_type<int>(_1778) : as_type<int>(_191);
    out.m_66.x = _1748;
    out.m_66.y = _1758;
    out.m_66.z = _1750;
    if (_1550)
    {
        bool _1782 = _1742 > 0.5;
        _1706 = _1782;
    }
    bool _1784 = _1706;
    bool _1786 = _811 != 2;
    float _1788 = _807 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1792 = -_195;
    int _1794 = _817 ? as_type<int>(_1792) : as_type<int>(_195);
    float _1796 = -_1790;
    float _1798 = fma(_1788, 2.0, _1796);
    float _1800 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1772);
    float _1802 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1774);
    float _1804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1806 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1776);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1812 = _813 != 1;
    float _1814 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1808);
    float _1816 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1824 = fma(_1816, -2.0, _1810);
    float _1826 = _1816;
    if (!_1550)
    {
        _1826 = _195;
    }
    float _1828 = _1826;
    float _1830 = fma(_1760, -2.0, _1818);
    float _1832 = _1828;
    if (_1550)
    {
        float _1834 = -_195;
        float _1836 = _1784 ? _1834 : _195;
        _1832 = _1836;
    }
    float _1838 = _1832;
    float _1840 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1820);
    float _1842 = _815 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1844 = !_1650;
    float _1846 = _1844 ? _191 : as_type<float>(_1770);
    float _1848 = _1838 + (-0.5);
    bool _1850 = !_1564;
    float _1852 = _1850 ? _191 : as_type<float>(_1780);
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1856 = !_1570;
    float _1858 = _1856 ? _195 : as_type<float>(_1794);
    float _1860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1862 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1864 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1830);
    float _1866 = -_1854;
    float _1868 = fma(_1842, 2.0, _1866);
    float _1870 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1872 = -_1862;
    float _1874 = -_1864;
    float _1876 = fma(_1872, _1848, _1874);
    float _1878 = -_123;
    float _1880 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1868);
    float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1884 = _1646 + 0.5;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1890 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1892 = fma(_1870, _1884, _1880);
    float _1894 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1896 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1888);
    float _1898 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1900 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1902 = -_123;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    float _1906 = _1852 + 0.5;
    float _1908 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = fma(_1900, _1906, _1904);
    float _1916 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1918 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1814);
    float _1920 = _1898;
    float _1922 = _1886;
    float _1924 = _1892;
    if (_1786)
    {
        _1920 = _807;
    }
    float _1926 = _1920;
    out.m_68.x = _1908;
    out.m_68.y = _1910;
    out.m_68.z = _1912;
    float _1928 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1824);
    float _1930 = _1926;
    if (!_1786)
    {
        _1930 = _719;
    }
    float _1932 = _1930;
    float _1934 = _1858 + (-0.5);
    float _1936 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1840);
    float _1938 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1886);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1942 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1944 = _1942;
    if (!_1812)
    {
        _1922 = _805;
    }
    float _1946 = _1922;
    float _1948 = -_1916;
    float _1950 = -_1928;
    float _1952 = fma(_1948, _1934, _1950);
    float _1954 = -_1918;
    float _1956 = _1954 + 1.0;
    float _1958 = -_1936;
    float _1960 = _1958 + 1.0;
    float _1962 = -_1940;
    float _1964 = fma(_1942, 2.0, _1962);
    float _1966 = _1946;
    if (!_1812)
    {
        _1944 = _1946;
    }
    float _1968 = _1944;
    float _1970 = -_1956;
    float _1972 = fma(_1970, _1646, _1892);
    float _1974 = fma(_1960, _1838, _1876);
    float _1976 = _1968;
    float _1978 = _1972;
    if (!_1812)
    {
        _1924 = _719;
    }
    float _1980 = _1924;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = _1980;
    if (_1812)
    {
        _1966 = _807;
    }
    float _1986 = _1966;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1812)
    {
        _1984 = _805;
    }
    float _1990 = _1984;
    float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1988);
    float _1996 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    if (_1812)
    {
        _1976 = _807;
    }
    float _1998 = _1976;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1812)
    {
        _773 = _805;
    }
    float _2002 = _773;
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_70.x = _1972;
    out.m_70.y = _1974;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2008 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2012 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1938);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2018 = fma(_2008, -2.0, _2010);
    float _2020 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2000);
    float _2024 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1786)
    {
        _1978 = _805;
    }
    float _2026 = _1978;
    float _2028 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2016);
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2032 = _2026;
    if (!_1786)
    {
        _2032 = _807;
    }
    float _2034 = _2032;
    float _2036 = -_2006;
    float _2038 = fma(_2024, 2.0, _2036);
    float _2040 = -_123;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1964);
    float _2044 = _1846 + 0.5;
    float _2046 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2048 = -_123;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2038);
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2054 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2056 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2058 = _853 + (-0.5);
    float _2060 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2018);
    float _2062 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1994);
    float _2064 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1996);
    float _2066 = fma(_2046, -2.0, _2052);
    float _2068 = fma(_2020, _2044, _2050);
    float _2070 = -_2054;
    float _2072 = _2070 + 1.0;
    float _2074 = -_2056;
    float _2076 = -_2060;
    float _2078 = fma(_2074, _2058, _2076);
    float _2080 = -_2012;
    float _2082 = _2080 + 1.0;
    float _2084 = -_2062;
    float _2086 = _2084 + 1.0;
    float _2088 = -_2064;
    float _2090 = _2088 + 1.0;
    float _2092 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2094 = _857 + 0.5;
    float _2096 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2028);
    float _2098 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1896);
    float _2100 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2066);
    float _2102 = -_2072;
    float _2104 = fma(_1852, _2102, _1914);
    float _2106 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2108 = _849 + (-0.5);
    float _2110 = fma(_1858, _2082, _1952);
    float _2112 = -_2086;
    float _2114 = fma(_1846, _2112, _2068);
    float _2116 = fma(_853, _2090, _2078);
    float _2118 = fma(_2092, _2094, _2042);
    float _2120 = -_2096;
    float _2122 = _2120 + 1.0;
    float _2124 = -_2106;
    float _2126 = -_2100;
    float _2128 = fma(_2124, _2108, _2126);
    float _2130 = -_2098;
    float _2132 = _2130 + 1.0;
    out.m_72.x = _2104;
    out.m_72.y = _2110;
    out.m_72.z = _2114;
    out.m_72.w = _2116;
    float _2134 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1596);
    float _2136 = -_2122;
    float _2138 = fma(_857, _2136, _2118);
    bool _2140 = _1199 > 0.0;
    bool _2142 = isnan(_1199);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = fma(_849, _2132, _2128);
    float _2152 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2154 = _2134 + _1455;
    out.m_74.x = _2138;
    out.m_74.y = _2150;
    float _2156 = _2154 * 0.5;
    out.gl_Position.x = _1481;
    out.gl_Position.y = _1483;
    out.gl_Position.z = _2134;
    out.gl_Position.w = _1455;
    float _2158 = _2152 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_76.z = _2156;
    out.m_76.w = _1455;
    out.m_45.x = _2158;
    float _2160 = _1598 * _1515;
    float _2162 = -_1598;
    float _2164 = _2162 + 1.0;
    float _2166 = _1526 * _2160;
    float _2168 = _1526 * _2164;
    float _2170 = _1540 * _2160;
    float _2172 = fma(_1536, _2166, _1520);
    float _2174 = fma(_1538, _2166, _1522);
    float _2176 = fma(_1526, _2170, _1524);
    out.m_78.x = _2172;
    out.m_78.y = _2174;
    out.m_78.z = _2176;
    out.m_78.w = _2168;
    if (_2148)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2178;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _457 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_42.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    float _105 = as_type<float>(_97);
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _103;
    if (!_101)
    {
        out.m_45.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _107 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2236 = as_type<float>(_113);
        out.gl_Position.z = _2236;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_47.w;
    float _119 = float(_97);
    float _121 = -_117;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_117);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = 1.0 / _119;
    bool _137 = _123 >= _119;
    bool _139 = !_133;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    float _145 = _123 * _135;
    float _147 = _145;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _149 = _143 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    out.m_49.x = _145;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2307 = as_type<float>(_151);
        out.gl_Position.z = _2307;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = as_type<float>(int(gl_VertexIndex));
    float _155 = in.m_54.x;
    float _157 = in.m_54.y;
    float _159 = in.m_54.z;
    int _161 = as_type<int>(_153) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_153) & 2;
    bool _167 = _165 != 0;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _177 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _179 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _181 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _175);
    float _183 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _185 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _187 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _189 = !_163;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_167;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_169;
    float _199 = _185;
    float _201 = _187;
    float _203 = _183;
    float _221;
    if (!_197)
    {
        float _205 = in.m_56.x;
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _205 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _145;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _225 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _255 = 1.0 / _241;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _259 = 1.0 / _249;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _263 = _225 + _261;
    float _265 = 1.0 / _245;
    float _267 = _237 * _255;
    float _269 = 1.0 / _253;
    float _271 = _229 * _259;
    bool _273 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _275 = isnan(_225);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -_283;
    float _287 = _285 + 1.0;
    float _289 = _233 * _265;
    bool _291 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _293 = isnan(_225);
    bool _295 = _291 || _293;
    bool _297 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _299 = _295 || _297;
    float _301 = float(_299);
    bool _303 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_225);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_301;
    float _317 = _315 + 1.0;
    float _319 = _301 * _287;
    float _321 = _263 * _269;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _323;
    bool _327 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_225);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = _313 * _317;
    float _341 = -_313;
    float _343 = _341 + 1.0;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = fma(_325, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _351 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _353 = isnan(_225);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _367 = fma(_347, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _369 = _337 * _343;
    float _371 = -_337;
    float _373 = _371 + 1.0;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _377 = _375 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _379 = -_361;
    float _381 = _379 + 1.0;
    float _383 = fma(_365, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = _361 * _373;
    float _387 = fma(_377, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _393;
    float _397 = _349 * _385;
    float _399 = _367 * _385;
    float _401 = fma(_391, _271, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_395, _271, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _405 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _397);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _399);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _417 = fma(_383, _369, _405);
    float _419 = fma(_387, _369, _407);
    float _421 = fma(_411, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _423 = fma(_415, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _425 = fma(_401, _339, _417);
    float _427 = fma(_403, _339, _419);
    float _429 = fma(_421, _319, _425);
    float _431 = fma(_423, _319, _427);
    float _433 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[147].x, _429);
    float _435 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[147].y, _431);
    bool _437 = !_257;
    float _455;
    if (!_437)
    {
        float _439 = in.m_56.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _145;
    }
    _457 = false;
    float _459 = _455;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _463 = _459 + _461;
    bool _465 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _467 = isnan(_459);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _459 + _477;
    bool _481 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _483 = isnan(_459);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _493;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _501 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _503 = isnan(_459);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -_475;
    float _515 = _513 + 1.0;
    float _517 = 1.0 / _499;
    float _519 = _511 * _515;
    float _521 = -_511;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _525;
    bool _529 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _531 = 1.0 / _495;
    float _533 = _491 * _523;
    float _535 = -_491;
    float _537 = _535 + 1.0;
    float _539 = _479 * _517;
    float _541 = _463 * _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _547;
    float _551 = fma(_527, _541, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _553 = fma(_545, _541, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _555 = fma(_549, _541, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _557 = _551 * _533;
    float _559 = _553 * _533;
    float _561 = _555 * _533;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _575 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].x, _557);
    float _577 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].y, _559);
    float _579 = fma(_565, _539, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _581 = fma(_569, _539, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _583 = fma(_573, _539, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _585 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[107].z, _561);
    float _587 = fma(_579, _519, _575);
    float _589 = fma(_581, _519, _577);
    float _591 = fma(_583, _519, _585);
    float _593 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].x, _587);
    float _595 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].y, _589);
    float _597 = in.m_58.x;
    float _599 = in.m_58.y;
    float _601 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[109].z, _591);
    float _603 = _593 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _605 = _595 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _607 = _601 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _609 = _603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _611 = _605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _613 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _609;
    out.m_60.y = _611;
    out.m_60.z = _613;
    float _615 = _435 * _599;
    float _617 = _433 * _597;
    bool _619 = !_529;
    if (!_619)
    {
        float _621 = in.m_56.x;
        float _623 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _625 = _621 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _627 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _629 = _627 * _623;
        float _631 = floor(_629);
        float _633 = -_631;
        float _635 = _629 + _633;
        _147 = _635;
    }
    float _637 = _147;
    float _639 = in.m_42.x;
    float _641 = in.m_42.y;
    float _643 = in.m_42.z;
    float _645 = _615 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _647 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _649 = _617 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _651 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _653 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _655 = _645 * _647;
    float _657 = _649 * _651;
    float _659 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _661 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _665 = _663 != 0;
    float _667 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _659);
    float _671 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _661);
    float _673 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _675 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[24].z, _671);
    float _679 = fma(_653, (*spvDescriptorSet0.vp_c8)._m0[25].z, _673);
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _685 = _641 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _687 = _641 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _689 = _641 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _691 = 0;
    int _693 = 0;
    float _695 = _667;
    if (_665)
    {
        _691 = 0;
        _693 = 0;
    }
    int _697 = _691;
    int _699 = _693;
    float _701 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].x, _685);
    float _703 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].x, _687);
    float _705 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    float _707 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[6].z, _701);
    float _709 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[4].z, _703);
    float _711 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _713 = _709 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _715 = _711 + _681;
    float _717 = _713 + _683;
    float _719 = in.m_56.z;
    float _721 = in.m_56.w;
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _725 = _715 + _723;
    float _727 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _729 = _717 + _727;
    float _731 = _725 * _725;
    float _733 = fma(_729, _729, _731);
    float _735 = _731;
    float _737 = _615;
    int _739 = _697;
    int _741 = _699;
    float _743 = _733;
    float _745 = _713;
    if (_665)
    {
        float _747 = in.m_56.x;
        float _749 = in.m_56.y;
        _735 = _747;
        _737 = _749;
    }
    float _751 = _735;
    float _753 = _737;
    float _755 = sqrt(_733);
    bool _757 = _721 > 0.5;
    float _759 = fma(_643, (*spvDescriptorSet0.vp_c10)._m0[5].z, _705);
    bool _761 = _719 > 0.5;
    float _763 = _759 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _765 = _755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _767 = 0.0;
    float _769 = _753;
    float _771 = _751;
    float _773 = _719;
    if (_665)
    {
        _767 = _751;
    }
    float _775 = _767;
    float _777 = 0.0;
    float _779 = _775;
    if (_665)
    {
        _777 = _753;
    }
    float _781 = _777;
    float _783 = _781;
    if (!_665)
    {
        float _785 = in.m_56.x;
        float _787 = in.m_56.y;
        float _789 = _785 * 3.1415927410125732421875;
        float _791 = _789 * 0.15915493667125701904296875;
        float _793 = _787 * 3.1415927410125732421875;
        float _795 = _793 * 0.15915493667125701904296875;
        float _797 = _791 * 6.283185482025146484375;
        float _799 = sin(_797);
        float _801 = _795 * 6.283185482025146484375;
        float _803 = sin(_801);
        _769 = _787;
        _771 = _785;
        _783 = _803;
        _739 = 2;
        _741 = 1;
        _779 = _799;
    }
    float _805 = _769;
    float _807 = _771;
    float _809 = _783;
    int _811 = _739;
    int _813 = _741;
    float _815 = _779;
    bool _817 = _805 > 0.5;
    float _819 = _679 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _821 = -_195;
    float _823 = _761 ? _821 : _195;
    int _825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _827 = _825 != 0;
    int _829 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _831 = _829 != 0;
    int _833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _835 = _833 != 0;
    float _837 = _763 + _819;
    float _839 = -_195;
    int _841 = _757 ? as_type<int>(_839) : as_type<int>(_195);
    float _843 = -_191;
    int _845 = _817 ? as_type<int>(_843) : as_type<int>(_191);
    bool _847 = !_835;
    float _849 = _847 ? _195 : _823;
    bool _851 = !_827;
    float _853 = _851 ? _195 : as_type<float>(_841);
    bool _855 = !_831;
    float _857 = _855 ? _191 : as_type<float>(_845);
    float _859 = _819;
    float _861 = _823;
    if (!_765)
    {
        _859 = _717;
    }
    float _863 = _859;
    float _865 = _863;
    if (!_765)
    {
        _861 = _715;
    }
    float _867 = _861;
    float _869 = _867;
    if (!_765)
    {
        _695 = _837;
    }
    float _871 = _695;
    bool _873 = !_765;
    float _875 = _871;
    if (!_873)
    {
        float _877 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _881 = _755 + _879;
        float _883 = _837 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _885 = rsqrt(_733);
        float _887 = _881 * _877;
        float _889 = _887 * 0.15915493667125701904296875;
        float _891 = _889 * 6.283185482025146484375;
        float _893 = cos(_891);
        float _895 = _889 * 6.283185482025146484375;
        float _897 = sin(_895);
        float _899 = _893 + (-1.0);
        float _901 = fma(_897, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _903 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _905 = _885 * _901;
        float _907 = fma(_837, _893, _903);
        float _909 = fma(_729, _905, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _911 = fma(_725, _905, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _875 = _907;
        _865 = _909;
        _869 = _911;
    }
    float _913 = _875;
    float _915 = _865;
    float _917 = _869;
    float _919 = -_763;
    float _921 = _919 + _913;
    float _923 = -_713;
    float _925 = _923 + _915;
    float _927 = -_711;
    float _929 = _927 + _917;
    float _931 = _763 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _933 = _921 * _921;
    bool _935 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _937 = isnan(0.5);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _943 = _939 || _941;
    float _945 = fma(_925, _925, _933);
    bool _947 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _949 = isnan(0.5);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _955 = _951 || _953;
    float _957 = fma(_929, _929, _945);
    float _959 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[11].x, _931);
    float _961 = _763 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _963 = sqrt(_957);
    float _965 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[11].z, _959);
    float _967 = _965 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _969 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[10].x, _961);
    float _971 = 1.0 / _967;
    float _973 = fma(_711, (*spvDescriptorSet0.vp_c8)._m0[10].z, _969);
    float _975 = _973 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _977 = _963 > 0.0;
    float _979 = _975 + _967;
    float _981 = _979 * _971;
    float _983 = _981 * 0.5;
    bool _985 = !_977;
    float _987 = _915;
    float _989 = _913;
    float _991 = _917;
    float _993 = _971;
    float _995 = _963;
    if (!_985)
    {
        float _997 = _185 * _185;
        float _999 = fma(_183, _183, _997);
        float _1001 = fma(_187, _187, _999);
        float _1003 = rsqrt(_957);
        float _1005 = sqrt(_1001);
        float _1007 = _925 * _1003;
        float _1009 = _921 * _1003;
        float _1011 = _929 * _1003;
        bool _1013 = _1005 > 0.0;
        bool _1015 = !_1013;
        _993 = _1003;
        _995 = _1001;
        _743 = _1007;
        if (!_1015)
        {
            float _1017 = rsqrt(_1001);
            float _1019 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1021 = _185 * _1017;
            float _1023 = _183 * _1017;
            float _1025 = _1009 * _1021;
            float _1027 = _187 * _1017;
            float _1029 = fma(_1007, _1023, _1025);
            float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1033 = fma(_1011, _1027, _1029);
            float _1035 = _1033 * _1031;
            float _1037 = fma(_183, _1035, _915);
            float _1039 = fma(_185, _1035, _913);
            float _1041 = fma(_187, _1035, _917);
            _987 = _1037;
            _989 = _1039;
            _991 = _1041;
            _993 = _1023;
            _995 = _1017;
        }
    }
    float _1043 = _987;
    float _1045 = _989;
    float _1047 = _991;
    float _1049 = _993;
    float _1051 = _995;
    float _1053 = _743;
    float _1055 = _1051;
    float _1057 = _1049;
    float _1059 = _1053;
    if (_955)
    {
        _1055 = 1.0;
    }
    float _1061 = _1055;
    float _1063 = _1061;
    if (_943)
    {
        _199 = _1043;
    }
    float _1065 = _199;
    float _1067 = _1065;
    if (_943)
    {
        _201 = _1045;
    }
    float _1069 = _201;
    float _1071 = _1069;
    if (_943)
    {
        _203 = _1047;
    }
    float _1073 = _203;
    float _1075 = _1073;
    if (!_943)
    {
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1079 = _763 + _1077;
        float _1081 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1083 = _713 + _1081;
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1087 = _1079 * _1079;
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1091 = _711 + _1089;
        float _1093 = fma(_1083, _1083, _1087);
        float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1097 = fma(_1091, _1091, _1093);
        float _1099 = sqrt(_1097);
        float _1101 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1103 = precise::min(_1099, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1105 = _1103 * _1095;
        float _1107 = -_713;
        float _1109 = _1107 + _1043;
        float _1111 = -_711;
        float _1113 = _1111 + _1047;
        float _1115 = _1101 * _1105;
        float _1117 = -_763;
        float _1119 = _1117 + _1045;
        float _1121 = fma(_1109, _1115, _713);
        float _1123 = fma(_1119, _1115, _763);
        float _1125 = fma(_1113, _1115, _711);
        _1071 = _1123;
        _1067 = _1121;
        _1075 = _1125;
        _1057 = _1115;
    }
    float _1127 = _1071;
    float _1129 = _1067;
    float _1131 = _1075;
    float _1133 = _1057;
    float _1135 = _1133;
    if (!_955)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1145 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1143);
        float _1147 = _1139 * 6.283185482025146484375;
        float _1149 = cos(_1147);
        float _1151 = _1141 * 0.15915493667125701904296875;
        float _1153 = _1139 * 6.283185482025146484375;
        float _1155 = sin(_1153);
        float _1157 = 1.0 / _1149;
        float _1159 = _1151 * 6.283185482025146484375;
        float _1161 = cos(_1159);
        float _1163 = _1155 * _1157;
        float _1165 = _1151 * 6.283185482025146484375;
        float _1167 = sin(_1165);
        float _1169 = _1161 * _1163;
        float _1171 = 1.0 / _1145;
        float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1175 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1173;
        float _1177 = 1.0 / _1169;
        float _1179 = 1.0 / _1175;
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1183 = _1171 * _1181;
        float _1185 = _1167 * _1177;
        float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1189 = fma(_1185, _1183, _1187);
        float _1191 = _1189 * _1179;
        float _1193 = precise::clamp(_1191, 0.0, 1.0);
        _745 = _1177;
        _1135 = _1151;
        _1063 = _1193;
    }
    float _1195 = _745;
    float _1197 = _1135;
    float _1199 = _1063;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1127 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1129 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1131 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1223 = _1207 * _1221;
    float _1225 = _1211 * _1221;
    float _1227 = _1223 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 + _1229;
    float _1233 = sqrt(_1231);
    bool _1235 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = _1233 + _1237;
    float _1241 = _1219;
    float _1243 = _1231;
    float _1245 = _1239;
    float _1247 = _1195;
    float _1249 = _1203;
    float _1251 = _1197;
    bool _1253 = _1235;
    if (_1235)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1255;
    }
    float _1257 = _1241;
    if (_1235)
    {
        float _1259 = rsqrt(_1231);
        _1243 = _1259;
    }
    float _1261 = _1243;
    float _1263 = _1261;
    if (_1235)
    {
        float _1265 = _1239 * _1257;
        _1245 = _1265;
    }
    float _1267 = _1245;
    if (_1235)
    {
        float _1269 = _1267 * 0.15915493667125701904296875;
        _1247 = _1269;
    }
    float _1271 = _1247;
    float _1273 = _1211;
    if (_1235)
    {
        float _1275 = _1271 * 6.283185482025146484375;
        float _1277 = sin(_1275);
        _1273 = _1277;
    }
    float _1279 = _1273;
    float _1281 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1283 = precise::max(0.0, _1281);
    float _1285 = _1257;
    float _1287 = _1283;
    if (_1235)
    {
        float _1289 = _1271 * 6.283185482025146484375;
        float _1291 = cos(_1289);
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = -_1221;
    float _1297 = -_1283;
    float _1299 = fma(_1203, _1295, _1297);
    if (_1235)
    {
        float _1301 = _1299 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1249 = _1301;
    }
    float _1303 = _1249;
    float _1305 = sqrt(_1217);
    float _1307 = _1303;
    float _1309 = _1279;
    if (_1235)
    {
        float _1311 = fma(_1279, _1303, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = _1313;
    if (!_1235)
    {
        _1309 = _1223;
    }
    float _1317 = _1309;
    float _1319 = _1317;
    float _1321 = _1293;
    if (_1235)
    {
        float _1323 = _1293 + (-1.0);
        _1287 = _1323;
    }
    float _1325 = _1287;
    float _1327 = _1325;
    if (_1235)
    {
        float _1329 = _1261 * _1313;
        _1059 = _1329;
    }
    float _1331 = _1059;
    if (!_1235)
    {
        _1315 = _1299;
    }
    float _1333 = _1315;
    float _1335 = _1333;
    if (_1235)
    {
        float _1337 = _1325 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1251 = _1337;
    }
    float _1339 = _1251;
    if (_1235)
    {
        float _1341 = _1223 * _1331;
        _1319 = _1341;
    }
    float _1343 = _1319;
    if (!_1235)
    {
        _1327 = _1225;
    }
    float _1345 = _1327;
    float _1347 = _1345;
    if (_1235)
    {
        float _1349 = _1225 * _1331;
        _1347 = _1349;
    }
    float _1351 = _1347;
    if (!_1235)
    {
        _1263 = _1227;
    }
    float _1353 = _1263;
    float _1355 = _1353;
    if (_1235)
    {
        float _1357 = fma(_1299, _1293, _1339);
        _1335 = _1357;
    }
    float _1359 = _1335;
    if (_1235)
    {
        float _1361 = _1343 * _1343;
        _1355 = _1361;
    }
    float _1363 = _1355;
    if (!_1235)
    {
        _1321 = _1229;
    }
    float _1365 = _1321;
    float _1367 = _1365;
    if (_1235)
    {
        float _1369 = _1351 * _1351;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = fma(_1359, _1359, _1363);
    float _1375 = _1373 + _1371;
    float _1377 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1381 = fma(_1305, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1379);
    float _1383 = precise::clamp(_1381, 0.0, 1.0);
    float _1385 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1387 = rsqrt(_1375);
    float _1389 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1377);
    float _1391 = -_1383;
    float _1393 = _1391 + 1.0;
    float _1395 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1385);
    float _1397 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1399 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1389);
    float _1401 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1403 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1405 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1395);
    float _1407 = abs(_1393);
    float _1409 = log2(_1407);
    float _1411 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1401);
    float _1413 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1403);
    float _1415 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1417 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1419 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1411);
    float _1421 = fma(_1131, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1413);
    float _1423 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1425 = _1387 * _1343;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1429 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1431 = _1387 * _1359;
    float _1433 = _1425 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1435 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1423);
    float _1437 = _1387 * _1351;
    float _1439 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1441 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1443 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1435);
    float _1445 = -_1433;
    float _1447 = fma(_1431, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1445);
    float _1449 = -_1439;
    float _1451 = fma(_1449, _1397, 1.0);
    float _1453 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1455 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1443);
    float _1457 = -_1437;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1447);
    float _1461 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1463 = exp2(_1441);
    float _1465 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1453);
    float _1467 = fma(_1459, -0.5, 0.5);
    float _1469 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1461);
    float _1471 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1465);
    float _1473 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1469);
    float _1475 = 1.0 / _1455;
    float _1477 = fma(_1459, 0.5, 0.5);
    float _1479 = _1431 + 1.0;
    float _1481 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1473);
    float _1483 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1471);
    float _1485 = fma(_1477, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1487 = log2(_1451);
    float _1489 = fma(_1477, _1485, -0.212114393711090087890625);
    float _1491 = -_1431;
    float _1493 = fma(_1463, _1479, _1491);
    float _1495 = fma(_1477, _1489, 1.570728778839111328125);
    float _1497 = fma(_1493, 0.5, 0.5);
    float _1499 = sqrt(_1467);
    float _1501 = _1481 * _1475;
    float _1503 = _1483 * _1475;
    float _1505 = fma(_1501, 0.5, 0.5);
    float _1507 = fma(_1503, -0.5, 0.5);
    float _1509 = _1487 * 0.693147182464599609375;
    float _1511 = _1509 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1513 = _1499 * 0.636619746685028076171875;
    float3 _4473 = float3(_1505, _1507, _1511);
    float _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4473, float3(0.0), isnan(_4473)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4473, float3(0.0), isnan(_4473)), level(0.0)).x;
    float3 _4484 = float3(_1505, _1507, _1511);
    float4 _1518 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4484, float3(0.0), isnan(_4484)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4484, float3(0.0), isnan(_4484)), level(0.0)).xyzw;
    float _1520 = _1518.x;
    float _1522 = _1518.y;
    float _1524 = _1518.z;
    float _1526 = _1518.w;
    float _1528 = -_1495;
    float _1530 = fma(_1513, _1528, 1.0);
    float2 _4506 = float2(_1530, _1497);
    float3 _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4506, float2(0.0), isnan(_4506)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4506, float2(0.0), isnan(_4506)), level(0.0)).xyz;
    float _1536 = _1534.x;
    float _1538 = _1534.y;
    float _1540 = _1534.z;
    int _1542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1544 = _1542 != 0;
    float _1546 = _1409 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1550 = _1548 != 0;
    float _1552 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1554 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1556 = exp2(_1546);
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1560 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1558;
    int _1562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1564 = _1562 != 0;
    float _1566 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1570 = _1568 != 0;
    float _1572 = 0.5;
    if (_1544)
    {
        float _1574 = in.m_56.w;
        _1572 = _1574;
    }
    float _1576 = _1572;
    float _1578 = fma(_1554, _1554, 1.0);
    float _1580 = 1.0 / _1560;
    float _1582 = 0.0;
    if (_1550)
    {
        float _1584 = in.m_56.x;
        _1582 = _1584;
    }
    float _1586 = _1582;
    float _1588 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1552);
    float _1590 = rsqrt(_1578);
    float _1592 = -_1556;
    float _1594 = _1592 + 1.0;
    float _1596 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1588);
    float _1598 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1600;
    float _1604 = _1576;
    if (_1544)
    {
        float _1606 = _1576 * 3.1415927410125732421875;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = 0.0;
    if (_1544)
    {
        float _1612 = _1608 * 0.15915493667125701904296875;
        _1610 = _1612;
    }
    float _1614 = _1610;
    float _1616 = _1614;
    if (_1544)
    {
        float _1618 = _1614 * 6.283185482025146484375;
        float _1620 = sin(_1618);
        _1616 = _1620;
    }
    float _1622 = _1616;
    out.m_62.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_62.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_62.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    float _1624 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1626 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1628 = _1622;
    if (_1544)
    {
        bool _1630 = _1622 > 0.5;
        _1253 = _1630;
    }
    bool _1632 = _1253;
    float _1634 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1566);
    if (!_1544)
    {
        _1628 = _191;
    }
    float _1636 = _1628;
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1626);
    float _1640 = _1636;
    if (_1544)
    {
        float _1642 = -_191;
        float _1644 = _1632 ? _1642 : _191;
        _1640 = _1644;
    }
    float _1646 = _1640;
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1650 = _1648 != 0;
    float _1652 = _1554 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1654 = _1554 * _1590;
    bool _1656 = _807 > 0.5;
    float _1658 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1652);
    float _1660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1662 = _637 + _1660;
    float _1664 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1666 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1668 = _1654 * _1666;
    float _1670 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1672 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1674 = _1662 * _1580;
    float _1676 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1678 = _1654 * _1676;
    float _1680 = fma(_1602, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _1682 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1684 = isnan(_637);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1694;
    out.m_64.x = _1664;
    out.m_64.y = _1670;
    out.m_64.z = _1672;
    float _1698 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1700 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1698;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1704 = _1674;
    bool _1706 = _1656;
    if (_1550)
    {
        float _1708 = _1586 * 3.1415927410125732421875;
        _1702 = _1708;
    }
    float _1710 = _1702;
    float _1712 = fma(_1696, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1714 = _637 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1716 = isnan(_637);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = fma(_1700, _1674, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    if (_1550)
    {
        float _1728 = _1710 * 0.15915493667125701904296875;
        _1704 = _1728;
    }
    float _1730 = _1704;
    float _1732 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1734 = _1654 * _1732;
    float _1736 = _1730;
    if (_1550)
    {
        float _1738 = _1730 * 6.283185482025146484375;
        float _1740 = sin(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = -_1692;
    float _1746 = _1744 + 1.0;
    float _1748 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[24].y, _1734);
    float _1750 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[26].y, _1678);
    float _1752 = _1724 * _1746;
    float _1754 = -_1724;
    float _1756 = _1754 + 1.0;
    float _1758 = fma(_1590, (*spvDescriptorSet0.vp_c8)._m0[25].y, _1668);
    float _1760 = _809 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1762 = _1712 * _1752;
    float _1764 = _1680 * _1752;
    float _1766 = _1726 * _1752;
    float _1768 = -_191;
    int _1770 = _761 ? as_type<int>(_1768) : as_type<int>(_191);
    float _1772 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1762);
    float _1774 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1764);
    float _1776 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1766);
    float _1778 = -_191;
    int _1780 = _1656 ? as_type<int>(_1778) : as_type<int>(_191);
    out.m_66.x = _1748;
    out.m_66.y = _1758;
    out.m_66.z = _1750;
    if (_1550)
    {
        bool _1782 = _1742 > 0.5;
        _1706 = _1782;
    }
    bool _1784 = _1706;
    bool _1786 = _811 != 2;
    float _1788 = _807 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1792 = -_195;
    int _1794 = _817 ? as_type<int>(_1792) : as_type<int>(_195);
    float _1796 = -_1790;
    float _1798 = fma(_1788, 2.0, _1796);
    float _1800 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1772);
    float _1802 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1774);
    float _1804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1806 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1776);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1810 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1812 = _813 != 1;
    float _1814 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1808);
    float _1816 = _805 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1822 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1824 = fma(_1816, -2.0, _1810);
    float _1826 = _1816;
    if (!_1550)
    {
        _1826 = _195;
    }
    float _1828 = _1826;
    float _1830 = fma(_1760, -2.0, _1818);
    float _1832 = _1828;
    if (_1550)
    {
        float _1834 = -_195;
        float _1836 = _1784 ? _1834 : _195;
        _1832 = _1836;
    }
    float _1838 = _1832;
    float _1840 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1820);
    float _1842 = _815 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1844 = !_1650;
    float _1846 = _1844 ? _191 : as_type<float>(_1770);
    float _1848 = _1838 + (-0.5);
    bool _1850 = !_1564;
    float _1852 = _1850 ? _191 : as_type<float>(_1780);
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1856 = !_1570;
    float _1858 = _1856 ? _195 : as_type<float>(_1794);
    float _1860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1862 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1864 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1830);
    float _1866 = -_1854;
    float _1868 = fma(_1842, 2.0, _1866);
    float _1870 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1872 = -_1862;
    float _1874 = -_1864;
    float _1876 = fma(_1872, _1848, _1874);
    float _1878 = -_123;
    float _1880 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1868);
    float _1882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1884 = _1646 + 0.5;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1888 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1890 = _1800 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1892 = fma(_1870, _1884, _1880);
    float _1894 = _1806 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1896 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1888);
    float _1898 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1900 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1902 = -_123;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1798);
    float _1906 = _1852 + 0.5;
    float _1908 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1894 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = fma(_1900, _1906, _1904);
    float _1916 = _1882 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1918 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1814);
    float _1920 = _1898;
    float _1922 = _1886;
    float _1924 = _1892;
    if (_1786)
    {
        _1920 = _807;
    }
    float _1926 = _1920;
    out.m_68.x = _1908;
    out.m_68.y = _1910;
    out.m_68.z = _1912;
    float _1928 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1824);
    float _1930 = _1926;
    if (!_1786)
    {
        _1930 = _719;
    }
    float _1932 = _1930;
    float _1934 = _1858 + (-0.5);
    float _1936 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1840);
    float _1938 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1886);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1942 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1944 = _1942;
    if (!_1812)
    {
        _1922 = _805;
    }
    float _1946 = _1922;
    float _1948 = -_1916;
    float _1950 = -_1928;
    float _1952 = fma(_1948, _1934, _1950);
    float _1954 = -_1918;
    float _1956 = _1954 + 1.0;
    float _1958 = -_1936;
    float _1960 = _1958 + 1.0;
    float _1962 = -_1940;
    float _1964 = fma(_1942, 2.0, _1962);
    float _1966 = _1946;
    if (!_1812)
    {
        _1944 = _1946;
    }
    float _1968 = _1944;
    float _1970 = -_1956;
    float _1972 = fma(_1970, _1646, _1892);
    float _1974 = fma(_1960, _1838, _1876);
    float _1976 = _1968;
    float _1978 = _1972;
    if (!_1812)
    {
        _1924 = _719;
    }
    float _1980 = _1924;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1984 = _1980;
    if (_1812)
    {
        _1966 = _807;
    }
    float _1986 = _1966;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1812)
    {
        _1984 = _805;
    }
    float _1990 = _1984;
    float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1994 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1988);
    float _1996 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1982);
    if (_1812)
    {
        _1976 = _807;
    }
    float _1998 = _1976;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1812)
    {
        _773 = _805;
    }
    float _2002 = _773;
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    out.m_70.x = _1972;
    out.m_70.y = _1974;
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2008 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2012 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1938);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2018 = fma(_2008, -2.0, _2010);
    float _2020 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2022 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2000);
    float _2024 = _1998 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1786)
    {
        _1978 = _805;
    }
    float _2026 = _1978;
    float _2028 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2016);
    float _2030 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2032 = _2026;
    if (!_1786)
    {
        _2032 = _807;
    }
    float _2034 = _2032;
    float _2036 = -_2006;
    float _2038 = fma(_2024, 2.0, _2036);
    float _2040 = -_123;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1964);
    float _2044 = _1846 + 0.5;
    float _2046 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2048 = -_123;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2038);
    float _2052 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2054 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2022);
    float _2056 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2058 = _853 + (-0.5);
    float _2060 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2018);
    float _2062 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1994);
    float _2064 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1996);
    float _2066 = fma(_2046, -2.0, _2052);
    float _2068 = fma(_2020, _2044, _2050);
    float _2070 = -_2054;
    float _2072 = _2070 + 1.0;
    float _2074 = -_2056;
    float _2076 = -_2060;
    float _2078 = fma(_2074, _2058, _2076);
    float _2080 = -_2012;
    float _2082 = _2080 + 1.0;
    float _2084 = -_2062;
    float _2086 = _2084 + 1.0;
    float _2088 = -_2064;
    float _2090 = _2088 + 1.0;
    float _2092 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2094 = _857 + 0.5;
    float _2096 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2028);
    float _2098 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1896);
    float _2100 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2066);
    float _2102 = -_2072;
    float _2104 = fma(_1852, _2102, _1914);
    float _2106 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2108 = _849 + (-0.5);
    float _2110 = fma(_1858, _2082, _1952);
    float _2112 = -_2086;
    float _2114 = fma(_1846, _2112, _2068);
    float _2116 = fma(_853, _2090, _2078);
    float _2118 = fma(_2092, _2094, _2042);
    float _2120 = -_2096;
    float _2122 = _2120 + 1.0;
    float _2124 = -_2106;
    float _2126 = -_2100;
    float _2128 = fma(_2124, _2108, _2126);
    float _2130 = -_2098;
    float _2132 = _2130 + 1.0;
    out.m_72.x = _2104;
    out.m_72.y = _2110;
    out.m_72.z = _2114;
    out.m_72.w = _2116;
    float _2134 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1596);
    float _2136 = -_2122;
    float _2138 = fma(_857, _2136, _2118);
    bool _2140 = _1199 > 0.0;
    bool _2142 = isnan(_1199);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = fma(_849, _2132, _2128);
    float _2152 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2154 = _2134 + _1455;
    out.m_74.x = _2138;
    out.m_74.y = _2150;
    float _2156 = _2154 * 0.5;
    out.gl_Position.x = _1481;
    out.gl_Position.y = _1483;
    out.gl_Position.z = _2134;
    out.gl_Position.w = _1455;
    float _2158 = _2152 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_76.z = _2156;
    out.m_76.w = _1455;
    out.m_45.x = _2158;
    float _2160 = _1598 * _1515;
    float _2162 = -_1598;
    float _2164 = _2162 + 1.0;
    float _2166 = _1526 * _2160;
    float _2168 = _1526 * _2164;
    float _2170 = _1540 * _2160;
    float _2172 = fma(_1536, _2166, _1520);
    float _2174 = fma(_1538, _2166, _1522);
    float _2176 = fma(_1526, _2170, _1524);
    out.m_78.x = _2172;
    out.m_78.y = _2174;
    out.m_78.z = _2176;
    out.m_78.w = _2168;
    if (_2148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2178;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

