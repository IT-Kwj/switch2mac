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
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_96 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_84 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_86 [[user(locn13)]];
    float4 m_90 [[user(locn14)]];
    float4 m_78 [[user(locn15)]];
    float4 m_80 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_82 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2762 = false;
    bool _581 = false;
    bool _439 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3061 = as_type<float>(_131);
        out.gl_Position.z = _3061;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_51.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3131 = as_type<float>(_169);
        out.gl_Position.z = _3131;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    int _179 = as_type<int>(_171) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_171) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _195 = !_181;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _201 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    bool _205 = !_185;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_187;
    float _217 = _213;
    float _235;
    if (!_215)
    {
        float _219 = in.m_58.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_115);
        float _241 = 1.0 / _239;
        float _243 = _149 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = 1.0 / _265;
    float _277 = -_261;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = 1.0 / _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _269;
    float _291 = _249 * _275;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _245 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _245 + _297;
    float _301 = _295 * _283;
    bool _303 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_245);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_245);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _313 * _279;
    bool _329 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_245);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _299 * _289;
    float _343 = fma(_287, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -_313;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = -_325;
    float _363 = _361 + 1.0;
    float _365 = _325 * _351;
    float _367 = fma(_355, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = _339 * _363;
    float _373 = fma(_347, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = in.m_60.x;
    float _377 = in.m_60.y;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = _343 * _371;
    float _385 = _373 * _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _399 = fma(_389, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_393, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_367, _365, _395);
    float _405 = fma(_369, _365, _397);
    float _407 = fma(_401, _327, _403);
    float _409 = fma(_399, _327, _405);
    float _411 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _409);
    float _415 = _411 * _375;
    float _417 = _413 * _377;
    bool _419 = !_281;
    float _437;
    if (!_419)
    {
        float _421 = in.m_58.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_115);
        float _443 = 1.0 / _441;
        float _445 = _149 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _447 + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = isnan(_447);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _475 = isnan(_447);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _485;
    bool _489 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _491 = isnan(_447);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _455;
    float _503 = -_467;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = _483 * _505;
    float _511 = -_483;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _471;
    float _517 = _487 * _501;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _523 = fma(_517, _451, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _525 = _521 * _515;
    float _527 = _523 * _509;
    float _529 = -_499;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _447 + _533;
    float _537 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _527);
    float _539 = _467 * _531;
    float _541 = fma(_525, _535, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = fma(_541, _539, _537);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _551 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[117].x, _545);
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _553;
    out.m_62.y = _555;
    out.m_62.z = _557;
    out.m_62.w = _559;
    bool _561 = !_507;
    float _579;
    if (!_561)
    {
        float _563 = in.m_58.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_115);
        float _585 = 1.0 / _583;
        float _587 = _149 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = in.m_58.z;
    float _593 = in.m_58.w;
    float _595 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = in.m_46.x;
    float _599 = in.m_46.y;
    float _601 = in.m_46.z;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = in.m_58.x;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _611 = _609 != 0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _617 = 1.0 / _605;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _623 = 1.0 / _615;
    bool _625 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _627 = isnan(_589);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _639 = _637 != 0;
    float _641 = 0.0;
    if (_611)
    {
        float _643 = in.m_58.y;
        _641 = _643;
    }
    float _645 = _641;
    float _647 = _591 * 2.0;
    bool _649 = _593 > 0.5;
    float _651 = 1.0 / _621;
    float _653 = _599 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _655 = _599 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _657 = _599 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _659;
    float _663 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].x, _653);
    float _665 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].x, _655);
    float _667 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].x, _657);
    float _669 = floor(_647);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _675;
    float _679 = _661 * _623;
    float _681 = -_635;
    float _683 = _681 + 1.0;
    float _685 = _673 * _617;
    bool _687 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _689 = isnan(_589);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[5].z, _665);
    float _701 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _703 = log2(_701);
    float _705 = _677 * _651;
    bool _707 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _709 = isnan(_589);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -_697;
    float _721 = _719 + 1.0;
    float _723 = _697 * _683;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _727 = _589 + _725;
    float _729 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[4].z, _663);
    float _731 = _699 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _733 = _669 > 0.0;
    float _735 = fma(_679, _727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _737 = _669 >= 0.0;
    bool _739 = isnan(_669);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _589 + _747;
    bool _751 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = isnan(_589);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _765 = _589 + _763;
    float _767 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[6].z, _667);
    float _769 = fma(_685, _749, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _771 = _729 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _773 = _761 * _721;
    float _775 = -_761;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _731 + _779;
    float _783 = _607 * 2.0;
    float _785 = fma(_705, _765, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _787 = _717 * _777;
    bool _789 = _607 > 0.5;
    float _791 = _767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _795 = _771 + _793;
    float _797 = _735 * _787;
    float _799 = _703 * _149;
    float _801 = _781 * _781;
    float _803 = floor(_783);
    float _805 = -_197;
    int _807 = _789 ? as_type<int>(_805) : as_type<int>(_197);
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _811 = _791 + _809;
    float _813 = fma(_795, _795, _801);
    float _815 = 0.0;
    bool _817 = _745;
    float _819 = _773;
    if (_639)
    {
        float _821 = in.m_58.w;
        _815 = _821;
    }
    float _823 = _815;
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = -_207;
    int _841 = _649 ? as_type<int>(_839) : as_type<int>(_207);
    float _843 = exp2(_799);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _847 = _845 != 0;
    float _849 = fma(_811, _811, _813);
    bool _851 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _859 = _855 || _857;
    float _861 = 1.0 / _837;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _871 = _833;
    if (_847)
    {
        float _873 = _607 * 3.1415927410125732421875;
        _869 = _873;
    }
    float _875 = _869;
    float _877 = rsqrt(_849);
    float _879 = -_843;
    float _881 = _879 + 1.0;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _885 = 0.0;
    float _887 = _843;
    float _889 = _875;
    if (_847)
    {
        float _891 = _875 * 0.15915493667125701904296875;
        _885 = _891;
    }
    float _893 = _885;
    if (_611)
    {
        _887 = _607;
    }
    float _895 = _887;
    float _897 = _859 ? _881 : 0.0;
    float _899 = sqrt(_849);
    float _901 = _895;
    float _903 = _645;
    if (_611)
    {
        _889 = _645;
    }
    float _905 = _889;
    bool _907 = _803 >= 0.0;
    bool _909 = isnan(_803);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = _905;
    if (!_611)
    {
        float _919 = in.m_58.y;
        float _921 = _607 * 3.1415927410125732421875;
        float _923 = _921 * 0.15915493667125701904296875;
        float _925 = _923 * 6.283185482025146484375;
        float _927 = sin(_925);
        float _929 = _919 * 3.1415927410125732421875;
        float _931 = _929 * 0.15915493667125701904296875;
        float _933 = _931 * 6.283185482025146484375;
        float _935 = sin(_933);
        _917 = _935;
        _901 = _927;
        _903 = _919;
    }
    float _937 = _917;
    float _939 = _901;
    float _941 = _903;
    float _943 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[93].w, _883);
    float _945 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[93].z, _863);
    float _947 = _883;
    float _949 = _937;
    if (_847)
    {
        float _951 = _893 * 6.283185482025146484375;
        float _953 = sin(_951);
        _947 = _953;
    }
    float _955 = _947;
    float _957 = _939 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _959 = _937 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_639)
    {
        float _961 = _823 * 3.1415927410125732421875;
        _949 = _961;
    }
    float _963 = _949;
    float _965 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[92].z, _945);
    float _967 = -_867;
    float _969 = fma(_957, 2.0, _967);
    float _971 = _595 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _973 = _899 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _975 = 0.0;
    if (_639)
    {
        float _977 = _963 * 0.15915493667125701904296875;
        _975 = _977;
    }
    float _979 = _975;
    float _981 = fma(_959, -2.0, _865);
    float _983 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[92].w, _943);
    float _985 = -_149;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[91].x, _969);
    float _989 = precise::min(_971, _973);
    float _991 = _943;
    if (_639)
    {
        float _993 = _979 * 6.283185482025146484375;
        float _995 = sin(_993);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _781 * _877;
    float _1001 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[91].y, _981);
    if (_833)
    {
        float _1003 = _897 * _861;
        _151 = _1003;
    }
    float _1005 = _151;
    float _1007 = -_717;
    float _1009 = _1007 + 1.0;
    if (_847)
    {
        bool _1011 = _955 > 0.5;
        _871 = _1011;
    }
    bool _1013 = _871;
    float _1015 = _999 * _989;
    float _1017 = _795 * _877;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[131].x, _797);
    float _1021 = _811 * _877;
    float _1023 = -_1015;
    float _1025 = _781 + _1023;
    float _1027 = _1017 * _989;
    int _1029 = _745 ? 0 : 1;
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1033 = _1025 * _1025;
    float _1035 = -_1027;
    float _1037 = _795 + _1035;
    float _1039 = _1021 * _989;
    float _1041 = _1019;
    float _1043 = _1039;
    float _1045 = _1027;
    if (_639)
    {
        bool _1047 = _997 > 0.5;
        _817 = _1047;
    }
    bool _1049 = _817;
    float _1051 = _941 * 2.0;
    float _1053 = fma(_1037, _1037, _1033);
    float _1055 = -_1039;
    float _1057 = _811 + _1055;
    float _1059 = fma(_769, _773, _1019);
    int _1061 = ~_1029;
    int _1063 = _1061 + 1;
    int _1065 = _1063 + 1;
    float _1067 = -_965;
    float _1069 = _1067 + 1.0;
    float _1071 = fma(_1057, _1057, _1053);
    int _1073 = _1065;
    if (!_733)
    {
        int _1075 = ~_1029;
        int _1077 = _1075 + 1;
        _1073 = _1077;
    }
    int _1079 = _1073;
    float _1081 = fma(_785, _723, _1059);
    bool _1083 = _591 > 0.5;
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_847)
    {
        _1041 = _207;
    }
    float _1093 = _1041;
    float _1095 = _607 + _941;
    int _1097 = _915 ? 0 : 1;
    out.m_64.w = _989;
    float _1099 = _1093;
    if (!_639)
    {
        _819 = _197;
    }
    float _1101 = _819;
    float _1103 = sqrt(_1071);
    float _1105 = _1101;
    if (_847)
    {
        float _1107 = -_207;
        float _1109 = _1013 ? _1107 : _207;
        _1099 = _1109;
    }
    float _1111 = _1099;
    float _1113 = _1095 + (-1.0);
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1121 = _1119 != 0;
    if (_639)
    {
        float _1123 = -_197;
        float _1125 = _1049 ? _1123 : _197;
        _1105 = _1125;
    }
    float _1127 = _1105;
    bool _1129 = _803 > 0.0;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = -_197;
    int _1135 = _1083 ? as_type<int>(_1133) : as_type<int>(_197);
    float _1137 = -_207;
    int _1139 = _1083 ? as_type<int>(_1137) : as_type<int>(_207);
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1143 = _1141 != 0;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1151 = _1149 != 0;
    int _1153 = ~_1097;
    int _1155 = _1153 + 1;
    int _1157 = _1155 + 1;
    float _1159 = _877 * _1103;
    bool _1161 = !_1121;
    float _1163 = _1161 ? _197 : as_type<float>(_1135);
    float _1165 = floor(_1051);
    bool _1167 = !_1143;
    float _1169 = _1167 ? _207 : as_type<float>(_841);
    float _1171 = _595 * _1159;
    int _1173 = _1157;
    if (!_1129)
    {
        int _1175 = ~_1097;
        int _1177 = _1175 + 1;
        _1173 = _1177;
    }
    int _1179 = _1173;
    float _1181 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1183 = _1111 + (-0.5);
    float _1185 = _1127 + 0.5;
    float _1187 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1189 = _941 > 0.5;
    float _1191 = -_1181;
    float _1193 = -_1001;
    float _1195 = fma(_1191, _1183, _1193);
    float _1197 = fma(_1091, _1185, _987);
    float _1199 = _781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1201 = _999 * _1187;
    float _1203 = _1017 * _1187;
    bool _1205 = !_1089;
    float _1207 = _1205 ? _197 : as_type<float>(_807);
    float _1209 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1199);
    float _1211 = -_1201;
    float _1213 = _781 + _1211;
    bool _1215 = !_1151;
    float _1217 = _1215 ? _207 : as_type<float>(_1139);
    float _1219 = -_1203;
    float _1221 = _795 + _1219;
    float _1223 = -_207;
    int _1225 = _1189 ? as_type<int>(_1223) : as_type<int>(_207);
    float _1227 = _1213 * _1213;
    float _1229 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1081);
    float _1231 = _1163 + 0.5;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1235 = !_1117;
    float _1237 = _1235 ? _207 : as_type<float>(_1225);
    float _1239 = fma(_1221, _1221, _1227);
    float _1241 = -_983;
    float _1243 = _1241 + 1.0;
    float _1245 = _1207 + 0.5;
    float _1247 = -_1169;
    float _1249 = _1247 + 0.5;
    float _1251 = _1021 * _1187;
    float _1253 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1255 = -_1069;
    float _1257 = fma(_1255, _1127, _1197);
    float _1259 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1261 = fma(_1243, _1111, _1195);
    float _1263 = _1253 * _1131;
    float _1265 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1267 = -_1251;
    float _1269 = _811 + _1267;
    float _1271 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1273 = _1259 * _1233;
    float _1275 = fma(_1269, _1269, _1239);
    float _1277 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1209);
    float _1279 = -_197;
    int _1281 = _1189 ? as_type<int>(_1279) : as_type<int>(_197);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1287 = -_1237;
    float _1289 = _1287 + 0.5;
    bool _1291 = _1165 > 0.0;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1295 = _1165 >= 0.0;
    bool _1297 = isnan(_1165);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.0);
    bool _1303 = _1299 || _1301;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1307 = !_1147;
    float _1309 = _1307 ? _197 : as_type<float>(_1281);
    float _1311 = sqrt(_1275);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1319 = _1317 != 0;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1323 = _1321 != 0;
    float _1325 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1327 = _1277 >= 0.0;
    float _1329 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = _1229 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1335 = -_1217;
    float _1337 = _1335 + 0.5;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1341 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1343 = _1309 + 0.5;
    out.m_66.x = _1329;
    out.m_66.y = _1331;
    out.m_66.z = _1325;
    out.m_66.w = _1333;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1347 = _1341 * _1285;
    bool _1349 = !_1315;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = in.m_68.x;
    float _1355 = in.m_68.y;
    float _1357 = in.m_68.z;
    float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1361 = _1285;
    int _1363 = _1351;
    if (_1327)
    {
        _1361 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1365 = _1361;
    float _1367 = _877 * _1311;
    out.m_70.x = _1257;
    out.m_70.y = _1261;
    float _1369 = _1171 * _1367;
    if (_1327)
    {
        out.m_49.x = 0.0;
    }
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1373 = _1345 * _1339;
    float _1375 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1377 = abs(_1351);
    if (_1327)
    {
        float _1379 = _1365 * 5.0;
        _1363 = as_type<int>(_1379);
    }
    int _1381 = _1363;
    out.m_72.x = _1369;
    float _1383 = float(_1377);
    float _1385 = _1265 * _1359;
    if (_1327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5046 = as_type<float>(_1381);
        out.gl_Position.z = _5046;
    }
    out.m_74.x = _1263;
    out.m_74.y = _1347;
    out.m_74.z = _1273;
    out.m_74.w = _1385;
    float _1387 = _1375 * _1371;
    out.m_76.x = _1387;
    out.m_76.y = _1373;
    float _1389 = float(_1079);
    bool _1391 = !_1323;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = _1383 * _1389;
    float _1397 = _607 + (-0.5);
    bool _1399 = !_1319;
    int _1401 = _1399 ? 0 : 1;
    float _1403 = _1357;
    if (_1327)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1405 = _1395 * (-2.0);
    float _1407 = -_1201;
    float _1409 = _731 + _1407;
    float _1411 = -_1203;
    float _1413 = _771 + _1411;
    int _1415 = _1303 ? 0 : 1;
    float _1417 = fma(_1405, _1353, _1353);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1421 = _1409 + _1419;
    float _1423 = fma(_1271, _1405, _1271);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1413 + _1425;
    float _1429 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1417);
    int _1431 = abs(_1401);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1435 = ~_1415;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    float _1441 = -_1251;
    float _1443 = _791 + _1441;
    int _1445 = _1439;
    if (!_1291)
    {
        int _1447 = ~_1415;
        int _1449 = _1447 + 1;
        _1445 = _1449;
    }
    int _1451 = _1445;
    float _1453 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1455 = float(_1179);
    float _1457 = _941 + _591;
    float _1459 = float(_1431);
    float _1461 = _607 + _591;
    int _1463 = abs(_1393);
    float _1465 = _1457 + (-1.0);
    float _1467 = float(_1451);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1443 + _1469;
    float _1473 = _1459 * _1455;
    float _1475 = float(_1463);
    float _1477 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1453);
    float _1479 = _941 + (-0.5);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1483 = _1473 * (-2.0);
    float _1485 = _1475 * _1467;
    bool _1487 = _1477 >= 0.0;
    float _1489 = _1461 + (-1.0);
    float _1491 = fma(_1483, _1355, _1355);
    float _1493 = fma(_1481, _1483, _1481);
    float _1495 = _1485 * (-2.0);
    float _1497 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1491);
    float _1499 = _591 + (-0.5);
    float _1501 = fma(_1423, _1005, _1429);
    float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1505 = fma(_1495, _1357, _1357);
    float _1507 = fma(_1493, _1005, _1497);
    float _1509 = _1501 * 0.15915493667125701904296875;
    float _1511 = fma(_1503, _1495, _1503);
    float _1513 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1505);
    float _1515 = _1507 * 0.15915493667125701904296875;
    if (_1487)
    {
        _1403 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1517 = _1403;
    float _1519 = _1509 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    float _1523 = fma(_1511, _1005, _1513);
    int _1525 = as_type<int>(_1517);
    if (_1487)
    {
        out.m_49.x = 0.0;
    }
    if (_1487)
    {
        float _1527 = _1517 * 5.0;
        _1525 = as_type<int>(_1527);
    }
    int _1529 = _1525;
    float _1531 = _1523 * 0.15915493667125701904296875;
    float _1533 = _1509 * 6.283185482025146484375;
    float _1535 = cos(_1533);
    if (_1487)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5292 = as_type<float>(_1529);
        out.gl_Position.z = _5292;
    }
    float _1537 = _1515 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = _1515 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    if (_1487)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1545 = _1531 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1551 = _1159 * _1367;
    float _1553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1555 = _1535 * _1543;
    float _1557 = _1535 * _1539;
    float _1559 = _1549 * _1551;
    float _1561 = _1521 * _1543;
    float _1563 = _1531 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = -_1027;
    float _1569 = _771 + _1567;
    float _1571 = _1559 * _1553;
    float _1573 = _1521 * _1539;
    float _1575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1577 = -_1039;
    float _1579 = _791 + _1577;
    float _1581 = _1535 * _1547;
    float _1583 = _1369 * _1575;
    float _1585 = _1543 * _1547;
    float _1587 = _1521 * _1547;
    float _1589 = _1581 * _1571;
    float _1591 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1593 = _1591 * 0.5;
    float _1595 = _1539 * _1547;
    float _1597 = fma(_1565, _1555, _1573);
    float _1599 = -_1561;
    float _1601 = fma(_1565, _1557, _1599);
    float _1603 = -_1571;
    float _1605 = _1565 * _1603;
    float _1607 = -_1557;
    float _1609 = fma(_1565, _1561, _1607);
    float _1611 = fma(_1597, _1583, _1589);
    float _1613 = _1587 * _1571;
    float _1615 = fma(_1585, _1583, _1605);
    float _1617 = fma(_1565, _1573, _1555);
    float _1619 = fma(_1601, _1593, _1611);
    float _1621 = fma(_1609, _1583, _1613);
    float _1623 = fma(_1595, _1593, _1615);
    float _1625 = -_1015;
    float _1627 = _731 + _1625;
    float _1629 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1631 = fma(_1617, _1593, _1621);
    float _1633 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1635 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1637 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1629);
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1633);
    float _1641 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1635);
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1637);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1639);
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1641);
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1651 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1655 = _791 + _1649;
    float _1657 = -_1201;
    float _1659 = _1657 + _1627;
    float _1661 = _771 + _1651;
    float _1663 = -_1251;
    float _1665 = _1663 + _1579;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1669 = _1655 + _1667;
    float _1671 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1675 = _1661 + _1673;
    float _1677 = _731 + _1653;
    float _1679 = _1669 * _1669;
    float _1681 = fma(_1675, _1675, _1679);
    float _1683 = -_1203;
    float _1685 = _1683 + _1569;
    float _1687 = sqrt(_1681);
    float _1689 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1691 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    bool _1693 = _1687 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = _1689;
    float _1697 = _1653;
    float _1699 = _1661;
    float _1701 = _1665;
    float _1703 = _1659;
    float _1705 = _1685;
    if (!_1693)
    {
        _1695 = _1661;
    }
    float _1707 = _1695;
    float _1709 = _1707;
    if (!_1693)
    {
        _1697 = _1655;
    }
    float _1711 = _1697;
    float _1713 = _1711;
    if (!_1693)
    {
        _1699 = _1677;
    }
    float _1715 = _1699;
    bool _1717 = !_1693;
    float _1719 = _1715;
    if (!_1717)
    {
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1725 = _1687 + _1723;
        float _1727 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = rsqrt(_1681);
        float _1731 = _1725 * _1721;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = _1733 * 6.283185482025146484375;
        float _1741 = sin(_1739);
        float _1743 = _1737 + (-1.0);
        float _1745 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = fma(_1741, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1749 = fma(_1677, _1737, _1745);
        float _1751 = _1729 * _1747;
        float _1753 = fma(_1675, _1751, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1755 = fma(_1669, _1751, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1719 = _1749;
        _1709 = _1753;
        _1713 = _1755;
    }
    float _1757 = _1719;
    float _1759 = _1709;
    float _1761 = _1713;
    float _1763 = -_731;
    float _1765 = _1763 + _1757;
    float _1767 = -_771;
    float _1769 = _1767 + _1759;
    float _1771 = -_791;
    float _1773 = _1771 + _1761;
    float _1775 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1777 = _1765 * _1765;
    float _1779 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1781 = -_1027;
    float _1783 = _1781 + _1759;
    float _1785 = 1.0 / _1775;
    float _1787 = fma(_1769, _1769, _1777);
    float _1789 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1779);
    bool _1791 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1793 = isnan(0.5);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1799 = _1795 || _1797;
    float _1801 = fma(_1773, _1773, _1787);
    float _1803 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1789);
    float _1805 = sqrt(_1801);
    float _1807 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1809 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1811 = isnan(0.5);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1817 = _1813 || _1815;
    float _1819 = _1807 + _1775;
    float _1821 = _1819 * _1785;
    float _1823 = _1821 * 0.5;
    bool _1825 = _1805 > 0.0;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1829 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1827);
    float _1831 = -_1015;
    float _1833 = _1831 + _1757;
    float _1835 = -_1039;
    float _1837 = _1835 + _1761;
    float _1839 = 1.0 / _1829;
    float _1841 = _1819;
    float _1843 = _1759;
    if (!_1825)
    {
        _1043 = _1783;
    }
    float _1845 = _1043;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1825)
    {
        _1841 = _1833;
    }
    float _1851 = _1841;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1825)
    {
        _1045 = _1837;
    }
    float _1857 = _1045;
    bool _1859 = !_1825;
    float _1861 = _1857;
    float _1863 = _1857;
    float _1865 = _1839;
    if (!_1859)
    {
        float _1867 = _211 * _211;
        float _1869 = fma(_209, _209, _1867);
        float _1871 = fma(_213, _213, _1869);
        float _1873 = rsqrt(_1801);
        float _1875 = sqrt(_1871);
        float _1877 = _1769 * _1873;
        float _1879 = _1765 * _1873;
        float _1881 = _1773 * _1873;
        bool _1883 = _1875 > 0.0;
        _1843 = _1875;
        if (!_1883)
        {
            _1847 = _1783;
        }
        float _1885 = _1847;
        _1849 = _1885;
        if (!_1883)
        {
            _1853 = _1833;
        }
        float _1887 = _1853;
        _1855 = _1887;
        if (!_1883)
        {
            _1861 = _1837;
        }
        float _1889 = _1861;
        bool _1891 = !_1883;
        _1863 = _1889;
        if (!_1891)
        {
            float _1893 = rsqrt(_1871);
            float _1895 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1897 = _211 * _1893;
            float _1899 = _209 * _1893;
            float _1901 = _213 * _1893;
            float _1903 = _1879 * _1897;
            float _1905 = fma(_1877, _1899, _1903);
            float _1907 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1909 = fma(_1881, _1901, _1905);
            float _1911 = _1909 * _1907;
            float _1913 = fma(_209, _1911, _1783);
            float _1915 = fma(_211, _1911, _1833);
            float _1917 = fma(_213, _1911, _1837);
            _1849 = _1913;
            _1855 = _1915;
            _1863 = _1917;
            _1843 = _1899;
        }
    }
    float _1919 = _1849;
    float _1921 = _1855;
    float _1923 = _1863;
    float _1925 = _1843;
    float _1927 = -_1203;
    float _1929 = _1927 + _1919;
    float _1931 = -_1201;
    float _1933 = _1931 + _1921;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1937 = _1839 * _1935;
    float _1939 = -_1251;
    float _1941 = _1939 + _1923;
    float _1943 = _1925;
    float _1945 = _1933;
    float _1947 = _1941;
    if (_1817)
    {
        _1943 = 1.0;
    }
    float _1949 = _1943;
    float _1951 = _1949;
    if (_1799)
    {
        _1865 = _1929;
    }
    float _1953 = _1865;
    float _1955 = _1953;
    if (!_1799)
    {
        float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1959 = _1659 + _1957;
        float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1963 = _1685 + _1961;
        float _1965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1967 = -_1579;
        float _1969 = _1967 + _1923;
        float _1971 = _1959 * _1959;
        float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1975 = _1665 + _1973;
        float _1977 = -_1569;
        float _1979 = _1977 + _1919;
        float _1981 = fma(_1963, _1963, _1971);
        float _1983 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1985 = fma(_1975, _1975, _1981);
        float _1987 = sqrt(_1985);
        float _1989 = 1.0 / _1367;
        float _1991 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = precise::min(_1987, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1995 = _1993 * _1965;
        float _1997 = _1995 * _1989;
        float _1999 = -_1627;
        float _2001 = _1999 + _1921;
        float _2003 = _1991 * _1997;
        float _2005 = _1969 * _1997;
        float _2007 = fma(_2001, _2003, _1659);
        float _2009 = fma(_1979, _2003, _1685);
        float _2011 = fma(_1991, _2005, _1665);
        _217 = _1965;
        _1945 = _2007;
        _1955 = _2009;
        _1947 = _2011;
    }
    float _2013 = _217;
    float _2015 = _1945;
    float _2017 = _1955;
    float _2019 = _1947;
    float _2021 = _2013;
    if (!_1817)
    {
        float _2023 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2025 = _2023 * 0.15915493667125701904296875;
        float _2027 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2029 = _2025 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        float _2033 = _2027 * 0.15915493667125701904296875;
        float _2035 = _2025 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        float _2039 = 1.0 / _2031;
        float _2041 = _2033 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        float _2045 = _2037 * _2039;
        float _2047 = _2033 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        float _2051 = _2043 * _2045;
        float _2053 = 1.0 / _2051;
        float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2057 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2055;
        float _2059 = 1.0 / _2057;
        float _2061 = _2049 * _2053;
        float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2065 = fma(_1937, _2061, _2063);
        float _2067 = _2065 * _2059;
        float _2069 = precise::clamp(_2067, 0.0, 1.0);
        _2021 = _2059;
        _1951 = _2069;
    }
    float _2071 = _2021;
    float _2073 = _1951;
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2077 = _2015 + _2075;
    float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2081 = _2017 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2085 = _2019 + _2083;
    float _2087 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2089 = _2077 * _2077;
    float _2091 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2087);
    float _2095 = fma(_2081, _2081, _2089);
    float _2097 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2099 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2093);
    float _2101 = fma(_2085, _2085, _2095);
    float _2103 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2105 = rsqrt(_2101);
    float _2107 = sqrt(_2101);
    float _2109 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2111 = _2081 * _2109;
    float _2113 = _2085 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 * _2113;
    float _2119 = _2115 + _2117;
    float _2121 = sqrt(_2119);
    bool _2123 = _2121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2127 = _2121 + _2125;
    float _2129 = _2105;
    float _2131 = _2119;
    float _2133 = _2127;
    float _2135 = _2071;
    float _2137 = _2077;
    float _2139 = _2109;
    float _2141 = _2111;
    if (_2123)
    {
        float _2143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2129 = _2143;
    }
    float _2145 = _2129;
    if (_2123)
    {
        float _2147 = rsqrt(_2119);
        _2131 = _2147;
    }
    float _2149 = _2131;
    float _2151 = _2149;
    if (_2123)
    {
        float _2153 = _2127 * _2145;
        _2133 = _2153;
    }
    float _2155 = _2133;
    if (_2123)
    {
        float _2157 = _2155 * 0.15915493667125701904296875;
        _2135 = _2157;
    }
    float _2159 = _2135;
    float _2161 = _2145;
    float _2163 = _2159;
    if (_2123)
    {
        float _2165 = _2159 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        _2161 = _2167;
    }
    float _2169 = _2161;
    float _2171 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2173 = precise::max(0.0, _2171);
    float _2175 = _2085;
    float _2177 = _2173;
    if (_2123)
    {
        float _2179 = _2159 * 6.283185482025146484375;
        float _2181 = cos(_2179);
        _2175 = _2181;
    }
    float _2183 = _2175;
    float _2185 = -_2109;
    float _2187 = -_2173;
    float _2189 = fma(_2077, _2185, _2187);
    if (_2123)
    {
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2191;
    }
    float _2193 = _2177;
    float _2195 = _2193;
    if (!_2123)
    {
        _2163 = _2111;
    }
    float _2197 = _2163;
    float _2199 = _2169;
    float _2201 = _2197;
    if (_2123)
    {
        float _2203 = fma(_2169, _2193, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2195 = _2203;
    }
    float _2205 = _2195;
    if (!_2123)
    {
        _2199 = _2189;
    }
    float _2207 = _2199;
    float _2209 = _2207;
    float _2211 = _2183;
    if (_2123)
    {
        float _2213 = _2183 + (-1.0);
        _2137 = _2213;
    }
    float _2215 = _2137;
    float _2217 = _2215;
    if (_2123)
    {
        float _2219 = _2149 * _2205;
        _2139 = _2219;
    }
    float _2221 = _2139;
    if (!_2123)
    {
        _2151 = _2113;
    }
    float _2223 = _2151;
    float _2225 = _2223;
    if (_2123)
    {
        float _2227 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2227;
    }
    float _2229 = _2217;
    if (_2123)
    {
        float _2231 = _2111 * _2221;
        _2201 = _2231;
    }
    float _2233 = _2201;
    if (_2123)
    {
        float _2235 = _2113 * _2221;
        _2225 = _2235;
    }
    float _2237 = _2225;
    if (!_2123)
    {
        _2141 = _2117;
    }
    float _2239 = _2141;
    float _2241 = _2239;
    if (_2123)
    {
        float _2243 = fma(_2189, _2183, _2229);
        _2209 = _2243;
    }
    float _2245 = _2209;
    if (!_2123)
    {
        _2211 = _2115;
    }
    float _2247 = _2211;
    float _2249 = _2247;
    if (_2123)
    {
        float _2251 = _2233 * _2233;
        _2249 = _2251;
    }
    float _2253 = _2249;
    if (_2123)
    {
        float _2255 = _2237 * _2237;
        _2241 = _2255;
    }
    float _2257 = _2241;
    float _2259 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2261 = fma(_2245, _2245, _2253);
    float _2263 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2259);
    float _2265 = _2261 + _2257;
    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2269 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2267);
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2263);
    float _2275 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2277 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2279 = -_2271;
    float _2281 = _2279 + 1.0;
    float _2283 = rsqrt(_2265);
    float _2285 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2289 = fma(_1665, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2291 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2293 = abs(_2281);
    float _2295 = log2(_2293);
    float _2297 = -_2287;
    float _2299 = fma(_2297, _2275, 1.0);
    float _2301 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2291);
    float _2303 = _2283 * _2233;
    float _2305 = _2283 * _2245;
    float _2307 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2309 = floor(_2277);
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2313 = _2283 * _2237;
    float _2315 = _2307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2317 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2319 = -_2311;
    float _2321 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2319);
    float _2323 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2325 = floor(_2289);
    float _2327 = -_2313;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2321);
    float _2331 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2097);
    float _2333 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2317);
    float _2335 = fma(_2329, -0.5, 0.5);
    float _2337 = _2331 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2339 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2333);
    float _2341 = exp2(_2323);
    float _2343 = -_2309;
    float _2345 = _2277 + _2343;
    float _2347 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2349 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2339);
    float _2351 = _2305 + 1.0;
    float _2353 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2347);
    float _2355 = log2(_2299);
    float _2357 = -_2325;
    float _2359 = _2289 + _2357;
    float _2361 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2353);
    float _2363 = 1.0 / _2349;
    float _2365 = fma(_2329, 0.5, 0.5);
    float _2367 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2371 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2373 = -_2305;
    float _2375 = fma(_2341, _2351, _2373);
    float _2377 = sqrt(_2335);
    float _2379 = fma(_2365, _2369, -0.212114393711090087890625);
    float _2381 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2371);
    float _2383 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2361);
    float _2385 = _2355 * 0.693147182464599609375;
    float2 _6634 = float2(_2345, _2359);
    float _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6634, float2(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6634, float2(0.0), isnan(_6634)), level(0.0)).x;
    float _2389 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2381);
    float _2391 = fma(_2365, _2379, 1.570728778839111328125);
    float _2393 = _2383 * _2363;
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2397 = _2389 * _2363;
    float _2399 = fma(_2375, 0.5, 0.5);
    float _2401 = fma(_2393, 0.5, 0.5);
    float _2403 = fma(_2397, -0.5, 0.5);
    float _2405 = _2377 * 0.636619746685028076171875;
    float _2407 = -_2391;
    float _2409 = fma(_2405, _2407, 1.0);
    float3 _6678 = float3(_2401, _2403, _2395);
    float _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6678, float3(0.0), isnan(_6678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6678, float3(0.0), isnan(_6678)), level(0.0)).x;
    float3 _6689 = float3(_2401, _2403, _2395);
    float4 _2414 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6689, float3(0.0), isnan(_6689)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6689, float3(0.0), isnan(_6689)), level(0.0)).xyzw;
    float _2416 = _2414.x;
    float _2418 = _2414.y;
    float _2420 = _2414.z;
    float _2422 = _2414.w;
    float2 _6705 = float2(_2409, _2399);
    float3 _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6705, float2(0.0), isnan(_6705)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6705, float2(0.0), isnan(_6705)), level(0.0)).xyz;
    float _2428 = _2426.x;
    float _2430 = _2426.y;
    float _2432 = _2426.z;
    float _2434 = abs(_1937);
    float _2436 = log2(_2434);
    float _2438 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2440 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2442 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2444 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2446 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2448 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2450 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2438);
    float _2452 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2440);
    float _2454 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2456 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2442);
    float _2458 = -_1565;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2444);
    float _2462 = -_1565;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2446);
    float _2466 = -_1565;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2454);
    float _2470 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2448);
    float _2474 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2476 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2478 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2480 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2460);
    float _2484 = fma(_2476, _2476, 1.0);
    float _2486 = exp2(_2474);
    float _2488 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2464);
    float _2490 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2468);
    float _2492 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2494 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2472);
    float _2496 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2478);
    float _2498 = rsqrt(_2484);
    float _2500 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2492);
    float _2502 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2450);
    float _2504 = _2476 * _2482;
    out.m_78.x = _2017;
    out.m_78.y = _2015;
    out.m_78.z = _2019;
    bool _2506 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2508 = isnan(_2107);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2514 = _2510 || _2512;
    float _2516 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2518 = precise::clamp(_2516, 0.0, 1.0);
    float _2520 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2452);
    float _2522 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2524 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2456);
    float _2526 = fma(_2518, -2.0, 3.0);
    float _2528 = _2518 * _2518;
    float _2530 = _2476 * _2488;
    float _2532 = fma(_2522, _2502, _2504);
    float _2534 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2536 = _2528 * _2526;
    float _2538 = fma(_2522, _2520, _2530);
    float _2540 = _2476 * _2490;
    float _2542 = _2476 * _2498;
    out.m_80.x = _2502;
    out.m_80.y = _2520;
    out.m_80.z = _2524;
    float _2544 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2534);
    float _2546 = fma(_2522, _2524, _2540);
    float _2548 = -_2500;
    float _2550 = _2542 * _2548;
    float _2552 = -_2536;
    float _2554 = _2552 + 1.0;
    float _2556 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2544);
    float _2558 = -_2494;
    float _2560 = _2542 * _2558;
    float _2562 = in.m_82.x;
    float _2564 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2536);
    float _2566 = _2494 + _2532;
    float _2568 = _2500 + _2546;
    out.m_84.x = _1685;
    out.m_84.y = _1659;
    out.m_84.z = _1665;
    float _2570 = -_2496;
    float _2572 = _2542 * _2570;
    float _2574 = fma(_2498, _2482, _2560);
    float _2576 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2556);
    float _2578 = fma(_2498, _2488, _2572);
    float _2580 = fma(_2498, _2490, _2550);
    float _2582 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2584 = _1937 <= 8000.0;
    bool _2586 = isnan(_1937);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan(8000.0);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2349 * 0.5;
    out.gl_Position.x = _2383;
    out.gl_Position.y = _2389;
    out.gl_Position.z = _2576;
    out.gl_Position.w = _2349;
    float _2598 = _2576 + _2349;
    float _2600 = _2383 + _2349;
    float _2602 = exp2(_2582);
    float _2604 = _2594 * _2564;
    float _2606 = fma(_2389, -0.5, _2596);
    out.m_86.x = _2574;
    out.m_86.y = _2578;
    out.m_86.z = _2580;
    float _2608 = _2598 * 0.5;
    float _2610 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = _2600 * 0.5;
    float _2614 = _2496 + _2538;
    float _2616 = _2532;
    float _2618 = _2578;
    if (!_2514)
    {
        _2616 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2620 = _2616;
    float _2622 = _2620;
    float _2624 = _2620;
    if (!_2514)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2626 = _1701;
    out.m_88.x = _2612;
    out.m_88.y = _2606;
    out.m_88.z = _2608;
    out.m_88.w = _2349;
    float _2628 = _2626;
    float _2630 = _2626;
    if (!_2514)
    {
        _1703 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2632 = _1703;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2514)
    {
        _1705 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _1705;
    out.m_90.x = _2566;
    out.m_90.y = _2614;
    out.m_90.z = _2568;
    float _2640 = -_2602;
    float _2642 = _2640 + 1.0;
    float _2644 = _2638;
    float _2646 = _2638;
    if (!_2514)
    {
        _2618 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _2618;
    float _2650 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = -_2387;
    float _2654 = _2652 + 1.0;
    float _2656 = _2654 * _2610;
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -_2658;
    float _2662 = fma(_2660, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2664 = _2073 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2666 = _2662 * _2562;
    float _2668 = _2666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = _2650 * _2411;
    float _2672 = -_2650;
    float _2674 = _2672 + 1.0;
    float _2676 = _2422 * _2670;
    float _2678 = _2432 * _2670;
    float _2680 = _2422 * _2674;
    out.m_92.x = _2668;
    float _2682 = fma(_2428, _2676, _2416);
    float _2684 = fma(_2430, _2676, _2418);
    float _2686 = fma(_2422, _2678, _2420);
    float _2688 = _2674;
    float _2690 = _2648;
    float _2692 = _2648;
    if (!_2514)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2694 = _2688;
    out.m_94.x = _2682;
    out.m_94.y = _2684;
    out.m_94.z = _2686;
    out.m_94.w = _2680;
    bool _2696 = !_2514;
    float _2698 = _2694;
    float _2700 = _2694;
    if (!_2696)
    {
        bool _2702 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2704 = isnan(_2107);
        bool _2706 = _2702 || _2704;
        bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2710 = _2706 || _2708;
        if (!_2710)
        {
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2714 = _2107 + _2712;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2718 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2716;
            float _2720 = 1.0 / _2718;
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2742 = _2714 * _2720;
            float _2744 = precise::clamp(_2742, 0.0, 1.0);
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2750 = fma(_2744, _2724, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2752 = fma(_2744, _2748, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2754 = fma(_2744, _2728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2756 = fma(_2744, _2732, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2758 = fma(_2744, _2736, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2760 = fma(_2744, _2740, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2700 = _2752;
            _2636 = _2758;
            _2624 = _2750;
            _2630 = _2756;
            _2692 = _2754;
            _2646 = _2760;
            _2762 = true;
        }
        else
        {
            bool _2764 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2766 = isnan(_2107);
            bool _2768 = _2764 || _2766;
            bool _2770 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2772 = _2768 || _2770;
            if (!_2772)
            {
                _2622 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2774 = _2622;
            _2624 = _2774;
            if (!_2772)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2776 = _2698;
            _2700 = _2776;
            if (!_2772)
            {
                _2690 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2778 = _2690;
            _2692 = _2778;
            if (!_2772)
            {
                _2628 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2780 = _2628;
            _2630 = _2780;
            if (!_2772)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2782 = _2634;
            _2636 = _2782;
            if (!_2772)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2784 = _2644;
            bool _2786 = !_2772;
            _2646 = _2784;
            if (!_2786)
            {
                bool _2788 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2790 = isnan(_2107);
                bool _2792 = _2788 || _2790;
                bool _2794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2796 = _2792 || _2794;
                if (!_2796)
                {
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2800 = _2107 + _2798;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2802;
                    float _2806 = 1.0 / _2804;
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2828 = _2800 * _2806;
                    float _2830 = precise::clamp(_2828, 0.0, 1.0);
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2836 = fma(_2830, _2810, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2838 = fma(_2830, _2834, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2840 = fma(_2830, _2814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2842 = fma(_2830, _2818, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2844 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2846 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2700 = _2838;
                    _2636 = _2844;
                    _2624 = _2836;
                    _2630 = _2842;
                    _2692 = _2840;
                    _2646 = _2846;
                    _2762 = true;
                }
                else
                {
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2624 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2630 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2692 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2762 = false;
    float _2848 = _2700;
    float _2850 = _2636;
    float _2852 = _2624;
    float _2854 = _2630;
    float _2856 = _2692;
    float _2858 = _2646;
    float _2860 = fma(_2614, -0.5, 0.5);
    float _2862 = precise::clamp(_2860, 0.0, 1.0);
    float _2864 = -_2848;
    float _2866 = _2864 + _2850;
    float _2868 = -_2852;
    float _2870 = _2868 + _2854;
    out.m_96.x = 0.0;
    float _2872 = fma(_2862, _2866, _2848);
    float _2874 = -_2856;
    float _2876 = _2874 + _2858;
    float _2878 = fma(_2862, _2870, _2852);
    float _2880 = _2872 * 0.586610972881317138671875;
    bool _2882 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2884 = fma(_2862, _2876, _2856);
    float _2886 = _2664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2888 = fma(_2878, 0.298911988735198974609375, _2880);
    bool _2890 = _2073 > 0.0;
    bool _2892 = isnan(_2073);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan(0.0);
    bool _2898 = _2894 || _2896;
    float _2900 = fma(_2884, 0.114477999508380889892578125, _2888);
    out.m_49.x = _2886;
    float _2902 = -_2900;
    float _2904 = _2878 + _2902;
    float _2906 = -_2900;
    float _2908 = _2872 + _2906;
    float _2910 = -_2900;
    float _2912 = _2884 + _2910;
    float _2914 = fma(_2904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2916 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2918 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    bool _2920 = !_2882;
    if (!_2920)
    {
        float _2922 = -_2015;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2926 = -_2017;
        float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2930 = -_2019;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2934 = _2924 * _2924;
        float _2936 = fma(_2928, _2928, _2934);
        float _2938 = fma(_2932, _2932, _2936);
        float _2940 = sqrt(_2938);
        float _2942 = rsqrt(_2938);
        float _2944 = -_2940;
        float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2950 = precise::clamp(_2948, 0.0, 1.0);
        float _2952 = _2928 * _2942;
        float _2954 = _2924 * _2942;
        float _2956 = abs(_2950);
        float _2958 = log2(_2956);
        float _2960 = _2932 * _2942;
        float _2962 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2964 = _2614 * _2954;
        float _2966 = -_2954;
        float _2968 = -_2962;
        float _2970 = fma(_2966, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2968);
        float _2972 = fma(_2566, _2952, _2964);
        float _2974 = -_2960;
        float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2970);
        float _2978 = fma(_2568, _2960, _2972);
        float _2980 = precise::clamp(_2978, 0.0, 1.0);
        float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2984 = _2976 + _2982;
        float _2986 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2988 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2990 = precise::clamp(_2988, 0.0, 1.0);
        float _2992 = exp2(_2986);
        float _2994 = _2992 * _2990;
        float _2996 = _2980 * _2994;
        float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3000 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3002 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2998;
        out.m_96.y = _3000;
        out.m_96.z = _3002;
    }
    out.m_64.x = _2914;
    out.m_64.y = _2916;
    out.m_64.z = _2918;
    if (_2898)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3004 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3004;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2762 = false;
    bool _581 = false;
    bool _439 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3061 = as_type<float>(_131);
        out.gl_Position.z = _3061;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_51.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3131 = as_type<float>(_169);
        out.gl_Position.z = _3131;
    }
    if (_161)
    {
        return out;
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    int _179 = as_type<int>(_171) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_171) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _195 = !_181;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _201 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    bool _205 = !_185;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_187;
    float _217 = _213;
    float _235;
    if (!_215)
    {
        float _219 = in.m_58.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_115);
        float _241 = 1.0 / _239;
        float _243 = _149 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = 1.0 / _265;
    float _277 = -_261;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = 1.0 / _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _269;
    float _291 = _249 * _275;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _245 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _245 + _297;
    float _301 = _295 * _283;
    bool _303 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_245);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_245);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _313 * _279;
    bool _329 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_245);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _299 * _289;
    float _343 = fma(_287, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -_313;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = -_325;
    float _363 = _361 + 1.0;
    float _365 = _325 * _351;
    float _367 = fma(_355, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = _339 * _363;
    float _373 = fma(_347, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = in.m_60.x;
    float _377 = in.m_60.y;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = _343 * _371;
    float _385 = _373 * _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _399 = fma(_389, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_393, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_367, _365, _395);
    float _405 = fma(_369, _365, _397);
    float _407 = fma(_401, _327, _403);
    float _409 = fma(_399, _327, _405);
    float _411 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _409);
    float _415 = _411 * _375;
    float _417 = _413 * _377;
    bool _419 = !_281;
    float _437;
    if (!_419)
    {
        float _421 = in.m_58.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_115);
        float _443 = 1.0 / _441;
        float _445 = _149 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _447 + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = isnan(_447);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _475 = isnan(_447);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _485;
    bool _489 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _491 = isnan(_447);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _455;
    float _503 = -_467;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = _483 * _505;
    float _511 = -_483;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _471;
    float _517 = _487 * _501;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _523 = fma(_517, _451, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _525 = _521 * _515;
    float _527 = _523 * _509;
    float _529 = -_499;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _447 + _533;
    float _537 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _527);
    float _539 = _467 * _531;
    float _541 = fma(_525, _535, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = fma(_541, _539, _537);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _551 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[117].x, _545);
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _553;
    out.m_62.y = _555;
    out.m_62.z = _557;
    out.m_62.w = _559;
    bool _561 = !_507;
    float _579;
    if (!_561)
    {
        float _563 = in.m_58.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_115);
        float _585 = 1.0 / _583;
        float _587 = _149 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = in.m_58.z;
    float _593 = in.m_58.w;
    float _595 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = in.m_46.x;
    float _599 = in.m_46.y;
    float _601 = in.m_46.z;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = in.m_58.x;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _611 = _609 != 0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _617 = 1.0 / _605;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _623 = 1.0 / _615;
    bool _625 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _627 = isnan(_589);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _639 = _637 != 0;
    float _641 = 0.0;
    if (_611)
    {
        float _643 = in.m_58.y;
        _641 = _643;
    }
    float _645 = _641;
    float _647 = _591 * 2.0;
    bool _649 = _593 > 0.5;
    float _651 = 1.0 / _621;
    float _653 = _599 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _655 = _599 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _657 = _599 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _659;
    float _663 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].x, _653);
    float _665 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].x, _655);
    float _667 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].x, _657);
    float _669 = floor(_647);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _675;
    float _679 = _661 * _623;
    float _681 = -_635;
    float _683 = _681 + 1.0;
    float _685 = _673 * _617;
    bool _687 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _689 = isnan(_589);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[5].z, _665);
    float _701 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _703 = log2(_701);
    float _705 = _677 * _651;
    bool _707 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _709 = isnan(_589);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -_697;
    float _721 = _719 + 1.0;
    float _723 = _697 * _683;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _727 = _589 + _725;
    float _729 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[4].z, _663);
    float _731 = _699 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _733 = _669 > 0.0;
    float _735 = fma(_679, _727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _737 = _669 >= 0.0;
    bool _739 = isnan(_669);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _589 + _747;
    bool _751 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = isnan(_589);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _765 = _589 + _763;
    float _767 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[6].z, _667);
    float _769 = fma(_685, _749, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _771 = _729 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _773 = _761 * _721;
    float _775 = -_761;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _731 + _779;
    float _783 = _607 * 2.0;
    float _785 = fma(_705, _765, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _787 = _717 * _777;
    bool _789 = _607 > 0.5;
    float _791 = _767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _795 = _771 + _793;
    float _797 = _735 * _787;
    float _799 = _703 * _149;
    float _801 = _781 * _781;
    float _803 = floor(_783);
    float _805 = -_197;
    int _807 = _789 ? as_type<int>(_805) : as_type<int>(_197);
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _811 = _791 + _809;
    float _813 = fma(_795, _795, _801);
    float _815 = 0.0;
    bool _817 = _745;
    float _819 = _773;
    if (_639)
    {
        float _821 = in.m_58.w;
        _815 = _821;
    }
    float _823 = _815;
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = -_207;
    int _841 = _649 ? as_type<int>(_839) : as_type<int>(_207);
    float _843 = exp2(_799);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _847 = _845 != 0;
    float _849 = fma(_811, _811, _813);
    bool _851 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _859 = _855 || _857;
    float _861 = 1.0 / _837;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _871 = _833;
    if (_847)
    {
        float _873 = _607 * 3.1415927410125732421875;
        _869 = _873;
    }
    float _875 = _869;
    float _877 = rsqrt(_849);
    float _879 = -_843;
    float _881 = _879 + 1.0;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _885 = 0.0;
    float _887 = _843;
    float _889 = _875;
    if (_847)
    {
        float _891 = _875 * 0.15915493667125701904296875;
        _885 = _891;
    }
    float _893 = _885;
    if (_611)
    {
        _887 = _607;
    }
    float _895 = _887;
    float _897 = _859 ? _881 : 0.0;
    float _899 = sqrt(_849);
    float _901 = _895;
    float _903 = _645;
    if (_611)
    {
        _889 = _645;
    }
    float _905 = _889;
    bool _907 = _803 >= 0.0;
    bool _909 = isnan(_803);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = _905;
    if (!_611)
    {
        float _919 = in.m_58.y;
        float _921 = _607 * 3.1415927410125732421875;
        float _923 = _921 * 0.15915493667125701904296875;
        float _925 = _923 * 6.283185482025146484375;
        float _927 = sin(_925);
        float _929 = _919 * 3.1415927410125732421875;
        float _931 = _929 * 0.15915493667125701904296875;
        float _933 = _931 * 6.283185482025146484375;
        float _935 = sin(_933);
        _917 = _935;
        _901 = _927;
        _903 = _919;
    }
    float _937 = _917;
    float _939 = _901;
    float _941 = _903;
    float _943 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[93].w, _883);
    float _945 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[93].z, _863);
    float _947 = _883;
    float _949 = _937;
    if (_847)
    {
        float _951 = _893 * 6.283185482025146484375;
        float _953 = sin(_951);
        _947 = _953;
    }
    float _955 = _947;
    float _957 = _939 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _959 = _937 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_639)
    {
        float _961 = _823 * 3.1415927410125732421875;
        _949 = _961;
    }
    float _963 = _949;
    float _965 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[92].z, _945);
    float _967 = -_867;
    float _969 = fma(_957, 2.0, _967);
    float _971 = _595 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _973 = _899 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _975 = 0.0;
    if (_639)
    {
        float _977 = _963 * 0.15915493667125701904296875;
        _975 = _977;
    }
    float _979 = _975;
    float _981 = fma(_959, -2.0, _865);
    float _983 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[92].w, _943);
    float _985 = -_149;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[91].x, _969);
    float _989 = precise::min(_971, _973);
    float _991 = _943;
    if (_639)
    {
        float _993 = _979 * 6.283185482025146484375;
        float _995 = sin(_993);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _781 * _877;
    float _1001 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[91].y, _981);
    if (_833)
    {
        float _1003 = _897 * _861;
        _151 = _1003;
    }
    float _1005 = _151;
    float _1007 = -_717;
    float _1009 = _1007 + 1.0;
    if (_847)
    {
        bool _1011 = _955 > 0.5;
        _871 = _1011;
    }
    bool _1013 = _871;
    float _1015 = _999 * _989;
    float _1017 = _795 * _877;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[131].x, _797);
    float _1021 = _811 * _877;
    float _1023 = -_1015;
    float _1025 = _781 + _1023;
    float _1027 = _1017 * _989;
    int _1029 = _745 ? 0 : 1;
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1033 = _1025 * _1025;
    float _1035 = -_1027;
    float _1037 = _795 + _1035;
    float _1039 = _1021 * _989;
    float _1041 = _1019;
    float _1043 = _1039;
    float _1045 = _1027;
    if (_639)
    {
        bool _1047 = _997 > 0.5;
        _817 = _1047;
    }
    bool _1049 = _817;
    float _1051 = _941 * 2.0;
    float _1053 = fma(_1037, _1037, _1033);
    float _1055 = -_1039;
    float _1057 = _811 + _1055;
    float _1059 = fma(_769, _773, _1019);
    int _1061 = ~_1029;
    int _1063 = _1061 + 1;
    int _1065 = _1063 + 1;
    float _1067 = -_965;
    float _1069 = _1067 + 1.0;
    float _1071 = fma(_1057, _1057, _1053);
    int _1073 = _1065;
    if (!_733)
    {
        int _1075 = ~_1029;
        int _1077 = _1075 + 1;
        _1073 = _1077;
    }
    int _1079 = _1073;
    float _1081 = fma(_785, _723, _1059);
    bool _1083 = _591 > 0.5;
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_847)
    {
        _1041 = _207;
    }
    float _1093 = _1041;
    float _1095 = _607 + _941;
    int _1097 = _915 ? 0 : 1;
    out.m_64.w = _989;
    float _1099 = _1093;
    if (!_639)
    {
        _819 = _197;
    }
    float _1101 = _819;
    float _1103 = sqrt(_1071);
    float _1105 = _1101;
    if (_847)
    {
        float _1107 = -_207;
        float _1109 = _1013 ? _1107 : _207;
        _1099 = _1109;
    }
    float _1111 = _1099;
    float _1113 = _1095 + (-1.0);
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1121 = _1119 != 0;
    if (_639)
    {
        float _1123 = -_197;
        float _1125 = _1049 ? _1123 : _197;
        _1105 = _1125;
    }
    float _1127 = _1105;
    bool _1129 = _803 > 0.0;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = -_197;
    int _1135 = _1083 ? as_type<int>(_1133) : as_type<int>(_197);
    float _1137 = -_207;
    int _1139 = _1083 ? as_type<int>(_1137) : as_type<int>(_207);
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1143 = _1141 != 0;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1151 = _1149 != 0;
    int _1153 = ~_1097;
    int _1155 = _1153 + 1;
    int _1157 = _1155 + 1;
    float _1159 = _877 * _1103;
    bool _1161 = !_1121;
    float _1163 = _1161 ? _197 : as_type<float>(_1135);
    float _1165 = floor(_1051);
    bool _1167 = !_1143;
    float _1169 = _1167 ? _207 : as_type<float>(_841);
    float _1171 = _595 * _1159;
    int _1173 = _1157;
    if (!_1129)
    {
        int _1175 = ~_1097;
        int _1177 = _1175 + 1;
        _1173 = _1177;
    }
    int _1179 = _1173;
    float _1181 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1183 = _1111 + (-0.5);
    float _1185 = _1127 + 0.5;
    float _1187 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1189 = _941 > 0.5;
    float _1191 = -_1181;
    float _1193 = -_1001;
    float _1195 = fma(_1191, _1183, _1193);
    float _1197 = fma(_1091, _1185, _987);
    float _1199 = _781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1201 = _999 * _1187;
    float _1203 = _1017 * _1187;
    bool _1205 = !_1089;
    float _1207 = _1205 ? _197 : as_type<float>(_807);
    float _1209 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1199);
    float _1211 = -_1201;
    float _1213 = _781 + _1211;
    bool _1215 = !_1151;
    float _1217 = _1215 ? _207 : as_type<float>(_1139);
    float _1219 = -_1203;
    float _1221 = _795 + _1219;
    float _1223 = -_207;
    int _1225 = _1189 ? as_type<int>(_1223) : as_type<int>(_207);
    float _1227 = _1213 * _1213;
    float _1229 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1081);
    float _1231 = _1163 + 0.5;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1235 = !_1117;
    float _1237 = _1235 ? _207 : as_type<float>(_1225);
    float _1239 = fma(_1221, _1221, _1227);
    float _1241 = -_983;
    float _1243 = _1241 + 1.0;
    float _1245 = _1207 + 0.5;
    float _1247 = -_1169;
    float _1249 = _1247 + 0.5;
    float _1251 = _1021 * _1187;
    float _1253 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1255 = -_1069;
    float _1257 = fma(_1255, _1127, _1197);
    float _1259 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1261 = fma(_1243, _1111, _1195);
    float _1263 = _1253 * _1131;
    float _1265 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1267 = -_1251;
    float _1269 = _811 + _1267;
    float _1271 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1273 = _1259 * _1233;
    float _1275 = fma(_1269, _1269, _1239);
    float _1277 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1209);
    float _1279 = -_197;
    int _1281 = _1189 ? as_type<int>(_1279) : as_type<int>(_197);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1287 = -_1237;
    float _1289 = _1287 + 0.5;
    bool _1291 = _1165 > 0.0;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1295 = _1165 >= 0.0;
    bool _1297 = isnan(_1165);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.0);
    bool _1303 = _1299 || _1301;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1307 = !_1147;
    float _1309 = _1307 ? _197 : as_type<float>(_1281);
    float _1311 = sqrt(_1275);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1319 = _1317 != 0;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1323 = _1321 != 0;
    float _1325 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1327 = _1277 >= 0.0;
    float _1329 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = _1229 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1335 = -_1217;
    float _1337 = _1335 + 0.5;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1341 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1343 = _1309 + 0.5;
    out.m_66.x = _1329;
    out.m_66.y = _1331;
    out.m_66.z = _1325;
    out.m_66.w = _1333;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1347 = _1341 * _1285;
    bool _1349 = !_1315;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = in.m_68.x;
    float _1355 = in.m_68.y;
    float _1357 = in.m_68.z;
    float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1361 = _1285;
    int _1363 = _1351;
    if (_1327)
    {
        _1361 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1365 = _1361;
    float _1367 = _877 * _1311;
    out.m_70.x = _1257;
    out.m_70.y = _1261;
    float _1369 = _1171 * _1367;
    if (_1327)
    {
        out.m_49.x = 0.0;
    }
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1373 = _1345 * _1339;
    float _1375 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1377 = abs(_1351);
    if (_1327)
    {
        float _1379 = _1365 * 5.0;
        _1363 = as_type<int>(_1379);
    }
    int _1381 = _1363;
    out.m_72.x = _1369;
    float _1383 = float(_1377);
    float _1385 = _1265 * _1359;
    if (_1327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5046 = as_type<float>(_1381);
        out.gl_Position.z = _5046;
    }
    out.m_74.x = _1263;
    out.m_74.y = _1347;
    out.m_74.z = _1273;
    out.m_74.w = _1385;
    float _1387 = _1375 * _1371;
    out.m_76.x = _1387;
    out.m_76.y = _1373;
    float _1389 = float(_1079);
    bool _1391 = !_1323;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = _1383 * _1389;
    float _1397 = _607 + (-0.5);
    bool _1399 = !_1319;
    int _1401 = _1399 ? 0 : 1;
    float _1403 = _1357;
    if (_1327)
    {
        return out;
    }
    float _1405 = _1395 * (-2.0);
    float _1407 = -_1201;
    float _1409 = _731 + _1407;
    float _1411 = -_1203;
    float _1413 = _771 + _1411;
    int _1415 = _1303 ? 0 : 1;
    float _1417 = fma(_1405, _1353, _1353);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1421 = _1409 + _1419;
    float _1423 = fma(_1271, _1405, _1271);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1413 + _1425;
    float _1429 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1417);
    int _1431 = abs(_1401);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1435 = ~_1415;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    float _1441 = -_1251;
    float _1443 = _791 + _1441;
    int _1445 = _1439;
    if (!_1291)
    {
        int _1447 = ~_1415;
        int _1449 = _1447 + 1;
        _1445 = _1449;
    }
    int _1451 = _1445;
    float _1453 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1455 = float(_1179);
    float _1457 = _941 + _591;
    float _1459 = float(_1431);
    float _1461 = _607 + _591;
    int _1463 = abs(_1393);
    float _1465 = _1457 + (-1.0);
    float _1467 = float(_1451);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1443 + _1469;
    float _1473 = _1459 * _1455;
    float _1475 = float(_1463);
    float _1477 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1453);
    float _1479 = _941 + (-0.5);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1483 = _1473 * (-2.0);
    float _1485 = _1475 * _1467;
    bool _1487 = _1477 >= 0.0;
    float _1489 = _1461 + (-1.0);
    float _1491 = fma(_1483, _1355, _1355);
    float _1493 = fma(_1481, _1483, _1481);
    float _1495 = _1485 * (-2.0);
    float _1497 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1491);
    float _1499 = _591 + (-0.5);
    float _1501 = fma(_1423, _1005, _1429);
    float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1505 = fma(_1495, _1357, _1357);
    float _1507 = fma(_1493, _1005, _1497);
    float _1509 = _1501 * 0.15915493667125701904296875;
    float _1511 = fma(_1503, _1495, _1503);
    float _1513 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1505);
    float _1515 = _1507 * 0.15915493667125701904296875;
    if (_1487)
    {
        _1403 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1517 = _1403;
    float _1519 = _1509 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    float _1523 = fma(_1511, _1005, _1513);
    int _1525 = as_type<int>(_1517);
    if (_1487)
    {
        out.m_49.x = 0.0;
    }
    if (_1487)
    {
        float _1527 = _1517 * 5.0;
        _1525 = as_type<int>(_1527);
    }
    int _1529 = _1525;
    float _1531 = _1523 * 0.15915493667125701904296875;
    float _1533 = _1509 * 6.283185482025146484375;
    float _1535 = cos(_1533);
    if (_1487)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5292 = as_type<float>(_1529);
        out.gl_Position.z = _5292;
    }
    float _1537 = _1515 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = _1515 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    if (_1487)
    {
        return out;
    }
    float _1545 = _1531 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1551 = _1159 * _1367;
    float _1553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1555 = _1535 * _1543;
    float _1557 = _1535 * _1539;
    float _1559 = _1549 * _1551;
    float _1561 = _1521 * _1543;
    float _1563 = _1531 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = -_1027;
    float _1569 = _771 + _1567;
    float _1571 = _1559 * _1553;
    float _1573 = _1521 * _1539;
    float _1575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1577 = -_1039;
    float _1579 = _791 + _1577;
    float _1581 = _1535 * _1547;
    float _1583 = _1369 * _1575;
    float _1585 = _1543 * _1547;
    float _1587 = _1521 * _1547;
    float _1589 = _1581 * _1571;
    float _1591 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1593 = _1591 * 0.5;
    float _1595 = _1539 * _1547;
    float _1597 = fma(_1565, _1555, _1573);
    float _1599 = -_1561;
    float _1601 = fma(_1565, _1557, _1599);
    float _1603 = -_1571;
    float _1605 = _1565 * _1603;
    float _1607 = -_1557;
    float _1609 = fma(_1565, _1561, _1607);
    float _1611 = fma(_1597, _1583, _1589);
    float _1613 = _1587 * _1571;
    float _1615 = fma(_1585, _1583, _1605);
    float _1617 = fma(_1565, _1573, _1555);
    float _1619 = fma(_1601, _1593, _1611);
    float _1621 = fma(_1609, _1583, _1613);
    float _1623 = fma(_1595, _1593, _1615);
    float _1625 = -_1015;
    float _1627 = _731 + _1625;
    float _1629 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1631 = fma(_1617, _1593, _1621);
    float _1633 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1635 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1637 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1629);
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1633);
    float _1641 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1635);
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1637);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1639);
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1641);
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1651 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1655 = _791 + _1649;
    float _1657 = -_1201;
    float _1659 = _1657 + _1627;
    float _1661 = _771 + _1651;
    float _1663 = -_1251;
    float _1665 = _1663 + _1579;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1669 = _1655 + _1667;
    float _1671 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1675 = _1661 + _1673;
    float _1677 = _731 + _1653;
    float _1679 = _1669 * _1669;
    float _1681 = fma(_1675, _1675, _1679);
    float _1683 = -_1203;
    float _1685 = _1683 + _1569;
    float _1687 = sqrt(_1681);
    float _1689 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1691 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    bool _1693 = _1687 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = _1689;
    float _1697 = _1653;
    float _1699 = _1661;
    float _1701 = _1665;
    float _1703 = _1659;
    float _1705 = _1685;
    if (!_1693)
    {
        _1695 = _1661;
    }
    float _1707 = _1695;
    float _1709 = _1707;
    if (!_1693)
    {
        _1697 = _1655;
    }
    float _1711 = _1697;
    float _1713 = _1711;
    if (!_1693)
    {
        _1699 = _1677;
    }
    float _1715 = _1699;
    bool _1717 = !_1693;
    float _1719 = _1715;
    if (!_1717)
    {
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1725 = _1687 + _1723;
        float _1727 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = rsqrt(_1681);
        float _1731 = _1725 * _1721;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = _1733 * 6.283185482025146484375;
        float _1741 = sin(_1739);
        float _1743 = _1737 + (-1.0);
        float _1745 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = fma(_1741, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1749 = fma(_1677, _1737, _1745);
        float _1751 = _1729 * _1747;
        float _1753 = fma(_1675, _1751, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1755 = fma(_1669, _1751, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1719 = _1749;
        _1709 = _1753;
        _1713 = _1755;
    }
    float _1757 = _1719;
    float _1759 = _1709;
    float _1761 = _1713;
    float _1763 = -_731;
    float _1765 = _1763 + _1757;
    float _1767 = -_771;
    float _1769 = _1767 + _1759;
    float _1771 = -_791;
    float _1773 = _1771 + _1761;
    float _1775 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1777 = _1765 * _1765;
    float _1779 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1781 = -_1027;
    float _1783 = _1781 + _1759;
    float _1785 = 1.0 / _1775;
    float _1787 = fma(_1769, _1769, _1777);
    float _1789 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1779);
    bool _1791 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1793 = isnan(0.5);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1799 = _1795 || _1797;
    float _1801 = fma(_1773, _1773, _1787);
    float _1803 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1789);
    float _1805 = sqrt(_1801);
    float _1807 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1809 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1811 = isnan(0.5);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1817 = _1813 || _1815;
    float _1819 = _1807 + _1775;
    float _1821 = _1819 * _1785;
    float _1823 = _1821 * 0.5;
    bool _1825 = _1805 > 0.0;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1829 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1827);
    float _1831 = -_1015;
    float _1833 = _1831 + _1757;
    float _1835 = -_1039;
    float _1837 = _1835 + _1761;
    float _1839 = 1.0 / _1829;
    float _1841 = _1819;
    float _1843 = _1759;
    if (!_1825)
    {
        _1043 = _1783;
    }
    float _1845 = _1043;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1825)
    {
        _1841 = _1833;
    }
    float _1851 = _1841;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1825)
    {
        _1045 = _1837;
    }
    float _1857 = _1045;
    bool _1859 = !_1825;
    float _1861 = _1857;
    float _1863 = _1857;
    float _1865 = _1839;
    if (!_1859)
    {
        float _1867 = _211 * _211;
        float _1869 = fma(_209, _209, _1867);
        float _1871 = fma(_213, _213, _1869);
        float _1873 = rsqrt(_1801);
        float _1875 = sqrt(_1871);
        float _1877 = _1769 * _1873;
        float _1879 = _1765 * _1873;
        float _1881 = _1773 * _1873;
        bool _1883 = _1875 > 0.0;
        _1843 = _1875;
        if (!_1883)
        {
            _1847 = _1783;
        }
        float _1885 = _1847;
        _1849 = _1885;
        if (!_1883)
        {
            _1853 = _1833;
        }
        float _1887 = _1853;
        _1855 = _1887;
        if (!_1883)
        {
            _1861 = _1837;
        }
        float _1889 = _1861;
        bool _1891 = !_1883;
        _1863 = _1889;
        if (!_1891)
        {
            float _1893 = rsqrt(_1871);
            float _1895 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1897 = _211 * _1893;
            float _1899 = _209 * _1893;
            float _1901 = _213 * _1893;
            float _1903 = _1879 * _1897;
            float _1905 = fma(_1877, _1899, _1903);
            float _1907 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1909 = fma(_1881, _1901, _1905);
            float _1911 = _1909 * _1907;
            float _1913 = fma(_209, _1911, _1783);
            float _1915 = fma(_211, _1911, _1833);
            float _1917 = fma(_213, _1911, _1837);
            _1849 = _1913;
            _1855 = _1915;
            _1863 = _1917;
            _1843 = _1899;
        }
    }
    float _1919 = _1849;
    float _1921 = _1855;
    float _1923 = _1863;
    float _1925 = _1843;
    float _1927 = -_1203;
    float _1929 = _1927 + _1919;
    float _1931 = -_1201;
    float _1933 = _1931 + _1921;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1937 = _1839 * _1935;
    float _1939 = -_1251;
    float _1941 = _1939 + _1923;
    float _1943 = _1925;
    float _1945 = _1933;
    float _1947 = _1941;
    if (_1817)
    {
        _1943 = 1.0;
    }
    float _1949 = _1943;
    float _1951 = _1949;
    if (_1799)
    {
        _1865 = _1929;
    }
    float _1953 = _1865;
    float _1955 = _1953;
    if (!_1799)
    {
        float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1959 = _1659 + _1957;
        float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1963 = _1685 + _1961;
        float _1965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1967 = -_1579;
        float _1969 = _1967 + _1923;
        float _1971 = _1959 * _1959;
        float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1975 = _1665 + _1973;
        float _1977 = -_1569;
        float _1979 = _1977 + _1919;
        float _1981 = fma(_1963, _1963, _1971);
        float _1983 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1985 = fma(_1975, _1975, _1981);
        float _1987 = sqrt(_1985);
        float _1989 = 1.0 / _1367;
        float _1991 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = precise::min(_1987, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1995 = _1993 * _1965;
        float _1997 = _1995 * _1989;
        float _1999 = -_1627;
        float _2001 = _1999 + _1921;
        float _2003 = _1991 * _1997;
        float _2005 = _1969 * _1997;
        float _2007 = fma(_2001, _2003, _1659);
        float _2009 = fma(_1979, _2003, _1685);
        float _2011 = fma(_1991, _2005, _1665);
        _217 = _1965;
        _1945 = _2007;
        _1955 = _2009;
        _1947 = _2011;
    }
    float _2013 = _217;
    float _2015 = _1945;
    float _2017 = _1955;
    float _2019 = _1947;
    float _2021 = _2013;
    if (!_1817)
    {
        float _2023 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2025 = _2023 * 0.15915493667125701904296875;
        float _2027 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2029 = _2025 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        float _2033 = _2027 * 0.15915493667125701904296875;
        float _2035 = _2025 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        float _2039 = 1.0 / _2031;
        float _2041 = _2033 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        float _2045 = _2037 * _2039;
        float _2047 = _2033 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        float _2051 = _2043 * _2045;
        float _2053 = 1.0 / _2051;
        float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2057 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2055;
        float _2059 = 1.0 / _2057;
        float _2061 = _2049 * _2053;
        float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2065 = fma(_1937, _2061, _2063);
        float _2067 = _2065 * _2059;
        float _2069 = precise::clamp(_2067, 0.0, 1.0);
        _2021 = _2059;
        _1951 = _2069;
    }
    float _2071 = _2021;
    float _2073 = _1951;
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2077 = _2015 + _2075;
    float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2081 = _2017 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2085 = _2019 + _2083;
    float _2087 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2089 = _2077 * _2077;
    float _2091 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2087);
    float _2095 = fma(_2081, _2081, _2089);
    float _2097 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2099 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2093);
    float _2101 = fma(_2085, _2085, _2095);
    float _2103 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2105 = rsqrt(_2101);
    float _2107 = sqrt(_2101);
    float _2109 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2111 = _2081 * _2109;
    float _2113 = _2085 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 * _2113;
    float _2119 = _2115 + _2117;
    float _2121 = sqrt(_2119);
    bool _2123 = _2121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2127 = _2121 + _2125;
    float _2129 = _2105;
    float _2131 = _2119;
    float _2133 = _2127;
    float _2135 = _2071;
    float _2137 = _2077;
    float _2139 = _2109;
    float _2141 = _2111;
    if (_2123)
    {
        float _2143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2129 = _2143;
    }
    float _2145 = _2129;
    if (_2123)
    {
        float _2147 = rsqrt(_2119);
        _2131 = _2147;
    }
    float _2149 = _2131;
    float _2151 = _2149;
    if (_2123)
    {
        float _2153 = _2127 * _2145;
        _2133 = _2153;
    }
    float _2155 = _2133;
    if (_2123)
    {
        float _2157 = _2155 * 0.15915493667125701904296875;
        _2135 = _2157;
    }
    float _2159 = _2135;
    float _2161 = _2145;
    float _2163 = _2159;
    if (_2123)
    {
        float _2165 = _2159 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        _2161 = _2167;
    }
    float _2169 = _2161;
    float _2171 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2173 = precise::max(0.0, _2171);
    float _2175 = _2085;
    float _2177 = _2173;
    if (_2123)
    {
        float _2179 = _2159 * 6.283185482025146484375;
        float _2181 = cos(_2179);
        _2175 = _2181;
    }
    float _2183 = _2175;
    float _2185 = -_2109;
    float _2187 = -_2173;
    float _2189 = fma(_2077, _2185, _2187);
    if (_2123)
    {
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2191;
    }
    float _2193 = _2177;
    float _2195 = _2193;
    if (!_2123)
    {
        _2163 = _2111;
    }
    float _2197 = _2163;
    float _2199 = _2169;
    float _2201 = _2197;
    if (_2123)
    {
        float _2203 = fma(_2169, _2193, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2195 = _2203;
    }
    float _2205 = _2195;
    if (!_2123)
    {
        _2199 = _2189;
    }
    float _2207 = _2199;
    float _2209 = _2207;
    float _2211 = _2183;
    if (_2123)
    {
        float _2213 = _2183 + (-1.0);
        _2137 = _2213;
    }
    float _2215 = _2137;
    float _2217 = _2215;
    if (_2123)
    {
        float _2219 = _2149 * _2205;
        _2139 = _2219;
    }
    float _2221 = _2139;
    if (!_2123)
    {
        _2151 = _2113;
    }
    float _2223 = _2151;
    float _2225 = _2223;
    if (_2123)
    {
        float _2227 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2227;
    }
    float _2229 = _2217;
    if (_2123)
    {
        float _2231 = _2111 * _2221;
        _2201 = _2231;
    }
    float _2233 = _2201;
    if (_2123)
    {
        float _2235 = _2113 * _2221;
        _2225 = _2235;
    }
    float _2237 = _2225;
    if (!_2123)
    {
        _2141 = _2117;
    }
    float _2239 = _2141;
    float _2241 = _2239;
    if (_2123)
    {
        float _2243 = fma(_2189, _2183, _2229);
        _2209 = _2243;
    }
    float _2245 = _2209;
    if (!_2123)
    {
        _2211 = _2115;
    }
    float _2247 = _2211;
    float _2249 = _2247;
    if (_2123)
    {
        float _2251 = _2233 * _2233;
        _2249 = _2251;
    }
    float _2253 = _2249;
    if (_2123)
    {
        float _2255 = _2237 * _2237;
        _2241 = _2255;
    }
    float _2257 = _2241;
    float _2259 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2261 = fma(_2245, _2245, _2253);
    float _2263 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2259);
    float _2265 = _2261 + _2257;
    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2269 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2267);
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2263);
    float _2275 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2277 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2279 = -_2271;
    float _2281 = _2279 + 1.0;
    float _2283 = rsqrt(_2265);
    float _2285 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2289 = fma(_1665, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2291 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2293 = abs(_2281);
    float _2295 = log2(_2293);
    float _2297 = -_2287;
    float _2299 = fma(_2297, _2275, 1.0);
    float _2301 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2291);
    float _2303 = _2283 * _2233;
    float _2305 = _2283 * _2245;
    float _2307 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2309 = floor(_2277);
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2313 = _2283 * _2237;
    float _2315 = _2307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2317 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2319 = -_2311;
    float _2321 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2319);
    float _2323 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2325 = floor(_2289);
    float _2327 = -_2313;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2321);
    float _2331 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2097);
    float _2333 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2317);
    float _2335 = fma(_2329, -0.5, 0.5);
    float _2337 = _2331 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2339 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2333);
    float _2341 = exp2(_2323);
    float _2343 = -_2309;
    float _2345 = _2277 + _2343;
    float _2347 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2349 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2339);
    float _2351 = _2305 + 1.0;
    float _2353 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2347);
    float _2355 = log2(_2299);
    float _2357 = -_2325;
    float _2359 = _2289 + _2357;
    float _2361 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2353);
    float _2363 = 1.0 / _2349;
    float _2365 = fma(_2329, 0.5, 0.5);
    float _2367 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2371 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2373 = -_2305;
    float _2375 = fma(_2341, _2351, _2373);
    float _2377 = sqrt(_2335);
    float _2379 = fma(_2365, _2369, -0.212114393711090087890625);
    float _2381 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2371);
    float _2383 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2361);
    float _2385 = _2355 * 0.693147182464599609375;
    float2 _6634 = float2(_2345, _2359);
    float _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6634, float2(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6634, float2(0.0), isnan(_6634)), level(0.0)).x;
    float _2389 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2381);
    float _2391 = fma(_2365, _2379, 1.570728778839111328125);
    float _2393 = _2383 * _2363;
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2397 = _2389 * _2363;
    float _2399 = fma(_2375, 0.5, 0.5);
    float _2401 = fma(_2393, 0.5, 0.5);
    float _2403 = fma(_2397, -0.5, 0.5);
    float _2405 = _2377 * 0.636619746685028076171875;
    float _2407 = -_2391;
    float _2409 = fma(_2405, _2407, 1.0);
    float3 _6678 = float3(_2401, _2403, _2395);
    float _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6678, float3(0.0), isnan(_6678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6678, float3(0.0), isnan(_6678)), level(0.0)).x;
    float3 _6689 = float3(_2401, _2403, _2395);
    float4 _2414 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6689, float3(0.0), isnan(_6689)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6689, float3(0.0), isnan(_6689)), level(0.0)).xyzw;
    float _2416 = _2414.x;
    float _2418 = _2414.y;
    float _2420 = _2414.z;
    float _2422 = _2414.w;
    float2 _6705 = float2(_2409, _2399);
    float3 _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6705, float2(0.0), isnan(_6705)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6705, float2(0.0), isnan(_6705)), level(0.0)).xyz;
    float _2428 = _2426.x;
    float _2430 = _2426.y;
    float _2432 = _2426.z;
    float _2434 = abs(_1937);
    float _2436 = log2(_2434);
    float _2438 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2440 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2442 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2444 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2446 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2448 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2450 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2438);
    float _2452 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2440);
    float _2454 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2456 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2442);
    float _2458 = -_1565;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2444);
    float _2462 = -_1565;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2446);
    float _2466 = -_1565;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2454);
    float _2470 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2448);
    float _2474 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2476 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2478 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2480 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2460);
    float _2484 = fma(_2476, _2476, 1.0);
    float _2486 = exp2(_2474);
    float _2488 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2464);
    float _2490 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2468);
    float _2492 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2494 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2472);
    float _2496 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2478);
    float _2498 = rsqrt(_2484);
    float _2500 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2492);
    float _2502 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2450);
    float _2504 = _2476 * _2482;
    out.m_78.x = _2017;
    out.m_78.y = _2015;
    out.m_78.z = _2019;
    bool _2506 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2508 = isnan(_2107);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2514 = _2510 || _2512;
    float _2516 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2518 = precise::clamp(_2516, 0.0, 1.0);
    float _2520 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2452);
    float _2522 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2524 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2456);
    float _2526 = fma(_2518, -2.0, 3.0);
    float _2528 = _2518 * _2518;
    float _2530 = _2476 * _2488;
    float _2532 = fma(_2522, _2502, _2504);
    float _2534 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2536 = _2528 * _2526;
    float _2538 = fma(_2522, _2520, _2530);
    float _2540 = _2476 * _2490;
    float _2542 = _2476 * _2498;
    out.m_80.x = _2502;
    out.m_80.y = _2520;
    out.m_80.z = _2524;
    float _2544 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2534);
    float _2546 = fma(_2522, _2524, _2540);
    float _2548 = -_2500;
    float _2550 = _2542 * _2548;
    float _2552 = -_2536;
    float _2554 = _2552 + 1.0;
    float _2556 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2544);
    float _2558 = -_2494;
    float _2560 = _2542 * _2558;
    float _2562 = in.m_82.x;
    float _2564 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2536);
    float _2566 = _2494 + _2532;
    float _2568 = _2500 + _2546;
    out.m_84.x = _1685;
    out.m_84.y = _1659;
    out.m_84.z = _1665;
    float _2570 = -_2496;
    float _2572 = _2542 * _2570;
    float _2574 = fma(_2498, _2482, _2560);
    float _2576 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2556);
    float _2578 = fma(_2498, _2488, _2572);
    float _2580 = fma(_2498, _2490, _2550);
    float _2582 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2584 = _1937 <= 8000.0;
    bool _2586 = isnan(_1937);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan(8000.0);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2349 * 0.5;
    out.gl_Position.x = _2383;
    out.gl_Position.y = _2389;
    out.gl_Position.z = _2576;
    out.gl_Position.w = _2349;
    float _2598 = _2576 + _2349;
    float _2600 = _2383 + _2349;
    float _2602 = exp2(_2582);
    float _2604 = _2594 * _2564;
    float _2606 = fma(_2389, -0.5, _2596);
    out.m_86.x = _2574;
    out.m_86.y = _2578;
    out.m_86.z = _2580;
    float _2608 = _2598 * 0.5;
    float _2610 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = _2600 * 0.5;
    float _2614 = _2496 + _2538;
    float _2616 = _2532;
    float _2618 = _2578;
    if (!_2514)
    {
        _2616 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2620 = _2616;
    float _2622 = _2620;
    float _2624 = _2620;
    if (!_2514)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2626 = _1701;
    out.m_88.x = _2612;
    out.m_88.y = _2606;
    out.m_88.z = _2608;
    out.m_88.w = _2349;
    float _2628 = _2626;
    float _2630 = _2626;
    if (!_2514)
    {
        _1703 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2632 = _1703;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2514)
    {
        _1705 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _1705;
    out.m_90.x = _2566;
    out.m_90.y = _2614;
    out.m_90.z = _2568;
    float _2640 = -_2602;
    float _2642 = _2640 + 1.0;
    float _2644 = _2638;
    float _2646 = _2638;
    if (!_2514)
    {
        _2618 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _2618;
    float _2650 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = -_2387;
    float _2654 = _2652 + 1.0;
    float _2656 = _2654 * _2610;
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -_2658;
    float _2662 = fma(_2660, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2664 = _2073 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2666 = _2662 * _2562;
    float _2668 = _2666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = _2650 * _2411;
    float _2672 = -_2650;
    float _2674 = _2672 + 1.0;
    float _2676 = _2422 * _2670;
    float _2678 = _2432 * _2670;
    float _2680 = _2422 * _2674;
    out.m_92.x = _2668;
    float _2682 = fma(_2428, _2676, _2416);
    float _2684 = fma(_2430, _2676, _2418);
    float _2686 = fma(_2422, _2678, _2420);
    float _2688 = _2674;
    float _2690 = _2648;
    float _2692 = _2648;
    if (!_2514)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2694 = _2688;
    out.m_94.x = _2682;
    out.m_94.y = _2684;
    out.m_94.z = _2686;
    out.m_94.w = _2680;
    bool _2696 = !_2514;
    float _2698 = _2694;
    float _2700 = _2694;
    if (!_2696)
    {
        bool _2702 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2704 = isnan(_2107);
        bool _2706 = _2702 || _2704;
        bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2710 = _2706 || _2708;
        if (!_2710)
        {
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2714 = _2107 + _2712;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2718 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2716;
            float _2720 = 1.0 / _2718;
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2742 = _2714 * _2720;
            float _2744 = precise::clamp(_2742, 0.0, 1.0);
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2750 = fma(_2744, _2724, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2752 = fma(_2744, _2748, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2754 = fma(_2744, _2728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2756 = fma(_2744, _2732, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2758 = fma(_2744, _2736, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2760 = fma(_2744, _2740, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2700 = _2752;
            _2636 = _2758;
            _2624 = _2750;
            _2630 = _2756;
            _2692 = _2754;
            _2646 = _2760;
            _2762 = true;
        }
        else
        {
            bool _2764 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2766 = isnan(_2107);
            bool _2768 = _2764 || _2766;
            bool _2770 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2772 = _2768 || _2770;
            if (!_2772)
            {
                _2622 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2774 = _2622;
            _2624 = _2774;
            if (!_2772)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2776 = _2698;
            _2700 = _2776;
            if (!_2772)
            {
                _2690 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2778 = _2690;
            _2692 = _2778;
            if (!_2772)
            {
                _2628 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2780 = _2628;
            _2630 = _2780;
            if (!_2772)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2782 = _2634;
            _2636 = _2782;
            if (!_2772)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2784 = _2644;
            bool _2786 = !_2772;
            _2646 = _2784;
            if (!_2786)
            {
                bool _2788 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2790 = isnan(_2107);
                bool _2792 = _2788 || _2790;
                bool _2794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2796 = _2792 || _2794;
                if (!_2796)
                {
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2800 = _2107 + _2798;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2802;
                    float _2806 = 1.0 / _2804;
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2828 = _2800 * _2806;
                    float _2830 = precise::clamp(_2828, 0.0, 1.0);
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2836 = fma(_2830, _2810, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2838 = fma(_2830, _2834, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2840 = fma(_2830, _2814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2842 = fma(_2830, _2818, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2844 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2846 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2700 = _2838;
                    _2636 = _2844;
                    _2624 = _2836;
                    _2630 = _2842;
                    _2692 = _2840;
                    _2646 = _2846;
                    _2762 = true;
                }
                else
                {
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2624 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2630 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2692 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2762 = false;
    float _2848 = _2700;
    float _2850 = _2636;
    float _2852 = _2624;
    float _2854 = _2630;
    float _2856 = _2692;
    float _2858 = _2646;
    float _2860 = fma(_2614, -0.5, 0.5);
    float _2862 = precise::clamp(_2860, 0.0, 1.0);
    float _2864 = -_2848;
    float _2866 = _2864 + _2850;
    float _2868 = -_2852;
    float _2870 = _2868 + _2854;
    out.m_96.x = 0.0;
    float _2872 = fma(_2862, _2866, _2848);
    float _2874 = -_2856;
    float _2876 = _2874 + _2858;
    float _2878 = fma(_2862, _2870, _2852);
    float _2880 = _2872 * 0.586610972881317138671875;
    bool _2882 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2884 = fma(_2862, _2876, _2856);
    float _2886 = _2664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2888 = fma(_2878, 0.298911988735198974609375, _2880);
    bool _2890 = _2073 > 0.0;
    bool _2892 = isnan(_2073);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan(0.0);
    bool _2898 = _2894 || _2896;
    float _2900 = fma(_2884, 0.114477999508380889892578125, _2888);
    out.m_49.x = _2886;
    float _2902 = -_2900;
    float _2904 = _2878 + _2902;
    float _2906 = -_2900;
    float _2908 = _2872 + _2906;
    float _2910 = -_2900;
    float _2912 = _2884 + _2910;
    float _2914 = fma(_2904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2916 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2918 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    bool _2920 = !_2882;
    if (!_2920)
    {
        float _2922 = -_2015;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2926 = -_2017;
        float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2930 = -_2019;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2934 = _2924 * _2924;
        float _2936 = fma(_2928, _2928, _2934);
        float _2938 = fma(_2932, _2932, _2936);
        float _2940 = sqrt(_2938);
        float _2942 = rsqrt(_2938);
        float _2944 = -_2940;
        float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2950 = precise::clamp(_2948, 0.0, 1.0);
        float _2952 = _2928 * _2942;
        float _2954 = _2924 * _2942;
        float _2956 = abs(_2950);
        float _2958 = log2(_2956);
        float _2960 = _2932 * _2942;
        float _2962 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2964 = _2614 * _2954;
        float _2966 = -_2954;
        float _2968 = -_2962;
        float _2970 = fma(_2966, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2968);
        float _2972 = fma(_2566, _2952, _2964);
        float _2974 = -_2960;
        float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2970);
        float _2978 = fma(_2568, _2960, _2972);
        float _2980 = precise::clamp(_2978, 0.0, 1.0);
        float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2984 = _2976 + _2982;
        float _2986 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2988 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2990 = precise::clamp(_2988, 0.0, 1.0);
        float _2992 = exp2(_2986);
        float _2994 = _2992 * _2990;
        float _2996 = _2980 * _2994;
        float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3000 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3002 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2998;
        out.m_96.y = _3000;
        out.m_96.z = _3002;
    }
    out.m_64.x = _2914;
    out.m_64.y = _2916;
    out.m_64.z = _2918;
    if (_2898)
    {
        return out;
    }
    float _3004 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3004;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2762 = false;
    bool _581 = false;
    bool _439 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3061 = as_type<float>(_131);
        out.gl_Position.z = _3061;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_51.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = _149;
    if (_145)
    {
        float _153 = float(_115);
        _125 = _153;
    }
    float _155 = _125;
    bool _157 = _149 >= _155;
    bool _159 = !_145;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_49.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _133 = as_type<int>(_167);
    }
    int _169 = _133;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3131 = as_type<float>(_169);
        out.gl_Position.z = _3131;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = as_type<float>(int(gl_VertexIndex));
    float _173 = in.m_56.x;
    float _175 = in.m_56.y;
    float _177 = in.m_56.z;
    int _179 = as_type<int>(_171) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_171) & 2;
    bool _185 = _183 != 0;
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _189 = _175 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _191 = _175 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _193 = _175 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _195 = !_181;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    float _201 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].x, _191);
    float _203 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].x, _193);
    bool _205 = !_185;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_187;
    float _217 = _213;
    float _235;
    if (!_215)
    {
        float _219 = in.m_58.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_115);
        float _241 = 1.0 / _239;
        float _243 = _149 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = 1.0 / _265;
    float _277 = -_261;
    float _279 = _277 + 1.0;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = 1.0 / _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _269;
    float _291 = _249 * _275;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = _245 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _299 = _245 + _297;
    float _301 = _295 * _283;
    bool _303 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_245);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    bool _315 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _317 = isnan(_245);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = _313 * _279;
    bool _329 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _331 = isnan(_245);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = _299 * _289;
    float _343 = fma(_287, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _345;
    float _349 = -_313;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = -_325;
    float _363 = _361 + 1.0;
    float _365 = _325 * _351;
    float _367 = fma(_355, _341, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _341, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = _339 * _363;
    float _373 = fma(_347, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _375 = in.m_60.x;
    float _377 = in.m_60.y;
    float _379 = -_339;
    float _381 = _379 + 1.0;
    float _383 = _343 * _371;
    float _385 = _373 * _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _399 = fma(_389, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _401 = fma(_393, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _403 = fma(_367, _365, _395);
    float _405 = fma(_369, _365, _397);
    float _407 = fma(_401, _327, _403);
    float _409 = fma(_399, _327, _405);
    float _411 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _407);
    float _413 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _409);
    float _415 = _411 * _375;
    float _417 = _413 * _377;
    bool _419 = !_281;
    float _437;
    if (!_419)
    {
        float _421 = in.m_58.x;
        float _423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _425 = _421 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _427 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _429 = _427 * _423;
        float _431 = floor(_429);
        float _433 = -_431;
        float _435 = _429 + _433;
        _437 = _435;
        _439 = true;
    }
    else
    {
        float _441 = float(_115);
        float _443 = 1.0 / _441;
        float _445 = _149 * _443;
        _437 = _445;
    }
    _439 = false;
    float _447 = _437;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _451 = _447 + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _459 = isnan(_447);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _475 = isnan(_447);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _485;
    bool _489 = _447 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _491 = isnan(_447);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = 1.0 / _455;
    float _503 = -_467;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = _483 * _505;
    float _511 = -_483;
    float _513 = _511 + 1.0;
    float _515 = 1.0 / _471;
    float _517 = _487 * _501;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _523 = fma(_517, _451, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _525 = _521 * _515;
    float _527 = _523 * _509;
    float _529 = -_499;
    float _531 = _529 + 1.0;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _447 + _533;
    float _537 = fma(_513, (*spvDescriptorSet0.vp_c9)._m0[115].x, _527);
    float _539 = _467 * _531;
    float _541 = fma(_525, _535, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = fma(_541, _539, _537);
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _551 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[117].x, _545);
    float _553 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _555 = _547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _557 = _549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _559 = _551 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _553;
    out.m_62.y = _555;
    out.m_62.z = _557;
    out.m_62.w = _559;
    bool _561 = !_507;
    float _579;
    if (!_561)
    {
        float _563 = in.m_58.x;
        float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _567 = _563 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _571 = _569 * _565;
        float _573 = floor(_571);
        float _575 = -_573;
        float _577 = _571 + _575;
        _579 = _577;
        _581 = true;
    }
    else
    {
        float _583 = float(_115);
        float _585 = 1.0 / _583;
        float _587 = _149 * _585;
        _579 = _587;
    }
    _581 = false;
    float _589 = _579;
    float _591 = in.m_58.z;
    float _593 = in.m_58.w;
    float _595 = _415 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = in.m_46.x;
    float _599 = in.m_46.y;
    float _601 = in.m_46.z;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _607 = in.m_58.x;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _611 = _609 != 0;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _617 = 1.0 / _605;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _623 = 1.0 / _615;
    bool _625 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _627 = isnan(_589);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _639 = _637 != 0;
    float _641 = 0.0;
    if (_611)
    {
        float _643 = in.m_58.y;
        _641 = _643;
    }
    float _645 = _641;
    float _647 = _591 * 2.0;
    bool _649 = _593 > 0.5;
    float _651 = 1.0 / _621;
    float _653 = _599 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _655 = _599 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _657 = _599 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _659;
    float _663 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].x, _653);
    float _665 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].x, _655);
    float _667 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].x, _657);
    float _669 = floor(_647);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _675;
    float _679 = _661 * _623;
    float _681 = -_635;
    float _683 = _681 + 1.0;
    float _685 = _673 * _617;
    bool _687 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _689 = isnan(_589);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    float _699 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[5].z, _665);
    float _701 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _703 = log2(_701);
    float _705 = _677 * _651;
    bool _707 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _709 = isnan(_589);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -_697;
    float _721 = _719 + 1.0;
    float _723 = _697 * _683;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _727 = _589 + _725;
    float _729 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[4].z, _663);
    float _731 = _699 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _733 = _669 > 0.0;
    float _735 = fma(_679, _727, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _737 = _669 >= 0.0;
    bool _739 = isnan(_669);
    bool _741 = _737 || _739;
    bool _743 = isnan(0.0);
    bool _745 = _741 || _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _749 = _589 + _747;
    bool _751 = _589 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _753 = isnan(_589);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _765 = _589 + _763;
    float _767 = fma(_601, (*spvDescriptorSet0.vp_c10)._m0[6].z, _667);
    float _769 = fma(_685, _749, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _771 = _729 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _773 = _761 * _721;
    float _775 = -_761;
    float _777 = _775 + 1.0;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _731 + _779;
    float _783 = _607 * 2.0;
    float _785 = fma(_705, _765, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _787 = _717 * _777;
    bool _789 = _607 > 0.5;
    float _791 = _767 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _795 = _771 + _793;
    float _797 = _735 * _787;
    float _799 = _703 * _149;
    float _801 = _781 * _781;
    float _803 = floor(_783);
    float _805 = -_197;
    int _807 = _789 ? as_type<int>(_805) : as_type<int>(_197);
    float _809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _811 = _791 + _809;
    float _813 = fma(_795, _795, _801);
    float _815 = 0.0;
    bool _817 = _745;
    float _819 = _773;
    if (_639)
    {
        float _821 = in.m_58.w;
        _815 = _821;
    }
    float _823 = _815;
    bool _825 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _827 = isnan(1.0);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _833 = _829 || _831;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _837 = 1.0 + _835;
    float _839 = -_207;
    int _841 = _649 ? as_type<int>(_839) : as_type<int>(_207);
    float _843 = exp2(_799);
    int _845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _847 = _845 != 0;
    float _849 = fma(_811, _811, _813);
    bool _851 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _853 = isnan(0.0);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _859 = _855 || _857;
    float _861 = 1.0 / _837;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _865 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _871 = _833;
    if (_847)
    {
        float _873 = _607 * 3.1415927410125732421875;
        _869 = _873;
    }
    float _875 = _869;
    float _877 = rsqrt(_849);
    float _879 = -_843;
    float _881 = _879 + 1.0;
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _885 = 0.0;
    float _887 = _843;
    float _889 = _875;
    if (_847)
    {
        float _891 = _875 * 0.15915493667125701904296875;
        _885 = _891;
    }
    float _893 = _885;
    if (_611)
    {
        _887 = _607;
    }
    float _895 = _887;
    float _897 = _859 ? _881 : 0.0;
    float _899 = sqrt(_849);
    float _901 = _895;
    float _903 = _645;
    if (_611)
    {
        _889 = _645;
    }
    float _905 = _889;
    bool _907 = _803 >= 0.0;
    bool _909 = isnan(_803);
    bool _911 = _907 || _909;
    bool _913 = isnan(0.0);
    bool _915 = _911 || _913;
    float _917 = _905;
    if (!_611)
    {
        float _919 = in.m_58.y;
        float _921 = _607 * 3.1415927410125732421875;
        float _923 = _921 * 0.15915493667125701904296875;
        float _925 = _923 * 6.283185482025146484375;
        float _927 = sin(_925);
        float _929 = _919 * 3.1415927410125732421875;
        float _931 = _929 * 0.15915493667125701904296875;
        float _933 = _931 * 6.283185482025146484375;
        float _935 = sin(_933);
        _917 = _935;
        _901 = _927;
        _903 = _919;
    }
    float _937 = _917;
    float _939 = _901;
    float _941 = _903;
    float _943 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[93].w, _883);
    float _945 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[93].z, _863);
    float _947 = _883;
    float _949 = _937;
    if (_847)
    {
        float _951 = _893 * 6.283185482025146484375;
        float _953 = sin(_951);
        _947 = _953;
    }
    float _955 = _947;
    float _957 = _939 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _959 = _937 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    if (_639)
    {
        float _961 = _823 * 3.1415927410125732421875;
        _949 = _961;
    }
    float _963 = _949;
    float _965 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[92].z, _945);
    float _967 = -_867;
    float _969 = fma(_957, 2.0, _967);
    float _971 = _595 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _973 = _899 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _975 = 0.0;
    if (_639)
    {
        float _977 = _963 * 0.15915493667125701904296875;
        _975 = _977;
    }
    float _979 = _975;
    float _981 = fma(_959, -2.0, _865);
    float _983 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[92].w, _943);
    float _985 = -_149;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[91].x, _969);
    float _989 = precise::min(_971, _973);
    float _991 = _943;
    if (_639)
    {
        float _993 = _979 * 6.283185482025146484375;
        float _995 = sin(_993);
        _991 = _995;
    }
    float _997 = _991;
    float _999 = _781 * _877;
    float _1001 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[91].y, _981);
    if (_833)
    {
        float _1003 = _897 * _861;
        _151 = _1003;
    }
    float _1005 = _151;
    float _1007 = -_717;
    float _1009 = _1007 + 1.0;
    if (_847)
    {
        bool _1011 = _955 > 0.5;
        _871 = _1011;
    }
    bool _1013 = _871;
    float _1015 = _999 * _989;
    float _1017 = _795 * _877;
    float _1019 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[131].x, _797);
    float _1021 = _811 * _877;
    float _1023 = -_1015;
    float _1025 = _781 + _1023;
    float _1027 = _1017 * _989;
    int _1029 = _745 ? 0 : 1;
    float _1031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1033 = _1025 * _1025;
    float _1035 = -_1027;
    float _1037 = _795 + _1035;
    float _1039 = _1021 * _989;
    float _1041 = _1019;
    float _1043 = _1039;
    float _1045 = _1027;
    if (_639)
    {
        bool _1047 = _997 > 0.5;
        _817 = _1047;
    }
    bool _1049 = _817;
    float _1051 = _941 * 2.0;
    float _1053 = fma(_1037, _1037, _1033);
    float _1055 = -_1039;
    float _1057 = _811 + _1055;
    float _1059 = fma(_769, _773, _1019);
    int _1061 = ~_1029;
    int _1063 = _1061 + 1;
    int _1065 = _1063 + 1;
    float _1067 = -_965;
    float _1069 = _1067 + 1.0;
    float _1071 = fma(_1057, _1057, _1053);
    int _1073 = _1065;
    if (!_733)
    {
        int _1075 = ~_1029;
        int _1077 = _1075 + 1;
        _1073 = _1077;
    }
    int _1079 = _1073;
    float _1081 = fma(_785, _723, _1059);
    bool _1083 = _591 > 0.5;
    float _1085 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (!_847)
    {
        _1041 = _207;
    }
    float _1093 = _1041;
    float _1095 = _607 + _941;
    int _1097 = _915 ? 0 : 1;
    out.m_64.w = _989;
    float _1099 = _1093;
    if (!_639)
    {
        _819 = _197;
    }
    float _1101 = _819;
    float _1103 = sqrt(_1071);
    float _1105 = _1101;
    if (_847)
    {
        float _1107 = -_207;
        float _1109 = _1013 ? _1107 : _207;
        _1099 = _1109;
    }
    float _1111 = _1099;
    float _1113 = _1095 + (-1.0);
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1121 = _1119 != 0;
    if (_639)
    {
        float _1123 = -_197;
        float _1125 = _1049 ? _1123 : _197;
        _1105 = _1125;
    }
    float _1127 = _1105;
    bool _1129 = _803 > 0.0;
    float _1131 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1133 = -_197;
    int _1135 = _1083 ? as_type<int>(_1133) : as_type<int>(_197);
    float _1137 = -_207;
    int _1139 = _1083 ? as_type<int>(_1137) : as_type<int>(_207);
    int _1141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1143 = _1141 != 0;
    int _1145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1147 = _1145 != 0;
    int _1149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1151 = _1149 != 0;
    int _1153 = ~_1097;
    int _1155 = _1153 + 1;
    int _1157 = _1155 + 1;
    float _1159 = _877 * _1103;
    bool _1161 = !_1121;
    float _1163 = _1161 ? _197 : as_type<float>(_1135);
    float _1165 = floor(_1051);
    bool _1167 = !_1143;
    float _1169 = _1167 ? _207 : as_type<float>(_841);
    float _1171 = _595 * _1159;
    int _1173 = _1157;
    if (!_1129)
    {
        int _1175 = ~_1097;
        int _1177 = _1175 + 1;
        _1173 = _1177;
    }
    int _1179 = _1173;
    float _1181 = _1085 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1183 = _1111 + (-0.5);
    float _1185 = _1127 + 0.5;
    float _1187 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1189 = _941 > 0.5;
    float _1191 = -_1181;
    float _1193 = -_1001;
    float _1195 = fma(_1191, _1183, _1193);
    float _1197 = fma(_1091, _1185, _987);
    float _1199 = _781 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1201 = _999 * _1187;
    float _1203 = _1017 * _1187;
    bool _1205 = !_1089;
    float _1207 = _1205 ? _197 : as_type<float>(_807);
    float _1209 = fma(_795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1199);
    float _1211 = -_1201;
    float _1213 = _781 + _1211;
    bool _1215 = !_1151;
    float _1217 = _1215 ? _207 : as_type<float>(_1139);
    float _1219 = -_1203;
    float _1221 = _795 + _1219;
    float _1223 = -_207;
    int _1225 = _1189 ? as_type<int>(_1223) : as_type<int>(_207);
    float _1227 = _1213 * _1213;
    float _1229 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1081);
    float _1231 = _1163 + 0.5;
    float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1235 = !_1117;
    float _1237 = _1235 ? _207 : as_type<float>(_1225);
    float _1239 = fma(_1221, _1221, _1227);
    float _1241 = -_983;
    float _1243 = _1241 + 1.0;
    float _1245 = _1207 + 0.5;
    float _1247 = -_1169;
    float _1249 = _1247 + 0.5;
    float _1251 = _1021 * _1187;
    float _1253 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1255 = -_1069;
    float _1257 = fma(_1255, _1127, _1197);
    float _1259 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1261 = fma(_1243, _1111, _1195);
    float _1263 = _1253 * _1131;
    float _1265 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1267 = -_1251;
    float _1269 = _811 + _1267;
    float _1271 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1273 = _1259 * _1233;
    float _1275 = fma(_1269, _1269, _1239);
    float _1277 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1209);
    float _1279 = -_197;
    int _1281 = _1189 ? as_type<int>(_1279) : as_type<int>(_197);
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1285 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1287 = -_1237;
    float _1289 = _1287 + 0.5;
    bool _1291 = _1165 > 0.0;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1295 = _1165 >= 0.0;
    bool _1297 = isnan(_1165);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(0.0);
    bool _1303 = _1299 || _1301;
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1307 = !_1147;
    float _1309 = _1307 ? _197 : as_type<float>(_1281);
    float _1311 = sqrt(_1275);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1319 = _1317 != 0;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1323 = _1321 != 0;
    float _1325 = _1283 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1327 = _1277 >= 0.0;
    float _1329 = _1293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1333 = _1229 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1335 = -_1217;
    float _1337 = _1335 + 0.5;
    float _1339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1341 = _1289 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1343 = _1309 + 0.5;
    out.m_66.x = _1329;
    out.m_66.y = _1331;
    out.m_66.z = _1325;
    out.m_66.w = _1333;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1347 = _1341 * _1285;
    bool _1349 = !_1315;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = in.m_68.x;
    float _1355 = in.m_68.y;
    float _1357 = in.m_68.z;
    float _1359 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1361 = _1285;
    int _1363 = _1351;
    if (_1327)
    {
        _1361 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1365 = _1361;
    float _1367 = _877 * _1311;
    out.m_70.x = _1257;
    out.m_70.y = _1261;
    float _1369 = _1171 * _1367;
    if (_1327)
    {
        out.m_49.x = 0.0;
    }
    float _1371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1373 = _1345 * _1339;
    float _1375 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1377 = abs(_1351);
    if (_1327)
    {
        float _1379 = _1365 * 5.0;
        _1363 = as_type<int>(_1379);
    }
    int _1381 = _1363;
    out.m_72.x = _1369;
    float _1383 = float(_1377);
    float _1385 = _1265 * _1359;
    if (_1327)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5046 = as_type<float>(_1381);
        out.gl_Position.z = _5046;
    }
    out.m_74.x = _1263;
    out.m_74.y = _1347;
    out.m_74.z = _1273;
    out.m_74.w = _1385;
    float _1387 = _1375 * _1371;
    out.m_76.x = _1387;
    out.m_76.y = _1373;
    float _1389 = float(_1079);
    bool _1391 = !_1323;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = _1383 * _1389;
    float _1397 = _607 + (-0.5);
    bool _1399 = !_1319;
    int _1401 = _1399 ? 0 : 1;
    float _1403 = _1357;
    if (_1327)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1405 = _1395 * (-2.0);
    float _1407 = -_1201;
    float _1409 = _731 + _1407;
    float _1411 = -_1203;
    float _1413 = _771 + _1411;
    int _1415 = _1303 ? 0 : 1;
    float _1417 = fma(_1405, _1353, _1353);
    float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1421 = _1409 + _1419;
    float _1423 = fma(_1271, _1405, _1271);
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1413 + _1425;
    float _1429 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1417);
    int _1431 = abs(_1401);
    float _1433 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1435 = ~_1415;
    int _1437 = _1435 + 1;
    int _1439 = _1437 + 1;
    float _1441 = -_1251;
    float _1443 = _791 + _1441;
    int _1445 = _1439;
    if (!_1291)
    {
        int _1447 = ~_1415;
        int _1449 = _1447 + 1;
        _1445 = _1449;
    }
    int _1451 = _1445;
    float _1453 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1433);
    float _1455 = float(_1179);
    float _1457 = _941 + _591;
    float _1459 = float(_1431);
    float _1461 = _607 + _591;
    int _1463 = abs(_1393);
    float _1465 = _1457 + (-1.0);
    float _1467 = float(_1451);
    float _1469 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1471 = _1443 + _1469;
    float _1473 = _1459 * _1455;
    float _1475 = float(_1463);
    float _1477 = fma(_1471, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1453);
    float _1479 = _941 + (-0.5);
    float _1481 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1483 = _1473 * (-2.0);
    float _1485 = _1475 * _1467;
    bool _1487 = _1477 >= 0.0;
    float _1489 = _1461 + (-1.0);
    float _1491 = fma(_1483, _1355, _1355);
    float _1493 = fma(_1481, _1483, _1481);
    float _1495 = _1485 * (-2.0);
    float _1497 = fma(_1479, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1491);
    float _1499 = _591 + (-0.5);
    float _1501 = fma(_1423, _1005, _1429);
    float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1505 = fma(_1495, _1357, _1357);
    float _1507 = fma(_1493, _1005, _1497);
    float _1509 = _1501 * 0.15915493667125701904296875;
    float _1511 = fma(_1503, _1495, _1503);
    float _1513 = fma(_1499, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1505);
    float _1515 = _1507 * 0.15915493667125701904296875;
    if (_1487)
    {
        _1403 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1517 = _1403;
    float _1519 = _1509 * 6.283185482025146484375;
    float _1521 = sin(_1519);
    float _1523 = fma(_1511, _1005, _1513);
    int _1525 = as_type<int>(_1517);
    if (_1487)
    {
        out.m_49.x = 0.0;
    }
    if (_1487)
    {
        float _1527 = _1517 * 5.0;
        _1525 = as_type<int>(_1527);
    }
    int _1529 = _1525;
    float _1531 = _1523 * 0.15915493667125701904296875;
    float _1533 = _1509 * 6.283185482025146484375;
    float _1535 = cos(_1533);
    if (_1487)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5292 = as_type<float>(_1529);
        out.gl_Position.z = _5292;
    }
    float _1537 = _1515 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = _1515 * 6.283185482025146484375;
    float _1543 = cos(_1541);
    if (_1487)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1545 = _1531 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _417 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1551 = _1159 * _1367;
    float _1553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1555 = _1535 * _1543;
    float _1557 = _1535 * _1539;
    float _1559 = _1549 * _1551;
    float _1561 = _1521 * _1543;
    float _1563 = _1531 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = -_1027;
    float _1569 = _771 + _1567;
    float _1571 = _1559 * _1553;
    float _1573 = _1521 * _1539;
    float _1575 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _197);
    float _1577 = -_1039;
    float _1579 = _791 + _1577;
    float _1581 = _1535 * _1547;
    float _1583 = _1369 * _1575;
    float _1585 = _1543 * _1547;
    float _1587 = _1521 * _1547;
    float _1589 = _1581 * _1571;
    float _1591 = _1551 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1593 = _1591 * 0.5;
    float _1595 = _1539 * _1547;
    float _1597 = fma(_1565, _1555, _1573);
    float _1599 = -_1561;
    float _1601 = fma(_1565, _1557, _1599);
    float _1603 = -_1571;
    float _1605 = _1565 * _1603;
    float _1607 = -_1557;
    float _1609 = fma(_1565, _1561, _1607);
    float _1611 = fma(_1597, _1583, _1589);
    float _1613 = _1587 * _1571;
    float _1615 = fma(_1585, _1583, _1605);
    float _1617 = fma(_1565, _1573, _1555);
    float _1619 = fma(_1601, _1593, _1611);
    float _1621 = fma(_1609, _1583, _1613);
    float _1623 = fma(_1595, _1593, _1615);
    float _1625 = -_1015;
    float _1627 = _731 + _1625;
    float _1629 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1631 = fma(_1617, _1593, _1621);
    float _1633 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1635 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1637 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1629);
    float _1639 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1633);
    float _1641 = fma(_1623, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1635);
    float _1643 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1637);
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1639);
    float _1647 = fma(_1631, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1641);
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1651 = _1645 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1653 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1655 = _791 + _1649;
    float _1657 = -_1201;
    float _1659 = _1657 + _1627;
    float _1661 = _771 + _1651;
    float _1663 = -_1251;
    float _1665 = _1663 + _1579;
    float _1667 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1669 = _1655 + _1667;
    float _1671 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1673 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1675 = _1661 + _1673;
    float _1677 = _731 + _1653;
    float _1679 = _1669 * _1669;
    float _1681 = fma(_1675, _1675, _1679);
    float _1683 = -_1203;
    float _1685 = _1683 + _1569;
    float _1687 = sqrt(_1681);
    float _1689 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1671);
    float _1691 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1689);
    bool _1693 = _1687 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1695 = _1689;
    float _1697 = _1653;
    float _1699 = _1661;
    float _1701 = _1665;
    float _1703 = _1659;
    float _1705 = _1685;
    if (!_1693)
    {
        _1695 = _1661;
    }
    float _1707 = _1695;
    float _1709 = _1707;
    if (!_1693)
    {
        _1697 = _1655;
    }
    float _1711 = _1697;
    float _1713 = _1711;
    if (!_1693)
    {
        _1699 = _1677;
    }
    float _1715 = _1699;
    bool _1717 = !_1693;
    float _1719 = _1715;
    if (!_1717)
    {
        float _1721 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1725 = _1687 + _1723;
        float _1727 = _1677 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = rsqrt(_1681);
        float _1731 = _1725 * _1721;
        float _1733 = _1731 * 0.15915493667125701904296875;
        float _1735 = _1733 * 6.283185482025146484375;
        float _1737 = cos(_1735);
        float _1739 = _1733 * 6.283185482025146484375;
        float _1741 = sin(_1739);
        float _1743 = _1737 + (-1.0);
        float _1745 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1747 = fma(_1741, _1727, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1749 = fma(_1677, _1737, _1745);
        float _1751 = _1729 * _1747;
        float _1753 = fma(_1675, _1751, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1755 = fma(_1669, _1751, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1719 = _1749;
        _1709 = _1753;
        _1713 = _1755;
    }
    float _1757 = _1719;
    float _1759 = _1709;
    float _1761 = _1713;
    float _1763 = -_731;
    float _1765 = _1763 + _1757;
    float _1767 = -_771;
    float _1769 = _1767 + _1759;
    float _1771 = -_791;
    float _1773 = _1771 + _1761;
    float _1775 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1777 = _1765 * _1765;
    float _1779 = _1659 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1781 = -_1027;
    float _1783 = _1781 + _1759;
    float _1785 = 1.0 / _1775;
    float _1787 = fma(_1769, _1769, _1777);
    float _1789 = fma(_1685, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1779);
    bool _1791 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1793 = isnan(0.5);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1799 = _1795 || _1797;
    float _1801 = fma(_1773, _1773, _1787);
    float _1803 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1789);
    float _1805 = sqrt(_1801);
    float _1807 = _1803 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1809 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1811 = isnan(0.5);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1817 = _1813 || _1815;
    float _1819 = _1807 + _1775;
    float _1821 = _1819 * _1785;
    float _1823 = _1821 * 0.5;
    bool _1825 = _1805 > 0.0;
    float _1827 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1829 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1827);
    float _1831 = -_1015;
    float _1833 = _1831 + _1757;
    float _1835 = -_1039;
    float _1837 = _1835 + _1761;
    float _1839 = 1.0 / _1829;
    float _1841 = _1819;
    float _1843 = _1759;
    if (!_1825)
    {
        _1043 = _1783;
    }
    float _1845 = _1043;
    float _1847 = _1845;
    float _1849 = _1845;
    if (!_1825)
    {
        _1841 = _1833;
    }
    float _1851 = _1841;
    float _1853 = _1851;
    float _1855 = _1851;
    if (!_1825)
    {
        _1045 = _1837;
    }
    float _1857 = _1045;
    bool _1859 = !_1825;
    float _1861 = _1857;
    float _1863 = _1857;
    float _1865 = _1839;
    if (!_1859)
    {
        float _1867 = _211 * _211;
        float _1869 = fma(_209, _209, _1867);
        float _1871 = fma(_213, _213, _1869);
        float _1873 = rsqrt(_1801);
        float _1875 = sqrt(_1871);
        float _1877 = _1769 * _1873;
        float _1879 = _1765 * _1873;
        float _1881 = _1773 * _1873;
        bool _1883 = _1875 > 0.0;
        _1843 = _1875;
        if (!_1883)
        {
            _1847 = _1783;
        }
        float _1885 = _1847;
        _1849 = _1885;
        if (!_1883)
        {
            _1853 = _1833;
        }
        float _1887 = _1853;
        _1855 = _1887;
        if (!_1883)
        {
            _1861 = _1837;
        }
        float _1889 = _1861;
        bool _1891 = !_1883;
        _1863 = _1889;
        if (!_1891)
        {
            float _1893 = rsqrt(_1871);
            float _1895 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1897 = _211 * _1893;
            float _1899 = _209 * _1893;
            float _1901 = _213 * _1893;
            float _1903 = _1879 * _1897;
            float _1905 = fma(_1877, _1899, _1903);
            float _1907 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1909 = fma(_1881, _1901, _1905);
            float _1911 = _1909 * _1907;
            float _1913 = fma(_209, _1911, _1783);
            float _1915 = fma(_211, _1911, _1833);
            float _1917 = fma(_213, _1911, _1837);
            _1849 = _1913;
            _1855 = _1915;
            _1863 = _1917;
            _1843 = _1899;
        }
    }
    float _1919 = _1849;
    float _1921 = _1855;
    float _1923 = _1863;
    float _1925 = _1843;
    float _1927 = -_1203;
    float _1929 = _1927 + _1919;
    float _1931 = -_1201;
    float _1933 = _1931 + _1921;
    float _1935 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1937 = _1839 * _1935;
    float _1939 = -_1251;
    float _1941 = _1939 + _1923;
    float _1943 = _1925;
    float _1945 = _1933;
    float _1947 = _1941;
    if (_1817)
    {
        _1943 = 1.0;
    }
    float _1949 = _1943;
    float _1951 = _1949;
    if (_1799)
    {
        _1865 = _1929;
    }
    float _1953 = _1865;
    float _1955 = _1953;
    if (!_1799)
    {
        float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1959 = _1659 + _1957;
        float _1961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1963 = _1685 + _1961;
        float _1965 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1967 = -_1579;
        float _1969 = _1967 + _1923;
        float _1971 = _1959 * _1959;
        float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1975 = _1665 + _1973;
        float _1977 = -_1569;
        float _1979 = _1977 + _1919;
        float _1981 = fma(_1963, _1963, _1971);
        float _1983 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1985 = fma(_1975, _1975, _1981);
        float _1987 = sqrt(_1985);
        float _1989 = 1.0 / _1367;
        float _1991 = _1983 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1993 = precise::min(_1987, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1995 = _1993 * _1965;
        float _1997 = _1995 * _1989;
        float _1999 = -_1627;
        float _2001 = _1999 + _1921;
        float _2003 = _1991 * _1997;
        float _2005 = _1969 * _1997;
        float _2007 = fma(_2001, _2003, _1659);
        float _2009 = fma(_1979, _2003, _1685);
        float _2011 = fma(_1991, _2005, _1665);
        _217 = _1965;
        _1945 = _2007;
        _1955 = _2009;
        _1947 = _2011;
    }
    float _2013 = _217;
    float _2015 = _1945;
    float _2017 = _1955;
    float _2019 = _1947;
    float _2021 = _2013;
    if (!_1817)
    {
        float _2023 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2025 = _2023 * 0.15915493667125701904296875;
        float _2027 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2029 = _2025 * 6.283185482025146484375;
        float _2031 = cos(_2029);
        float _2033 = _2027 * 0.15915493667125701904296875;
        float _2035 = _2025 * 6.283185482025146484375;
        float _2037 = sin(_2035);
        float _2039 = 1.0 / _2031;
        float _2041 = _2033 * 6.283185482025146484375;
        float _2043 = cos(_2041);
        float _2045 = _2037 * _2039;
        float _2047 = _2033 * 6.283185482025146484375;
        float _2049 = sin(_2047);
        float _2051 = _2043 * _2045;
        float _2053 = 1.0 / _2051;
        float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2057 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2055;
        float _2059 = 1.0 / _2057;
        float _2061 = _2049 * _2053;
        float _2063 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2065 = fma(_1937, _2061, _2063);
        float _2067 = _2065 * _2059;
        float _2069 = precise::clamp(_2067, 0.0, 1.0);
        _2021 = _2059;
        _1951 = _2069;
    }
    float _2071 = _2021;
    float _2073 = _1951;
    float _2075 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2077 = _2015 + _2075;
    float _2079 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2081 = _2017 + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2085 = _2019 + _2083;
    float _2087 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2089 = _2077 * _2077;
    float _2091 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2087);
    float _2095 = fma(_2081, _2081, _2089);
    float _2097 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2099 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2093);
    float _2101 = fma(_2085, _2085, _2095);
    float _2103 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2105 = rsqrt(_2101);
    float _2107 = sqrt(_2101);
    float _2109 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2111 = _2081 * _2109;
    float _2113 = _2085 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 * _2113;
    float _2119 = _2115 + _2117;
    float _2121 = sqrt(_2119);
    bool _2123 = _2121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2127 = _2121 + _2125;
    float _2129 = _2105;
    float _2131 = _2119;
    float _2133 = _2127;
    float _2135 = _2071;
    float _2137 = _2077;
    float _2139 = _2109;
    float _2141 = _2111;
    if (_2123)
    {
        float _2143 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2129 = _2143;
    }
    float _2145 = _2129;
    if (_2123)
    {
        float _2147 = rsqrt(_2119);
        _2131 = _2147;
    }
    float _2149 = _2131;
    float _2151 = _2149;
    if (_2123)
    {
        float _2153 = _2127 * _2145;
        _2133 = _2153;
    }
    float _2155 = _2133;
    if (_2123)
    {
        float _2157 = _2155 * 0.15915493667125701904296875;
        _2135 = _2157;
    }
    float _2159 = _2135;
    float _2161 = _2145;
    float _2163 = _2159;
    if (_2123)
    {
        float _2165 = _2159 * 6.283185482025146484375;
        float _2167 = sin(_2165);
        _2161 = _2167;
    }
    float _2169 = _2161;
    float _2171 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2173 = precise::max(0.0, _2171);
    float _2175 = _2085;
    float _2177 = _2173;
    if (_2123)
    {
        float _2179 = _2159 * 6.283185482025146484375;
        float _2181 = cos(_2179);
        _2175 = _2181;
    }
    float _2183 = _2175;
    float _2185 = -_2109;
    float _2187 = -_2173;
    float _2189 = fma(_2077, _2185, _2187);
    if (_2123)
    {
        float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2177 = _2191;
    }
    float _2193 = _2177;
    float _2195 = _2193;
    if (!_2123)
    {
        _2163 = _2111;
    }
    float _2197 = _2163;
    float _2199 = _2169;
    float _2201 = _2197;
    if (_2123)
    {
        float _2203 = fma(_2169, _2193, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2195 = _2203;
    }
    float _2205 = _2195;
    if (!_2123)
    {
        _2199 = _2189;
    }
    float _2207 = _2199;
    float _2209 = _2207;
    float _2211 = _2183;
    if (_2123)
    {
        float _2213 = _2183 + (-1.0);
        _2137 = _2213;
    }
    float _2215 = _2137;
    float _2217 = _2215;
    if (_2123)
    {
        float _2219 = _2149 * _2205;
        _2139 = _2219;
    }
    float _2221 = _2139;
    if (!_2123)
    {
        _2151 = _2113;
    }
    float _2223 = _2151;
    float _2225 = _2223;
    if (_2123)
    {
        float _2227 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2227;
    }
    float _2229 = _2217;
    if (_2123)
    {
        float _2231 = _2111 * _2221;
        _2201 = _2231;
    }
    float _2233 = _2201;
    if (_2123)
    {
        float _2235 = _2113 * _2221;
        _2225 = _2235;
    }
    float _2237 = _2225;
    if (!_2123)
    {
        _2141 = _2117;
    }
    float _2239 = _2141;
    float _2241 = _2239;
    if (_2123)
    {
        float _2243 = fma(_2189, _2183, _2229);
        _2209 = _2243;
    }
    float _2245 = _2209;
    if (!_2123)
    {
        _2211 = _2115;
    }
    float _2247 = _2211;
    float _2249 = _2247;
    if (_2123)
    {
        float _2251 = _2233 * _2233;
        _2249 = _2251;
    }
    float _2253 = _2249;
    if (_2123)
    {
        float _2255 = _2237 * _2237;
        _2241 = _2255;
    }
    float _2257 = _2241;
    float _2259 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2261 = fma(_2245, _2245, _2253);
    float _2263 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2259);
    float _2265 = _2261 + _2257;
    float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2269 = fma(_2107, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2267);
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2263);
    float _2275 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2277 = fma(_1685, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2279 = -_2271;
    float _2281 = _2279 + 1.0;
    float _2283 = rsqrt(_2265);
    float _2285 = _2273 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2289 = fma(_1665, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2291 = _2015 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2293 = abs(_2281);
    float _2295 = log2(_2293);
    float _2297 = -_2287;
    float _2299 = fma(_2297, _2275, 1.0);
    float _2301 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2291);
    float _2303 = _2283 * _2233;
    float _2305 = _2283 * _2245;
    float _2307 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2309 = floor(_2277);
    float _2311 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2313 = _2283 * _2237;
    float _2315 = _2307 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2317 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2319 = -_2311;
    float _2321 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2319);
    float _2323 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2325 = floor(_2289);
    float _2327 = -_2313;
    float _2329 = fma(_2327, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2321);
    float _2331 = fma(_2019, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2097);
    float _2333 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2317);
    float _2335 = fma(_2329, -0.5, 0.5);
    float _2337 = _2331 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2339 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2333);
    float _2341 = exp2(_2323);
    float _2343 = -_2309;
    float _2345 = _2277 + _2343;
    float _2347 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2349 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2339);
    float _2351 = _2305 + 1.0;
    float _2353 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2347);
    float _2355 = log2(_2299);
    float _2357 = -_2325;
    float _2359 = _2289 + _2357;
    float _2361 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2353);
    float _2363 = 1.0 / _2349;
    float _2365 = fma(_2329, 0.5, 0.5);
    float _2367 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2371 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2373 = -_2305;
    float _2375 = fma(_2341, _2351, _2373);
    float _2377 = sqrt(_2335);
    float _2379 = fma(_2365, _2369, -0.212114393711090087890625);
    float _2381 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2371);
    float _2383 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2361);
    float _2385 = _2355 * 0.693147182464599609375;
    float2 _6634 = float2(_2345, _2359);
    float _2387 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6634, float2(0.0), isnan(_6634)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6634, float2(0.0), isnan(_6634)), level(0.0)).x;
    float _2389 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2381);
    float _2391 = fma(_2365, _2379, 1.570728778839111328125);
    float _2393 = _2383 * _2363;
    float _2395 = _2385 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2397 = _2389 * _2363;
    float _2399 = fma(_2375, 0.5, 0.5);
    float _2401 = fma(_2393, 0.5, 0.5);
    float _2403 = fma(_2397, -0.5, 0.5);
    float _2405 = _2377 * 0.636619746685028076171875;
    float _2407 = -_2391;
    float _2409 = fma(_2405, _2407, 1.0);
    float3 _6678 = float3(_2401, _2403, _2395);
    float _2411 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6678, float3(0.0), isnan(_6678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6678, float3(0.0), isnan(_6678)), level(0.0)).x;
    float3 _6689 = float3(_2401, _2403, _2395);
    float4 _2414 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6689, float3(0.0), isnan(_6689)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6689, float3(0.0), isnan(_6689)), level(0.0)).xyzw;
    float _2416 = _2414.x;
    float _2418 = _2414.y;
    float _2420 = _2414.z;
    float _2422 = _2414.w;
    float2 _6705 = float2(_2409, _2399);
    float3 _2426 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6705, float2(0.0), isnan(_6705)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6705, float2(0.0), isnan(_6705)), level(0.0)).xyz;
    float _2428 = _2426.x;
    float _2430 = _2426.y;
    float _2432 = _2426.z;
    float _2434 = abs(_1937);
    float _2436 = log2(_2434);
    float _2438 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2440 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2442 = _1597 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2444 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2446 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2448 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2450 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2438);
    float _2452 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2440);
    float _2454 = _1581 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2456 = fma(_1585, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2442);
    float _2458 = -_1565;
    float _2460 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2444);
    float _2462 = -_1565;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2446);
    float _2466 = -_1565;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2454);
    float _2470 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2448);
    float _2474 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2476 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2478 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2480 = _1601 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2482 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2460);
    float _2484 = fma(_2476, _2476, 1.0);
    float _2486 = exp2(_2474);
    float _2488 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2464);
    float _2490 = fma(_1587, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2468);
    float _2492 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2480);
    float _2494 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2472);
    float _2496 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2478);
    float _2498 = rsqrt(_2484);
    float _2500 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2492);
    float _2502 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2450);
    float _2504 = _2476 * _2482;
    out.m_78.x = _2017;
    out.m_78.y = _2015;
    out.m_78.z = _2019;
    bool _2506 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2508 = isnan(_2107);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2514 = _2510 || _2512;
    float _2516 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2518 = precise::clamp(_2516, 0.0, 1.0);
    float _2520 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2452);
    float _2522 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2524 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2456);
    float _2526 = fma(_2518, -2.0, 3.0);
    float _2528 = _2518 * _2518;
    float _2530 = _2476 * _2488;
    float _2532 = fma(_2522, _2502, _2504);
    float _2534 = _2103 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2536 = _2528 * _2526;
    float _2538 = fma(_2522, _2520, _2530);
    float _2540 = _2476 * _2490;
    float _2542 = _2476 * _2498;
    out.m_80.x = _2502;
    out.m_80.y = _2520;
    out.m_80.z = _2524;
    float _2544 = fma(_2315, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2534);
    float _2546 = fma(_2522, _2524, _2540);
    float _2548 = -_2500;
    float _2550 = _2542 * _2548;
    float _2552 = -_2536;
    float _2554 = _2552 + 1.0;
    float _2556 = fma(_2285, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2544);
    float _2558 = -_2494;
    float _2560 = _2542 * _2558;
    float _2562 = in.m_82.x;
    float _2564 = fma(_2554, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2536);
    float _2566 = _2494 + _2532;
    float _2568 = _2500 + _2546;
    out.m_84.x = _1685;
    out.m_84.y = _1659;
    out.m_84.z = _1665;
    float _2570 = -_2496;
    float _2572 = _2542 * _2570;
    float _2574 = fma(_2498, _2482, _2560);
    float _2576 = fma(_2337, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2556);
    float _2578 = fma(_2498, _2488, _2572);
    float _2580 = fma(_2498, _2490, _2550);
    float _2582 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2584 = _1937 <= 8000.0;
    bool _2586 = isnan(_1937);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan(8000.0);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2349 * 0.5;
    out.gl_Position.x = _2383;
    out.gl_Position.y = _2389;
    out.gl_Position.z = _2576;
    out.gl_Position.w = _2349;
    float _2598 = _2576 + _2349;
    float _2600 = _2383 + _2349;
    float _2602 = exp2(_2582);
    float _2604 = _2594 * _2564;
    float _2606 = fma(_2389, -0.5, _2596);
    out.m_86.x = _2574;
    out.m_86.y = _2578;
    out.m_86.z = _2580;
    float _2608 = _2598 * 0.5;
    float _2610 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2612 = _2600 * 0.5;
    float _2614 = _2496 + _2538;
    float _2616 = _2532;
    float _2618 = _2578;
    if (!_2514)
    {
        _2616 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2620 = _2616;
    float _2622 = _2620;
    float _2624 = _2620;
    if (!_2514)
    {
        _1701 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2626 = _1701;
    out.m_88.x = _2612;
    out.m_88.y = _2606;
    out.m_88.z = _2608;
    out.m_88.w = _2349;
    float _2628 = _2626;
    float _2630 = _2626;
    if (!_2514)
    {
        _1703 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2632 = _1703;
    float _2634 = _2632;
    float _2636 = _2632;
    if (!_2514)
    {
        _1705 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _1705;
    out.m_90.x = _2566;
    out.m_90.y = _2614;
    out.m_90.z = _2568;
    float _2640 = -_2602;
    float _2642 = _2640 + 1.0;
    float _2644 = _2638;
    float _2646 = _2638;
    if (!_2514)
    {
        _2618 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2648 = _2618;
    float _2650 = _2642 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2652 = -_2387;
    float _2654 = _2652 + 1.0;
    float _2656 = _2654 * _2610;
    float _2658 = precise::clamp(_2656, 0.0, 1.0);
    float _2660 = -_2658;
    float _2662 = fma(_2660, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2664 = _2073 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2666 = _2662 * _2562;
    float _2668 = _2666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2670 = _2650 * _2411;
    float _2672 = -_2650;
    float _2674 = _2672 + 1.0;
    float _2676 = _2422 * _2670;
    float _2678 = _2432 * _2670;
    float _2680 = _2422 * _2674;
    out.m_92.x = _2668;
    float _2682 = fma(_2428, _2676, _2416);
    float _2684 = fma(_2430, _2676, _2418);
    float _2686 = fma(_2422, _2678, _2420);
    float _2688 = _2674;
    float _2690 = _2648;
    float _2692 = _2648;
    if (!_2514)
    {
        _2688 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2694 = _2688;
    out.m_94.x = _2682;
    out.m_94.y = _2684;
    out.m_94.z = _2686;
    out.m_94.w = _2680;
    bool _2696 = !_2514;
    float _2698 = _2694;
    float _2700 = _2694;
    if (!_2696)
    {
        bool _2702 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2704 = isnan(_2107);
        bool _2706 = _2702 || _2704;
        bool _2708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2710 = _2706 || _2708;
        if (!_2710)
        {
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2714 = _2107 + _2712;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2718 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2716;
            float _2720 = 1.0 / _2718;
            float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2724 = _2722 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2738 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2742 = _2714 * _2720;
            float _2744 = precise::clamp(_2742, 0.0, 1.0);
            float _2746 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2750 = fma(_2744, _2724, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2752 = fma(_2744, _2748, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2754 = fma(_2744, _2728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2756 = fma(_2744, _2732, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2758 = fma(_2744, _2736, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2760 = fma(_2744, _2740, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2700 = _2752;
            _2636 = _2758;
            _2624 = _2750;
            _2630 = _2756;
            _2692 = _2754;
            _2646 = _2760;
            _2762 = true;
        }
        else
        {
            bool _2764 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2766 = isnan(_2107);
            bool _2768 = _2764 || _2766;
            bool _2770 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2772 = _2768 || _2770;
            if (!_2772)
            {
                _2622 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2774 = _2622;
            _2624 = _2774;
            if (!_2772)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2776 = _2698;
            _2700 = _2776;
            if (!_2772)
            {
                _2690 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2778 = _2690;
            _2692 = _2778;
            if (!_2772)
            {
                _2628 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2780 = _2628;
            _2630 = _2780;
            if (!_2772)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2782 = _2634;
            _2636 = _2782;
            if (!_2772)
            {
                _2644 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2784 = _2644;
            bool _2786 = !_2772;
            _2646 = _2784;
            if (!_2786)
            {
                bool _2788 = _2107 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2790 = isnan(_2107);
                bool _2792 = _2788 || _2790;
                bool _2794 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2796 = _2792 || _2794;
                if (!_2796)
                {
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2800 = _2107 + _2798;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2804 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2802;
                    float _2806 = 1.0 / _2804;
                    float _2808 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2810 = _2808 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2814 = _2812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2818 = _2816 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2828 = _2800 * _2806;
                    float _2830 = precise::clamp(_2828, 0.0, 1.0);
                    float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2836 = fma(_2830, _2810, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2838 = fma(_2830, _2834, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2840 = fma(_2830, _2814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2842 = fma(_2830, _2818, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2844 = fma(_2830, _2822, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2846 = fma(_2830, _2826, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2700 = _2838;
                    _2636 = _2844;
                    _2624 = _2836;
                    _2630 = _2842;
                    _2692 = _2840;
                    _2646 = _2846;
                    _2762 = true;
                }
                else
                {
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2624 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2630 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2692 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2646 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2762 = false;
    float _2848 = _2700;
    float _2850 = _2636;
    float _2852 = _2624;
    float _2854 = _2630;
    float _2856 = _2692;
    float _2858 = _2646;
    float _2860 = fma(_2614, -0.5, 0.5);
    float _2862 = precise::clamp(_2860, 0.0, 1.0);
    float _2864 = -_2848;
    float _2866 = _2864 + _2850;
    float _2868 = -_2852;
    float _2870 = _2868 + _2854;
    out.m_96.x = 0.0;
    float _2872 = fma(_2862, _2866, _2848);
    float _2874 = -_2856;
    float _2876 = _2874 + _2858;
    float _2878 = fma(_2862, _2870, _2852);
    float _2880 = _2872 * 0.586610972881317138671875;
    bool _2882 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2884 = fma(_2862, _2876, _2856);
    float _2886 = _2664 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2888 = fma(_2878, 0.298911988735198974609375, _2880);
    bool _2890 = _2073 > 0.0;
    bool _2892 = isnan(_2073);
    bool _2894 = _2890 || _2892;
    bool _2896 = isnan(0.0);
    bool _2898 = _2894 || _2896;
    float _2900 = fma(_2884, 0.114477999508380889892578125, _2888);
    out.m_49.x = _2886;
    float _2902 = -_2900;
    float _2904 = _2878 + _2902;
    float _2906 = -_2900;
    float _2908 = _2872 + _2906;
    float _2910 = -_2900;
    float _2912 = _2884 + _2910;
    float _2914 = fma(_2904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2916 = fma(_2908, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    float _2918 = fma(_2912, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2900);
    bool _2920 = !_2882;
    if (!_2920)
    {
        float _2922 = -_2015;
        float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2926 = -_2017;
        float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2930 = -_2019;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2934 = _2924 * _2924;
        float _2936 = fma(_2928, _2928, _2934);
        float _2938 = fma(_2932, _2932, _2936);
        float _2940 = sqrt(_2938);
        float _2942 = rsqrt(_2938);
        float _2944 = -_2940;
        float _2946 = _2944 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2948 = _2946 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2950 = precise::clamp(_2948, 0.0, 1.0);
        float _2952 = _2928 * _2942;
        float _2954 = _2924 * _2942;
        float _2956 = abs(_2950);
        float _2958 = log2(_2956);
        float _2960 = _2932 * _2942;
        float _2962 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2964 = _2614 * _2954;
        float _2966 = -_2954;
        float _2968 = -_2962;
        float _2970 = fma(_2966, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2968);
        float _2972 = fma(_2566, _2952, _2964);
        float _2974 = -_2960;
        float _2976 = fma(_2974, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2970);
        float _2978 = fma(_2568, _2960, _2972);
        float _2980 = precise::clamp(_2978, 0.0, 1.0);
        float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2984 = _2976 + _2982;
        float _2986 = _2958 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2988 = _2984 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2990 = precise::clamp(_2988, 0.0, 1.0);
        float _2992 = exp2(_2986);
        float _2994 = _2992 * _2990;
        float _2996 = _2980 * _2994;
        float _2998 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3000 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3002 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2998;
        out.m_96.y = _3000;
        out.m_96.z = _3002;
    }
    out.m_64.x = _2914;
    out.m_64.y = _2916;
    out.m_64.z = _2918;
    if (_2898)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3004 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3004;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

