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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3332 = false;
    bool _337 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_123);
        out.gl_Position.z = _3636;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _147;
    float _159 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3709 = as_type<float>(_165);
        out.gl_Position.z = _3709;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_60.x;
    float _171 = in.m_60.y;
    float _173 = in.m_60.z;
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
    float _213 = _207;
    float _231;
    if (!_211)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _147;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = in.m_64.x;
    float _243 = in.m_64.y;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_255;
    float _275 = _273 + 1.0;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _271 * _275;
    float _287 = -_271;
    float _289 = _287 + 1.0;
    float _291 = _239 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = _309 * _241;
    float _315 = _311 * _243;
    bool _317 = !_283;
    float _335;
    if (!_317)
    {
        float _319 = in.m_62.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        _335 = _147;
    }
    _337 = false;
    float _339 = _335;
    bool _341 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _343 = isnan(_339);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_339);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _375 = _339 + _373;
    float _377 = -_351;
    float _379 = _377 + 1.0;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _383 = 1.0 / _355;
    float _385 = _367 * _379;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = _371 * _383;
    float _393 = fma(_391, _375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _395 = _393 * _385;
    float _397 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[116].x, _397);
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    bool _415 = !_381;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _157 = _431;
    }
    float _433 = _157;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_68.y;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _469 = _467 != 0;
    float _471 = 1.0 / _449;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _465;
    float _479 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _481 = _441 > 0.5;
    bool _483 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _485 = isnan(_433);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _503 = _501 != 0;
    float _505 = 1.0 / _457;
    float _507 = -_203;
    int _509 = _481 ? as_type<int>(_507) : as_type<int>(_203);
    bool _511 = _435 > 0.5;
    float _513 = -_193;
    int _515 = _511 ? as_type<int>(_513) : as_type<int>(_193);
    float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _521 = _519 != 0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = -_523;
    float _527 = fma(_479, 2.0, _525);
    float _529 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _541 = _439 * 2.0;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _545 = _537 * _471;
    float _547 = fma(_529, -2.0, _539);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _549;
    float _553 = _533 * _505;
    float _555 = _437 * 2.0;
    bool _557 = !_453;
    float _559 = _557 ? _193 : as_type<float>(_515);
    float _561 = _551 * _477;
    bool _563 = _437 > 0.5;
    float _565 = _437 + _439;
    float _567 = floor(_555);
    float _569 = -_203;
    int _571 = _563 ? as_type<int>(_569) : as_type<int>(_203);
    float _573 = _565 + (-1.0);
    float _575 = -_193;
    int _577 = _563 ? as_type<int>(_575) : as_type<int>(_193);
    float _579 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _547);
    bool _581 = !_461;
    float _583 = _581 ? _203 : as_type<float>(_571);
    float _585 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _587 = _439 > 0.5;
    float _589 = floor(_541);
    float _591 = _437 + _435;
    float _593 = _517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _595 = -_193;
    int _597 = _587 ? as_type<int>(_595) : as_type<int>(_193);
    float _599 = _591 + (-1.0);
    float _601 = _583 + (-0.5);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _605 = !_475;
    float _607 = _605 ? _193 : as_type<float>(_597);
    float _609 = _435 * 2.0;
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _613 = -_203;
    int _615 = _587 ? as_type<int>(_613) : as_type<int>(_203);
    float _617 = -_593;
    float _619 = -_579;
    float _621 = fma(_617, _601, _619);
    bool _623 = !_499;
    float _625 = _623 ? _193 : as_type<float>(_577);
    float _627 = floor(_609);
    bool _629 = _567 > 0.0;
    bool _631 = _567 >= 0.0;
    bool _633 = isnan(_567);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _643 = _433 + _641;
    bool _645 = _589 >= 0.0;
    bool _647 = isnan(_589);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = _625 + 0.5;
    int _657 = _639 ? 0 : 1;
    float _659 = fma(_553, _643, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _661 = !_503;
    float _663 = _661 ? _203 : as_type<float>(_615);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _433 + _665;
    float _669 = _553;
    float _671 = _621;
    float _673 = _445;
    if (!_521)
    {
        _669 = _439;
    }
    float _675 = _669;
    float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _679 = _589 > 0.0;
    float _681 = fma(_545, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _683 = _675;
    if (_521)
    {
        _683 = _437;
    }
    float _685 = _683;
    float _687 = -_663;
    float _689 = _687 + 0.5;
    int _691 = _653 ? 0 : 1;
    bool _693 = _627 > 0.0;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].w, _495);
    float _697 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _699 = -_135;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[76].x, _527);
    float _703 = _559 + 0.5;
    bool _705 = _627 >= 0.0;
    bool _707 = isnan(_627);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _717 = _433 + _715;
    int _719 = ~_691;
    int _721 = _719 + 1;
    int _723 = _721 + 1;
    float _725 = fma(_697, _703, _701);
    int _727 = _723;
    float _729 = _717;
    float _731 = _685;
    if (!_679)
    {
        int _733 = ~_691;
        int _735 = _733 + 1;
        _727 = _735;
    }
    int _737 = _727;
    float _739 = fma(_561, _717, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _741 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _743 = isnan(_433);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _689 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _757 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _759 = isnan(_433);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -_751;
    float _771 = _769 + 1.0;
    if (!_521)
    {
        _729 = _437;
    }
    float _773 = _729;
    float _775 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _695);
    float _777 = _773;
    if (!_521)
    {
        _731 = _439;
    }
    float _779 = _731;
    float _781 = _767 * _771;
    float _783 = _779;
    if (_521)
    {
        _777 = _435;
    }
    float _785 = _777;
    float _787 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _789 = log2(_787);
    if (_521)
    {
        _783 = _437;
    }
    float _791 = _783;
    float _793 = -_775;
    float _795 = _793 + 1.0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _803 = _801 != 0;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _807 = _805 != 0;
    float _809 = -_767;
    float _811 = _809 + 1.0;
    bool _813 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _815 = isnan(_433);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _827 = _823 * _811;
    float _829 = -_823;
    float _831 = _829 + 1.0;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _835 = _755 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _839 = _493 * _831;
    float _841 = -_493;
    float _843 = _841 + 1.0;
    float _845 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[83].z, _603);
    float _847 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _849 = _659 * _839;
    float _851 = _655 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _853 = _785 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _855 = fma(_847, -2.0, _833);
    float _857 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[131].x, _849);
    float _859 = _753 * _543;
    float _861 = _851 * _677;
    float _863 = in.m_48.x;
    float _865 = in.m_48.y;
    float _867 = in.m_48.z;
    float _869 = -_837;
    float _871 = fma(_853, 2.0, _869);
    int _873 = _713 ? 0 : 1;
    float _875 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _855);
    out.m_70.x = _861;
    out.m_70.y = _859;
    float _877 = _607 + 0.5;
    float _879 = -_135;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[81].x, _871);
    int _883 = ~_873;
    int _885 = _883 + 1;
    int _887 = _885 + 1;
    float _889 = _789 * _135;
    int _891 = _887;
    float _893 = _877;
    if (!_693)
    {
        int _895 = ~_873;
        int _897 = _895 + 1;
        _891 = _897;
    }
    int _899 = _891;
    float _901 = fma(_681, _827, _857);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _905 = fma(_835, _877, _881);
    float _907 = exp2(_889);
    float _909 = _825 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _911 = ~_657;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _919 = 1.0 + _917;
    int _921 = _915;
    int _923 = _899;
    if (!_629)
    {
        int _925 = ~_657;
        int _927 = _925 + 1;
        _921 = _927;
    }
    int _929 = _921;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _933 = !_469;
    float _935 = _933 ? _203 : as_type<float>(_509);
    float _937 = 1.0 / _919;
    float _939 = _865 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _941 = _865 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _943 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _945 = isnan(1.0);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _951 = _947 || _949;
    float _953 = _865 + _445;
    float _955 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[6].x, _939);
    float _957 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[4].x, _941);
    float _959 = _935 + (-0.5);
    float _961 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _931);
    float _963 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[6].z, _955);
    float _965 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _903);
    float _967 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _953 + _969;
    float _973 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _845);
    float _975 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _965);
    float _977 = _967 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _979 = -_909;
    float _981 = -_875;
    float _983 = fma(_979, _959, _981);
    float _985 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _961);
    float _987 = -_975;
    float _989 = _987 + 1.0;
    float _991 = _971 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _993 = _963 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _997 = _977 + _995;
    float _999 = -_989;
    float _1001 = fma(_559, _999, _725);
    bool _1003 = !_799;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = -_973;
    float _1009 = _1007 + 1.0;
    float _1011 = -_985;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _993 + _1015;
    int _1019 = abs(_1005);
    float _1021 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[28].x, _991);
    float _1023 = -_1009;
    float _1025 = fma(_607, _1023, _905);
    float _1027 = -_907;
    float _1029 = _1027 + 1.0;
    float _1031 = fma(_583, _1013, _621);
    float _1033 = fma(_935, _795, _983);
    float _1035 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1021);
    bool _1037 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(0.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = in.m_72.x;
    float _1049 = in.m_72.y;
    float _1051 = in.m_72.z;
    float _1053 = float(_737);
    float _1055 = fma(_739, _781, _901);
    bool _1057 = !_803;
    int _1059 = _1057 ? 0 : 1;
    out.m_74.x = _1001;
    out.m_74.y = _1031;
    out.m_74.z = _1025;
    out.m_74.w = _1033;
    float _1061 = float(_1019);
    float _1063 = _971 * _971;
    float _1065 = _1045 ? _1029 : 0.0;
    bool _1067 = _1035 >= 0.0;
    float _1069 = _1061 * _1053;
    int _1071 = abs(_1059);
    float _1073 = fma(_997, _997, _1063);
    if (_951)
    {
        float _1075 = _1065 * _937;
        _159 = _1075;
    }
    float _1077 = _159;
    float _1079 = fma(_1017, _1017, _1073);
    float _1081 = float(_899);
    float _1083 = _1069 * (-2.0);
    float _1085 = float(_1071);
    float _1087 = rsqrt(_1079);
    if (_1067)
    {
        _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1089 = _671;
    float _1091 = _1085 * _1081;
    float _1093 = fma(_611, _1083, _611);
    float _1095 = fma(_1083, _1047, _1047);
    float _1097 = _435 + (-0.5);
    float _1099 = _1051;
    if (_1067)
    {
        float _1101 = _1089 * 5.0;
        _923 = as_type<int>(_1101);
    }
    int _1103 = _923;
    float _1105 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1107 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1095);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1111 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1055);
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1067)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5245 = as_type<float>(_1103);
        out.gl_Position.z = _5245;
    }
    float _1119 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1067)
    {
        out.m_51.x = 0.0;
    }
    bool _1127 = !_807;
    int _1129 = _1127 ? 0 : 1;
    out.m_76.x = _1119;
    out.m_76.y = _1121;
    out.m_76.z = _1123;
    out.m_76.w = _1125;
    float _1131 = _1113 * _1087;
    float _1133 = _997 * _1131;
    float _1135 = _971 * _1131;
    float _1137 = -_1133;
    float _1139 = _997 + _1137;
    float _1141 = -_1135;
    float _1143 = _971 + _1141;
    if (_1067)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1145 = -_1135;
    float _1147 = _953 + _1145;
    float _1149 = _1143 * _1143;
    float _1151 = _1017 * _1131;
    float _1153 = -_1133;
    float _1155 = _977 + _1153;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1159 = _1147 + _1157;
    float _1161 = fma(_1139, _1139, _1149);
    float _1163 = -_1151;
    float _1165 = _1017 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = _1155 + _1167;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1173 = fma(_1093, _1077, _1107);
    int _1175 = abs(_1129);
    float _1177 = fma(_1165, _1165, _1161);
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1171);
    float _1181 = _1091 * (-2.0);
    float _1183 = -_1151;
    float _1185 = _993 + _1183;
    float _1187 = _437 + (-0.5);
    float _1189 = float(_929);
    float _1191 = fma(_1181, _1049, _1049);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1195 = _1185 + _1193;
    float _1197 = float(_1175);
    float _1199 = fma(_585, _1181, _585);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1191);
    float _1203 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1179);
    float _1205 = _439 + _435;
    float _1207 = _1197 * _1189;
    float _1209 = fma(_1199, _1077, _1201);
    float _1211 = _439 + (-0.5);
    bool _1213 = _1203 >= 0.0;
    float _1215 = _1205 + (-1.0);
    float _1217 = _1207 * (-2.0);
    float _1219 = _1209 * 0.15915493667125701904296875;
    float _1221 = _1173 * 0.15915493667125701904296875;
    float _1223 = sqrt(_1177);
    float _1225 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = fma(_1217, _1051, _1051);
    float _1229 = fma(_1225, _1217, _1225);
    float _1231 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    if (_1213)
    {
        _1099 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1233 = _1099;
    float _1235 = _1221 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    int _1239 = as_type<int>(_1233);
    if (_1213)
    {
        out.m_51.x = 0.0;
    }
    float _1241 = fma(_1229, _1077, _1231);
    if (_1213)
    {
        float _1243 = _1233 * 5.0;
        _1239 = as_type<int>(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1241 * 0.15915493667125701904296875;
    float _1249 = _1221 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    if (_1213)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5479 = as_type<float>(_1245);
        out.gl_Position.z = _5479;
    }
    float _1253 = _1219 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1219 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _1247 * 6.283185482025146484375;
    float _1263 = sin(_1261);
    if (_1213)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _1265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1267 = _1237 * _1255;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1271 = _1251 * _1259;
    float _1273 = _1247 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    float _1277 = -_953;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = fma(_1263, _1271, _1267);
    float _1283 = fma(_1263, _1267, _1271);
    float _1285 = _1251 * _1255;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1291 = _1087 * _1223;
    float _1293 = _1237 * _1259;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    if (_1265)
    {
        float _1297 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _893 = _1297;
    }
    float _1299 = _893;
    float _1301 = _1105 * _1291;
    float _1303 = -_1285;
    float _1305 = fma(_1263, _1293, _1303);
    float _1307 = _1299;
    if (_1269)
    {
        float _1309 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _673 = _1309;
    }
    float _1311 = _673;
    float _1313 = _1143;
    if (_1265)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1313 = _1315;
    }
    float _1317 = _1313;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1323 = -_1293;
    float _1325 = fma(_1263, _1285, _1323);
    float _1327 = _1295 * _1301;
    float _1329 = _315 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1331 = -_977;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1335 = as_type<float>(_1245);
    if (_1269)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = _1279 * _1279;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1351 = _1251 * _1275;
    float _1353 = _1259 * _1275;
    float _1355 = _1237 * _1275;
    float _1357 = 1.0 / _1321;
    float _1359 = _1255 * _1275;
    float _1361 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1363 = -_993;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1367 = fma(_1333, _1333, _1341);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1373 = 1.0 / _1289;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1379 = _1291 * _1329;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1385 = _1361 * _1379;
    float _1387 = fma(_1365, _1365, _1367);
    float _1389 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1391 = _1367;
    float _1393 = _1357;
    if (_1265)
    {
        float _1395 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1307 = _1395;
    }
    float _1397 = _1307;
    float _1399 = 1.0 / _1345;
    float _1401 = _1397;
    if (_1269)
    {
        float _1403 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1389 = _1403;
    }
    float _1405 = _1389;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1407;
    if (_1265)
    {
        float _1411 = _1397 * _1317;
        _1391 = _1411;
    }
    float _1413 = _1391;
    if (_1269)
    {
        float _1415 = _1405 * _1339;
        _1401 = _1415;
    }
    float _1417 = _1401;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1419;
    float _1423 = 1.0 / _1349;
    float _1425 = _1409 * _1373;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1443 = 1.0 / _1377;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1453;
    float _1457 = _1437 * _1399;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1463;
    float _1467 = 1.0 / _1371;
    float _1469 = _1441 * _1423;
    float _1471 = _1451 * _1357;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1473;
    float _1477 = _1475;
    if (!_1265)
    {
        _1393 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1479 = _1393;
    float _1481 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1483 = _1481 * 0.5;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1489 = 0.0;
    float _1491 = _1479;
    if (_1265)
    {
        float _1493 = floor(_1413);
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = _1455 * _1443;
    float _1499 = -_1385;
    float _1501 = _1263 * _1499;
    float _1503 = _1355 * _1385;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1505;
    float _1509 = _865 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1511 = fma(_1353, _1327, _1501);
    float _1513 = fma(_1305, _1327, _1503);
    float _1515 = 1.0 / _1383;
    float _1517 = _1461 * _1467;
    float _1519 = _1351 * _1385;
    float _1521 = fma(_1281, _1327, _1519);
    float _1523 = fma(_1359, _1483, _1511);
    float _1525 = 0.0;
    float _1527 = _1523;
    if (_1269)
    {
        float _1529 = floor(_1417);
        _1525 = _1529;
    }
    float _1531 = _1525;
    if (_1265)
    {
        float _1533 = -_1495;
        float _1535 = _1413 + _1533;
        _1491 = _1535;
    }
    float _1537 = _1491;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1541 = _1537 + _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1545 = _1537 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1549 = _1537 + _1547;
    float _1551 = 1.0 / _1429;
    float _1553 = _1475 * _1515;
    if (!_1269)
    {
        _1477 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1555 = _1477;
    float _1557 = 1.0 / _1421;
    float _1559 = _1555;
    if (_1269)
    {
        float _1561 = -_1531;
        float _1563 = _1417 + _1561;
        _1559 = _1563;
    }
    float _1565 = _1559;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1569 = _1537 + _1567;
    bool _1571 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1573 = isnan(_1565);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = 1.0 / _1433;
    float _1585 = _1569 * _1551;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1589 = _1537 + _1587;
    float _1591 = -_1581;
    float _1593 = _1591 + 1.0;
    float _1595 = 1.0 / _1447;
    float _1597 = _1541 * _1557;
    float _1599 = rsqrt(_1387);
    float _1601 = _1545 * _1583;
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1605 = _1565 + _1603;
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1609 = _1537 + _1607;
    float _1611 = fma(_1457, _1605, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1615 = _1565 + _1613;
    float _1617 = 1.0 / _1465;
    float _1619 = _1589 * _1595;
    float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1623 = _1565 + _1621;
    float _1625 = fma(_1471, _1615, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1627 = fma(_1425, _1623, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1631 = _1565 + _1629;
    float _1633 = 1.0 / _1507;
    float _1635 = _1333 * _1599;
    float _1637 = _1279 * _1599;
    float _1639 = _1365 * _1599;
    float _1641 = fma(_1325, _1483, _1521);
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1645 = _1565 + _1643;
    float _1647 = fma(_1469, _1631, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1651 = _1565 + _1649;
    float _1653 = 1.0 / _1487;
    float _1655 = _1609 * _1617;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1659 = _1565 + _1657;
    float _1661 = fma(_1517, _1645, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _1663 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1665 = isnan(_1565);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1671 = _1667 || _1669;
    float _1673 = float(_1671);
    float _1675 = fma(_1283, _1483, _1513);
    float _1677 = fma(_1553, _1659, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1679 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1681 = isnan(_1565);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1549 * _1633;
    bool _1693 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1695 = isnan(_1565);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1701 = _1697 || _1699;
    float _1703 = float(_1701);
    float _1705 = _1673 * _1593;
    float _1707 = -_1673;
    float _1709 = _1707 + 1.0;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1713 = _1537 + _1711;
    float _1715 = fma(_1497, _1651, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1717 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1719 = isnan(_1565);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = -_1689;
    float _1731 = _1729 + 1.0;
    bool _1733 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1735 = isnan(_1565);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = -_1703;
    float _1747 = _1745 + 1.0;
    bool _1749 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1751 = isnan(_1537);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1713 * _1653;
    float _1763 = _1581 * _1731;
    float _1765 = -_1743;
    float _1767 = _1765 + 1.0;
    float _1769 = _1727 * _1747;
    bool _1771 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1773 = isnan(_1537);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1779 = _1775 || _1777;
    float _1781 = float(_1779);
    float _1783 = -_1759;
    float _1785 = _1783 + 1.0;
    float _1787 = _1703 * _1709;
    float _1789 = _1689 * _1767;
    float _1791 = _1627 * _1769;
    float _1793 = _1781 * _1785;
    float _1795 = -_1781;
    float _1797 = _1795 + 1.0;
    bool _1799 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1801 = isnan(_1565);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = -_1727;
    float _1813 = _1811 + 1.0;
    bool _1815 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1817 = isnan(_1537);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    bool _1827 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1829 = isnan(_1537);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1791);
    float _1841 = -_1809;
    float _1843 = _1841 + 1.0;
    float _1845 = _1825 * _1797;
    float _1847 = -_1825;
    float _1849 = _1847 + 1.0;
    bool _1851 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1853 = isnan(_1537);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = _1743 * _1843;
    float _1865 = fma(_1611, _1787, _1839);
    float _1867 = -_1837;
    float _1869 = _1867 + 1.0;
    float _1871 = _1837 * _1849;
    bool _1873 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1875 = isnan(_1537);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = _1861 * _1869;
    bool _1887 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1889 = isnan(_1537);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1899;
    bool _1903 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1905 = isnan(_1537);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = -_1883;
    float _1917 = _1915 + 1.0;
    float _1919 = -_1861;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1901, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1925 = _1913 * _1917;
    float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1929 = _1927 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1931;
    float _1935 = _1897 * _1921;
    float _1937 = -_1897;
    float _1939 = _1937 + 1.0;
    float _1941 = -_1913;
    float _1943 = _1941 + 1.0;
    float _1945 = _1923 * _1925;
    bool _1947 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1949 = isnan(_1565);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1955 = _1951 || _1953;
    float _1957 = float(_1955);
    float _1959 = fma(_1933, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1961 = fma(_1677, _1705, _1865);
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1967 = _1883 * _1939;
    float _1969 = fma(_1929, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1971 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1945);
    float _1973 = _1959 * _1925;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1975;
    float _1979 = -_1957;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1647, _1763, _1961);
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1987 = _1635 * _1985;
    float _1989 = fma(_1969, _1967, _1971);
    float _1991 = fma(_1965, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1993 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1973);
    float _1995 = fma(_1977, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1997 = _1809 * _1981;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1999;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2005 = _1639 * _2003;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2009 = -_1987;
    float _2011 = fma(_1639, _2007, _2009);
    float _2013 = fma(_1991, _1967, _1993);
    float _2015 = fma(_1995, _1935, _1989);
    float _2017 = fma(_2001, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2021 = _2019 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2025 = -_2005;
    float _2027 = fma(_1637, _2023, _2025);
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2031 = _1637 * _2029;
    float _2033 = _2011 * _2011;
    float _2035 = fma(_2017, _1935, _2013);
    float _2037 = fma(_2021, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2041 = -_2031;
    float _2043 = fma(_1635, _2039, _2041);
    float _2045 = fma(_2027, _2027, _2033);
    float _2047 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _2049 = _2047 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2051 = fma(_2037, _1885, _2015);
    float _2053 = fma(_2043, _2043, _2045);
    float _2055 = fma(_2049, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2057 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2065 = rsqrt(_2053);
    float _2067 = fma(_2059, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2069 = fma(_2055, _1885, _2035);
    float _2071 = fma(_1625, _1789, _1983);
    float _2073 = fma(_2063, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2075 = fma(_2067, _1871, _2051);
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2077;
    float _2081 = fma(_1661, _1863, _2071);
    float _2083 = fma(_2073, _1845, _2075);
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2089;
    float _2093 = fma(_2079, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2095 = fma(_1715, _1997, _2081);
    float _2097 = fma(_2091, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2099 = _2027 * _2065;
    float _2101 = fma(_2093, _1871, _2069);
    float _2103 = fma(_2087, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2105 = fma(_2097, _1793, _2083);
    float _2107 = _2011 * _2065;
    float _2109 = _1637 * _2099;
    float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2111;
    float _2115 = fma(_2103, _1845, _2101);
    float _2117 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2095);
    float _2119 = _2043 * _2065;
    float _2121 = _1639 * _2107;
    float _2123 = -_2109;
    float _2125 = fma(_1635, _2107, _2123);
    float _2127 = fma(_2113, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2129 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2105);
    float _2131 = -_2121;
    float _2133 = fma(_1637, _2119, _2131);
    float _2135 = _2125 * _1641;
    float _2137 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2139 = _993 + _2137;
    float _2141 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2143 = fma(_2127, _1793, _2115);
    float _2145 = _2133 * _1641;
    float _2147 = fma(_2119, _1523, _2135);
    float _2149 = -_2141;
    float _2151 = fma(_2129, _2139, _2149);
    float _2153 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2155 = _977 + _2153;
    float _2157 = fma(_2099, _1523, _2145);
    float _2159 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2161 = fma(_1639, _1675, _2147);
    float _2163 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2143);
    float _2165 = fma(_1635, _1675, _2157);
    float _2167 = -_2159;
    float _2169 = fma(_2129, _2155, _2167);
    float _2171 = _1635 * _2119;
    float _2173 = fma(_2161, _2163, _2151);
    float _2175 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1509);
    float _2177 = fma(_2165, _2163, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_1639, _2099, _2179);
    float _2183 = _2173 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2185 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2175);
    float _2187 = _2177 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2189 = _2181 * _1641;
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2193 = _2183 + _2191;
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2199 = _2187 + _2197;
    float _2201 = fma(_2107, _1523, _2189);
    float _2203 = _2193 * _2193;
    float _2205 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2207 = _2195 + _2205;
    float _2209 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2211 = fma(_1637, _1675, _2201);
    float _2213 = fma(_2199, _2199, _2203);
    float _2215 = -_2209;
    float _2217 = fma(_2129, _2207, _2215);
    float _2219 = _953 + _2211;
    float _2221 = sqrt(_2213);
    float _2223 = -_2195;
    float _2225 = _2219 + _2223;
    float _2227 = fma(_2163, _2225, _2217);
    float _2229 = _2227 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2231 = _2221 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = _2221 + _2233;
    float _2237 = _2203;
    float _2239 = _2207;
    float _2241 = _2213;
    float _2243 = _2201;
    float _2245 = _2187;
    float _2247 = _2183;
    float _2249 = _1641;
    float _2251 = _2199;
    if (_2231)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2253;
    }
    float _2255 = _2237;
    if (_2231)
    {
        float _2257 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2257;
    }
    float _2259 = _2239;
    if (_2231)
    {
        float _2261 = rsqrt(_2213);
        _2241 = _2261;
    }
    float _2263 = _2241;
    float _2265 = _2255;
    if (_2231)
    {
        float _2267 = _2235 * _2255;
        _2265 = _2267;
    }
    float _2269 = _2265;
    if (_2231)
    {
        float _2271 = _2269 * 0.15915493667125701904296875;
        _2243 = _2271;
    }
    float _2273 = _2243;
    float _2275 = _867;
    if (_2231)
    {
        float _2277 = _2273 * 6.283185482025146484375;
        float _2279 = sin(_2277);
        _2275 = _2279;
    }
    float _2281 = _2275;
    float _2283 = _2281;
    if (_2231)
    {
        float _2285 = fma(_2281, _2259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2285;
    }
    float _2287 = _2283;
    float _2289 = _2287;
    if (_2231)
    {
        float _2291 = _2263 * _2287;
        _2289 = _2291;
    }
    float _2293 = _2289;
    if (_2231)
    {
        float _2295 = fma(_2199, _2293, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2245 = _2295;
    }
    float _2297 = _2245;
    float _2299 = _2297;
    if (_2231)
    {
        float _2301 = fma(_2193, _2293, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2247 = _2301;
    }
    float _2303 = _2247;
    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2307 = _2297 + _2305;
    float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2311 = _2303 + _2309;
    float _2313 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2315 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7184 = float2(_2313, _2315);
    float _2317 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7184, float2(0.0), isnan(_7184)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7184, float2(0.0), isnan(_7184)), level(0.0)).x;
    float _2319 = _2273;
    float _2321 = _2307;
    float _2323 = _2303;
    float _2325 = _2315;
    if (_2231)
    {
        float _2327 = _2273 * 6.283185482025146484375;
        float _2329 = cos(_2327);
        _2319 = _2329;
    }
    float _2331 = _2319;
    if (!_2231)
    {
        _2321 = _2229;
    }
    float _2333 = _2321;
    float _2335 = -_977;
    float _2337 = _2335 + _2297;
    float _2339 = _2333;
    if (_2231)
    {
        float _2341 = _2331 + (-1.0);
        _2249 = _2341;
    }
    float _2343 = _2249;
    if (_2231)
    {
        float _2345 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _2345;
    }
    float _2347 = _1527;
    if (_2231)
    {
        float _2349 = fma(_2229, _2331, _2347);
        _2339 = _2349;
    }
    float _2351 = _2339;
    float _2353 = -_993;
    float _2355 = _2353 + _2303;
    float _2357 = -_953;
    float _2359 = _2357 + _2351;
    float _2361 = _2359 * _2359;
    float _2363 = fma(_2337, _2337, _2361);
    float _2365 = fma(_2355, _2355, _2363);
    float _2367 = sqrt(_2365);
    bool _2369 = _2367 > 0.0;
    float _2371 = fma(_2317, 100.0, _2351);
    bool _2373 = !_2369;
    float _2375 = _2371;
    float _2377 = _2365;
    float _2379 = _2359;
    if (!_2373)
    {
        float _2381 = _207 * _207;
        float _2383 = fma(_205, _205, _2381);
        float _2385 = fma(_209, _209, _2383);
        float _2387 = rsqrt(_2365);
        float _2389 = sqrt(_2385);
        float _2391 = _2359 * _2387;
        float _2393 = _2355 * _2387;
        bool _2395 = _2389 > 0.0;
        float _2397 = _2337 * _2387;
        bool _2399 = !_2395;
        _2251 = _2393;
        _2379 = _2391;
        _2325 = _2397;
        if (!_2399)
        {
            float _2401 = rsqrt(_2385);
            float _2403 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2405 = _207 * _2401;
            float _2407 = _205 * _2401;
            float _2409 = _2391 * _2405;
            float _2411 = _209 * _2401;
            float _2413 = fma(_2397, _2407, _2409);
            float _2415 = _2403 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2417 = fma(_2393, _2411, _2413);
            float _2419 = _2417 * _2415;
            float _2421 = fma(_205, _2419, _2297);
            float _2423 = fma(_207, _2419, _2371);
            float _2425 = fma(_209, _2419, _2303);
            _2375 = _2423;
            _2299 = _2421;
            _2323 = _2425;
            _2377 = _2413;
            _2379 = _2415;
        }
    }
    float _2427 = _2375;
    float _2429 = _2299;
    float _2431 = _2323;
    float _2433 = _2377;
    float _2435 = _2251;
    float _2437 = _2379;
    float _2439 = _2325;
    float _2441 = -_1135;
    float _2443 = _2441 + _2427;
    float _2445 = -_1133;
    float _2447 = _2445 + _2429;
    float _2449 = -_1151;
    float _2451 = _2449 + _2431;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2455 = _2443 + _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2459 = _2447 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2463 = _2451 + _2461;
    float _2465 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2467 = _2455 * _2455;
    float _2469 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2465);
    float _2471 = fma(_2459, _2459, _2467);
    float _2473 = fma(_2463, _2463, _2471);
    float _2475 = rsqrt(_2473);
    float _2477 = sqrt(_2473);
    float _2479 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2481 = _2459 * _2479;
    float _2483 = _2463 * _2479;
    float _2485 = _2481 * _2481;
    float _2487 = _2483 * _2483;
    float _2489 = _2485 + _2487;
    float _2491 = sqrt(_2489);
    bool _2493 = _2491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2497 = _2491 + _2495;
    float _2499 = _2433;
    float _2501 = _2489;
    float _2503 = _2497;
    float _2505 = _2435;
    float _2507 = _2439;
    float _2509 = _2429;
    float _2511 = _2481;
    float _2513 = _2483;
    float _2515 = _2485;
    float _2517 = _2487;
    if (_2493)
    {
        float _2519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2499 = _2519;
    }
    float _2521 = _2499;
    if (_2493)
    {
        float _2523 = rsqrt(_2489);
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (_2493)
    {
        float _2527 = _2497 * _2521;
        _2503 = _2527;
    }
    float _2529 = _2503;
    if (_2493)
    {
        float _2531 = _2529 * 0.15915493667125701904296875;
        _2505 = _2531;
    }
    float _2533 = _2505;
    float _2535 = _2521;
    if (_2493)
    {
        float _2537 = _2533 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        _2535 = _2539;
    }
    float _2541 = _2535;
    float _2543 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2545 = precise::max(0.0, _2543);
    float _2547 = _2437;
    float _2549 = _2545;
    if (_2493)
    {
        float _2551 = _2533 * 6.283185482025146484375;
        float _2553 = cos(_2551);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = -_2479;
    float _2559 = -_2545;
    float _2561 = fma(_2455, _2557, _2559);
    if (_2493)
    {
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2549 = _2563;
    }
    float _2565 = _2549;
    float _2567 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2569 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2571 = _2541;
    if (_2493)
    {
        float _2573 = fma(_2541, _2565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _213 = _2573;
    }
    float _2575 = _213;
    if (!_2493)
    {
        _2571 = _2561;
    }
    float _2577 = _2571;
    float _2579 = floor(_2569);
    float _2581 = _2577;
    if (_2493)
    {
        float _2583 = _2555 + (-1.0);
        _2507 = _2583;
    }
    float _2585 = _2507;
    float _2587 = _2585;
    if (_2493)
    {
        float _2589 = _2525 * _2575;
        _2509 = _2589;
    }
    float _2591 = _2509;
    if (_2493)
    {
        float _2593 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2587 = _2593;
    }
    float _2595 = _2587;
    if (_2493)
    {
        float _2597 = _2481 * _2591;
        _2511 = _2597;
    }
    float _2599 = _2511;
    if (_2493)
    {
        float _2601 = _2483 * _2591;
        _2513 = _2601;
    }
    float _2603 = _2513;
    float _2605 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2567);
    if (_2493)
    {
        float _2607 = fma(_2561, _2555, _2595);
        _2581 = _2607;
    }
    float _2609 = _2581;
    if (_2493)
    {
        float _2611 = _2599 * _2599;
        _2515 = _2611;
    }
    float _2613 = _2515;
    if (_2493)
    {
        float _2615 = _2603 * _2603;
        _2517 = _2615;
    }
    float _2617 = _2517;
    float _2619 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2605);
    float _2621 = fma(_2609, _2609, _2613);
    float _2623 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2625 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2627 = _2621 + _2617;
    float _2629 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2631 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2625);
    float _2633 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2635 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2629);
    float _2637 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2631);
    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2641 = fma(_2477, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2639);
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    float _2645 = rsqrt(_2627);
    float _2647 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2635);
    float _2649 = _2637 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2651 = _2619 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2653 = -_2643;
    float _2655 = _2653 + 1.0;
    float _2657 = _2647 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2659 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2661 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2663 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2469);
    float _2665 = floor(_2623);
    float _2667 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2659);
    float _2669 = -_2661;
    float _2671 = fma(_2669, _2633, 1.0);
    float _2673 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2675 = -_2579;
    float _2677 = _2569 + _2675;
    float _2679 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2667);
    float _2681 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2683 = _2645 * _2599;
    float _2685 = abs(_2655);
    float _2687 = log2(_2685);
    float _2689 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2679);
    float _2691 = _2645 * _2609;
    float _2693 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2695 = _2645 * _2603;
    float _2697 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2699 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2681);
    float _2701 = -_2693;
    float _2703 = fma(_2691, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2701);
    float _2705 = log2(_2671);
    float _2707 = -_2665;
    float _2709 = _2623 + _2707;
    float _2711 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2697);
    float _2713 = -_2695;
    float _2715 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2703);
    float _2717 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2699);
    float _2719 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2711);
    float _2721 = fma(_2715, -0.5, 0.5);
    float _2723 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2725 = fma(_2715, 0.5, 0.5);
    float _2727 = 1.0 / _2689;
    float _2729 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2717);
    float _2731 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2719);
    float _2733 = fma(_2725, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2735 = _2705 * 0.693147182464599609375;
    float _2737 = fma(_2725, _2733, -0.212114393711090087890625);
    float _2739 = exp2(_2723);
    float _2741 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2743 = fma(_2725, _2737, 1.570728778839111328125);
    float _2745 = sqrt(_2721);
    float _2747 = _2691 + 1.0;
    float _2749 = _2729 * _2727;
    float2 _7888 = float2(_2677, _2709);
    float _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7888, float2(0.0), isnan(_7888)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7888, float2(0.0), isnan(_7888)), level(0.0)).x;
    float _2753 = fma(_2749, 0.5, 0.5);
    float _2755 = -_2691;
    float _2757 = fma(_2739, _2747, _2755);
    float _2759 = _2731 * _2727;
    float _2761 = fma(_2757, 0.5, 0.5);
    float _2763 = fma(_2759, -0.5, 0.5);
    float _2765 = _2745 * 0.636619746685028076171875;
    float _2767 = -_2743;
    float _2769 = fma(_2765, _2767, 1.0);
    float3 _7920 = float3(_2753, _2763, _2741);
    float _2771 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7920, float3(0.0), isnan(_7920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7920, float3(0.0), isnan(_7920)), level(0.0)).x;
    float3 _7931 = float3(_2753, _2763, _2741);
    float4 _2774 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7931, float3(0.0), isnan(_7931)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7931, float3(0.0), isnan(_7931)), level(0.0)).xyzw;
    float _2776 = _2774.x;
    float _2778 = _2774.y;
    float _2780 = _2774.z;
    float _2782 = _2774.w;
    float2 _7947 = float2(_2769, _2761);
    float3 _2786 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7947, float2(0.0), isnan(_7947)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7947, float2(0.0), isnan(_7947)), level(0.0)).xyz;
    float _2788 = _2786.x;
    float _2790 = _2786.y;
    float _2792 = _2786.z;
    out.m_76.x = _1119;
    out.m_76.y = _1121;
    out.m_76.z = _1123;
    out.m_76.w = _1125;
    float _2794 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2796 = fma(_2317, 100.0, _953);
    float _2798 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _2800;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    float _2804 = -_1135;
    float _2806 = _2804 + _2796;
    float _2808 = fma(_2802, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _2810 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2814 = _2808 * _1925;
    float _2816 = fma(_2812, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _2818;
    float _2822 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2814);
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2828 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2828;
    float _2832 = fma(_2820, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _2834 = fma(_2816, _1967, _2822);
    float _2836 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2836;
    float _2840 = fma(_2826, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2846 = fma(_2832, _1935, _2834);
    float _2848 = fma(_2838, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2850 = _1351 * _2133;
    float _2852 = fma(_2844, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2854 = fma(_2840, _1885, _2846);
    float _2856 = _1351 * _2181;
    float _2858 = _1281 * _2133;
    float _2860 = -_1263;
    float _2862 = fma(_2860, _2099, _2850);
    float _2864 = _1351 * _2125;
    float _2866 = -_1263;
    float _2868 = fma(_2866, _2107, _2856);
    float _2870 = _1325 * _2133;
    float _2872 = fma(_1353, _2099, _2858);
    float _2874 = fma(_1355, _1635, _2862);
    float _2876 = fma(_1355, _1637, _2868);
    float _2878 = fma(_1359, _2099, _2870);
    float _2880 = fma(_1305, _1635, _2872);
    float _2882 = _2794 * _2874;
    float _2884 = _2794 * _2876;
    float _2886 = fma(_1283, _1635, _2878);
    float _2888 = fma(_2830, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2890 = fma(_2798, _2880, _2882);
    float _2892 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2894 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2896 = _1281 * _2181;
    float _2898 = _2886 + _2890;
    float _2900 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2892);
    float _2902 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2894);
    float _2904 = fma(_2848, _1871, _2854);
    float _2906 = -_1263;
    float _2908 = fma(_2906, _2119, _2864);
    float _2910 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2900);
    float _2912 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2902);
    float _2914 = fma(_1353, _2107, _2896);
    float _2916 = fma(_2852, _1845, _2904);
    float _2918 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2920 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2922 = fma(_1355, _1639, _2908);
    float _2924 = fma(_1305, _1637, _2914);
    float _2926 = 1.0 / _2918;
    float _2928 = _2920 + _2918;
    float _2930 = fma(_2888, _1793, _2916);
    float _2932 = fma(_2798, _2924, _2884);
    float _2934 = _1281 * _2125;
    float _2936 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2930);
    float _2938 = in.m_68.x;
    float _2940 = _1325 * _2181;
    float _2942 = _1325 * _2125;
    out.m_78.x = _2936;
    float _2944 = fma(_1353, _2119, _2934);
    float _2946 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2948 = fma(_1359, _2107, _2940);
    float _2950 = _2928 * _2926;
    float _2952 = _2950 * 0.5;
    bool _2954 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2958 = _2954 || _2956;
    bool _2960 = isnan(0.5);
    bool _2962 = _2958 || _2960;
    float _2964 = fma(_1359, _2119, _2942);
    float _2966 = fma(_1305, _1639, _2944);
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2970 = fma(_2952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2968);
    float _2972 = _2794 * _2922;
    float _2974 = exp2(_2946);
    float _2976 = fma(_1283, _1637, _2948);
    float _2978 = fma(_1283, _1639, _2964);
    float _2980 = fma(_2798, _2966, _2972);
    float _2982 = _2689 * 0.5;
    float _2984 = _2976 + _2932;
    float _2986 = _2978 + _2980;
    float _2988 = 1.0 / _2970;
    float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2992 = _2988 * _2990;
    float _2994 = abs(_2992);
    float _2996 = log2(_2994);
    bool _2998 = _2992 <= 8000.0;
    bool _3000 = isnan(_2992);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(8000.0);
    bool _3006 = _3002 || _3004;
    float _3008 = float(_3006);
    float _3010 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3012 = exp2(_3010);
    float _3014 = fma(_3012, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3016 = precise::clamp(_3014, 0.0, 1.0);
    float _3018 = _3012;
    float _3020 = _2982;
    float _3022 = _2689;
    float _3024 = _2731;
    float _3026 = _2729;
    if (_2962)
    {
        _3018 = 1.0;
    }
    float _3028 = _3018;
    float _3030 = fma(_3016, -2.0, 3.0);
    float _3032 = _3016 * _3016;
    float _3034 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3036 = _3032 * _3030;
    float _3038 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3034);
    float _3040 = -_3036;
    float _3042 = _3040 + 1.0;
    float _3044 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3038);
    float _3046 = fma(_3042, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3036);
    float _3048 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3044);
    float _3050 = _2729 + _2689;
    float _3052 = fma(_2731, -0.5, _2982);
    float _3054 = _3028;
    float _3056 = _3052;
    if (_2962)
    {
        _3020 = 1.0;
    }
    float _3058 = _3020;
    float _3060 = _3048 + _2689;
    float _3062 = _3050 * 0.5;
    float _3064 = _3060 * 0.5;
    float _3066 = _3058;
    float _3068 = _3064;
    if (!_2962)
    {
        float _3070 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3072 = _3070 * 0.15915493667125701904296875;
        float _3074 = _3072 * 6.283185482025146484375;
        float _3076 = cos(_3074);
        float _3078 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3080 = _3078 * 0.15915493667125701904296875;
        float _3082 = _3072 * 6.283185482025146484375;
        float _3084 = sin(_3082);
        float _3086 = 1.0 / _3076;
        float _3088 = _3080 * 6.283185482025146484375;
        float _3090 = cos(_3088);
        float _3092 = _3084 * _3086;
        float _3094 = _3080 * 6.283185482025146484375;
        float _3096 = sin(_3094);
        float _3098 = _3090 * _3092;
        float _3100 = 1.0 / _3098;
        float _3102 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3104 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3102;
        float _3106 = 1.0 / _3104;
        float _3108 = _3096 * _3100;
        float _3110 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3112 = fma(_2992, _3108, _3110);
        float _3114 = _3112 * _3106;
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        _3066 = _3116;
    }
    float _3118 = _3066;
    if (!_2962)
    {
        float _3120 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3122 = _3120 * 0.15915493667125701904296875;
        float _3124 = _3122 * 6.283185482025146484375;
        float _3126 = cos(_3124);
        float _3128 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3130 = _3128 * 0.15915493667125701904296875;
        float _3132 = _3122 * 6.283185482025146484375;
        float _3134 = sin(_3132);
        float _3136 = 1.0 / _3126;
        float _3138 = _3130 * 6.283185482025146484375;
        float _3140 = cos(_3138);
        float _3142 = _3134 * _3136;
        float _3144 = _3130 * 6.283185482025146484375;
        float _3146 = sin(_3144);
        float _3148 = _3140 * _3142;
        float _3150 = 1.0 / _3148;
        float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3154 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3152;
        float _3156 = 1.0 / _3154;
        float _3158 = _3146 * _3150;
        float _3160 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3162 = fma(_2992, _3158, _3160);
        float _3164 = _3162 * _3156;
        float _3166 = precise::clamp(_3164, 0.0, 1.0);
        float _3168 = -_3166;
        float _3170 = _3168 + 1.0;
        _3054 = _3170;
    }
    float _3172 = _3054;
    float _3174 = _3008 * _3046;
    float _3176 = -_2974;
    float _3178 = _3176 + 1.0;
    float _3180 = -_2751;
    float _3182 = _3180 + 1.0;
    float _3184 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3062;
    out.m_80.y = _3052;
    out.m_80.z = _3064;
    out.m_80.w = _2689;
    bool _3188 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3190 = isnan(_2477);
    bool _3192 = _3188 || _3190;
    bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3196 = _3192 || _3194;
    float _3198 = _3182 * _3184;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = _3186 * _2771;
    out.m_82.x = _2898;
    out.m_82.y = _2984;
    out.m_82.z = _2986;
    float _3204 = -_3200;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3208 = _2782 * _3202;
    float _3210 = _2792 * _3202;
    out.gl_Position.x = _2729;
    out.gl_Position.y = _2731;
    out.gl_Position.z = _3048;
    out.gl_Position.w = _2689;
    float _3212 = _3206 * _2938;
    float _3214 = fma(_2788, _3208, _2776);
    float _3216 = fma(_2790, _3208, _2778);
    float _3218 = fma(_2782, _3210, _2780);
    float _3220 = -_3186;
    float _3222 = _3220 + 1.0;
    float _3224 = _3212 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3226 = _3222;
    if (!_3196)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3228 = _3022;
    float _3230 = _2782 * _3222;
    float _3232 = _3228;
    float _3234 = _3228;
    if (!_3196)
    {
        _3068 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3236 = _3068;
    out.m_84.x = _3224;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3196)
    {
        _3056 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3242 = _3056;
    float _3244 = _3118 * _3172;
    out.m_86.x = _3214;
    out.m_86.y = _3216;
    out.m_86.z = _3218;
    out.m_86.w = _3230;
    float _3246 = _3242;
    float _3248 = _3242;
    if (!_3196)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3250 = _3024;
    float _3252 = _3250;
    float _3254 = _3250;
    if (!_3196)
    {
        _3026 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3256 = _3026;
    float _3258 = _3244 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3260 = _3256;
    float _3262 = _3256;
    if (!_3196)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3264 = _3226;
    bool _3266 = !_3196;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3266)
    {
        bool _3272 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3274 = isnan(_2477);
        bool _3276 = _3272 || _3274;
        bool _3278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3280 = _3276 || _3278;
        if (!_3280)
        {
            float _3282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3284 = _2477 + _3282;
            float _3286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3286;
            float _3290 = 1.0 / _3288;
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3294 = _3292 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3298 = _3296 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3302 = _3300 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3312 = _3284 * _3290;
            float _3314 = precise::clamp(_3312, 0.0, 1.0);
            float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3320 = fma(_3314, _3294, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3322 = fma(_3314, _3318, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3324 = fma(_3314, _3298, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3326 = fma(_3314, _3302, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3328 = fma(_3314, _3306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3330 = fma(_3314, _3310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3322;
            _3248 = _3328;
            _3254 = _3320;
            _3240 = _3326;
            _3234 = _3324;
            _3270 = _3330;
            _3332 = true;
        }
        else
        {
            bool _3334 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3336 = isnan(_2477);
            bool _3338 = _3334 || _3336;
            bool _3340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3342 = _3338 || _3340;
            if (!_3342)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3344 = _3252;
            _3254 = _3344;
            if (!_3342)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3346 = _3260;
            _3262 = _3346;
            if (!_3342)
            {
                _3232 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3348 = _3232;
            _3234 = _3348;
            if (!_3342)
            {
                _3238 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3350 = _3238;
            _3240 = _3350;
            if (!_3342)
            {
                _3246 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3352 = _3246;
            _3248 = _3352;
            if (!_3342)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3354 = _3268;
            bool _3356 = !_3342;
            _3270 = _3354;
            if (!_3356)
            {
                bool _3358 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3360 = isnan(_2477);
                bool _3362 = _3358 || _3360;
                bool _3364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3366 = _3362 || _3364;
                if (!_3366)
                {
                    float _3368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3370 = _2477 + _3368;
                    float _3372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3372;
                    float _3376 = 1.0 / _3374;
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3380 = _3378 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3398 = _3370 * _3376;
                    float _3400 = precise::clamp(_3398, 0.0, 1.0);
                    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3404 = _3402 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3406 = fma(_3400, _3380, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3408 = fma(_3400, _3404, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3410 = fma(_3400, _3384, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3412 = fma(_3400, _3388, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3414 = fma(_3400, _3392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3416 = fma(_3400, _3396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3408;
                    _3248 = _3414;
                    _3254 = _3406;
                    _3240 = _3412;
                    _3234 = _3410;
                    _3270 = _3416;
                    _3332 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3248 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3240 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3234 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3332 = false;
    float _3418 = _3262;
    float _3420 = _3248;
    float _3422 = _3254;
    float _3424 = _3240;
    float _3426 = _3234;
    float _3428 = _3270;
    float _3430 = fma(_2984, -0.5, 0.5);
    float _3432 = precise::clamp(_3430, 0.0, 1.0);
    float _3434 = -_3418;
    float _3436 = _3434 + _3420;
    float _3438 = -_3422;
    float _3440 = _3438 + _3424;
    out.m_88.x = 0.0;
    float _3442 = fma(_3432, _3436, _3418);
    float _3444 = -_3426;
    float _3446 = _3444 + _3428;
    float _3448 = fma(_3432, _3440, _3422);
    float _3450 = _3442 * 0.586610972881317138671875;
    bool _3452 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3454 = fma(_3432, _3446, _3426);
    float _3456 = _3258 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3458 = fma(_3448, 0.298911988735198974609375, _3450);
    bool _3460 = _3118 > 0.0;
    bool _3462 = isnan(_3118);
    bool _3464 = _3460 || _3462;
    bool _3466 = isnan(0.0);
    bool _3468 = _3464 || _3466;
    float _3470 = fma(_3454, 0.114477999508380889892578125, _3458);
    out.m_51.x = _3456;
    bool _3472 = _3172 <= 0.0;
    bool _3474 = !_3468;
    bool _3476 = _3472 || _3474;
    float _3478 = -_3470;
    float _3480 = _3448 + _3478;
    float _3482 = -_3470;
    float _3484 = _3442 + _3482;
    float _3486 = -_3470;
    float _3488 = _3454 + _3486;
    float _3490 = fma(_3480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    float _3492 = fma(_3484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    float _3494 = fma(_3488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    bool _3496 = !_3452;
    if (!_3496)
    {
        float _3498 = -_2443;
        float _3500 = _3498 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3502 = -_2447;
        float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3506 = -_2451;
        float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3510 = _3500 * _3500;
        float _3512 = fma(_3504, _3504, _3510);
        float _3514 = fma(_3508, _3508, _3512);
        float _3516 = sqrt(_3514);
        float _3518 = rsqrt(_3514);
        float _3520 = -_3516;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3524 = _3522 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3526 = precise::clamp(_3524, 0.0, 1.0);
        float _3528 = _3504 * _3518;
        float _3530 = _3500 * _3518;
        float _3532 = abs(_3526);
        float _3534 = log2(_3532);
        float _3536 = _3508 * _3518;
        float _3538 = _3528 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3540 = _2984 * _3530;
        float _3542 = -_3530;
        float _3544 = -_3538;
        float _3546 = fma(_3542, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3544);
        float _3548 = fma(_2898, _3528, _3540);
        float _3550 = -_3536;
        float _3552 = fma(_3550, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3546);
        float _3554 = fma(_2986, _3536, _3548);
        float _3556 = precise::clamp(_3554, 0.0, 1.0);
        float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3560 = _3552 + _3558;
        float _3562 = _3534 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3564 = _3560 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3566 = precise::clamp(_3564, 0.0, 1.0);
        float _3568 = exp2(_3562);
        float _3570 = _3568 * _3566;
        float _3572 = _3556 * _3570;
        float _3574 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3576 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3578 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3574;
        out.m_88.y = _3576;
        out.m_88.z = _3578;
    }
    out.m_90.x = _3490;
    out.m_90.y = _3492;
    out.m_90.z = _3494;
    if (!_3476)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3580 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3580;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3332 = false;
    bool _337 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_123);
        out.gl_Position.z = _3636;
    }
    if (!_113)
    {
        return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _147;
    float _159 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3709 = as_type<float>(_165);
        out.gl_Position.z = _3709;
    }
    if (_153)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_60.x;
    float _171 = in.m_60.y;
    float _173 = in.m_60.z;
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
    float _213 = _207;
    float _231;
    if (!_211)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _147;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = in.m_64.x;
    float _243 = in.m_64.y;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_255;
    float _275 = _273 + 1.0;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _271 * _275;
    float _287 = -_271;
    float _289 = _287 + 1.0;
    float _291 = _239 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = _309 * _241;
    float _315 = _311 * _243;
    bool _317 = !_283;
    float _335;
    if (!_317)
    {
        float _319 = in.m_62.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        _335 = _147;
    }
    _337 = false;
    float _339 = _335;
    bool _341 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _343 = isnan(_339);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_339);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _375 = _339 + _373;
    float _377 = -_351;
    float _379 = _377 + 1.0;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _383 = 1.0 / _355;
    float _385 = _367 * _379;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = _371 * _383;
    float _393 = fma(_391, _375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _395 = _393 * _385;
    float _397 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[116].x, _397);
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    bool _415 = !_381;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _157 = _431;
    }
    float _433 = _157;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_68.y;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _469 = _467 != 0;
    float _471 = 1.0 / _449;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _465;
    float _479 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _481 = _441 > 0.5;
    bool _483 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _485 = isnan(_433);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _503 = _501 != 0;
    float _505 = 1.0 / _457;
    float _507 = -_203;
    int _509 = _481 ? as_type<int>(_507) : as_type<int>(_203);
    bool _511 = _435 > 0.5;
    float _513 = -_193;
    int _515 = _511 ? as_type<int>(_513) : as_type<int>(_193);
    float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _521 = _519 != 0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = -_523;
    float _527 = fma(_479, 2.0, _525);
    float _529 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _541 = _439 * 2.0;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _545 = _537 * _471;
    float _547 = fma(_529, -2.0, _539);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _549;
    float _553 = _533 * _505;
    float _555 = _437 * 2.0;
    bool _557 = !_453;
    float _559 = _557 ? _193 : as_type<float>(_515);
    float _561 = _551 * _477;
    bool _563 = _437 > 0.5;
    float _565 = _437 + _439;
    float _567 = floor(_555);
    float _569 = -_203;
    int _571 = _563 ? as_type<int>(_569) : as_type<int>(_203);
    float _573 = _565 + (-1.0);
    float _575 = -_193;
    int _577 = _563 ? as_type<int>(_575) : as_type<int>(_193);
    float _579 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _547);
    bool _581 = !_461;
    float _583 = _581 ? _203 : as_type<float>(_571);
    float _585 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _587 = _439 > 0.5;
    float _589 = floor(_541);
    float _591 = _437 + _435;
    float _593 = _517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _595 = -_193;
    int _597 = _587 ? as_type<int>(_595) : as_type<int>(_193);
    float _599 = _591 + (-1.0);
    float _601 = _583 + (-0.5);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _605 = !_475;
    float _607 = _605 ? _193 : as_type<float>(_597);
    float _609 = _435 * 2.0;
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _613 = -_203;
    int _615 = _587 ? as_type<int>(_613) : as_type<int>(_203);
    float _617 = -_593;
    float _619 = -_579;
    float _621 = fma(_617, _601, _619);
    bool _623 = !_499;
    float _625 = _623 ? _193 : as_type<float>(_577);
    float _627 = floor(_609);
    bool _629 = _567 > 0.0;
    bool _631 = _567 >= 0.0;
    bool _633 = isnan(_567);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _643 = _433 + _641;
    bool _645 = _589 >= 0.0;
    bool _647 = isnan(_589);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = _625 + 0.5;
    int _657 = _639 ? 0 : 1;
    float _659 = fma(_553, _643, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _661 = !_503;
    float _663 = _661 ? _203 : as_type<float>(_615);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _433 + _665;
    float _669 = _553;
    float _671 = _621;
    float _673 = _445;
    if (!_521)
    {
        _669 = _439;
    }
    float _675 = _669;
    float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _679 = _589 > 0.0;
    float _681 = fma(_545, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _683 = _675;
    if (_521)
    {
        _683 = _437;
    }
    float _685 = _683;
    float _687 = -_663;
    float _689 = _687 + 0.5;
    int _691 = _653 ? 0 : 1;
    bool _693 = _627 > 0.0;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].w, _495);
    float _697 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _699 = -_135;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[76].x, _527);
    float _703 = _559 + 0.5;
    bool _705 = _627 >= 0.0;
    bool _707 = isnan(_627);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _717 = _433 + _715;
    int _719 = ~_691;
    int _721 = _719 + 1;
    int _723 = _721 + 1;
    float _725 = fma(_697, _703, _701);
    int _727 = _723;
    float _729 = _717;
    float _731 = _685;
    if (!_679)
    {
        int _733 = ~_691;
        int _735 = _733 + 1;
        _727 = _735;
    }
    int _737 = _727;
    float _739 = fma(_561, _717, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _741 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _743 = isnan(_433);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _689 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _757 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _759 = isnan(_433);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -_751;
    float _771 = _769 + 1.0;
    if (!_521)
    {
        _729 = _437;
    }
    float _773 = _729;
    float _775 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _695);
    float _777 = _773;
    if (!_521)
    {
        _731 = _439;
    }
    float _779 = _731;
    float _781 = _767 * _771;
    float _783 = _779;
    if (_521)
    {
        _777 = _435;
    }
    float _785 = _777;
    float _787 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _789 = log2(_787);
    if (_521)
    {
        _783 = _437;
    }
    float _791 = _783;
    float _793 = -_775;
    float _795 = _793 + 1.0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _803 = _801 != 0;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _807 = _805 != 0;
    float _809 = -_767;
    float _811 = _809 + 1.0;
    bool _813 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _815 = isnan(_433);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _827 = _823 * _811;
    float _829 = -_823;
    float _831 = _829 + 1.0;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _835 = _755 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _839 = _493 * _831;
    float _841 = -_493;
    float _843 = _841 + 1.0;
    float _845 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[83].z, _603);
    float _847 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _849 = _659 * _839;
    float _851 = _655 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _853 = _785 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _855 = fma(_847, -2.0, _833);
    float _857 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[131].x, _849);
    float _859 = _753 * _543;
    float _861 = _851 * _677;
    float _863 = in.m_48.x;
    float _865 = in.m_48.y;
    float _867 = in.m_48.z;
    float _869 = -_837;
    float _871 = fma(_853, 2.0, _869);
    int _873 = _713 ? 0 : 1;
    float _875 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _855);
    out.m_70.x = _861;
    out.m_70.y = _859;
    float _877 = _607 + 0.5;
    float _879 = -_135;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[81].x, _871);
    int _883 = ~_873;
    int _885 = _883 + 1;
    int _887 = _885 + 1;
    float _889 = _789 * _135;
    int _891 = _887;
    float _893 = _877;
    if (!_693)
    {
        int _895 = ~_873;
        int _897 = _895 + 1;
        _891 = _897;
    }
    int _899 = _891;
    float _901 = fma(_681, _827, _857);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _905 = fma(_835, _877, _881);
    float _907 = exp2(_889);
    float _909 = _825 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _911 = ~_657;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _919 = 1.0 + _917;
    int _921 = _915;
    int _923 = _899;
    if (!_629)
    {
        int _925 = ~_657;
        int _927 = _925 + 1;
        _921 = _927;
    }
    int _929 = _921;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _933 = !_469;
    float _935 = _933 ? _203 : as_type<float>(_509);
    float _937 = 1.0 / _919;
    float _939 = _865 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _941 = _865 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _943 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _945 = isnan(1.0);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _951 = _947 || _949;
    float _953 = _865 + _445;
    float _955 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[6].x, _939);
    float _957 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[4].x, _941);
    float _959 = _935 + (-0.5);
    float _961 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _931);
    float _963 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[6].z, _955);
    float _965 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _903);
    float _967 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _953 + _969;
    float _973 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _845);
    float _975 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _965);
    float _977 = _967 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _979 = -_909;
    float _981 = -_875;
    float _983 = fma(_979, _959, _981);
    float _985 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _961);
    float _987 = -_975;
    float _989 = _987 + 1.0;
    float _991 = _971 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _993 = _963 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _997 = _977 + _995;
    float _999 = -_989;
    float _1001 = fma(_559, _999, _725);
    bool _1003 = !_799;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = -_973;
    float _1009 = _1007 + 1.0;
    float _1011 = -_985;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _993 + _1015;
    int _1019 = abs(_1005);
    float _1021 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[28].x, _991);
    float _1023 = -_1009;
    float _1025 = fma(_607, _1023, _905);
    float _1027 = -_907;
    float _1029 = _1027 + 1.0;
    float _1031 = fma(_583, _1013, _621);
    float _1033 = fma(_935, _795, _983);
    float _1035 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1021);
    bool _1037 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(0.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = in.m_72.x;
    float _1049 = in.m_72.y;
    float _1051 = in.m_72.z;
    float _1053 = float(_737);
    float _1055 = fma(_739, _781, _901);
    bool _1057 = !_803;
    int _1059 = _1057 ? 0 : 1;
    out.m_74.x = _1001;
    out.m_74.y = _1031;
    out.m_74.z = _1025;
    out.m_74.w = _1033;
    float _1061 = float(_1019);
    float _1063 = _971 * _971;
    float _1065 = _1045 ? _1029 : 0.0;
    bool _1067 = _1035 >= 0.0;
    float _1069 = _1061 * _1053;
    int _1071 = abs(_1059);
    float _1073 = fma(_997, _997, _1063);
    if (_951)
    {
        float _1075 = _1065 * _937;
        _159 = _1075;
    }
    float _1077 = _159;
    float _1079 = fma(_1017, _1017, _1073);
    float _1081 = float(_899);
    float _1083 = _1069 * (-2.0);
    float _1085 = float(_1071);
    float _1087 = rsqrt(_1079);
    if (_1067)
    {
        _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1089 = _671;
    float _1091 = _1085 * _1081;
    float _1093 = fma(_611, _1083, _611);
    float _1095 = fma(_1083, _1047, _1047);
    float _1097 = _435 + (-0.5);
    float _1099 = _1051;
    if (_1067)
    {
        float _1101 = _1089 * 5.0;
        _923 = as_type<int>(_1101);
    }
    int _1103 = _923;
    float _1105 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1107 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1095);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1111 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1055);
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1067)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5245 = as_type<float>(_1103);
        out.gl_Position.z = _5245;
    }
    float _1119 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1067)
    {
        out.m_51.x = 0.0;
    }
    bool _1127 = !_807;
    int _1129 = _1127 ? 0 : 1;
    out.m_76.x = _1119;
    out.m_76.y = _1121;
    out.m_76.z = _1123;
    out.m_76.w = _1125;
    float _1131 = _1113 * _1087;
    float _1133 = _997 * _1131;
    float _1135 = _971 * _1131;
    float _1137 = -_1133;
    float _1139 = _997 + _1137;
    float _1141 = -_1135;
    float _1143 = _971 + _1141;
    if (_1067)
    {
        return out;
    }
    float _1145 = -_1135;
    float _1147 = _953 + _1145;
    float _1149 = _1143 * _1143;
    float _1151 = _1017 * _1131;
    float _1153 = -_1133;
    float _1155 = _977 + _1153;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1159 = _1147 + _1157;
    float _1161 = fma(_1139, _1139, _1149);
    float _1163 = -_1151;
    float _1165 = _1017 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = _1155 + _1167;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1173 = fma(_1093, _1077, _1107);
    int _1175 = abs(_1129);
    float _1177 = fma(_1165, _1165, _1161);
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1171);
    float _1181 = _1091 * (-2.0);
    float _1183 = -_1151;
    float _1185 = _993 + _1183;
    float _1187 = _437 + (-0.5);
    float _1189 = float(_929);
    float _1191 = fma(_1181, _1049, _1049);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1195 = _1185 + _1193;
    float _1197 = float(_1175);
    float _1199 = fma(_585, _1181, _585);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1191);
    float _1203 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1179);
    float _1205 = _439 + _435;
    float _1207 = _1197 * _1189;
    float _1209 = fma(_1199, _1077, _1201);
    float _1211 = _439 + (-0.5);
    bool _1213 = _1203 >= 0.0;
    float _1215 = _1205 + (-1.0);
    float _1217 = _1207 * (-2.0);
    float _1219 = _1209 * 0.15915493667125701904296875;
    float _1221 = _1173 * 0.15915493667125701904296875;
    float _1223 = sqrt(_1177);
    float _1225 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = fma(_1217, _1051, _1051);
    float _1229 = fma(_1225, _1217, _1225);
    float _1231 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    if (_1213)
    {
        _1099 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1233 = _1099;
    float _1235 = _1221 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    int _1239 = as_type<int>(_1233);
    if (_1213)
    {
        out.m_51.x = 0.0;
    }
    float _1241 = fma(_1229, _1077, _1231);
    if (_1213)
    {
        float _1243 = _1233 * 5.0;
        _1239 = as_type<int>(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1241 * 0.15915493667125701904296875;
    float _1249 = _1221 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    if (_1213)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5479 = as_type<float>(_1245);
        out.gl_Position.z = _5479;
    }
    float _1253 = _1219 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1219 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _1247 * 6.283185482025146484375;
    float _1263 = sin(_1261);
    if (_1213)
    {
        return out;
    }
    bool _1265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1267 = _1237 * _1255;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1271 = _1251 * _1259;
    float _1273 = _1247 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    float _1277 = -_953;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = fma(_1263, _1271, _1267);
    float _1283 = fma(_1263, _1267, _1271);
    float _1285 = _1251 * _1255;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1291 = _1087 * _1223;
    float _1293 = _1237 * _1259;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    if (_1265)
    {
        float _1297 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _893 = _1297;
    }
    float _1299 = _893;
    float _1301 = _1105 * _1291;
    float _1303 = -_1285;
    float _1305 = fma(_1263, _1293, _1303);
    float _1307 = _1299;
    if (_1269)
    {
        float _1309 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _673 = _1309;
    }
    float _1311 = _673;
    float _1313 = _1143;
    if (_1265)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1313 = _1315;
    }
    float _1317 = _1313;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1323 = -_1293;
    float _1325 = fma(_1263, _1285, _1323);
    float _1327 = _1295 * _1301;
    float _1329 = _315 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1331 = -_977;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1335 = as_type<float>(_1245);
    if (_1269)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = _1279 * _1279;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1351 = _1251 * _1275;
    float _1353 = _1259 * _1275;
    float _1355 = _1237 * _1275;
    float _1357 = 1.0 / _1321;
    float _1359 = _1255 * _1275;
    float _1361 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1363 = -_993;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1367 = fma(_1333, _1333, _1341);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1373 = 1.0 / _1289;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1379 = _1291 * _1329;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1385 = _1361 * _1379;
    float _1387 = fma(_1365, _1365, _1367);
    float _1389 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1391 = _1367;
    float _1393 = _1357;
    if (_1265)
    {
        float _1395 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1307 = _1395;
    }
    float _1397 = _1307;
    float _1399 = 1.0 / _1345;
    float _1401 = _1397;
    if (_1269)
    {
        float _1403 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1389 = _1403;
    }
    float _1405 = _1389;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1407;
    if (_1265)
    {
        float _1411 = _1397 * _1317;
        _1391 = _1411;
    }
    float _1413 = _1391;
    if (_1269)
    {
        float _1415 = _1405 * _1339;
        _1401 = _1415;
    }
    float _1417 = _1401;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1419;
    float _1423 = 1.0 / _1349;
    float _1425 = _1409 * _1373;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1443 = 1.0 / _1377;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1453;
    float _1457 = _1437 * _1399;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1463;
    float _1467 = 1.0 / _1371;
    float _1469 = _1441 * _1423;
    float _1471 = _1451 * _1357;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1473;
    float _1477 = _1475;
    if (!_1265)
    {
        _1393 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1479 = _1393;
    float _1481 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1483 = _1481 * 0.5;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1489 = 0.0;
    float _1491 = _1479;
    if (_1265)
    {
        float _1493 = floor(_1413);
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = _1455 * _1443;
    float _1499 = -_1385;
    float _1501 = _1263 * _1499;
    float _1503 = _1355 * _1385;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1505;
    float _1509 = _865 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1511 = fma(_1353, _1327, _1501);
    float _1513 = fma(_1305, _1327, _1503);
    float _1515 = 1.0 / _1383;
    float _1517 = _1461 * _1467;
    float _1519 = _1351 * _1385;
    float _1521 = fma(_1281, _1327, _1519);
    float _1523 = fma(_1359, _1483, _1511);
    float _1525 = 0.0;
    float _1527 = _1523;
    if (_1269)
    {
        float _1529 = floor(_1417);
        _1525 = _1529;
    }
    float _1531 = _1525;
    if (_1265)
    {
        float _1533 = -_1495;
        float _1535 = _1413 + _1533;
        _1491 = _1535;
    }
    float _1537 = _1491;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1541 = _1537 + _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1545 = _1537 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1549 = _1537 + _1547;
    float _1551 = 1.0 / _1429;
    float _1553 = _1475 * _1515;
    if (!_1269)
    {
        _1477 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1555 = _1477;
    float _1557 = 1.0 / _1421;
    float _1559 = _1555;
    if (_1269)
    {
        float _1561 = -_1531;
        float _1563 = _1417 + _1561;
        _1559 = _1563;
    }
    float _1565 = _1559;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1569 = _1537 + _1567;
    bool _1571 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1573 = isnan(_1565);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = 1.0 / _1433;
    float _1585 = _1569 * _1551;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1589 = _1537 + _1587;
    float _1591 = -_1581;
    float _1593 = _1591 + 1.0;
    float _1595 = 1.0 / _1447;
    float _1597 = _1541 * _1557;
    float _1599 = rsqrt(_1387);
    float _1601 = _1545 * _1583;
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1605 = _1565 + _1603;
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1609 = _1537 + _1607;
    float _1611 = fma(_1457, _1605, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1615 = _1565 + _1613;
    float _1617 = 1.0 / _1465;
    float _1619 = _1589 * _1595;
    float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1623 = _1565 + _1621;
    float _1625 = fma(_1471, _1615, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1627 = fma(_1425, _1623, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1631 = _1565 + _1629;
    float _1633 = 1.0 / _1507;
    float _1635 = _1333 * _1599;
    float _1637 = _1279 * _1599;
    float _1639 = _1365 * _1599;
    float _1641 = fma(_1325, _1483, _1521);
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1645 = _1565 + _1643;
    float _1647 = fma(_1469, _1631, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1651 = _1565 + _1649;
    float _1653 = 1.0 / _1487;
    float _1655 = _1609 * _1617;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1659 = _1565 + _1657;
    float _1661 = fma(_1517, _1645, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _1663 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1665 = isnan(_1565);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1671 = _1667 || _1669;
    float _1673 = float(_1671);
    float _1675 = fma(_1283, _1483, _1513);
    float _1677 = fma(_1553, _1659, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1679 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1681 = isnan(_1565);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1549 * _1633;
    bool _1693 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1695 = isnan(_1565);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1701 = _1697 || _1699;
    float _1703 = float(_1701);
    float _1705 = _1673 * _1593;
    float _1707 = -_1673;
    float _1709 = _1707 + 1.0;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1713 = _1537 + _1711;
    float _1715 = fma(_1497, _1651, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1717 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1719 = isnan(_1565);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = -_1689;
    float _1731 = _1729 + 1.0;
    bool _1733 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1735 = isnan(_1565);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = -_1703;
    float _1747 = _1745 + 1.0;
    bool _1749 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1751 = isnan(_1537);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1713 * _1653;
    float _1763 = _1581 * _1731;
    float _1765 = -_1743;
    float _1767 = _1765 + 1.0;
    float _1769 = _1727 * _1747;
    bool _1771 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1773 = isnan(_1537);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1779 = _1775 || _1777;
    float _1781 = float(_1779);
    float _1783 = -_1759;
    float _1785 = _1783 + 1.0;
    float _1787 = _1703 * _1709;
    float _1789 = _1689 * _1767;
    float _1791 = _1627 * _1769;
    float _1793 = _1781 * _1785;
    float _1795 = -_1781;
    float _1797 = _1795 + 1.0;
    bool _1799 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1801 = isnan(_1565);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = -_1727;
    float _1813 = _1811 + 1.0;
    bool _1815 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1817 = isnan(_1537);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    bool _1827 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1829 = isnan(_1537);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1791);
    float _1841 = -_1809;
    float _1843 = _1841 + 1.0;
    float _1845 = _1825 * _1797;
    float _1847 = -_1825;
    float _1849 = _1847 + 1.0;
    bool _1851 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1853 = isnan(_1537);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = _1743 * _1843;
    float _1865 = fma(_1611, _1787, _1839);
    float _1867 = -_1837;
    float _1869 = _1867 + 1.0;
    float _1871 = _1837 * _1849;
    bool _1873 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1875 = isnan(_1537);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = _1861 * _1869;
    bool _1887 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1889 = isnan(_1537);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1899;
    bool _1903 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1905 = isnan(_1537);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = -_1883;
    float _1917 = _1915 + 1.0;
    float _1919 = -_1861;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1901, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1925 = _1913 * _1917;
    float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1929 = _1927 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1931;
    float _1935 = _1897 * _1921;
    float _1937 = -_1897;
    float _1939 = _1937 + 1.0;
    float _1941 = -_1913;
    float _1943 = _1941 + 1.0;
    float _1945 = _1923 * _1925;
    bool _1947 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1949 = isnan(_1565);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1955 = _1951 || _1953;
    float _1957 = float(_1955);
    float _1959 = fma(_1933, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1961 = fma(_1677, _1705, _1865);
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1967 = _1883 * _1939;
    float _1969 = fma(_1929, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1971 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1945);
    float _1973 = _1959 * _1925;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1975;
    float _1979 = -_1957;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1647, _1763, _1961);
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1987 = _1635 * _1985;
    float _1989 = fma(_1969, _1967, _1971);
    float _1991 = fma(_1965, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1993 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1973);
    float _1995 = fma(_1977, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1997 = _1809 * _1981;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1999;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2005 = _1639 * _2003;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2009 = -_1987;
    float _2011 = fma(_1639, _2007, _2009);
    float _2013 = fma(_1991, _1967, _1993);
    float _2015 = fma(_1995, _1935, _1989);
    float _2017 = fma(_2001, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2021 = _2019 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2025 = -_2005;
    float _2027 = fma(_1637, _2023, _2025);
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2031 = _1637 * _2029;
    float _2033 = _2011 * _2011;
    float _2035 = fma(_2017, _1935, _2013);
    float _2037 = fma(_2021, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2041 = -_2031;
    float _2043 = fma(_1635, _2039, _2041);
    float _2045 = fma(_2027, _2027, _2033);
    float _2047 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _2049 = _2047 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2051 = fma(_2037, _1885, _2015);
    float _2053 = fma(_2043, _2043, _2045);
    float _2055 = fma(_2049, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2057 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2065 = rsqrt(_2053);
    float _2067 = fma(_2059, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2069 = fma(_2055, _1885, _2035);
    float _2071 = fma(_1625, _1789, _1983);
    float _2073 = fma(_2063, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2075 = fma(_2067, _1871, _2051);
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2077;
    float _2081 = fma(_1661, _1863, _2071);
    float _2083 = fma(_2073, _1845, _2075);
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2089;
    float _2093 = fma(_2079, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2095 = fma(_1715, _1997, _2081);
    float _2097 = fma(_2091, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2099 = _2027 * _2065;
    float _2101 = fma(_2093, _1871, _2069);
    float _2103 = fma(_2087, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2105 = fma(_2097, _1793, _2083);
    float _2107 = _2011 * _2065;
    float _2109 = _1637 * _2099;
    float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2111;
    float _2115 = fma(_2103, _1845, _2101);
    float _2117 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2095);
    float _2119 = _2043 * _2065;
    float _2121 = _1639 * _2107;
    float _2123 = -_2109;
    float _2125 = fma(_1635, _2107, _2123);
    float _2127 = fma(_2113, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2129 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2105);
    float _2131 = -_2121;
    float _2133 = fma(_1637, _2119, _2131);
    float _2135 = _2125 * _1641;
    float _2137 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2139 = _993 + _2137;
    float _2141 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2143 = fma(_2127, _1793, _2115);
    float _2145 = _2133 * _1641;
    float _2147 = fma(_2119, _1523, _2135);
    float _2149 = -_2141;
    float _2151 = fma(_2129, _2139, _2149);
    float _2153 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2155 = _977 + _2153;
    float _2157 = fma(_2099, _1523, _2145);
    float _2159 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2161 = fma(_1639, _1675, _2147);
    float _2163 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2143);
    float _2165 = fma(_1635, _1675, _2157);
    float _2167 = -_2159;
    float _2169 = fma(_2129, _2155, _2167);
    float _2171 = _1635 * _2119;
    float _2173 = fma(_2161, _2163, _2151);
    float _2175 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1509);
    float _2177 = fma(_2165, _2163, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_1639, _2099, _2179);
    float _2183 = _2173 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2185 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2175);
    float _2187 = _2177 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2189 = _2181 * _1641;
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2193 = _2183 + _2191;
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2199 = _2187 + _2197;
    float _2201 = fma(_2107, _1523, _2189);
    float _2203 = _2193 * _2193;
    float _2205 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2207 = _2195 + _2205;
    float _2209 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2211 = fma(_1637, _1675, _2201);
    float _2213 = fma(_2199, _2199, _2203);
    float _2215 = -_2209;
    float _2217 = fma(_2129, _2207, _2215);
    float _2219 = _953 + _2211;
    float _2221 = sqrt(_2213);
    float _2223 = -_2195;
    float _2225 = _2219 + _2223;
    float _2227 = fma(_2163, _2225, _2217);
    float _2229 = _2227 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2231 = _2221 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = _2221 + _2233;
    float _2237 = _2203;
    float _2239 = _2207;
    float _2241 = _2213;
    float _2243 = _2201;
    float _2245 = _2187;
    float _2247 = _2183;
    float _2249 = _1641;
    float _2251 = _2199;
    if (_2231)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2253;
    }
    float _2255 = _2237;
    if (_2231)
    {
        float _2257 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2257;
    }
    float _2259 = _2239;
    if (_2231)
    {
        float _2261 = rsqrt(_2213);
        _2241 = _2261;
    }
    float _2263 = _2241;
    float _2265 = _2255;
    if (_2231)
    {
        float _2267 = _2235 * _2255;
        _2265 = _2267;
    }
    float _2269 = _2265;
    if (_2231)
    {
        float _2271 = _2269 * 0.15915493667125701904296875;
        _2243 = _2271;
    }
    float _2273 = _2243;
    float _2275 = _867;
    if (_2231)
    {
        float _2277 = _2273 * 6.283185482025146484375;
        float _2279 = sin(_2277);
        _2275 = _2279;
    }
    float _2281 = _2275;
    float _2283 = _2281;
    if (_2231)
    {
        float _2285 = fma(_2281, _2259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2285;
    }
    float _2287 = _2283;
    float _2289 = _2287;
    if (_2231)
    {
        float _2291 = _2263 * _2287;
        _2289 = _2291;
    }
    float _2293 = _2289;
    if (_2231)
    {
        float _2295 = fma(_2199, _2293, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2245 = _2295;
    }
    float _2297 = _2245;
    float _2299 = _2297;
    if (_2231)
    {
        float _2301 = fma(_2193, _2293, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2247 = _2301;
    }
    float _2303 = _2247;
    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2307 = _2297 + _2305;
    float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2311 = _2303 + _2309;
    float _2313 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2315 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7184 = float2(_2313, _2315);
    float _2317 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7184, float2(0.0), isnan(_7184)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7184, float2(0.0), isnan(_7184)), level(0.0)).x;
    float _2319 = _2273;
    float _2321 = _2307;
    float _2323 = _2303;
    float _2325 = _2315;
    if (_2231)
    {
        float _2327 = _2273 * 6.283185482025146484375;
        float _2329 = cos(_2327);
        _2319 = _2329;
    }
    float _2331 = _2319;
    if (!_2231)
    {
        _2321 = _2229;
    }
    float _2333 = _2321;
    float _2335 = -_977;
    float _2337 = _2335 + _2297;
    float _2339 = _2333;
    if (_2231)
    {
        float _2341 = _2331 + (-1.0);
        _2249 = _2341;
    }
    float _2343 = _2249;
    if (_2231)
    {
        float _2345 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _2345;
    }
    float _2347 = _1527;
    if (_2231)
    {
        float _2349 = fma(_2229, _2331, _2347);
        _2339 = _2349;
    }
    float _2351 = _2339;
    float _2353 = -_993;
    float _2355 = _2353 + _2303;
    float _2357 = -_953;
    float _2359 = _2357 + _2351;
    float _2361 = _2359 * _2359;
    float _2363 = fma(_2337, _2337, _2361);
    float _2365 = fma(_2355, _2355, _2363);
    float _2367 = sqrt(_2365);
    bool _2369 = _2367 > 0.0;
    float _2371 = fma(_2317, 100.0, _2351);
    bool _2373 = !_2369;
    float _2375 = _2371;
    float _2377 = _2365;
    float _2379 = _2359;
    if (!_2373)
    {
        float _2381 = _207 * _207;
        float _2383 = fma(_205, _205, _2381);
        float _2385 = fma(_209, _209, _2383);
        float _2387 = rsqrt(_2365);
        float _2389 = sqrt(_2385);
        float _2391 = _2359 * _2387;
        float _2393 = _2355 * _2387;
        bool _2395 = _2389 > 0.0;
        float _2397 = _2337 * _2387;
        bool _2399 = !_2395;
        _2251 = _2393;
        _2379 = _2391;
        _2325 = _2397;
        if (!_2399)
        {
            float _2401 = rsqrt(_2385);
            float _2403 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2405 = _207 * _2401;
            float _2407 = _205 * _2401;
            float _2409 = _2391 * _2405;
            float _2411 = _209 * _2401;
            float _2413 = fma(_2397, _2407, _2409);
            float _2415 = _2403 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2417 = fma(_2393, _2411, _2413);
            float _2419 = _2417 * _2415;
            float _2421 = fma(_205, _2419, _2297);
            float _2423 = fma(_207, _2419, _2371);
            float _2425 = fma(_209, _2419, _2303);
            _2375 = _2423;
            _2299 = _2421;
            _2323 = _2425;
            _2377 = _2413;
            _2379 = _2415;
        }
    }
    float _2427 = _2375;
    float _2429 = _2299;
    float _2431 = _2323;
    float _2433 = _2377;
    float _2435 = _2251;
    float _2437 = _2379;
    float _2439 = _2325;
    float _2441 = -_1135;
    float _2443 = _2441 + _2427;
    float _2445 = -_1133;
    float _2447 = _2445 + _2429;
    float _2449 = -_1151;
    float _2451 = _2449 + _2431;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2455 = _2443 + _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2459 = _2447 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2463 = _2451 + _2461;
    float _2465 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2467 = _2455 * _2455;
    float _2469 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2465);
    float _2471 = fma(_2459, _2459, _2467);
    float _2473 = fma(_2463, _2463, _2471);
    float _2475 = rsqrt(_2473);
    float _2477 = sqrt(_2473);
    float _2479 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2481 = _2459 * _2479;
    float _2483 = _2463 * _2479;
    float _2485 = _2481 * _2481;
    float _2487 = _2483 * _2483;
    float _2489 = _2485 + _2487;
    float _2491 = sqrt(_2489);
    bool _2493 = _2491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2497 = _2491 + _2495;
    float _2499 = _2433;
    float _2501 = _2489;
    float _2503 = _2497;
    float _2505 = _2435;
    float _2507 = _2439;
    float _2509 = _2429;
    float _2511 = _2481;
    float _2513 = _2483;
    float _2515 = _2485;
    float _2517 = _2487;
    if (_2493)
    {
        float _2519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2499 = _2519;
    }
    float _2521 = _2499;
    if (_2493)
    {
        float _2523 = rsqrt(_2489);
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (_2493)
    {
        float _2527 = _2497 * _2521;
        _2503 = _2527;
    }
    float _2529 = _2503;
    if (_2493)
    {
        float _2531 = _2529 * 0.15915493667125701904296875;
        _2505 = _2531;
    }
    float _2533 = _2505;
    float _2535 = _2521;
    if (_2493)
    {
        float _2537 = _2533 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        _2535 = _2539;
    }
    float _2541 = _2535;
    float _2543 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2545 = precise::max(0.0, _2543);
    float _2547 = _2437;
    float _2549 = _2545;
    if (_2493)
    {
        float _2551 = _2533 * 6.283185482025146484375;
        float _2553 = cos(_2551);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = -_2479;
    float _2559 = -_2545;
    float _2561 = fma(_2455, _2557, _2559);
    if (_2493)
    {
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2549 = _2563;
    }
    float _2565 = _2549;
    float _2567 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2569 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2571 = _2541;
    if (_2493)
    {
        float _2573 = fma(_2541, _2565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _213 = _2573;
    }
    float _2575 = _213;
    if (!_2493)
    {
        _2571 = _2561;
    }
    float _2577 = _2571;
    float _2579 = floor(_2569);
    float _2581 = _2577;
    if (_2493)
    {
        float _2583 = _2555 + (-1.0);
        _2507 = _2583;
    }
    float _2585 = _2507;
    float _2587 = _2585;
    if (_2493)
    {
        float _2589 = _2525 * _2575;
        _2509 = _2589;
    }
    float _2591 = _2509;
    if (_2493)
    {
        float _2593 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2587 = _2593;
    }
    float _2595 = _2587;
    if (_2493)
    {
        float _2597 = _2481 * _2591;
        _2511 = _2597;
    }
    float _2599 = _2511;
    if (_2493)
    {
        float _2601 = _2483 * _2591;
        _2513 = _2601;
    }
    float _2603 = _2513;
    float _2605 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2567);
    if (_2493)
    {
        float _2607 = fma(_2561, _2555, _2595);
        _2581 = _2607;
    }
    float _2609 = _2581;
    if (_2493)
    {
        float _2611 = _2599 * _2599;
        _2515 = _2611;
    }
    float _2613 = _2515;
    if (_2493)
    {
        float _2615 = _2603 * _2603;
        _2517 = _2615;
    }
    float _2617 = _2517;
    float _2619 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2605);
    float _2621 = fma(_2609, _2609, _2613);
    float _2623 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2625 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2627 = _2621 + _2617;
    float _2629 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2631 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2625);
    float _2633 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2635 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2629);
    float _2637 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2631);
    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2641 = fma(_2477, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2639);
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    float _2645 = rsqrt(_2627);
    float _2647 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2635);
    float _2649 = _2637 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2651 = _2619 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2653 = -_2643;
    float _2655 = _2653 + 1.0;
    float _2657 = _2647 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2659 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2661 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2663 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2469);
    float _2665 = floor(_2623);
    float _2667 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2659);
    float _2669 = -_2661;
    float _2671 = fma(_2669, _2633, 1.0);
    float _2673 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2675 = -_2579;
    float _2677 = _2569 + _2675;
    float _2679 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2667);
    float _2681 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2683 = _2645 * _2599;
    float _2685 = abs(_2655);
    float _2687 = log2(_2685);
    float _2689 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2679);
    float _2691 = _2645 * _2609;
    float _2693 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2695 = _2645 * _2603;
    float _2697 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2699 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2681);
    float _2701 = -_2693;
    float _2703 = fma(_2691, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2701);
    float _2705 = log2(_2671);
    float _2707 = -_2665;
    float _2709 = _2623 + _2707;
    float _2711 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2697);
    float _2713 = -_2695;
    float _2715 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2703);
    float _2717 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2699);
    float _2719 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2711);
    float _2721 = fma(_2715, -0.5, 0.5);
    float _2723 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2725 = fma(_2715, 0.5, 0.5);
    float _2727 = 1.0 / _2689;
    float _2729 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2717);
    float _2731 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2719);
    float _2733 = fma(_2725, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2735 = _2705 * 0.693147182464599609375;
    float _2737 = fma(_2725, _2733, -0.212114393711090087890625);
    float _2739 = exp2(_2723);
    float _2741 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2743 = fma(_2725, _2737, 1.570728778839111328125);
    float _2745 = sqrt(_2721);
    float _2747 = _2691 + 1.0;
    float _2749 = _2729 * _2727;
    float2 _7888 = float2(_2677, _2709);
    float _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7888, float2(0.0), isnan(_7888)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7888, float2(0.0), isnan(_7888)), level(0.0)).x;
    float _2753 = fma(_2749, 0.5, 0.5);
    float _2755 = -_2691;
    float _2757 = fma(_2739, _2747, _2755);
    float _2759 = _2731 * _2727;
    float _2761 = fma(_2757, 0.5, 0.5);
    float _2763 = fma(_2759, -0.5, 0.5);
    float _2765 = _2745 * 0.636619746685028076171875;
    float _2767 = -_2743;
    float _2769 = fma(_2765, _2767, 1.0);
    float3 _7920 = float3(_2753, _2763, _2741);
    float _2771 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7920, float3(0.0), isnan(_7920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7920, float3(0.0), isnan(_7920)), level(0.0)).x;
    float3 _7931 = float3(_2753, _2763, _2741);
    float4 _2774 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7931, float3(0.0), isnan(_7931)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7931, float3(0.0), isnan(_7931)), level(0.0)).xyzw;
    float _2776 = _2774.x;
    float _2778 = _2774.y;
    float _2780 = _2774.z;
    float _2782 = _2774.w;
    float2 _7947 = float2(_2769, _2761);
    float3 _2786 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7947, float2(0.0), isnan(_7947)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7947, float2(0.0), isnan(_7947)), level(0.0)).xyz;
    float _2788 = _2786.x;
    float _2790 = _2786.y;
    float _2792 = _2786.z;
    out.m_76.x = _1119;
    out.m_76.y = _1121;
    out.m_76.z = _1123;
    out.m_76.w = _1125;
    float _2794 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2796 = fma(_2317, 100.0, _953);
    float _2798 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _2800;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    float _2804 = -_1135;
    float _2806 = _2804 + _2796;
    float _2808 = fma(_2802, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _2810 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2814 = _2808 * _1925;
    float _2816 = fma(_2812, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _2818;
    float _2822 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2814);
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2828 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2828;
    float _2832 = fma(_2820, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _2834 = fma(_2816, _1967, _2822);
    float _2836 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2836;
    float _2840 = fma(_2826, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2846 = fma(_2832, _1935, _2834);
    float _2848 = fma(_2838, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2850 = _1351 * _2133;
    float _2852 = fma(_2844, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2854 = fma(_2840, _1885, _2846);
    float _2856 = _1351 * _2181;
    float _2858 = _1281 * _2133;
    float _2860 = -_1263;
    float _2862 = fma(_2860, _2099, _2850);
    float _2864 = _1351 * _2125;
    float _2866 = -_1263;
    float _2868 = fma(_2866, _2107, _2856);
    float _2870 = _1325 * _2133;
    float _2872 = fma(_1353, _2099, _2858);
    float _2874 = fma(_1355, _1635, _2862);
    float _2876 = fma(_1355, _1637, _2868);
    float _2878 = fma(_1359, _2099, _2870);
    float _2880 = fma(_1305, _1635, _2872);
    float _2882 = _2794 * _2874;
    float _2884 = _2794 * _2876;
    float _2886 = fma(_1283, _1635, _2878);
    float _2888 = fma(_2830, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2890 = fma(_2798, _2880, _2882);
    float _2892 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2894 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2896 = _1281 * _2181;
    float _2898 = _2886 + _2890;
    float _2900 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2892);
    float _2902 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2894);
    float _2904 = fma(_2848, _1871, _2854);
    float _2906 = -_1263;
    float _2908 = fma(_2906, _2119, _2864);
    float _2910 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2900);
    float _2912 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2902);
    float _2914 = fma(_1353, _2107, _2896);
    float _2916 = fma(_2852, _1845, _2904);
    float _2918 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2920 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2922 = fma(_1355, _1639, _2908);
    float _2924 = fma(_1305, _1637, _2914);
    float _2926 = 1.0 / _2918;
    float _2928 = _2920 + _2918;
    float _2930 = fma(_2888, _1793, _2916);
    float _2932 = fma(_2798, _2924, _2884);
    float _2934 = _1281 * _2125;
    float _2936 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2930);
    float _2938 = in.m_68.x;
    float _2940 = _1325 * _2181;
    float _2942 = _1325 * _2125;
    out.m_78.x = _2936;
    float _2944 = fma(_1353, _2119, _2934);
    float _2946 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2948 = fma(_1359, _2107, _2940);
    float _2950 = _2928 * _2926;
    float _2952 = _2950 * 0.5;
    bool _2954 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2958 = _2954 || _2956;
    bool _2960 = isnan(0.5);
    bool _2962 = _2958 || _2960;
    float _2964 = fma(_1359, _2119, _2942);
    float _2966 = fma(_1305, _1639, _2944);
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2970 = fma(_2952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2968);
    float _2972 = _2794 * _2922;
    float _2974 = exp2(_2946);
    float _2976 = fma(_1283, _1637, _2948);
    float _2978 = fma(_1283, _1639, _2964);
    float _2980 = fma(_2798, _2966, _2972);
    float _2982 = _2689 * 0.5;
    float _2984 = _2976 + _2932;
    float _2986 = _2978 + _2980;
    float _2988 = 1.0 / _2970;
    float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2992 = _2988 * _2990;
    float _2994 = abs(_2992);
    float _2996 = log2(_2994);
    bool _2998 = _2992 <= 8000.0;
    bool _3000 = isnan(_2992);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(8000.0);
    bool _3006 = _3002 || _3004;
    float _3008 = float(_3006);
    float _3010 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3012 = exp2(_3010);
    float _3014 = fma(_3012, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3016 = precise::clamp(_3014, 0.0, 1.0);
    float _3018 = _3012;
    float _3020 = _2982;
    float _3022 = _2689;
    float _3024 = _2731;
    float _3026 = _2729;
    if (_2962)
    {
        _3018 = 1.0;
    }
    float _3028 = _3018;
    float _3030 = fma(_3016, -2.0, 3.0);
    float _3032 = _3016 * _3016;
    float _3034 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3036 = _3032 * _3030;
    float _3038 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3034);
    float _3040 = -_3036;
    float _3042 = _3040 + 1.0;
    float _3044 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3038);
    float _3046 = fma(_3042, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3036);
    float _3048 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3044);
    float _3050 = _2729 + _2689;
    float _3052 = fma(_2731, -0.5, _2982);
    float _3054 = _3028;
    float _3056 = _3052;
    if (_2962)
    {
        _3020 = 1.0;
    }
    float _3058 = _3020;
    float _3060 = _3048 + _2689;
    float _3062 = _3050 * 0.5;
    float _3064 = _3060 * 0.5;
    float _3066 = _3058;
    float _3068 = _3064;
    if (!_2962)
    {
        float _3070 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3072 = _3070 * 0.15915493667125701904296875;
        float _3074 = _3072 * 6.283185482025146484375;
        float _3076 = cos(_3074);
        float _3078 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3080 = _3078 * 0.15915493667125701904296875;
        float _3082 = _3072 * 6.283185482025146484375;
        float _3084 = sin(_3082);
        float _3086 = 1.0 / _3076;
        float _3088 = _3080 * 6.283185482025146484375;
        float _3090 = cos(_3088);
        float _3092 = _3084 * _3086;
        float _3094 = _3080 * 6.283185482025146484375;
        float _3096 = sin(_3094);
        float _3098 = _3090 * _3092;
        float _3100 = 1.0 / _3098;
        float _3102 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3104 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3102;
        float _3106 = 1.0 / _3104;
        float _3108 = _3096 * _3100;
        float _3110 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3112 = fma(_2992, _3108, _3110);
        float _3114 = _3112 * _3106;
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        _3066 = _3116;
    }
    float _3118 = _3066;
    if (!_2962)
    {
        float _3120 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3122 = _3120 * 0.15915493667125701904296875;
        float _3124 = _3122 * 6.283185482025146484375;
        float _3126 = cos(_3124);
        float _3128 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3130 = _3128 * 0.15915493667125701904296875;
        float _3132 = _3122 * 6.283185482025146484375;
        float _3134 = sin(_3132);
        float _3136 = 1.0 / _3126;
        float _3138 = _3130 * 6.283185482025146484375;
        float _3140 = cos(_3138);
        float _3142 = _3134 * _3136;
        float _3144 = _3130 * 6.283185482025146484375;
        float _3146 = sin(_3144);
        float _3148 = _3140 * _3142;
        float _3150 = 1.0 / _3148;
        float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3154 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3152;
        float _3156 = 1.0 / _3154;
        float _3158 = _3146 * _3150;
        float _3160 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3162 = fma(_2992, _3158, _3160);
        float _3164 = _3162 * _3156;
        float _3166 = precise::clamp(_3164, 0.0, 1.0);
        float _3168 = -_3166;
        float _3170 = _3168 + 1.0;
        _3054 = _3170;
    }
    float _3172 = _3054;
    float _3174 = _3008 * _3046;
    float _3176 = -_2974;
    float _3178 = _3176 + 1.0;
    float _3180 = -_2751;
    float _3182 = _3180 + 1.0;
    float _3184 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3062;
    out.m_80.y = _3052;
    out.m_80.z = _3064;
    out.m_80.w = _2689;
    bool _3188 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3190 = isnan(_2477);
    bool _3192 = _3188 || _3190;
    bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3196 = _3192 || _3194;
    float _3198 = _3182 * _3184;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = _3186 * _2771;
    out.m_82.x = _2898;
    out.m_82.y = _2984;
    out.m_82.z = _2986;
    float _3204 = -_3200;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3208 = _2782 * _3202;
    float _3210 = _2792 * _3202;
    out.gl_Position.x = _2729;
    out.gl_Position.y = _2731;
    out.gl_Position.z = _3048;
    out.gl_Position.w = _2689;
    float _3212 = _3206 * _2938;
    float _3214 = fma(_2788, _3208, _2776);
    float _3216 = fma(_2790, _3208, _2778);
    float _3218 = fma(_2782, _3210, _2780);
    float _3220 = -_3186;
    float _3222 = _3220 + 1.0;
    float _3224 = _3212 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3226 = _3222;
    if (!_3196)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3228 = _3022;
    float _3230 = _2782 * _3222;
    float _3232 = _3228;
    float _3234 = _3228;
    if (!_3196)
    {
        _3068 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3236 = _3068;
    out.m_84.x = _3224;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3196)
    {
        _3056 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3242 = _3056;
    float _3244 = _3118 * _3172;
    out.m_86.x = _3214;
    out.m_86.y = _3216;
    out.m_86.z = _3218;
    out.m_86.w = _3230;
    float _3246 = _3242;
    float _3248 = _3242;
    if (!_3196)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3250 = _3024;
    float _3252 = _3250;
    float _3254 = _3250;
    if (!_3196)
    {
        _3026 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3256 = _3026;
    float _3258 = _3244 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3260 = _3256;
    float _3262 = _3256;
    if (!_3196)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3264 = _3226;
    bool _3266 = !_3196;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3266)
    {
        bool _3272 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3274 = isnan(_2477);
        bool _3276 = _3272 || _3274;
        bool _3278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3280 = _3276 || _3278;
        if (!_3280)
        {
            float _3282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3284 = _2477 + _3282;
            float _3286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3286;
            float _3290 = 1.0 / _3288;
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3294 = _3292 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3298 = _3296 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3302 = _3300 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3312 = _3284 * _3290;
            float _3314 = precise::clamp(_3312, 0.0, 1.0);
            float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3320 = fma(_3314, _3294, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3322 = fma(_3314, _3318, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3324 = fma(_3314, _3298, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3326 = fma(_3314, _3302, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3328 = fma(_3314, _3306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3330 = fma(_3314, _3310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3322;
            _3248 = _3328;
            _3254 = _3320;
            _3240 = _3326;
            _3234 = _3324;
            _3270 = _3330;
            _3332 = true;
        }
        else
        {
            bool _3334 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3336 = isnan(_2477);
            bool _3338 = _3334 || _3336;
            bool _3340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3342 = _3338 || _3340;
            if (!_3342)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3344 = _3252;
            _3254 = _3344;
            if (!_3342)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3346 = _3260;
            _3262 = _3346;
            if (!_3342)
            {
                _3232 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3348 = _3232;
            _3234 = _3348;
            if (!_3342)
            {
                _3238 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3350 = _3238;
            _3240 = _3350;
            if (!_3342)
            {
                _3246 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3352 = _3246;
            _3248 = _3352;
            if (!_3342)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3354 = _3268;
            bool _3356 = !_3342;
            _3270 = _3354;
            if (!_3356)
            {
                bool _3358 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3360 = isnan(_2477);
                bool _3362 = _3358 || _3360;
                bool _3364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3366 = _3362 || _3364;
                if (!_3366)
                {
                    float _3368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3370 = _2477 + _3368;
                    float _3372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3372;
                    float _3376 = 1.0 / _3374;
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3380 = _3378 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3398 = _3370 * _3376;
                    float _3400 = precise::clamp(_3398, 0.0, 1.0);
                    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3404 = _3402 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3406 = fma(_3400, _3380, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3408 = fma(_3400, _3404, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3410 = fma(_3400, _3384, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3412 = fma(_3400, _3388, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3414 = fma(_3400, _3392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3416 = fma(_3400, _3396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3408;
                    _3248 = _3414;
                    _3254 = _3406;
                    _3240 = _3412;
                    _3234 = _3410;
                    _3270 = _3416;
                    _3332 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3248 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3240 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3234 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3332 = false;
    float _3418 = _3262;
    float _3420 = _3248;
    float _3422 = _3254;
    float _3424 = _3240;
    float _3426 = _3234;
    float _3428 = _3270;
    float _3430 = fma(_2984, -0.5, 0.5);
    float _3432 = precise::clamp(_3430, 0.0, 1.0);
    float _3434 = -_3418;
    float _3436 = _3434 + _3420;
    float _3438 = -_3422;
    float _3440 = _3438 + _3424;
    out.m_88.x = 0.0;
    float _3442 = fma(_3432, _3436, _3418);
    float _3444 = -_3426;
    float _3446 = _3444 + _3428;
    float _3448 = fma(_3432, _3440, _3422);
    float _3450 = _3442 * 0.586610972881317138671875;
    bool _3452 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3454 = fma(_3432, _3446, _3426);
    float _3456 = _3258 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3458 = fma(_3448, 0.298911988735198974609375, _3450);
    bool _3460 = _3118 > 0.0;
    bool _3462 = isnan(_3118);
    bool _3464 = _3460 || _3462;
    bool _3466 = isnan(0.0);
    bool _3468 = _3464 || _3466;
    float _3470 = fma(_3454, 0.114477999508380889892578125, _3458);
    out.m_51.x = _3456;
    bool _3472 = _3172 <= 0.0;
    bool _3474 = !_3468;
    bool _3476 = _3472 || _3474;
    float _3478 = -_3470;
    float _3480 = _3448 + _3478;
    float _3482 = -_3470;
    float _3484 = _3442 + _3482;
    float _3486 = -_3470;
    float _3488 = _3454 + _3486;
    float _3490 = fma(_3480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    float _3492 = fma(_3484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    float _3494 = fma(_3488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    bool _3496 = !_3452;
    if (!_3496)
    {
        float _3498 = -_2443;
        float _3500 = _3498 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3502 = -_2447;
        float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3506 = -_2451;
        float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3510 = _3500 * _3500;
        float _3512 = fma(_3504, _3504, _3510);
        float _3514 = fma(_3508, _3508, _3512);
        float _3516 = sqrt(_3514);
        float _3518 = rsqrt(_3514);
        float _3520 = -_3516;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3524 = _3522 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3526 = precise::clamp(_3524, 0.0, 1.0);
        float _3528 = _3504 * _3518;
        float _3530 = _3500 * _3518;
        float _3532 = abs(_3526);
        float _3534 = log2(_3532);
        float _3536 = _3508 * _3518;
        float _3538 = _3528 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3540 = _2984 * _3530;
        float _3542 = -_3530;
        float _3544 = -_3538;
        float _3546 = fma(_3542, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3544);
        float _3548 = fma(_2898, _3528, _3540);
        float _3550 = -_3536;
        float _3552 = fma(_3550, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3546);
        float _3554 = fma(_2986, _3536, _3548);
        float _3556 = precise::clamp(_3554, 0.0, 1.0);
        float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3560 = _3552 + _3558;
        float _3562 = _3534 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3564 = _3560 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3566 = precise::clamp(_3564, 0.0, 1.0);
        float _3568 = exp2(_3562);
        float _3570 = _3568 * _3566;
        float _3572 = _3556 * _3570;
        float _3574 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3576 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3578 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3574;
        out.m_88.y = _3576;
        out.m_88.z = _3578;
    }
    out.m_90.x = _3490;
    out.m_90.y = _3492;
    out.m_90.z = _3494;
    if (!_3476)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3580 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3580;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3332 = false;
    bool _337 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3636 = as_type<float>(_123);
        out.gl_Position.z = _3636;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _147;
    float _159 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3709 = as_type<float>(_165);
        out.gl_Position.z = _3709;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_60.x;
    float _171 = in.m_60.y;
    float _173 = in.m_60.z;
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
    float _213 = _207;
    float _231;
    if (!_211)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _147;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = in.m_64.x;
    float _243 = in.m_64.y;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_255;
    float _275 = _273 + 1.0;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _271 * _275;
    float _287 = -_271;
    float _289 = _287 + 1.0;
    float _291 = _239 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = _309 * _241;
    float _315 = _311 * _243;
    bool _317 = !_283;
    float _335;
    if (!_317)
    {
        float _319 = in.m_62.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        _335 = _147;
    }
    _337 = false;
    float _339 = _335;
    bool _341 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _343 = isnan(_339);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_339);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _375 = _339 + _373;
    float _377 = -_351;
    float _379 = _377 + 1.0;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _383 = 1.0 / _355;
    float _385 = _367 * _379;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = _371 * _383;
    float _393 = fma(_391, _375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _395 = _393 * _385;
    float _397 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[115].x, _395);
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _405 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[116].x, _397);
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _405 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    bool _415 = !_381;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _157 = _431;
    }
    float _433 = _157;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _445 = in.m_68.y;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _461 = _459 != 0;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _469 = _467 != 0;
    float _471 = 1.0 / _449;
    int _473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _475 = _473 != 0;
    float _477 = 1.0 / _465;
    float _479 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _481 = _441 > 0.5;
    bool _483 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _485 = isnan(_433);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _499 = _497 != 0;
    int _501 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _503 = _501 != 0;
    float _505 = 1.0 / _457;
    float _507 = -_203;
    int _509 = _481 ? as_type<int>(_507) : as_type<int>(_203);
    bool _511 = _435 > 0.5;
    float _513 = -_193;
    int _515 = _511 ? as_type<int>(_513) : as_type<int>(_193);
    float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _521 = _519 != 0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _525 = -_523;
    float _527 = fma(_479, 2.0, _525);
    float _529 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _531;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _541 = _439 * 2.0;
    float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _545 = _537 * _471;
    float _547 = fma(_529, -2.0, _539);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _549;
    float _553 = _533 * _505;
    float _555 = _437 * 2.0;
    bool _557 = !_453;
    float _559 = _557 ? _193 : as_type<float>(_515);
    float _561 = _551 * _477;
    bool _563 = _437 > 0.5;
    float _565 = _437 + _439;
    float _567 = floor(_555);
    float _569 = -_203;
    int _571 = _563 ? as_type<int>(_569) : as_type<int>(_203);
    float _573 = _565 + (-1.0);
    float _575 = -_193;
    int _577 = _563 ? as_type<int>(_575) : as_type<int>(_193);
    float _579 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _547);
    bool _581 = !_461;
    float _583 = _581 ? _203 : as_type<float>(_571);
    float _585 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _587 = _439 > 0.5;
    float _589 = floor(_541);
    float _591 = _437 + _435;
    float _593 = _517 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _595 = -_193;
    int _597 = _587 ? as_type<int>(_595) : as_type<int>(_193);
    float _599 = _591 + (-1.0);
    float _601 = _583 + (-0.5);
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _605 = !_475;
    float _607 = _605 ? _193 : as_type<float>(_597);
    float _609 = _435 * 2.0;
    float _611 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _613 = -_203;
    int _615 = _587 ? as_type<int>(_613) : as_type<int>(_203);
    float _617 = -_593;
    float _619 = -_579;
    float _621 = fma(_617, _601, _619);
    bool _623 = !_499;
    float _625 = _623 ? _193 : as_type<float>(_577);
    float _627 = floor(_609);
    bool _629 = _567 > 0.0;
    bool _631 = _567 >= 0.0;
    bool _633 = isnan(_567);
    bool _635 = _631 || _633;
    bool _637 = isnan(0.0);
    bool _639 = _635 || _637;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _643 = _433 + _641;
    bool _645 = _589 >= 0.0;
    bool _647 = isnan(_589);
    bool _649 = _645 || _647;
    bool _651 = isnan(0.0);
    bool _653 = _649 || _651;
    float _655 = _625 + 0.5;
    int _657 = _639 ? 0 : 1;
    float _659 = fma(_553, _643, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _661 = !_503;
    float _663 = _661 ? _203 : as_type<float>(_615);
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _667 = _433 + _665;
    float _669 = _553;
    float _671 = _621;
    float _673 = _445;
    if (!_521)
    {
        _669 = _439;
    }
    float _675 = _669;
    float _677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _679 = _589 > 0.0;
    float _681 = fma(_545, _667, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _683 = _675;
    if (_521)
    {
        _683 = _437;
    }
    float _685 = _683;
    float _687 = -_663;
    float _689 = _687 + 0.5;
    int _691 = _653 ? 0 : 1;
    bool _693 = _627 > 0.0;
    float _695 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[83].w, _495);
    float _697 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _699 = -_135;
    float _701 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[76].x, _527);
    float _703 = _559 + 0.5;
    bool _705 = _627 >= 0.0;
    bool _707 = isnan(_627);
    bool _709 = _705 || _707;
    bool _711 = isnan(0.0);
    bool _713 = _709 || _711;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _717 = _433 + _715;
    int _719 = ~_691;
    int _721 = _719 + 1;
    int _723 = _721 + 1;
    float _725 = fma(_697, _703, _701);
    int _727 = _723;
    float _729 = _717;
    float _731 = _685;
    if (!_679)
    {
        int _733 = ~_691;
        int _735 = _733 + 1;
        _727 = _735;
    }
    int _737 = _727;
    float _739 = fma(_561, _717, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _741 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _743 = isnan(_433);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _749 = _745 || _747;
    float _751 = float(_749);
    float _753 = _689 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _757 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _759 = isnan(_433);
    bool _761 = _757 || _759;
    bool _763 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _765 = _761 || _763;
    float _767 = float(_765);
    float _769 = -_751;
    float _771 = _769 + 1.0;
    if (!_521)
    {
        _729 = _437;
    }
    float _773 = _729;
    float _775 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _695);
    float _777 = _773;
    if (!_521)
    {
        _731 = _439;
    }
    float _779 = _731;
    float _781 = _767 * _771;
    float _783 = _779;
    if (_521)
    {
        _777 = _435;
    }
    float _785 = _777;
    float _787 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _789 = log2(_787);
    if (_521)
    {
        _783 = _437;
    }
    float _791 = _783;
    float _793 = -_775;
    float _795 = _793 + 1.0;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _799 = _797 != 0;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _803 = _801 != 0;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _807 = _805 != 0;
    float _809 = -_767;
    float _811 = _809 + 1.0;
    bool _813 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _815 = isnan(_433);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _827 = _823 * _811;
    float _829 = -_823;
    float _831 = _829 + 1.0;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _835 = _755 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _839 = _493 * _831;
    float _841 = -_493;
    float _843 = _841 + 1.0;
    float _845 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[83].z, _603);
    float _847 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _849 = _659 * _839;
    float _851 = _655 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _853 = _785 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _855 = fma(_847, -2.0, _833);
    float _857 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[131].x, _849);
    float _859 = _753 * _543;
    float _861 = _851 * _677;
    float _863 = in.m_48.x;
    float _865 = in.m_48.y;
    float _867 = in.m_48.z;
    float _869 = -_837;
    float _871 = fma(_853, 2.0, _869);
    int _873 = _713 ? 0 : 1;
    float _875 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _855);
    out.m_70.x = _861;
    out.m_70.y = _859;
    float _877 = _607 + 0.5;
    float _879 = -_135;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[81].x, _871);
    int _883 = ~_873;
    int _885 = _883 + 1;
    int _887 = _885 + 1;
    float _889 = _789 * _135;
    int _891 = _887;
    float _893 = _877;
    if (!_693)
    {
        int _895 = ~_873;
        int _897 = _895 + 1;
        _891 = _897;
    }
    int _899 = _891;
    float _901 = fma(_681, _827, _857);
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _905 = fma(_835, _877, _881);
    float _907 = exp2(_889);
    float _909 = _825 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _911 = ~_657;
    int _913 = _911 + 1;
    int _915 = _913 + 1;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _919 = 1.0 + _917;
    int _921 = _915;
    int _923 = _899;
    if (!_629)
    {
        int _925 = ~_657;
        int _927 = _925 + 1;
        _921 = _927;
    }
    int _929 = _921;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _933 = !_469;
    float _935 = _933 ? _203 : as_type<float>(_509);
    float _937 = 1.0 / _919;
    float _939 = _865 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _941 = _865 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _943 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _945 = isnan(1.0);
    bool _947 = _943 || _945;
    bool _949 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _951 = _947 || _949;
    float _953 = _865 + _445;
    float _955 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[6].x, _939);
    float _957 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[4].x, _941);
    float _959 = _935 + (-0.5);
    float _961 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _931);
    float _963 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[6].z, _955);
    float _965 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _903);
    float _967 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[4].z, _957);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _971 = _953 + _969;
    float _973 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _845);
    float _975 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _965);
    float _977 = _967 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _979 = -_909;
    float _981 = -_875;
    float _983 = fma(_979, _959, _981);
    float _985 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _961);
    float _987 = -_975;
    float _989 = _987 + 1.0;
    float _991 = _971 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _993 = _963 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _997 = _977 + _995;
    float _999 = -_989;
    float _1001 = fma(_559, _999, _725);
    bool _1003 = !_799;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = -_973;
    float _1009 = _1007 + 1.0;
    float _1011 = -_985;
    float _1013 = _1011 + 1.0;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1017 = _993 + _1015;
    int _1019 = abs(_1005);
    float _1021 = fma(_997, (*spvDescriptorSet0.vp_c8)._m0[28].x, _991);
    float _1023 = -_1009;
    float _1025 = fma(_607, _1023, _905);
    float _1027 = -_907;
    float _1029 = _1027 + 1.0;
    float _1031 = fma(_583, _1013, _621);
    float _1033 = fma(_935, _795, _983);
    float _1035 = fma(_1017, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1021);
    bool _1037 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1039 = isnan(0.0);
    bool _1041 = _1037 || _1039;
    bool _1043 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1045 = _1041 || _1043;
    float _1047 = in.m_72.x;
    float _1049 = in.m_72.y;
    float _1051 = in.m_72.z;
    float _1053 = float(_737);
    float _1055 = fma(_739, _781, _901);
    bool _1057 = !_803;
    int _1059 = _1057 ? 0 : 1;
    out.m_74.x = _1001;
    out.m_74.y = _1031;
    out.m_74.z = _1025;
    out.m_74.w = _1033;
    float _1061 = float(_1019);
    float _1063 = _971 * _971;
    float _1065 = _1045 ? _1029 : 0.0;
    bool _1067 = _1035 >= 0.0;
    float _1069 = _1061 * _1053;
    int _1071 = abs(_1059);
    float _1073 = fma(_997, _997, _1063);
    if (_951)
    {
        float _1075 = _1065 * _937;
        _159 = _1075;
    }
    float _1077 = _159;
    float _1079 = fma(_1017, _1017, _1073);
    float _1081 = float(_899);
    float _1083 = _1069 * (-2.0);
    float _1085 = float(_1071);
    float _1087 = rsqrt(_1079);
    if (_1067)
    {
        _671 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1089 = _671;
    float _1091 = _1085 * _1081;
    float _1093 = fma(_611, _1083, _611);
    float _1095 = fma(_1083, _1047, _1047);
    float _1097 = _435 + (-0.5);
    float _1099 = _1051;
    if (_1067)
    {
        float _1101 = _1089 * 5.0;
        _923 = as_type<int>(_1101);
    }
    int _1103 = _923;
    float _1105 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1107 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1095);
    float _1109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1111 = fma(_751, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1055);
    float _1113 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1067)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5245 = as_type<float>(_1103);
        out.gl_Position.z = _5245;
    }
    float _1119 = _1109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1067)
    {
        out.m_51.x = 0.0;
    }
    bool _1127 = !_807;
    int _1129 = _1127 ? 0 : 1;
    out.m_76.x = _1119;
    out.m_76.y = _1121;
    out.m_76.z = _1123;
    out.m_76.w = _1125;
    float _1131 = _1113 * _1087;
    float _1133 = _997 * _1131;
    float _1135 = _971 * _1131;
    float _1137 = -_1133;
    float _1139 = _997 + _1137;
    float _1141 = -_1135;
    float _1143 = _971 + _1141;
    if (_1067)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1145 = -_1135;
    float _1147 = _953 + _1145;
    float _1149 = _1143 * _1143;
    float _1151 = _1017 * _1131;
    float _1153 = -_1133;
    float _1155 = _977 + _1153;
    float _1157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1159 = _1147 + _1157;
    float _1161 = fma(_1139, _1139, _1149);
    float _1163 = -_1151;
    float _1165 = _1017 + _1163;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1169 = _1155 + _1167;
    float _1171 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1173 = fma(_1093, _1077, _1107);
    int _1175 = abs(_1129);
    float _1177 = fma(_1165, _1165, _1161);
    float _1179 = fma(_1169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1171);
    float _1181 = _1091 * (-2.0);
    float _1183 = -_1151;
    float _1185 = _993 + _1183;
    float _1187 = _437 + (-0.5);
    float _1189 = float(_929);
    float _1191 = fma(_1181, _1049, _1049);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1195 = _1185 + _1193;
    float _1197 = float(_1175);
    float _1199 = fma(_585, _1181, _585);
    float _1201 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1191);
    float _1203 = fma(_1195, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1179);
    float _1205 = _439 + _435;
    float _1207 = _1197 * _1189;
    float _1209 = fma(_1199, _1077, _1201);
    float _1211 = _439 + (-0.5);
    bool _1213 = _1203 >= 0.0;
    float _1215 = _1205 + (-1.0);
    float _1217 = _1207 * (-2.0);
    float _1219 = _1209 * 0.15915493667125701904296875;
    float _1221 = _1173 * 0.15915493667125701904296875;
    float _1223 = sqrt(_1177);
    float _1225 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = fma(_1217, _1051, _1051);
    float _1229 = fma(_1225, _1217, _1225);
    float _1231 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    if (_1213)
    {
        _1099 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1233 = _1099;
    float _1235 = _1221 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    int _1239 = as_type<int>(_1233);
    if (_1213)
    {
        out.m_51.x = 0.0;
    }
    float _1241 = fma(_1229, _1077, _1231);
    if (_1213)
    {
        float _1243 = _1233 * 5.0;
        _1239 = as_type<int>(_1243);
    }
    int _1245 = _1239;
    float _1247 = _1241 * 0.15915493667125701904296875;
    float _1249 = _1221 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    if (_1213)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5479 = as_type<float>(_1245);
        out.gl_Position.z = _5479;
    }
    float _1253 = _1219 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1219 * 6.283185482025146484375;
    float _1259 = cos(_1257);
    float _1261 = _1247 * 6.283185482025146484375;
    float _1263 = sin(_1261);
    if (_1213)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _1265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1267 = _1237 * _1255;
    bool _1269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1271 = _1251 * _1259;
    float _1273 = _1247 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    float _1277 = -_953;
    float _1279 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1281 = fma(_1263, _1271, _1267);
    float _1283 = fma(_1263, _1267, _1271);
    float _1285 = _1251 * _1255;
    float _1287 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1289 = _1287 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1291 = _1087 * _1223;
    float _1293 = _1237 * _1259;
    float _1295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    if (_1265)
    {
        float _1297 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _893 = _1297;
    }
    float _1299 = _893;
    float _1301 = _1105 * _1291;
    float _1303 = -_1285;
    float _1305 = fma(_1263, _1293, _1303);
    float _1307 = _1299;
    if (_1269)
    {
        float _1309 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _673 = _1309;
    }
    float _1311 = _673;
    float _1313 = _1143;
    if (_1265)
    {
        float _1315 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1313 = _1315;
    }
    float _1317 = _1313;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1321 = _1319 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1323 = -_1293;
    float _1325 = fma(_1263, _1285, _1323);
    float _1327 = _1295 * _1301;
    float _1329 = _315 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1331 = -_977;
    float _1333 = _1331 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1335 = as_type<float>(_1245);
    if (_1269)
    {
        float _1337 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1335 = _1337;
    }
    float _1339 = _1335;
    float _1341 = _1279 * _1279;
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1345 = _1343 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1347 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1351 = _1251 * _1275;
    float _1353 = _1259 * _1275;
    float _1355 = _1237 * _1275;
    float _1357 = 1.0 / _1321;
    float _1359 = _1255 * _1275;
    float _1361 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1363 = -_993;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1367 = fma(_1333, _1333, _1341);
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1371 = _1369 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1373 = 1.0 / _1289;
    float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1377 = _1375 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1379 = _1291 * _1329;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1383 = _1381 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1385 = _1361 * _1379;
    float _1387 = fma(_1365, _1365, _1367);
    float _1389 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1391 = _1367;
    float _1393 = _1357;
    if (_1265)
    {
        float _1395 = fma(_1299, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1307 = _1395;
    }
    float _1397 = _1307;
    float _1399 = 1.0 / _1345;
    float _1401 = _1397;
    if (_1269)
    {
        float _1403 = fma(_1311, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1389 = _1403;
    }
    float _1405 = _1389;
    float _1407 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1409 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1407;
    if (_1265)
    {
        float _1411 = _1397 * _1317;
        _1391 = _1411;
    }
    float _1413 = _1391;
    if (_1269)
    {
        float _1415 = _1405 * _1339;
        _1401 = _1415;
    }
    float _1417 = _1401;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1419;
    float _1423 = 1.0 / _1349;
    float _1425 = _1409 * _1373;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1431 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1431;
    float _1435 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1437 = _1435 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1441 = _1439 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1443 = 1.0 / _1377;
    float _1445 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1447 = _1445 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1455 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1453;
    float _1457 = _1437 * _1399;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1461 = _1459 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1463;
    float _1467 = 1.0 / _1371;
    float _1469 = _1441 * _1423;
    float _1471 = _1451 * _1357;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1473;
    float _1477 = _1475;
    if (!_1265)
    {
        _1393 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1479 = _1393;
    float _1481 = _1291 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1483 = _1481 * 0.5;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1487 = _1485 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1489 = 0.0;
    float _1491 = _1479;
    if (_1265)
    {
        float _1493 = floor(_1413);
        _1489 = _1493;
    }
    float _1495 = _1489;
    float _1497 = _1455 * _1443;
    float _1499 = -_1385;
    float _1501 = _1263 * _1499;
    float _1503 = _1355 * _1385;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1505;
    float _1509 = _865 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1511 = fma(_1353, _1327, _1501);
    float _1513 = fma(_1305, _1327, _1503);
    float _1515 = 1.0 / _1383;
    float _1517 = _1461 * _1467;
    float _1519 = _1351 * _1385;
    float _1521 = fma(_1281, _1327, _1519);
    float _1523 = fma(_1359, _1483, _1511);
    float _1525 = 0.0;
    float _1527 = _1523;
    if (_1269)
    {
        float _1529 = floor(_1417);
        _1525 = _1529;
    }
    float _1531 = _1525;
    if (_1265)
    {
        float _1533 = -_1495;
        float _1535 = _1413 + _1533;
        _1491 = _1535;
    }
    float _1537 = _1491;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1541 = _1537 + _1539;
    float _1543 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1545 = _1537 + _1543;
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1549 = _1537 + _1547;
    float _1551 = 1.0 / _1429;
    float _1553 = _1475 * _1515;
    if (!_1269)
    {
        _1477 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1555 = _1477;
    float _1557 = 1.0 / _1421;
    float _1559 = _1555;
    if (_1269)
    {
        float _1561 = -_1531;
        float _1563 = _1417 + _1561;
        _1559 = _1563;
    }
    float _1565 = _1559;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1569 = _1537 + _1567;
    bool _1571 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1573 = isnan(_1565);
    bool _1575 = _1571 || _1573;
    bool _1577 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1579 = _1575 || _1577;
    float _1581 = float(_1579);
    float _1583 = 1.0 / _1433;
    float _1585 = _1569 * _1551;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1589 = _1537 + _1587;
    float _1591 = -_1581;
    float _1593 = _1591 + 1.0;
    float _1595 = 1.0 / _1447;
    float _1597 = _1541 * _1557;
    float _1599 = rsqrt(_1387);
    float _1601 = _1545 * _1583;
    float _1603 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1605 = _1565 + _1603;
    float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1609 = _1537 + _1607;
    float _1611 = fma(_1457, _1605, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1613 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1615 = _1565 + _1613;
    float _1617 = 1.0 / _1465;
    float _1619 = _1589 * _1595;
    float _1621 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1623 = _1565 + _1621;
    float _1625 = fma(_1471, _1615, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1627 = fma(_1425, _1623, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1631 = _1565 + _1629;
    float _1633 = 1.0 / _1507;
    float _1635 = _1333 * _1599;
    float _1637 = _1279 * _1599;
    float _1639 = _1365 * _1599;
    float _1641 = fma(_1325, _1483, _1521);
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1645 = _1565 + _1643;
    float _1647 = fma(_1469, _1631, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1649 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1651 = _1565 + _1649;
    float _1653 = 1.0 / _1487;
    float _1655 = _1609 * _1617;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1659 = _1565 + _1657;
    float _1661 = fma(_1517, _1645, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _1663 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1665 = isnan(_1565);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1671 = _1667 || _1669;
    float _1673 = float(_1671);
    float _1675 = fma(_1283, _1483, _1513);
    float _1677 = fma(_1553, _1659, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1679 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1681 = isnan(_1565);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1549 * _1633;
    bool _1693 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1695 = isnan(_1565);
    bool _1697 = _1693 || _1695;
    bool _1699 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1701 = _1697 || _1699;
    float _1703 = float(_1701);
    float _1705 = _1673 * _1593;
    float _1707 = -_1673;
    float _1709 = _1707 + 1.0;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1713 = _1537 + _1711;
    float _1715 = fma(_1497, _1651, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1717 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1719 = isnan(_1565);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = -_1689;
    float _1731 = _1729 + 1.0;
    bool _1733 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1735 = isnan(_1565);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    float _1745 = -_1703;
    float _1747 = _1745 + 1.0;
    bool _1749 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1751 = isnan(_1537);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    float _1761 = _1713 * _1653;
    float _1763 = _1581 * _1731;
    float _1765 = -_1743;
    float _1767 = _1765 + 1.0;
    float _1769 = _1727 * _1747;
    bool _1771 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1773 = isnan(_1537);
    bool _1775 = _1771 || _1773;
    bool _1777 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1779 = _1775 || _1777;
    float _1781 = float(_1779);
    float _1783 = -_1759;
    float _1785 = _1783 + 1.0;
    float _1787 = _1703 * _1709;
    float _1789 = _1689 * _1767;
    float _1791 = _1627 * _1769;
    float _1793 = _1781 * _1785;
    float _1795 = -_1781;
    float _1797 = _1795 + 1.0;
    bool _1799 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1801 = isnan(_1565);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = -_1727;
    float _1813 = _1811 + 1.0;
    bool _1815 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1817 = isnan(_1537);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1823 = _1819 || _1821;
    float _1825 = float(_1823);
    bool _1827 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1829 = isnan(_1537);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = fma(_1813, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1791);
    float _1841 = -_1809;
    float _1843 = _1841 + 1.0;
    float _1845 = _1825 * _1797;
    float _1847 = -_1825;
    float _1849 = _1847 + 1.0;
    bool _1851 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1853 = isnan(_1537);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1859 = _1855 || _1857;
    float _1861 = float(_1859);
    float _1863 = _1743 * _1843;
    float _1865 = fma(_1611, _1787, _1839);
    float _1867 = -_1837;
    float _1869 = _1867 + 1.0;
    float _1871 = _1837 * _1849;
    bool _1873 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1875 = isnan(_1537);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = _1861 * _1869;
    bool _1887 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1889 = isnan(_1537);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1895 = _1891 || _1893;
    float _1897 = float(_1895);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1899;
    bool _1903 = _1537 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1905 = isnan(_1537);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = -_1883;
    float _1917 = _1915 + 1.0;
    float _1919 = -_1861;
    float _1921 = _1919 + 1.0;
    float _1923 = fma(_1901, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1925 = _1913 * _1917;
    float _1927 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1929 = _1927 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1933 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1931;
    float _1935 = _1897 * _1921;
    float _1937 = -_1897;
    float _1939 = _1937 + 1.0;
    float _1941 = -_1913;
    float _1943 = _1941 + 1.0;
    float _1945 = _1923 * _1925;
    bool _1947 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1949 = isnan(_1565);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1955 = _1951 || _1953;
    float _1957 = float(_1955);
    float _1959 = fma(_1933, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1961 = fma(_1677, _1705, _1865);
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1967 = _1883 * _1939;
    float _1969 = fma(_1929, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1971 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1945);
    float _1973 = _1959 * _1925;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1977 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1975;
    float _1979 = -_1957;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1647, _1763, _1961);
    float _1985 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1987 = _1635 * _1985;
    float _1989 = fma(_1969, _1967, _1971);
    float _1991 = fma(_1965, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1993 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1973);
    float _1995 = fma(_1977, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1997 = _1809 * _1981;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _2001 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1999;
    float _2003 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2005 = _1639 * _2003;
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2009 = -_1987;
    float _2011 = fma(_1639, _2007, _2009);
    float _2013 = fma(_1991, _1967, _1993);
    float _2015 = fma(_1995, _1935, _1989);
    float _2017 = fma(_2001, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2021 = _2019 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2025 = -_2005;
    float _2027 = fma(_1637, _2023, _2025);
    float _2029 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2031 = _1637 * _2029;
    float _2033 = _2011 * _2011;
    float _2035 = fma(_2017, _1935, _2013);
    float _2037 = fma(_2021, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2039 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2041 = -_2031;
    float _2043 = fma(_1635, _2039, _2041);
    float _2045 = fma(_2027, _2027, _2033);
    float _2047 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _2049 = _2047 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2051 = fma(_2037, _1885, _2015);
    float _2053 = fma(_2043, _2043, _2045);
    float _2055 = fma(_2049, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2057 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2057;
    float _2061 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2063 = _2061 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2065 = rsqrt(_2053);
    float _2067 = fma(_2059, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2069 = fma(_2055, _1885, _2035);
    float _2071 = fma(_1625, _1789, _1983);
    float _2073 = fma(_2063, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2075 = fma(_2067, _1871, _2051);
    float _2077 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2077;
    float _2081 = fma(_1661, _1863, _2071);
    float _2083 = fma(_2073, _1845, _2075);
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2087 = _2085 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2089;
    float _2093 = fma(_2079, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2095 = fma(_1715, _1997, _2081);
    float _2097 = fma(_2091, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2099 = _2027 * _2065;
    float _2101 = fma(_2093, _1871, _2069);
    float _2103 = fma(_2087, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2105 = fma(_2097, _1793, _2083);
    float _2107 = _2011 * _2065;
    float _2109 = _1637 * _2099;
    float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2111;
    float _2115 = fma(_2103, _1845, _2101);
    float _2117 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2095);
    float _2119 = _2043 * _2065;
    float _2121 = _1639 * _2107;
    float _2123 = -_2109;
    float _2125 = fma(_1635, _2107, _2123);
    float _2127 = fma(_2113, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2129 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2105);
    float _2131 = -_2121;
    float _2133 = fma(_1637, _2119, _2131);
    float _2135 = _2125 * _1641;
    float _2137 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2139 = _993 + _2137;
    float _2141 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2143 = fma(_2127, _1793, _2115);
    float _2145 = _2133 * _1641;
    float _2147 = fma(_2119, _1523, _2135);
    float _2149 = -_2141;
    float _2151 = fma(_2129, _2139, _2149);
    float _2153 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2155 = _977 + _2153;
    float _2157 = fma(_2099, _1523, _2145);
    float _2159 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2161 = fma(_1639, _1675, _2147);
    float _2163 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2143);
    float _2165 = fma(_1635, _1675, _2157);
    float _2167 = -_2159;
    float _2169 = fma(_2129, _2155, _2167);
    float _2171 = _1635 * _2119;
    float _2173 = fma(_2161, _2163, _2151);
    float _2175 = fma(_863, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1509);
    float _2177 = fma(_2165, _2163, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_1639, _2099, _2179);
    float _2183 = _2173 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2185 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2175);
    float _2187 = _2177 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2189 = _2181 * _1641;
    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2193 = _2183 + _2191;
    float _2195 = _2185 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2199 = _2187 + _2197;
    float _2201 = fma(_2107, _1523, _2189);
    float _2203 = _2193 * _2193;
    float _2205 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2207 = _2195 + _2205;
    float _2209 = _2117 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2211 = fma(_1637, _1675, _2201);
    float _2213 = fma(_2199, _2199, _2203);
    float _2215 = -_2209;
    float _2217 = fma(_2129, _2207, _2215);
    float _2219 = _953 + _2211;
    float _2221 = sqrt(_2213);
    float _2223 = -_2195;
    float _2225 = _2219 + _2223;
    float _2227 = fma(_2163, _2225, _2217);
    float _2229 = _2227 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2231 = _2221 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2233 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2235 = _2221 + _2233;
    float _2237 = _2203;
    float _2239 = _2207;
    float _2241 = _2213;
    float _2243 = _2201;
    float _2245 = _2187;
    float _2247 = _2183;
    float _2249 = _1641;
    float _2251 = _2199;
    if (_2231)
    {
        float _2253 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2237 = _2253;
    }
    float _2255 = _2237;
    if (_2231)
    {
        float _2257 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2257;
    }
    float _2259 = _2239;
    if (_2231)
    {
        float _2261 = rsqrt(_2213);
        _2241 = _2261;
    }
    float _2263 = _2241;
    float _2265 = _2255;
    if (_2231)
    {
        float _2267 = _2235 * _2255;
        _2265 = _2267;
    }
    float _2269 = _2265;
    if (_2231)
    {
        float _2271 = _2269 * 0.15915493667125701904296875;
        _2243 = _2271;
    }
    float _2273 = _2243;
    float _2275 = _867;
    if (_2231)
    {
        float _2277 = _2273 * 6.283185482025146484375;
        float _2279 = sin(_2277);
        _2275 = _2279;
    }
    float _2281 = _2275;
    float _2283 = _2281;
    if (_2231)
    {
        float _2285 = fma(_2281, _2259, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2285;
    }
    float _2287 = _2283;
    float _2289 = _2287;
    if (_2231)
    {
        float _2291 = _2263 * _2287;
        _2289 = _2291;
    }
    float _2293 = _2289;
    if (_2231)
    {
        float _2295 = fma(_2199, _2293, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2245 = _2295;
    }
    float _2297 = _2245;
    float _2299 = _2297;
    if (_2231)
    {
        float _2301 = fma(_2193, _2293, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2247 = _2301;
    }
    float _2303 = _2247;
    float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2307 = _2297 + _2305;
    float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2311 = _2303 + _2309;
    float _2313 = fma(_2307, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2315 = fma(_2311, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7184 = float2(_2313, _2315);
    float _2317 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7184, float2(0.0), isnan(_7184)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7184, float2(0.0), isnan(_7184)), level(0.0)).x;
    float _2319 = _2273;
    float _2321 = _2307;
    float _2323 = _2303;
    float _2325 = _2315;
    if (_2231)
    {
        float _2327 = _2273 * 6.283185482025146484375;
        float _2329 = cos(_2327);
        _2319 = _2329;
    }
    float _2331 = _2319;
    if (!_2231)
    {
        _2321 = _2229;
    }
    float _2333 = _2321;
    float _2335 = -_977;
    float _2337 = _2335 + _2297;
    float _2339 = _2333;
    if (_2231)
    {
        float _2341 = _2331 + (-1.0);
        _2249 = _2341;
    }
    float _2343 = _2249;
    if (_2231)
    {
        float _2345 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1527 = _2345;
    }
    float _2347 = _1527;
    if (_2231)
    {
        float _2349 = fma(_2229, _2331, _2347);
        _2339 = _2349;
    }
    float _2351 = _2339;
    float _2353 = -_993;
    float _2355 = _2353 + _2303;
    float _2357 = -_953;
    float _2359 = _2357 + _2351;
    float _2361 = _2359 * _2359;
    float _2363 = fma(_2337, _2337, _2361);
    float _2365 = fma(_2355, _2355, _2363);
    float _2367 = sqrt(_2365);
    bool _2369 = _2367 > 0.0;
    float _2371 = fma(_2317, 100.0, _2351);
    bool _2373 = !_2369;
    float _2375 = _2371;
    float _2377 = _2365;
    float _2379 = _2359;
    if (!_2373)
    {
        float _2381 = _207 * _207;
        float _2383 = fma(_205, _205, _2381);
        float _2385 = fma(_209, _209, _2383);
        float _2387 = rsqrt(_2365);
        float _2389 = sqrt(_2385);
        float _2391 = _2359 * _2387;
        float _2393 = _2355 * _2387;
        bool _2395 = _2389 > 0.0;
        float _2397 = _2337 * _2387;
        bool _2399 = !_2395;
        _2251 = _2393;
        _2379 = _2391;
        _2325 = _2397;
        if (!_2399)
        {
            float _2401 = rsqrt(_2385);
            float _2403 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2405 = _207 * _2401;
            float _2407 = _205 * _2401;
            float _2409 = _2391 * _2405;
            float _2411 = _209 * _2401;
            float _2413 = fma(_2397, _2407, _2409);
            float _2415 = _2403 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2417 = fma(_2393, _2411, _2413);
            float _2419 = _2417 * _2415;
            float _2421 = fma(_205, _2419, _2297);
            float _2423 = fma(_207, _2419, _2371);
            float _2425 = fma(_209, _2419, _2303);
            _2375 = _2423;
            _2299 = _2421;
            _2323 = _2425;
            _2377 = _2413;
            _2379 = _2415;
        }
    }
    float _2427 = _2375;
    float _2429 = _2299;
    float _2431 = _2323;
    float _2433 = _2377;
    float _2435 = _2251;
    float _2437 = _2379;
    float _2439 = _2325;
    float _2441 = -_1135;
    float _2443 = _2441 + _2427;
    float _2445 = -_1133;
    float _2447 = _2445 + _2429;
    float _2449 = -_1151;
    float _2451 = _2449 + _2431;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2455 = _2443 + _2453;
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2459 = _2447 + _2457;
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2463 = _2451 + _2461;
    float _2465 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2467 = _2455 * _2455;
    float _2469 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2465);
    float _2471 = fma(_2459, _2459, _2467);
    float _2473 = fma(_2463, _2463, _2471);
    float _2475 = rsqrt(_2473);
    float _2477 = sqrt(_2473);
    float _2479 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2481 = _2459 * _2479;
    float _2483 = _2463 * _2479;
    float _2485 = _2481 * _2481;
    float _2487 = _2483 * _2483;
    float _2489 = _2485 + _2487;
    float _2491 = sqrt(_2489);
    bool _2493 = _2491 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2497 = _2491 + _2495;
    float _2499 = _2433;
    float _2501 = _2489;
    float _2503 = _2497;
    float _2505 = _2435;
    float _2507 = _2439;
    float _2509 = _2429;
    float _2511 = _2481;
    float _2513 = _2483;
    float _2515 = _2485;
    float _2517 = _2487;
    if (_2493)
    {
        float _2519 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2499 = _2519;
    }
    float _2521 = _2499;
    if (_2493)
    {
        float _2523 = rsqrt(_2489);
        _2501 = _2523;
    }
    float _2525 = _2501;
    if (_2493)
    {
        float _2527 = _2497 * _2521;
        _2503 = _2527;
    }
    float _2529 = _2503;
    if (_2493)
    {
        float _2531 = _2529 * 0.15915493667125701904296875;
        _2505 = _2531;
    }
    float _2533 = _2505;
    float _2535 = _2521;
    if (_2493)
    {
        float _2537 = _2533 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        _2535 = _2539;
    }
    float _2541 = _2535;
    float _2543 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2545 = precise::max(0.0, _2543);
    float _2547 = _2437;
    float _2549 = _2545;
    if (_2493)
    {
        float _2551 = _2533 * 6.283185482025146484375;
        float _2553 = cos(_2551);
        _2547 = _2553;
    }
    float _2555 = _2547;
    float _2557 = -_2479;
    float _2559 = -_2545;
    float _2561 = fma(_2455, _2557, _2559);
    if (_2493)
    {
        float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2549 = _2563;
    }
    float _2565 = _2549;
    float _2567 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2569 = fma(_1155, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2571 = _2541;
    if (_2493)
    {
        float _2573 = fma(_2541, _2565, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _213 = _2573;
    }
    float _2575 = _213;
    if (!_2493)
    {
        _2571 = _2561;
    }
    float _2577 = _2571;
    float _2579 = floor(_2569);
    float _2581 = _2577;
    if (_2493)
    {
        float _2583 = _2555 + (-1.0);
        _2507 = _2583;
    }
    float _2585 = _2507;
    float _2587 = _2585;
    if (_2493)
    {
        float _2589 = _2525 * _2575;
        _2509 = _2589;
    }
    float _2591 = _2509;
    if (_2493)
    {
        float _2593 = _2585 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2587 = _2593;
    }
    float _2595 = _2587;
    if (_2493)
    {
        float _2597 = _2481 * _2591;
        _2511 = _2597;
    }
    float _2599 = _2511;
    if (_2493)
    {
        float _2601 = _2483 * _2591;
        _2513 = _2601;
    }
    float _2603 = _2513;
    float _2605 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2567);
    if (_2493)
    {
        float _2607 = fma(_2561, _2555, _2595);
        _2581 = _2607;
    }
    float _2609 = _2581;
    if (_2493)
    {
        float _2611 = _2599 * _2599;
        _2515 = _2611;
    }
    float _2613 = _2515;
    if (_2493)
    {
        float _2615 = _2603 * _2603;
        _2517 = _2615;
    }
    float _2617 = _2517;
    float _2619 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2605);
    float _2621 = fma(_2609, _2609, _2613);
    float _2623 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2625 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2627 = _2621 + _2617;
    float _2629 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2631 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2625);
    float _2633 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2635 = fma(_2447, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2629);
    float _2637 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2631);
    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2641 = fma(_2477, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2639);
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    float _2645 = rsqrt(_2627);
    float _2647 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2635);
    float _2649 = _2637 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2651 = _2619 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2653 = -_2643;
    float _2655 = _2653 + 1.0;
    float _2657 = _2647 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2659 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2661 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2663 = fma(_2451, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2469);
    float _2665 = floor(_2623);
    float _2667 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2659);
    float _2669 = -_2661;
    float _2671 = fma(_2669, _2633, 1.0);
    float _2673 = _2663 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2675 = -_2579;
    float _2677 = _2569 + _2675;
    float _2679 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2667);
    float _2681 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2683 = _2645 * _2599;
    float _2685 = abs(_2655);
    float _2687 = log2(_2685);
    float _2689 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2679);
    float _2691 = _2645 * _2609;
    float _2693 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2695 = _2645 * _2603;
    float _2697 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2699 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2681);
    float _2701 = -_2693;
    float _2703 = fma(_2691, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2701);
    float _2705 = log2(_2671);
    float _2707 = -_2665;
    float _2709 = _2623 + _2707;
    float _2711 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2697);
    float _2713 = -_2695;
    float _2715 = fma(_2713, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2703);
    float _2717 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2699);
    float _2719 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2711);
    float _2721 = fma(_2715, -0.5, 0.5);
    float _2723 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2725 = fma(_2715, 0.5, 0.5);
    float _2727 = 1.0 / _2689;
    float _2729 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2717);
    float _2731 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2719);
    float _2733 = fma(_2725, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2735 = _2705 * 0.693147182464599609375;
    float _2737 = fma(_2725, _2733, -0.212114393711090087890625);
    float _2739 = exp2(_2723);
    float _2741 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2743 = fma(_2725, _2737, 1.570728778839111328125);
    float _2745 = sqrt(_2721);
    float _2747 = _2691 + 1.0;
    float _2749 = _2729 * _2727;
    float2 _7888 = float2(_2677, _2709);
    float _2751 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7888, float2(0.0), isnan(_7888)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7888, float2(0.0), isnan(_7888)), level(0.0)).x;
    float _2753 = fma(_2749, 0.5, 0.5);
    float _2755 = -_2691;
    float _2757 = fma(_2739, _2747, _2755);
    float _2759 = _2731 * _2727;
    float _2761 = fma(_2757, 0.5, 0.5);
    float _2763 = fma(_2759, -0.5, 0.5);
    float _2765 = _2745 * 0.636619746685028076171875;
    float _2767 = -_2743;
    float _2769 = fma(_2765, _2767, 1.0);
    float3 _7920 = float3(_2753, _2763, _2741);
    float _2771 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7920, float3(0.0), isnan(_7920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7920, float3(0.0), isnan(_7920)), level(0.0)).x;
    float3 _7931 = float3(_2753, _2763, _2741);
    float4 _2774 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7931, float3(0.0), isnan(_7931)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7931, float3(0.0), isnan(_7931)), level(0.0)).xyzw;
    float _2776 = _2774.x;
    float _2778 = _2774.y;
    float _2780 = _2774.z;
    float _2782 = _2774.w;
    float2 _7947 = float2(_2769, _2761);
    float3 _2786 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7947, float2(0.0), isnan(_7947)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7947, float2(0.0), isnan(_7947)), level(0.0)).xyz;
    float _2788 = _2786.x;
    float _2790 = _2786.y;
    float _2792 = _2786.z;
    out.m_76.x = _1119;
    out.m_76.y = _1121;
    out.m_76.z = _1123;
    out.m_76.w = _1125;
    float _2794 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2796 = fma(_2317, 100.0, _953);
    float _2798 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2800 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _2802 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _2800;
    out.m_66.x = _407;
    out.m_66.y = _409;
    out.m_66.z = _411;
    out.m_66.w = _413;
    float _2804 = -_1135;
    float _2806 = _2804 + _2796;
    float _2808 = fma(_2802, _1597, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _2810 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2814 = _2808 * _1925;
    float _2816 = fma(_2812, _1585, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _2818 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _2818;
    float _2822 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2814);
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2828 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2830 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2828;
    float _2832 = fma(_2820, _1601, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _2834 = fma(_2816, _1967, _2822);
    float _2836 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2838 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2836;
    float _2840 = fma(_2826, _1619, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2846 = fma(_2832, _1935, _2834);
    float _2848 = fma(_2838, _1655, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2850 = _1351 * _2133;
    float _2852 = fma(_2844, _1761, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2854 = fma(_2840, _1885, _2846);
    float _2856 = _1351 * _2181;
    float _2858 = _1281 * _2133;
    float _2860 = -_1263;
    float _2862 = fma(_2860, _2099, _2850);
    float _2864 = _1351 * _2125;
    float _2866 = -_1263;
    float _2868 = fma(_2866, _2107, _2856);
    float _2870 = _1325 * _2133;
    float _2872 = fma(_1353, _2099, _2858);
    float _2874 = fma(_1355, _1635, _2862);
    float _2876 = fma(_1355, _1637, _2868);
    float _2878 = fma(_1359, _2099, _2870);
    float _2880 = fma(_1305, _1635, _2872);
    float _2882 = _2794 * _2874;
    float _2884 = _2794 * _2876;
    float _2886 = fma(_1283, _1635, _2878);
    float _2888 = fma(_2830, _1691, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2890 = fma(_2798, _2880, _2882);
    float _2892 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2894 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2896 = _1281 * _2181;
    float _2898 = _2886 + _2890;
    float _2900 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2892);
    float _2902 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2894);
    float _2904 = fma(_2848, _1871, _2854);
    float _2906 = -_1263;
    float _2908 = fma(_2906, _2119, _2864);
    float _2910 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2900);
    float _2912 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2902);
    float _2914 = fma(_1353, _2107, _2896);
    float _2916 = fma(_2852, _1845, _2904);
    float _2918 = _2910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2920 = _2912 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2922 = fma(_1355, _1639, _2908);
    float _2924 = fma(_1305, _1637, _2914);
    float _2926 = 1.0 / _2918;
    float _2928 = _2920 + _2918;
    float _2930 = fma(_2888, _1793, _2916);
    float _2932 = fma(_2798, _2924, _2884);
    float _2934 = _1281 * _2125;
    float _2936 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2930);
    float _2938 = in.m_68.x;
    float _2940 = _1325 * _2181;
    float _2942 = _1325 * _2125;
    out.m_78.x = _2936;
    float _2944 = fma(_1353, _2119, _2934);
    float _2946 = _2687 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2948 = fma(_1359, _2107, _2940);
    float _2950 = _2928 * _2926;
    float _2952 = _2950 * 0.5;
    bool _2954 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2956 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2958 = _2954 || _2956;
    bool _2960 = isnan(0.5);
    bool _2962 = _2958 || _2960;
    float _2964 = fma(_1359, _2119, _2942);
    float _2966 = fma(_1305, _1639, _2944);
    float _2968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2970 = fma(_2952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2968);
    float _2972 = _2794 * _2922;
    float _2974 = exp2(_2946);
    float _2976 = fma(_1283, _1637, _2948);
    float _2978 = fma(_1283, _1639, _2964);
    float _2980 = fma(_2798, _2966, _2972);
    float _2982 = _2689 * 0.5;
    float _2984 = _2976 + _2932;
    float _2986 = _2978 + _2980;
    float _2988 = 1.0 / _2970;
    float _2990 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2992 = _2988 * _2990;
    float _2994 = abs(_2992);
    float _2996 = log2(_2994);
    bool _2998 = _2992 <= 8000.0;
    bool _3000 = isnan(_2992);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(8000.0);
    bool _3006 = _3002 || _3004;
    float _3008 = float(_3006);
    float _3010 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3012 = exp2(_3010);
    float _3014 = fma(_3012, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3016 = precise::clamp(_3014, 0.0, 1.0);
    float _3018 = _3012;
    float _3020 = _2982;
    float _3022 = _2689;
    float _3024 = _2731;
    float _3026 = _2729;
    if (_2962)
    {
        _3018 = 1.0;
    }
    float _3028 = _3018;
    float _3030 = fma(_3016, -2.0, 3.0);
    float _3032 = _3016 * _3016;
    float _3034 = _2649 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3036 = _3032 * _3030;
    float _3038 = fma(_2657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3034);
    float _3040 = -_3036;
    float _3042 = _3040 + 1.0;
    float _3044 = fma(_2651, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3038);
    float _3046 = fma(_3042, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3036);
    float _3048 = fma(_2673, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3044);
    float _3050 = _2729 + _2689;
    float _3052 = fma(_2731, -0.5, _2982);
    float _3054 = _3028;
    float _3056 = _3052;
    if (_2962)
    {
        _3020 = 1.0;
    }
    float _3058 = _3020;
    float _3060 = _3048 + _2689;
    float _3062 = _3050 * 0.5;
    float _3064 = _3060 * 0.5;
    float _3066 = _3058;
    float _3068 = _3064;
    if (!_2962)
    {
        float _3070 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3072 = _3070 * 0.15915493667125701904296875;
        float _3074 = _3072 * 6.283185482025146484375;
        float _3076 = cos(_3074);
        float _3078 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3080 = _3078 * 0.15915493667125701904296875;
        float _3082 = _3072 * 6.283185482025146484375;
        float _3084 = sin(_3082);
        float _3086 = 1.0 / _3076;
        float _3088 = _3080 * 6.283185482025146484375;
        float _3090 = cos(_3088);
        float _3092 = _3084 * _3086;
        float _3094 = _3080 * 6.283185482025146484375;
        float _3096 = sin(_3094);
        float _3098 = _3090 * _3092;
        float _3100 = 1.0 / _3098;
        float _3102 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3104 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3102;
        float _3106 = 1.0 / _3104;
        float _3108 = _3096 * _3100;
        float _3110 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3112 = fma(_2992, _3108, _3110);
        float _3114 = _3112 * _3106;
        float _3116 = precise::clamp(_3114, 0.0, 1.0);
        _3066 = _3116;
    }
    float _3118 = _3066;
    if (!_2962)
    {
        float _3120 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3122 = _3120 * 0.15915493667125701904296875;
        float _3124 = _3122 * 6.283185482025146484375;
        float _3126 = cos(_3124);
        float _3128 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3130 = _3128 * 0.15915493667125701904296875;
        float _3132 = _3122 * 6.283185482025146484375;
        float _3134 = sin(_3132);
        float _3136 = 1.0 / _3126;
        float _3138 = _3130 * 6.283185482025146484375;
        float _3140 = cos(_3138);
        float _3142 = _3134 * _3136;
        float _3144 = _3130 * 6.283185482025146484375;
        float _3146 = sin(_3144);
        float _3148 = _3140 * _3142;
        float _3150 = 1.0 / _3148;
        float _3152 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3154 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3152;
        float _3156 = 1.0 / _3154;
        float _3158 = _3146 * _3150;
        float _3160 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3162 = fma(_2992, _3158, _3160);
        float _3164 = _3162 * _3156;
        float _3166 = precise::clamp(_3164, 0.0, 1.0);
        float _3168 = -_3166;
        float _3170 = _3168 + 1.0;
        _3054 = _3170;
    }
    float _3172 = _3054;
    float _3174 = _3008 * _3046;
    float _3176 = -_2974;
    float _3178 = _3176 + 1.0;
    float _3180 = -_2751;
    float _3182 = _3180 + 1.0;
    float _3184 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3186 = _3178 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _3062;
    out.m_80.y = _3052;
    out.m_80.z = _3064;
    out.m_80.w = _2689;
    bool _3188 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3190 = isnan(_2477);
    bool _3192 = _3188 || _3190;
    bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3196 = _3192 || _3194;
    float _3198 = _3182 * _3184;
    float _3200 = precise::clamp(_3198, 0.0, 1.0);
    float _3202 = _3186 * _2771;
    out.m_82.x = _2898;
    out.m_82.y = _2984;
    out.m_82.z = _2986;
    float _3204 = -_3200;
    float _3206 = fma(_3204, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3208 = _2782 * _3202;
    float _3210 = _2792 * _3202;
    out.gl_Position.x = _2729;
    out.gl_Position.y = _2731;
    out.gl_Position.z = _3048;
    out.gl_Position.w = _2689;
    float _3212 = _3206 * _2938;
    float _3214 = fma(_2788, _3208, _2776);
    float _3216 = fma(_2790, _3208, _2778);
    float _3218 = fma(_2782, _3210, _2780);
    float _3220 = -_3186;
    float _3222 = _3220 + 1.0;
    float _3224 = _3212 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3226 = _3222;
    if (!_3196)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3228 = _3022;
    float _3230 = _2782 * _3222;
    float _3232 = _3228;
    float _3234 = _3228;
    if (!_3196)
    {
        _3068 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3236 = _3068;
    out.m_84.x = _3224;
    float _3238 = _3236;
    float _3240 = _3236;
    if (!_3196)
    {
        _3056 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3242 = _3056;
    float _3244 = _3118 * _3172;
    out.m_86.x = _3214;
    out.m_86.y = _3216;
    out.m_86.z = _3218;
    out.m_86.w = _3230;
    float _3246 = _3242;
    float _3248 = _3242;
    if (!_3196)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3250 = _3024;
    float _3252 = _3250;
    float _3254 = _3250;
    if (!_3196)
    {
        _3026 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3256 = _3026;
    float _3258 = _3244 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3260 = _3256;
    float _3262 = _3256;
    if (!_3196)
    {
        _3226 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3264 = _3226;
    bool _3266 = !_3196;
    float _3268 = _3264;
    float _3270 = _3264;
    if (!_3266)
    {
        bool _3272 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3274 = isnan(_2477);
        bool _3276 = _3272 || _3274;
        bool _3278 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3280 = _3276 || _3278;
        if (!_3280)
        {
            float _3282 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3284 = _2477 + _3282;
            float _3286 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3288 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3286;
            float _3290 = 1.0 / _3288;
            float _3292 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3294 = _3292 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3296 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3298 = _3296 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3300 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3302 = _3300 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3312 = _3284 * _3290;
            float _3314 = precise::clamp(_3312, 0.0, 1.0);
            float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3320 = fma(_3314, _3294, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3322 = fma(_3314, _3318, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3324 = fma(_3314, _3298, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3326 = fma(_3314, _3302, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3328 = fma(_3314, _3306, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3330 = fma(_3314, _3310, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3262 = _3322;
            _3248 = _3328;
            _3254 = _3320;
            _3240 = _3326;
            _3234 = _3324;
            _3270 = _3330;
            _3332 = true;
        }
        else
        {
            bool _3334 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3336 = isnan(_2477);
            bool _3338 = _3334 || _3336;
            bool _3340 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3342 = _3338 || _3340;
            if (!_3342)
            {
                _3252 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3344 = _3252;
            _3254 = _3344;
            if (!_3342)
            {
                _3260 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3346 = _3260;
            _3262 = _3346;
            if (!_3342)
            {
                _3232 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3348 = _3232;
            _3234 = _3348;
            if (!_3342)
            {
                _3238 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3350 = _3238;
            _3240 = _3350;
            if (!_3342)
            {
                _3246 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3352 = _3246;
            _3248 = _3352;
            if (!_3342)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3354 = _3268;
            bool _3356 = !_3342;
            _3270 = _3354;
            if (!_3356)
            {
                bool _3358 = _2477 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3360 = isnan(_2477);
                bool _3362 = _3358 || _3360;
                bool _3364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3366 = _3362 || _3364;
                if (!_3366)
                {
                    float _3368 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3370 = _2477 + _3368;
                    float _3372 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3374 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3372;
                    float _3376 = 1.0 / _3374;
                    float _3378 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3380 = _3378 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3382 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3384 = _3382 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3398 = _3370 * _3376;
                    float _3400 = precise::clamp(_3398, 0.0, 1.0);
                    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3404 = _3402 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3406 = fma(_3400, _3380, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3408 = fma(_3400, _3404, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3410 = fma(_3400, _3384, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3412 = fma(_3400, _3388, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3414 = fma(_3400, _3392, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3416 = fma(_3400, _3396, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3262 = _3408;
                    _3248 = _3414;
                    _3254 = _3406;
                    _3240 = _3412;
                    _3234 = _3410;
                    _3270 = _3416;
                    _3332 = true;
                }
                else
                {
                    _3262 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3248 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3254 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3240 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3234 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3332 = false;
    float _3418 = _3262;
    float _3420 = _3248;
    float _3422 = _3254;
    float _3424 = _3240;
    float _3426 = _3234;
    float _3428 = _3270;
    float _3430 = fma(_2984, -0.5, 0.5);
    float _3432 = precise::clamp(_3430, 0.0, 1.0);
    float _3434 = -_3418;
    float _3436 = _3434 + _3420;
    float _3438 = -_3422;
    float _3440 = _3438 + _3424;
    out.m_88.x = 0.0;
    float _3442 = fma(_3432, _3436, _3418);
    float _3444 = -_3426;
    float _3446 = _3444 + _3428;
    float _3448 = fma(_3432, _3440, _3422);
    float _3450 = _3442 * 0.586610972881317138671875;
    bool _3452 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3454 = fma(_3432, _3446, _3426);
    float _3456 = _3258 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3458 = fma(_3448, 0.298911988735198974609375, _3450);
    bool _3460 = _3118 > 0.0;
    bool _3462 = isnan(_3118);
    bool _3464 = _3460 || _3462;
    bool _3466 = isnan(0.0);
    bool _3468 = _3464 || _3466;
    float _3470 = fma(_3454, 0.114477999508380889892578125, _3458);
    out.m_51.x = _3456;
    bool _3472 = _3172 <= 0.0;
    bool _3474 = !_3468;
    bool _3476 = _3472 || _3474;
    float _3478 = -_3470;
    float _3480 = _3448 + _3478;
    float _3482 = -_3470;
    float _3484 = _3442 + _3482;
    float _3486 = -_3470;
    float _3488 = _3454 + _3486;
    float _3490 = fma(_3480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    float _3492 = fma(_3484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    float _3494 = fma(_3488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3470);
    bool _3496 = !_3452;
    if (!_3496)
    {
        float _3498 = -_2443;
        float _3500 = _3498 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3502 = -_2447;
        float _3504 = _3502 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3506 = -_2451;
        float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3510 = _3500 * _3500;
        float _3512 = fma(_3504, _3504, _3510);
        float _3514 = fma(_3508, _3508, _3512);
        float _3516 = sqrt(_3514);
        float _3518 = rsqrt(_3514);
        float _3520 = -_3516;
        float _3522 = _3520 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3524 = _3522 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3526 = precise::clamp(_3524, 0.0, 1.0);
        float _3528 = _3504 * _3518;
        float _3530 = _3500 * _3518;
        float _3532 = abs(_3526);
        float _3534 = log2(_3532);
        float _3536 = _3508 * _3518;
        float _3538 = _3528 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3540 = _2984 * _3530;
        float _3542 = -_3530;
        float _3544 = -_3538;
        float _3546 = fma(_3542, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3544);
        float _3548 = fma(_2898, _3528, _3540);
        float _3550 = -_3536;
        float _3552 = fma(_3550, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3546);
        float _3554 = fma(_2986, _3536, _3548);
        float _3556 = precise::clamp(_3554, 0.0, 1.0);
        float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3560 = _3552 + _3558;
        float _3562 = _3534 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3564 = _3560 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3566 = precise::clamp(_3564, 0.0, 1.0);
        float _3568 = exp2(_3562);
        float _3570 = _3568 * _3566;
        float _3572 = _3556 * _3570;
        float _3574 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3576 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3578 = _3572 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3574;
        out.m_88.y = _3576;
        out.m_88.z = _3578;
    }
    out.m_90.x = _3490;
    out.m_90.y = _3492;
    out.m_90.z = _3494;
    if (!_3476)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3580 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3580;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

