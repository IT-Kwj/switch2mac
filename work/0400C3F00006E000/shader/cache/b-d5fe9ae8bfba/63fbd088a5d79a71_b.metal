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
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_68 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _493 = false;
    bool _293 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_111);
        out.gl_Position.z = _2229;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_149);
        out.gl_Position.z = _2298;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _155 = as_type<int>(_151) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_151) & 2;
    bool _161 = _159 != 0;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_153;
    float _189;
    if (!_171)
    {
        float _173 = in.m_52.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_95);
        float _195 = 1.0 / _193;
        float _197 = _129 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    bool _205 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _207 = isnan(_199);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _213 = _209 || _211;
    float _215 = float(_213);
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _217;
    float _221 = -_215;
    float _223 = _221 + 1.0;
    bool _225 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _227 = isnan(_199);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _219;
    float _245 = _235 * _223;
    float _247 = -_235;
    float _249 = _247 + 1.0;
    float _251 = _203 * _243;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = fma(_239, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _259 = fma(_255, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _257 * _245;
    float _263 = _259 * _245;
    float _265 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[143].x, _261);
    float _267 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[143].y, _263);
    float _269 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[144].x, _265);
    float _271 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[144].y, _267);
    bool _273 = !_241;
    float _291;
    if (!_273)
    {
        float _275 = in.m_52.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _305 = _301 + _303;
    float _307 = in.m_54.x;
    float _309 = in.m_54.y;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _335 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _337 = isnan(_301);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _313;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _349;
    float _353 = -_329;
    float _355 = _353 + 1.0;
    bool _357 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_301);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _371 = 1.0 / _317;
    float _373 = 1.0 / _333;
    float _375 = _351 * _347;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _381 = _345 * _355;
    float _383 = -_345;
    float _385 = _383 + 1.0;
    float _387 = fma(_375, _305, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _389;
    float _393 = _271 * _309;
    float _395 = _367 * _385;
    float _397 = _379 * _371;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _401 = _301 + _399;
    bool _403 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _405 = isnan(_301);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _387 * _395;
    float _417 = -_367;
    float _419 = _417 + 1.0;
    float _421 = fma(_397, _401, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = _301 + _423;
    float _427 = _391 * _373;
    float _429 = -_413;
    float _431 = _429 + 1.0;
    float _433 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[115].x, _415);
    float _435 = fma(_427, _425, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _437 = _329 * _431;
    float _439 = fma(_421, _381, _433);
    float _441 = _269 * _307;
    float _443 = fma(_435, _437, _439);
    float _445 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[118].x, _443);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _459 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _465;
    out.m_56.y = _467;
    out.m_56.z = _469;
    out.m_58.x = _459;
    out.m_58.y = _461;
    out.m_58.z = _463;
    out.m_58.w = _471;
    bool _473 = !_369;
    float _491;
    if (!_473)
    {
        float _475 = in.m_52.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_95);
        float _497 = 1.0 / _495;
        float _499 = _129 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_42.x;
    float _505 = in.m_42.y;
    float _507 = in.m_42.z;
    float _509 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = in.m_60.z;
    float _517 = in.m_60.w;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _521 = _519 != 0;
    float _523 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _525 = in.m_62.x;
    float _527 = in.m_62.y;
    float _529 = in.m_62.z;
    float _531 = in.m_62.w;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _543 = _541 != 0;
    float _545 = in.m_64.x;
    float _547 = in.m_64.y;
    float _549 = in.m_64.z;
    float _551 = in.m_64.w;
    float _553 = in.m_52.x;
    float _555 = in.m_52.y;
    float _557 = in.m_52.z;
    float _559 = in.m_52.w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _565 = _505 * _513;
    float _567 = _505 * _527;
    float _569 = fma(_503, _511, _565);
    float _571 = fma(_503, _525, _567);
    float _573 = _505 * _547;
    float _575 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _577 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _579 = fma(_503, _545, _573);
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _583 = _555 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _585 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _587 = _555 + _557;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _591 = fma(_583, -2.0, _581);
    float _593 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _595 = _587 + (-1.0);
    float _597 = _557 * 2.0;
    float _599 = -_589;
    float _601 = fma(_577, 2.0, _599);
    float _603 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _593);
    float _605 = _553 * 2.0;
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = _555 + _553;
    float _611 = fma(_507, _549, _579);
    float _613 = fma(_507, _529, _571);
    float _615 = _555 * 2.0;
    float _617 = floor(_597);
    float _619 = _609 + (-1.0);
    float _621 = fma(_507, _515, _569);
    float _623 = _609;
    float _625 = _515;
    float _627 = _605;
    if (!_521)
    {
        _623 = _557;
    }
    float _629 = _623;
    float _631 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _633 = floor(_605);
    float _635 = _629;
    if (_521)
    {
        _635 = _555;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_521)
    {
        _625 = _555;
    }
    float _641 = _625;
    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _585);
    float _645 = _641;
    if (_521)
    {
        _645 = _553;
    }
    float _647 = _645;
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[83].w, _639);
    float _651 = floor(_615);
    if (!_521)
    {
        _627 = _557;
    }
    float _653 = _627;
    float _655 = _621 + _517;
    float _657 = _653;
    if (_521)
    {
        _657 = _555;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _663 = _617 >= 0.0;
    bool _665 = isnan(_617);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = _647 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _675 = _617 > 0.0;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    bool _681 = _633 > 0.0;
    float _683 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _661);
    bool _685 = _633 >= 0.0;
    bool _687 = isnan(_633);
    bool _689 = _685 || _687;
    bool _691 = isnan(0.0);
    bool _693 = _689 || _691;
    float _695 = _613 + _531;
    float _697 = -_561;
    float _699 = fma(_673, 2.0, _697);
    int _701 = _671 ? 0 : 1;
    float _703 = _659 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _705 = _693 ? 0 : 1;
    float _707 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[78].w, _563);
    bool _709 = _651 > 0.0;
    bool _711 = _651 >= 0.0;
    bool _713 = isnan(_651);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _603);
    float _723 = _611 + _551;
    int _725 = _719 ? 0 : 1;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _729 = _679 * _129;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _733 = ~_725;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    float _739 = fma(_703, -2.0, _727);
    int _741 = _737;
    if (!_709)
    {
        int _743 = ~_725;
        int _745 = _743 + 1;
        _741 = _745;
    }
    int _747 = _741;
    float _749 = exp2(_729);
    int _751 = ~_705;
    int _753 = _751 + 1;
    int _755 = _753 + 1;
    float _757 = in.m_66.x;
    float _759 = in.m_66.y;
    float _761 = in.m_66.z;
    int _763 = _755;
    if (!_681)
    {
        int _765 = ~_705;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _773 = 1.0 + _771;
    float _775 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _731);
    bool _777 = !_535;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_539;
    int _783 = _781 ? 0 : 1;
    float _785 = 1.0 / _773;
    int _787 = ~_701;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    int _793 = _791;
    if (!_675)
    {
        int _795 = ~_701;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = -_129;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _601);
    int _805 = abs(_779);
    float _807 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _775);
    int _809 = abs(_783);
    float _811 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _591);
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _649);
    float _825 = -_129;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[81].x, _699);
    float _829 = float(_805);
    float _831 = -_749;
    float _833 = _831 + 1.0;
    float _835 = float(_799);
    float _837 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _707);
    bool _839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(0.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = rsqrt(_721);
    float _851 = float(_809);
    float _853 = _829 * _835;
    float _855 = _847 ? _833 : 0.0;
    float _857 = -_723;
    float _859 = _857 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = float(_769);
    float _863 = _853 * (-2.0);
    float _865 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _683);
    float _867 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    float _869 = _803;
    if (_821)
    {
        float _871 = _855 * _785;
        _133 = _871;
    }
    float _873 = _133;
    float _875 = _851 * _861;
    float _877 = -_695;
    float _879 = _877 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _859 * _859;
    float _883 = fma(_863, _757, _757);
    float _885 = _553 + (-0.5);
    bool _887 = !_543;
    int _889 = _887 ? 0 : 1;
    float _891 = fma(_879, _879, _881);
    float _893 = fma(_631, _863, _631);
    float _895 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].x, _883);
    int _897 = abs(_889);
    float _899 = _875 * (-2.0);
    float _901 = -_655;
    float _903 = _901 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = fma(_893, _873, _895);
    float _907 = float(_747);
    float _909 = fma(_899, _759, _759);
    float _911 = fma(_903, _903, _891);
    float _913 = _555 + (-0.5);
    float _915 = fma(_607, _899, _607);
    float _917 = float(_897);
    float _919 = rsqrt(_911);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _909);
    float _923 = _557 + _553;
    float _925 = _905 * 0.15915493667125701904296875;
    float _927 = _917 * _907;
    float _929 = fma(_915, _873, _921);
    float _931 = _923 + (-1.0);
    float _933 = _927 * (-2.0);
    float _935 = rsqrt(_643);
    float _937 = _929 * 0.15915493667125701904296875;
    float _939 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _941 = _557 + (-0.5);
    float _943 = _169 * _849;
    bool _945 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _953 = _949 || _951;
    float _955 = fma(_939, _933, _939);
    float _957 = _879 * _919;
    float _959 = _903 * _919;
    float _961 = fma(_933, _761, _761);
    float _963 = _859 * _919;
    float _965 = _925 * 6.283185482025146484375;
    float _967 = sin(_965);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _959 * _969;
    float _973 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _977 = _963 * _975;
    float _979 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _943);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _983 = -_971;
    float _985 = fma(_963, _981, _983);
    float _987 = fma(_955, _873, _973);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _991 = _957 * _989;
    float _993 = _925 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _999 = -_977;
    float _1001 = fma(_957, _997, _999);
    float _1003 = _987 * 0.15915493667125701904296875;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1007 = -_991;
    float _1009 = fma(_959, _1005, _1007);
    float _1011 = _165 * _935;
    float _1013 = _1009 * _1009;
    float _1015 = _937 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1021 = fma(_985, _985, _1013);
    float _1023 = _509 * _979;
    float _1025 = _523 * _1019;
    float _1027 = fma(_1001, _1001, _1021);
    float _1029 = _937 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = _1003 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _995 * _1017;
    float _1039 = _967 * _1017;
    float _1041 = _1003 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    float _1045 = _967 * _1031;
    float _1047 = rsqrt(_1027);
    float _1049 = -_1037;
    float _1051 = fma(_1035, _1045, _1049);
    float _1053 = -_1045;
    float _1055 = fma(_1035, _1037, _1053);
    float _1057 = _995 * _1031;
    float _1059 = _1043 * _1023;
    float _1061 = _1017 * _1043;
    float _1063 = _1031 * _1043;
    float _1065 = -_1023;
    float _1067 = _1035 * _1065;
    float _1069 = fma(_1035, _1057, _1039);
    float _1071 = _995 * _1059;
    float _1073 = fma(_1035, _1039, _1057);
    float _1075 = fma(_1063, _1025, _1067);
    float _1077 = _985 * _1047;
    float _1079 = _967 * _1059;
    float _1081 = fma(_1069, _1025, _1071);
    float _1083 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1085 = _1009 * _1047;
    float _1087 = _963 * _1077;
    float _1089 = _1001 * _1047;
    float _1091 = fma(_1055, _1083, _1081);
    float _1093 = _959 * _1085;
    float _1095 = -_1087;
    float _1097 = fma(_957, _1085, _1095);
    float _1099 = fma(_1051, _1025, _1079);
    float _1101 = fma(_1061, _1083, _1075);
    float _1103 = -_1093;
    float _1105 = fma(_963, _1089, _1103);
    float _1107 = _1097 * _1091;
    float _1109 = fma(_1073, _1083, _1099);
    float _1111 = _1105 * _1091;
    float _1113 = fma(_1089, _1101, _1107);
    float _1115 = _957 * _1089;
    float _1117 = fma(_1077, _1101, _1111);
    float _1119 = fma(_959, _1109, _1113);
    float _1121 = -_1115;
    float _1123 = fma(_959, _1077, _1121);
    float _1125 = fma(_957, _1109, _1117);
    float _1127 = _655 + _1119;
    float _1129 = _1123 * _1091;
    float _1131 = _695 + _1125;
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1127 + _1133;
    float _1137 = fma(_1085, _1101, _1129);
    float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1141 = _1131 + _1139;
    float _1143 = _1135 * _1135;
    float _1145 = fma(_963, _1109, _1137);
    float _1147 = fma(_1141, _1141, _1143);
    float _1149 = _723 + _1145;
    float _1151 = sqrt(_1147);
    bool _1153 = _1151 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1155 = _1143;
    float _1157 = _1131;
    float _1159 = _1127;
    float _1161 = _1123;
    float _1163 = _1109;
    float _1165 = _959;
    if (!_1153)
    {
        _1155 = _1149;
    }
    float _1167 = _1155;
    bool _1169 = !_1153;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1151 + _1175;
        float _1179 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = rsqrt(_1147);
        float _1183 = _1177 * _1173;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = _1189 + (-1.0);
        float _1197 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = fma(_1193, _1179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1201 = fma(_1149, _1189, _1197);
        float _1203 = _1181 * _1199;
        float _1205 = fma(_1141, _1203, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1207 = fma(_1135, _1203, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1171 = _1201;
        _1157 = _1205;
        _1159 = _1207;
        _1161 = _1185;
    }
    float _1209 = _1171;
    float _1211 = _1157;
    float _1213 = _1159;
    float _1215 = _1161;
    float _1217 = _1209;
    float _1219 = _1211;
    float _1221 = _1213;
    if (!_953)
    {
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1225 = _723 + _1223;
        float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1229 = _695 + _1227;
        float _1231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1233 = -_723;
        float _1235 = _1233 + _1209;
        float _1237 = _1225 * _1225;
        float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1241 = _655 + _1239;
        float _1243 = fma(_1229, _1229, _1237);
        float _1245 = -_695;
        float _1247 = _1245 + _1211;
        float _1249 = fma(_1241, _1241, _1243);
        float _1251 = sqrt(_1249);
        float _1253 = precise::min(_1251, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1255 = _1253 * _1231;
        float _1257 = -_655;
        float _1259 = _1257 + _1213;
        float _1261 = fma(_1247, _1255, _695);
        float _1263 = fma(_1235, _1255, _723);
        float _1265 = fma(_1259, _1255, _655);
        _1217 = _1263;
        _1219 = _1261;
        _1221 = _1265;
    }
    float _1267 = _1217;
    float _1269 = _1219;
    float _1271 = _1221;
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1275 = _1267 + _1273;
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1279 = _1269 + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1283 = _1271 + _1281;
    float _1285 = _1275 * _1275;
    float _1287 = fma(_1279, _1279, _1285);
    float _1289 = fma(_1283, _1283, _1287);
    float _1291 = rsqrt(_1289);
    float _1293 = sqrt(_1289);
    float _1295 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1297 = _1279 * _1295;
    float _1299 = _1283 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 + _1303;
    float _1307 = sqrt(_1305);
    bool _1309 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = _1307 + _1311;
    float _1315 = _1291;
    float _1317 = _1305;
    float _1319 = _1313;
    float _1321 = _1295;
    if (_1309)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1315 = _1323;
    }
    float _1325 = _1315;
    if (_1309)
    {
        float _1327 = rsqrt(_1305);
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = _1329;
    if (_1309)
    {
        float _1333 = _1313 * _1325;
        _1319 = _1333;
    }
    float _1335 = _1319;
    if (_1309)
    {
        float _1337 = _1335 * 0.15915493667125701904296875;
        _1163 = _1337;
    }
    float _1339 = _1163;
    float _1341 = _1283;
    if (_1309)
    {
        float _1343 = _1339 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        _1341 = _1345;
    }
    float _1347 = _1341;
    float _1349 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1351 = precise::max(0.0, _1349);
    float _1353 = _1215;
    float _1355 = _1351;
    float _1357 = _1349;
    if (_1309)
    {
        float _1359 = _1339 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        _1353 = _1361;
    }
    float _1363 = _1353;
    float _1365 = -_1295;
    float _1367 = -_1351;
    float _1369 = fma(_1275, _1365, _1367);
    float _1371 = _1369;
    if (_1309)
    {
        float _1373 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1355 = _1373;
    }
    float _1375 = _1355;
    float _1377 = _1347;
    float _1379 = _1375;
    if (_1309)
    {
        float _1381 = fma(_1347, _1375, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = _1383;
    if (!_1309)
    {
        _1379 = _1297;
    }
    float _1387 = _1379;
    float _1389 = _1387;
    if (_1309)
    {
        float _1391 = _1363 + (-1.0);
        _1357 = _1391;
    }
    float _1393 = _1357;
    float _1395 = _1393;
    if (_1309)
    {
        float _1397 = _1329 * _1383;
        _1165 = _1397;
    }
    float _1399 = _1165;
    if (!_1309)
    {
        _1385 = _1369;
    }
    float _1401 = _1385;
    float _1403 = _1401;
    if (_1309)
    {
        float _1405 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1405;
    }
    float _1407 = _1321;
    if (_1309)
    {
        float _1409 = _1297 * _1399;
        _1389 = _1409;
    }
    float _1411 = _1389;
    if (!_1309)
    {
        _1395 = _1299;
    }
    float _1413 = _1395;
    float _1415 = _1413;
    if (_1309)
    {
        float _1417 = _1299 * _1399;
        _1415 = _1417;
    }
    float _1419 = _1415;
    if (!_1309)
    {
        _1331 = _1301;
    }
    float _1421 = _1331;
    float _1423 = _1421;
    if (_1309)
    {
        float _1425 = fma(_1369, _1363, _1407);
        _1403 = _1425;
    }
    float _1427 = _1403;
    if (_1309)
    {
        float _1429 = _1411 * _1411;
        _1423 = _1429;
    }
    float _1431 = _1423;
    if (!_1309)
    {
        _1371 = _1303;
    }
    float _1433 = _1371;
    float _1435 = _1433;
    if (_1309)
    {
        float _1437 = _1419 * _1419;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = fma(_1427, _1427, _1431);
    float _1443 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1445 = _1441 + _1439;
    float _1447 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1457 = rsqrt(_1445);
    float _1459 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1461 = -_1453;
    float _1463 = _1461 + 1.0;
    float _1465 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1455);
    float _1469 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1447);
    float _1473 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = abs(_1463);
    float _1477 = log2(_1475);
    float _1479 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1467);
    float _1481 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1485 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1457 * _1411;
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1497 = _1457 * _1427;
    float _1499 = -_1489;
    float _1501 = fma(_1499, _1459, 1.0);
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1505 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1485);
    float _1507 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1495);
    float _1509 = _1457 * _1419;
    float _1511 = -_1503;
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1511);
    float _1515 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1517 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1519 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1507);
    float _1521 = -_1509;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1513);
    float _1525 = exp2(_1515);
    float _1527 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1519);
    float _1531 = fma(_1523, -0.5, 0.5);
    float _1533 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1527);
    float _1537 = fma(_1523, 0.5, 0.5);
    float _1539 = 1.0 / _1529;
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1543 = _1497 + 1.0;
    float _1545 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1541);
    float _1551 = log2(_1501);
    float _1553 = -_1497;
    float _1555 = fma(_1525, _1543, _1553);
    float _1557 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1549);
    float _1559 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1561 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1563 = sqrt(_1531);
    float _1565 = _1557 * _1539;
    float _1567 = _1559 * _1539;
    float _1569 = fma(_1537, _1561, 1.570728778839111328125);
    float _1571 = fma(_1565, 0.5, 0.5);
    float _1573 = fma(_1567, -0.5, 0.5);
    float _1575 = _1551 * 0.693147182464599609375;
    float _1577 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1579 = _1563 * 0.636619746685028076171875;
    float3 _4555 = float3(_1571, _1573, _1577);
    float _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4555, float3(0.0), isnan(_4555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4555, float3(0.0), isnan(_4555)), level(0.0)).x;
    float _1583 = -_1569;
    float _1585 = fma(_1579, _1583, 1.0);
    float _1587 = fma(_1555, 0.5, 0.5);
    float3 _4573 = float3(_1571, _1573, _1577);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4573, float3(0.0), isnan(_4573)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4573, float3(0.0), isnan(_4573)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _4590 = float2(_1585, _1587);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4590, float2(0.0), isnan(_4590)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4590, float2(0.0), isnan(_4590)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1612 = _559 > 0.5;
    float _1614 = -_807;
    float _1616 = _1614 + 1.0;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1622 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1630 = _1626 || _1628;
    float _1632 = exp2(_1610);
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1638 = _553 > 0.5;
    float _1640 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1644 = _1642 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1646 = _555 > 0.5;
    float _1648 = 1.0 / _1620;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1658 = -_169;
    int _1660 = _1646 ? as_type<int>(_1658) : as_type<int>(_169);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1666 = 1.0 / _1644;
    bool _1668 = _557 > 0.5;
    float _1670 = -_1632;
    float _1672 = _1670 + 1.0;
    float _1674 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1640);
    float _1676 = -_169;
    int _1678 = _1612 ? as_type<int>(_1676) : as_type<int>(_169);
    out.m_68.x = _1269;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = 1.0 / _1636;
    float _1686 = _1656 * _1648;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1694 = _1692 != 0;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1696;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1674);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1708 = _1706 != 0;
    float _1710 = 1.0 / _1664;
    float _1712 = _1698 * _1666;
    float _1714 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1704);
    bool _1716 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1718 = isnan(_501);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1724 = _1720 || _1722;
    float _1726 = float(_1724);
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1732 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1734 = isnan(_501);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1740 = _1736 || _1738;
    float _1742 = float(_1740);
    float _1744 = 1.0 / _1690;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1750 = _1652 * _1684;
    float _1752 = -_1726;
    float _1754 = _1752 + 1.0;
    float _1756 = -_1742;
    float _1758 = _1756 + 1.0;
    bool _1760 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1762 = isnan(_501);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1768 = _1764 || _1766;
    float _1770 = float(_1768);
    float _1772 = _1742 * _1754;
    float _1774 = 1.0 / _1730;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1778 = _1776 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1780 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1782 = isnan(_501);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1792;
    float _1796 = -_1770;
    float _1798 = _1796 + 1.0;
    float _1800 = _1778 * _1710;
    float _1802 = _1770 * _1758;
    bool _1804 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1806 = isnan(_501);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = 1.0 / _1748;
    float _1818 = _1794 * _1744;
    float _1820 = _1790 * _1798;
    float _1822 = -_1790;
    float _1824 = _1822 + 1.0;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1828 = _1826 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1830 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1832 = isnan(_501);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    out.m_68.z = _1271;
    float _1842 = _1814 * _1824;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1844;
    float _1848 = -_1814;
    float _1850 = _1848 + 1.0;
    bool _1852 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1854 = isnan(_501);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1828 * _1774;
    float _1866 = -_1840;
    float _1868 = _1866 + 1.0;
    float _1870 = _1840 * _1850;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1874 = _501 + _1872;
    float _1876 = _1846 * _1816;
    bool _1878 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1880 = isnan(_501);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = -_1862;
    float _1892 = _1890 + 1.0;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1896 = _501 + _1894;
    float _1898 = fma(_1750, _1874, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1900 = _1862 * _1868;
    float _1902 = _1888 * _1892;
    float _1904 = fma(_1686, _1896, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1908 = _501 + _1906;
    float _1910 = -_1888;
    float _1912 = _1910 + 1.0;
    float _1914 = _1898 * _1902;
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1918 = _501 + _1916;
    float _1920 = _723 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1922 = fma(_1800, _1908, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1924 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1914);
    float _1926 = fma(_1712, _1918, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1928 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1920);
    float _1930 = _723 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1932 = fma(_1904, _1900, _1924);
    float _1934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1936 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1928);
    float _1938 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1930);
    float _1940 = -_165;
    int _1942 = _1638 ? as_type<int>(_1940) : as_type<int>(_165);
    float _1944 = fma(_1926, _1870, _1932);
    float _1946 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1948 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1938);
    bool _1950 = !_1682;
    float _1952 = _1950 ? _165 : as_type<float>(_1942);
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1956 = _501 + _1954;
    float _1958 = 1.0 / _1946;
    bool _1960 = !_1694;
    float _1962 = _1960 ? _169 : as_type<float>(_1660);
    float _1964 = fma(_1922, _1842, _1944);
    bool _1966 = !_1708;
    float _1968 = _1966 ? _169 : as_type<float>(_1678);
    float _1970 = _1948 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1972 = -_165;
    int _1974 = _1668 ? as_type<int>(_1972) : as_type<int>(_165);
    float _1976 = fma(_1818, _1956, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1980 = _501 + _1978;
    float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1986 = _501 + _1984;
    float _1988 = _1970 + _1946;
    bool _1990 = !_1702;
    float _1992 = _1990 ? _165 : as_type<float>(_1974);
    float _1994 = fma(_1976, _1820, _1964);
    float _1996 = fma(_1876, _1986, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1998 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2000 = _1952 + 0.5;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2004 = fma(_1864, _1980, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2006 = _1876;
    float _2008 = _1996;
    float _2010 = _1992;
    if (!_1630)
    {
        _2006 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2012 = _2006;
    float _2014 = _1988 * _1958;
    float _2016 = _2014 * 0.5;
    float _2018 = fma(_1998, _2000, _803);
    float _2020 = fma(_2004, _1802, _1994);
    float _2022 = _2016;
    if (!_1630)
    {
        _869 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2024 = _869;
    if (!_1630)
    {
        float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2028 = fma(_2016, _2012, _2026);
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2034 = fma(_1996, _1772, _2020);
    float _2036 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1630)
    {
        float _2038 = -_2024;
        float _2040 = _2038 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2008 = _2040;
    }
    float _2042 = _2008;
    float _2044 = _1962 + (-0.5);
    out.gl_Position.x = _1557;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _1714;
    out.gl_Position.w = _1529;
    float _2046 = _2030;
    if (!_1630)
    {
        float _2048 = 1.0 / _2030;
        _2046 = _2048;
    }
    float _2050 = _2046;
    float _2052 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2054 = -_2036;
    float _2056 = -_811;
    float _2058 = fma(_2054, _2044, _2056);
    float _2060 = _1992 + 0.5;
    float _2062 = _1968 + (-0.5);
    float _2064 = fma(_2052, _2060, _827);
    float _2066 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2068 = _2042;
    float _2070 = _2058;
    if (!_1630)
    {
        float _2072 = 1.0 / _2042;
        _2068 = _2072;
    }
    float _2074 = _2068;
    float _2076 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2034);
    float _2078 = -_837;
    float _2080 = _2078 + 1.0;
    float _2082 = -_2066;
    float _2084 = -_867;
    float _2086 = fma(_2082, _2062, _2084);
    float _2088 = -_865;
    float _2090 = _2088 + 1.0;
    float _2092 = -_823;
    float _2094 = _2092 + 1.0;
    float _2096 = -_1616;
    float _2098 = fma(_1952, _2096, _2018);
    float _2100 = fma(_1962, _2080, _2058);
    float _2102 = -_2090;
    float _2104 = fma(_1992, _2102, _2064);
    float _2106 = fma(_1968, _2094, _2086);
    if (!_1630)
    {
        float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2110 = -_2024;
        float _2112 = fma(_2050, _2108, _2110);
        _2010 = _2112;
    }
    float _2114 = _2010;
    if (_1630)
    {
        _2070 = 1.0;
    }
    float _2116 = _2070;
    float _2118 = _1714 + _1529;
    float _2120 = _1529 * 0.5;
    out.m_70.x = _2098;
    out.m_70.y = _2100;
    out.m_70.z = _2104;
    out.m_70.w = _2106;
    float _2122 = _2116;
    if (!_1630)
    {
        float _2124 = _2114 * _2074;
        float _2126 = precise::clamp(_2124, 0.0, 1.0);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = _1557 + _1529;
    float _2132 = _2118 * 0.5;
    float _2134 = fma(_1559, -0.5, _2120);
    float _2136 = _2128 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2138 = _2128 > 0.0;
    bool _2140 = isnan(_2128);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = _2130 * 0.5;
    out.m_72.x = _2076;
    out.m_74.x = _2148;
    out.m_74.y = _2134;
    out.m_74.z = _2132;
    out.m_74.w = _1529;
    float _2150 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2152;
    float _2154 = _2150 * _1581;
    float _2156 = -_2150;
    float _2158 = _2156 + 1.0;
    float _2160 = _1598 * _2154;
    float _2162 = _1598 * _2158;
    float _2164 = _1608 * _2154;
    float _2166 = fma(_1604, _2160, _1592);
    float _2168 = fma(_1606, _2160, _1594);
    float _2170 = fma(_1598, _2164, _1596);
    out.m_76.x = _2166;
    out.m_76.y = _2168;
    out.m_76.z = _2170;
    out.m_76.w = _2162;
    if (_2146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2172 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2172;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _493 = false;
    bool _293 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_111);
        out.gl_Position.z = _2229;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_149);
        out.gl_Position.z = _2298;
    }
    if (_143)
    {
        return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _155 = as_type<int>(_151) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_151) & 2;
    bool _161 = _159 != 0;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_153;
    float _189;
    if (!_171)
    {
        float _173 = in.m_52.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_95);
        float _195 = 1.0 / _193;
        float _197 = _129 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    bool _205 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _207 = isnan(_199);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _213 = _209 || _211;
    float _215 = float(_213);
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _217;
    float _221 = -_215;
    float _223 = _221 + 1.0;
    bool _225 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _227 = isnan(_199);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _219;
    float _245 = _235 * _223;
    float _247 = -_235;
    float _249 = _247 + 1.0;
    float _251 = _203 * _243;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = fma(_239, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _259 = fma(_255, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _257 * _245;
    float _263 = _259 * _245;
    float _265 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[143].x, _261);
    float _267 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[143].y, _263);
    float _269 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[144].x, _265);
    float _271 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[144].y, _267);
    bool _273 = !_241;
    float _291;
    if (!_273)
    {
        float _275 = in.m_52.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _305 = _301 + _303;
    float _307 = in.m_54.x;
    float _309 = in.m_54.y;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _335 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _337 = isnan(_301);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _313;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _349;
    float _353 = -_329;
    float _355 = _353 + 1.0;
    bool _357 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_301);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _371 = 1.0 / _317;
    float _373 = 1.0 / _333;
    float _375 = _351 * _347;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _381 = _345 * _355;
    float _383 = -_345;
    float _385 = _383 + 1.0;
    float _387 = fma(_375, _305, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _389;
    float _393 = _271 * _309;
    float _395 = _367 * _385;
    float _397 = _379 * _371;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _401 = _301 + _399;
    bool _403 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _405 = isnan(_301);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _387 * _395;
    float _417 = -_367;
    float _419 = _417 + 1.0;
    float _421 = fma(_397, _401, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = _301 + _423;
    float _427 = _391 * _373;
    float _429 = -_413;
    float _431 = _429 + 1.0;
    float _433 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[115].x, _415);
    float _435 = fma(_427, _425, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _437 = _329 * _431;
    float _439 = fma(_421, _381, _433);
    float _441 = _269 * _307;
    float _443 = fma(_435, _437, _439);
    float _445 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[118].x, _443);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _459 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _465;
    out.m_56.y = _467;
    out.m_56.z = _469;
    out.m_58.x = _459;
    out.m_58.y = _461;
    out.m_58.z = _463;
    out.m_58.w = _471;
    bool _473 = !_369;
    float _491;
    if (!_473)
    {
        float _475 = in.m_52.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_95);
        float _497 = 1.0 / _495;
        float _499 = _129 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_42.x;
    float _505 = in.m_42.y;
    float _507 = in.m_42.z;
    float _509 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = in.m_60.z;
    float _517 = in.m_60.w;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _521 = _519 != 0;
    float _523 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _525 = in.m_62.x;
    float _527 = in.m_62.y;
    float _529 = in.m_62.z;
    float _531 = in.m_62.w;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _543 = _541 != 0;
    float _545 = in.m_64.x;
    float _547 = in.m_64.y;
    float _549 = in.m_64.z;
    float _551 = in.m_64.w;
    float _553 = in.m_52.x;
    float _555 = in.m_52.y;
    float _557 = in.m_52.z;
    float _559 = in.m_52.w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _565 = _505 * _513;
    float _567 = _505 * _527;
    float _569 = fma(_503, _511, _565);
    float _571 = fma(_503, _525, _567);
    float _573 = _505 * _547;
    float _575 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _577 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _579 = fma(_503, _545, _573);
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _583 = _555 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _585 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _587 = _555 + _557;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _591 = fma(_583, -2.0, _581);
    float _593 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _595 = _587 + (-1.0);
    float _597 = _557 * 2.0;
    float _599 = -_589;
    float _601 = fma(_577, 2.0, _599);
    float _603 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _593);
    float _605 = _553 * 2.0;
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = _555 + _553;
    float _611 = fma(_507, _549, _579);
    float _613 = fma(_507, _529, _571);
    float _615 = _555 * 2.0;
    float _617 = floor(_597);
    float _619 = _609 + (-1.0);
    float _621 = fma(_507, _515, _569);
    float _623 = _609;
    float _625 = _515;
    float _627 = _605;
    if (!_521)
    {
        _623 = _557;
    }
    float _629 = _623;
    float _631 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _633 = floor(_605);
    float _635 = _629;
    if (_521)
    {
        _635 = _555;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_521)
    {
        _625 = _555;
    }
    float _641 = _625;
    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _585);
    float _645 = _641;
    if (_521)
    {
        _645 = _553;
    }
    float _647 = _645;
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[83].w, _639);
    float _651 = floor(_615);
    if (!_521)
    {
        _627 = _557;
    }
    float _653 = _627;
    float _655 = _621 + _517;
    float _657 = _653;
    if (_521)
    {
        _657 = _555;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _663 = _617 >= 0.0;
    bool _665 = isnan(_617);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = _647 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _675 = _617 > 0.0;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    bool _681 = _633 > 0.0;
    float _683 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _661);
    bool _685 = _633 >= 0.0;
    bool _687 = isnan(_633);
    bool _689 = _685 || _687;
    bool _691 = isnan(0.0);
    bool _693 = _689 || _691;
    float _695 = _613 + _531;
    float _697 = -_561;
    float _699 = fma(_673, 2.0, _697);
    int _701 = _671 ? 0 : 1;
    float _703 = _659 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _705 = _693 ? 0 : 1;
    float _707 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[78].w, _563);
    bool _709 = _651 > 0.0;
    bool _711 = _651 >= 0.0;
    bool _713 = isnan(_651);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _603);
    float _723 = _611 + _551;
    int _725 = _719 ? 0 : 1;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _729 = _679 * _129;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _733 = ~_725;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    float _739 = fma(_703, -2.0, _727);
    int _741 = _737;
    if (!_709)
    {
        int _743 = ~_725;
        int _745 = _743 + 1;
        _741 = _745;
    }
    int _747 = _741;
    float _749 = exp2(_729);
    int _751 = ~_705;
    int _753 = _751 + 1;
    int _755 = _753 + 1;
    float _757 = in.m_66.x;
    float _759 = in.m_66.y;
    float _761 = in.m_66.z;
    int _763 = _755;
    if (!_681)
    {
        int _765 = ~_705;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _773 = 1.0 + _771;
    float _775 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _731);
    bool _777 = !_535;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_539;
    int _783 = _781 ? 0 : 1;
    float _785 = 1.0 / _773;
    int _787 = ~_701;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    int _793 = _791;
    if (!_675)
    {
        int _795 = ~_701;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = -_129;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _601);
    int _805 = abs(_779);
    float _807 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _775);
    int _809 = abs(_783);
    float _811 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _591);
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _649);
    float _825 = -_129;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[81].x, _699);
    float _829 = float(_805);
    float _831 = -_749;
    float _833 = _831 + 1.0;
    float _835 = float(_799);
    float _837 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _707);
    bool _839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(0.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = rsqrt(_721);
    float _851 = float(_809);
    float _853 = _829 * _835;
    float _855 = _847 ? _833 : 0.0;
    float _857 = -_723;
    float _859 = _857 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = float(_769);
    float _863 = _853 * (-2.0);
    float _865 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _683);
    float _867 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    float _869 = _803;
    if (_821)
    {
        float _871 = _855 * _785;
        _133 = _871;
    }
    float _873 = _133;
    float _875 = _851 * _861;
    float _877 = -_695;
    float _879 = _877 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _859 * _859;
    float _883 = fma(_863, _757, _757);
    float _885 = _553 + (-0.5);
    bool _887 = !_543;
    int _889 = _887 ? 0 : 1;
    float _891 = fma(_879, _879, _881);
    float _893 = fma(_631, _863, _631);
    float _895 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].x, _883);
    int _897 = abs(_889);
    float _899 = _875 * (-2.0);
    float _901 = -_655;
    float _903 = _901 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = fma(_893, _873, _895);
    float _907 = float(_747);
    float _909 = fma(_899, _759, _759);
    float _911 = fma(_903, _903, _891);
    float _913 = _555 + (-0.5);
    float _915 = fma(_607, _899, _607);
    float _917 = float(_897);
    float _919 = rsqrt(_911);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _909);
    float _923 = _557 + _553;
    float _925 = _905 * 0.15915493667125701904296875;
    float _927 = _917 * _907;
    float _929 = fma(_915, _873, _921);
    float _931 = _923 + (-1.0);
    float _933 = _927 * (-2.0);
    float _935 = rsqrt(_643);
    float _937 = _929 * 0.15915493667125701904296875;
    float _939 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _941 = _557 + (-0.5);
    float _943 = _169 * _849;
    bool _945 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _953 = _949 || _951;
    float _955 = fma(_939, _933, _939);
    float _957 = _879 * _919;
    float _959 = _903 * _919;
    float _961 = fma(_933, _761, _761);
    float _963 = _859 * _919;
    float _965 = _925 * 6.283185482025146484375;
    float _967 = sin(_965);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _959 * _969;
    float _973 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _977 = _963 * _975;
    float _979 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _943);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _983 = -_971;
    float _985 = fma(_963, _981, _983);
    float _987 = fma(_955, _873, _973);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _991 = _957 * _989;
    float _993 = _925 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _999 = -_977;
    float _1001 = fma(_957, _997, _999);
    float _1003 = _987 * 0.15915493667125701904296875;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1007 = -_991;
    float _1009 = fma(_959, _1005, _1007);
    float _1011 = _165 * _935;
    float _1013 = _1009 * _1009;
    float _1015 = _937 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1021 = fma(_985, _985, _1013);
    float _1023 = _509 * _979;
    float _1025 = _523 * _1019;
    float _1027 = fma(_1001, _1001, _1021);
    float _1029 = _937 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = _1003 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _995 * _1017;
    float _1039 = _967 * _1017;
    float _1041 = _1003 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    float _1045 = _967 * _1031;
    float _1047 = rsqrt(_1027);
    float _1049 = -_1037;
    float _1051 = fma(_1035, _1045, _1049);
    float _1053 = -_1045;
    float _1055 = fma(_1035, _1037, _1053);
    float _1057 = _995 * _1031;
    float _1059 = _1043 * _1023;
    float _1061 = _1017 * _1043;
    float _1063 = _1031 * _1043;
    float _1065 = -_1023;
    float _1067 = _1035 * _1065;
    float _1069 = fma(_1035, _1057, _1039);
    float _1071 = _995 * _1059;
    float _1073 = fma(_1035, _1039, _1057);
    float _1075 = fma(_1063, _1025, _1067);
    float _1077 = _985 * _1047;
    float _1079 = _967 * _1059;
    float _1081 = fma(_1069, _1025, _1071);
    float _1083 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1085 = _1009 * _1047;
    float _1087 = _963 * _1077;
    float _1089 = _1001 * _1047;
    float _1091 = fma(_1055, _1083, _1081);
    float _1093 = _959 * _1085;
    float _1095 = -_1087;
    float _1097 = fma(_957, _1085, _1095);
    float _1099 = fma(_1051, _1025, _1079);
    float _1101 = fma(_1061, _1083, _1075);
    float _1103 = -_1093;
    float _1105 = fma(_963, _1089, _1103);
    float _1107 = _1097 * _1091;
    float _1109 = fma(_1073, _1083, _1099);
    float _1111 = _1105 * _1091;
    float _1113 = fma(_1089, _1101, _1107);
    float _1115 = _957 * _1089;
    float _1117 = fma(_1077, _1101, _1111);
    float _1119 = fma(_959, _1109, _1113);
    float _1121 = -_1115;
    float _1123 = fma(_959, _1077, _1121);
    float _1125 = fma(_957, _1109, _1117);
    float _1127 = _655 + _1119;
    float _1129 = _1123 * _1091;
    float _1131 = _695 + _1125;
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1127 + _1133;
    float _1137 = fma(_1085, _1101, _1129);
    float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1141 = _1131 + _1139;
    float _1143 = _1135 * _1135;
    float _1145 = fma(_963, _1109, _1137);
    float _1147 = fma(_1141, _1141, _1143);
    float _1149 = _723 + _1145;
    float _1151 = sqrt(_1147);
    bool _1153 = _1151 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1155 = _1143;
    float _1157 = _1131;
    float _1159 = _1127;
    float _1161 = _1123;
    float _1163 = _1109;
    float _1165 = _959;
    if (!_1153)
    {
        _1155 = _1149;
    }
    float _1167 = _1155;
    bool _1169 = !_1153;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1151 + _1175;
        float _1179 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = rsqrt(_1147);
        float _1183 = _1177 * _1173;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = _1189 + (-1.0);
        float _1197 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = fma(_1193, _1179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1201 = fma(_1149, _1189, _1197);
        float _1203 = _1181 * _1199;
        float _1205 = fma(_1141, _1203, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1207 = fma(_1135, _1203, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1171 = _1201;
        _1157 = _1205;
        _1159 = _1207;
        _1161 = _1185;
    }
    float _1209 = _1171;
    float _1211 = _1157;
    float _1213 = _1159;
    float _1215 = _1161;
    float _1217 = _1209;
    float _1219 = _1211;
    float _1221 = _1213;
    if (!_953)
    {
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1225 = _723 + _1223;
        float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1229 = _695 + _1227;
        float _1231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1233 = -_723;
        float _1235 = _1233 + _1209;
        float _1237 = _1225 * _1225;
        float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1241 = _655 + _1239;
        float _1243 = fma(_1229, _1229, _1237);
        float _1245 = -_695;
        float _1247 = _1245 + _1211;
        float _1249 = fma(_1241, _1241, _1243);
        float _1251 = sqrt(_1249);
        float _1253 = precise::min(_1251, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1255 = _1253 * _1231;
        float _1257 = -_655;
        float _1259 = _1257 + _1213;
        float _1261 = fma(_1247, _1255, _695);
        float _1263 = fma(_1235, _1255, _723);
        float _1265 = fma(_1259, _1255, _655);
        _1217 = _1263;
        _1219 = _1261;
        _1221 = _1265;
    }
    float _1267 = _1217;
    float _1269 = _1219;
    float _1271 = _1221;
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1275 = _1267 + _1273;
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1279 = _1269 + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1283 = _1271 + _1281;
    float _1285 = _1275 * _1275;
    float _1287 = fma(_1279, _1279, _1285);
    float _1289 = fma(_1283, _1283, _1287);
    float _1291 = rsqrt(_1289);
    float _1293 = sqrt(_1289);
    float _1295 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1297 = _1279 * _1295;
    float _1299 = _1283 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 + _1303;
    float _1307 = sqrt(_1305);
    bool _1309 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = _1307 + _1311;
    float _1315 = _1291;
    float _1317 = _1305;
    float _1319 = _1313;
    float _1321 = _1295;
    if (_1309)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1315 = _1323;
    }
    float _1325 = _1315;
    if (_1309)
    {
        float _1327 = rsqrt(_1305);
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = _1329;
    if (_1309)
    {
        float _1333 = _1313 * _1325;
        _1319 = _1333;
    }
    float _1335 = _1319;
    if (_1309)
    {
        float _1337 = _1335 * 0.15915493667125701904296875;
        _1163 = _1337;
    }
    float _1339 = _1163;
    float _1341 = _1283;
    if (_1309)
    {
        float _1343 = _1339 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        _1341 = _1345;
    }
    float _1347 = _1341;
    float _1349 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1351 = precise::max(0.0, _1349);
    float _1353 = _1215;
    float _1355 = _1351;
    float _1357 = _1349;
    if (_1309)
    {
        float _1359 = _1339 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        _1353 = _1361;
    }
    float _1363 = _1353;
    float _1365 = -_1295;
    float _1367 = -_1351;
    float _1369 = fma(_1275, _1365, _1367);
    float _1371 = _1369;
    if (_1309)
    {
        float _1373 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1355 = _1373;
    }
    float _1375 = _1355;
    float _1377 = _1347;
    float _1379 = _1375;
    if (_1309)
    {
        float _1381 = fma(_1347, _1375, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = _1383;
    if (!_1309)
    {
        _1379 = _1297;
    }
    float _1387 = _1379;
    float _1389 = _1387;
    if (_1309)
    {
        float _1391 = _1363 + (-1.0);
        _1357 = _1391;
    }
    float _1393 = _1357;
    float _1395 = _1393;
    if (_1309)
    {
        float _1397 = _1329 * _1383;
        _1165 = _1397;
    }
    float _1399 = _1165;
    if (!_1309)
    {
        _1385 = _1369;
    }
    float _1401 = _1385;
    float _1403 = _1401;
    if (_1309)
    {
        float _1405 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1405;
    }
    float _1407 = _1321;
    if (_1309)
    {
        float _1409 = _1297 * _1399;
        _1389 = _1409;
    }
    float _1411 = _1389;
    if (!_1309)
    {
        _1395 = _1299;
    }
    float _1413 = _1395;
    float _1415 = _1413;
    if (_1309)
    {
        float _1417 = _1299 * _1399;
        _1415 = _1417;
    }
    float _1419 = _1415;
    if (!_1309)
    {
        _1331 = _1301;
    }
    float _1421 = _1331;
    float _1423 = _1421;
    if (_1309)
    {
        float _1425 = fma(_1369, _1363, _1407);
        _1403 = _1425;
    }
    float _1427 = _1403;
    if (_1309)
    {
        float _1429 = _1411 * _1411;
        _1423 = _1429;
    }
    float _1431 = _1423;
    if (!_1309)
    {
        _1371 = _1303;
    }
    float _1433 = _1371;
    float _1435 = _1433;
    if (_1309)
    {
        float _1437 = _1419 * _1419;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = fma(_1427, _1427, _1431);
    float _1443 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1445 = _1441 + _1439;
    float _1447 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1457 = rsqrt(_1445);
    float _1459 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1461 = -_1453;
    float _1463 = _1461 + 1.0;
    float _1465 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1455);
    float _1469 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1447);
    float _1473 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = abs(_1463);
    float _1477 = log2(_1475);
    float _1479 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1467);
    float _1481 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1485 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1457 * _1411;
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1497 = _1457 * _1427;
    float _1499 = -_1489;
    float _1501 = fma(_1499, _1459, 1.0);
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1505 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1485);
    float _1507 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1495);
    float _1509 = _1457 * _1419;
    float _1511 = -_1503;
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1511);
    float _1515 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1517 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1519 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1507);
    float _1521 = -_1509;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1513);
    float _1525 = exp2(_1515);
    float _1527 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1519);
    float _1531 = fma(_1523, -0.5, 0.5);
    float _1533 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1527);
    float _1537 = fma(_1523, 0.5, 0.5);
    float _1539 = 1.0 / _1529;
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1543 = _1497 + 1.0;
    float _1545 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1541);
    float _1551 = log2(_1501);
    float _1553 = -_1497;
    float _1555 = fma(_1525, _1543, _1553);
    float _1557 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1549);
    float _1559 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1561 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1563 = sqrt(_1531);
    float _1565 = _1557 * _1539;
    float _1567 = _1559 * _1539;
    float _1569 = fma(_1537, _1561, 1.570728778839111328125);
    float _1571 = fma(_1565, 0.5, 0.5);
    float _1573 = fma(_1567, -0.5, 0.5);
    float _1575 = _1551 * 0.693147182464599609375;
    float _1577 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1579 = _1563 * 0.636619746685028076171875;
    float3 _4555 = float3(_1571, _1573, _1577);
    float _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4555, float3(0.0), isnan(_4555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4555, float3(0.0), isnan(_4555)), level(0.0)).x;
    float _1583 = -_1569;
    float _1585 = fma(_1579, _1583, 1.0);
    float _1587 = fma(_1555, 0.5, 0.5);
    float3 _4573 = float3(_1571, _1573, _1577);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4573, float3(0.0), isnan(_4573)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4573, float3(0.0), isnan(_4573)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _4590 = float2(_1585, _1587);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4590, float2(0.0), isnan(_4590)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4590, float2(0.0), isnan(_4590)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1612 = _559 > 0.5;
    float _1614 = -_807;
    float _1616 = _1614 + 1.0;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1622 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1630 = _1626 || _1628;
    float _1632 = exp2(_1610);
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1638 = _553 > 0.5;
    float _1640 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1644 = _1642 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1646 = _555 > 0.5;
    float _1648 = 1.0 / _1620;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1658 = -_169;
    int _1660 = _1646 ? as_type<int>(_1658) : as_type<int>(_169);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1666 = 1.0 / _1644;
    bool _1668 = _557 > 0.5;
    float _1670 = -_1632;
    float _1672 = _1670 + 1.0;
    float _1674 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1640);
    float _1676 = -_169;
    int _1678 = _1612 ? as_type<int>(_1676) : as_type<int>(_169);
    out.m_68.x = _1269;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = 1.0 / _1636;
    float _1686 = _1656 * _1648;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1694 = _1692 != 0;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1696;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1674);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1708 = _1706 != 0;
    float _1710 = 1.0 / _1664;
    float _1712 = _1698 * _1666;
    float _1714 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1704);
    bool _1716 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1718 = isnan(_501);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1724 = _1720 || _1722;
    float _1726 = float(_1724);
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1732 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1734 = isnan(_501);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1740 = _1736 || _1738;
    float _1742 = float(_1740);
    float _1744 = 1.0 / _1690;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1750 = _1652 * _1684;
    float _1752 = -_1726;
    float _1754 = _1752 + 1.0;
    float _1756 = -_1742;
    float _1758 = _1756 + 1.0;
    bool _1760 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1762 = isnan(_501);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1768 = _1764 || _1766;
    float _1770 = float(_1768);
    float _1772 = _1742 * _1754;
    float _1774 = 1.0 / _1730;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1778 = _1776 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1780 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1782 = isnan(_501);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1792;
    float _1796 = -_1770;
    float _1798 = _1796 + 1.0;
    float _1800 = _1778 * _1710;
    float _1802 = _1770 * _1758;
    bool _1804 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1806 = isnan(_501);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = 1.0 / _1748;
    float _1818 = _1794 * _1744;
    float _1820 = _1790 * _1798;
    float _1822 = -_1790;
    float _1824 = _1822 + 1.0;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1828 = _1826 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1830 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1832 = isnan(_501);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    out.m_68.z = _1271;
    float _1842 = _1814 * _1824;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1844;
    float _1848 = -_1814;
    float _1850 = _1848 + 1.0;
    bool _1852 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1854 = isnan(_501);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1828 * _1774;
    float _1866 = -_1840;
    float _1868 = _1866 + 1.0;
    float _1870 = _1840 * _1850;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1874 = _501 + _1872;
    float _1876 = _1846 * _1816;
    bool _1878 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1880 = isnan(_501);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = -_1862;
    float _1892 = _1890 + 1.0;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1896 = _501 + _1894;
    float _1898 = fma(_1750, _1874, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1900 = _1862 * _1868;
    float _1902 = _1888 * _1892;
    float _1904 = fma(_1686, _1896, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1908 = _501 + _1906;
    float _1910 = -_1888;
    float _1912 = _1910 + 1.0;
    float _1914 = _1898 * _1902;
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1918 = _501 + _1916;
    float _1920 = _723 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1922 = fma(_1800, _1908, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1924 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1914);
    float _1926 = fma(_1712, _1918, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1928 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1920);
    float _1930 = _723 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1932 = fma(_1904, _1900, _1924);
    float _1934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1936 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1928);
    float _1938 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1930);
    float _1940 = -_165;
    int _1942 = _1638 ? as_type<int>(_1940) : as_type<int>(_165);
    float _1944 = fma(_1926, _1870, _1932);
    float _1946 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1948 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1938);
    bool _1950 = !_1682;
    float _1952 = _1950 ? _165 : as_type<float>(_1942);
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1956 = _501 + _1954;
    float _1958 = 1.0 / _1946;
    bool _1960 = !_1694;
    float _1962 = _1960 ? _169 : as_type<float>(_1660);
    float _1964 = fma(_1922, _1842, _1944);
    bool _1966 = !_1708;
    float _1968 = _1966 ? _169 : as_type<float>(_1678);
    float _1970 = _1948 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1972 = -_165;
    int _1974 = _1668 ? as_type<int>(_1972) : as_type<int>(_165);
    float _1976 = fma(_1818, _1956, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1980 = _501 + _1978;
    float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1986 = _501 + _1984;
    float _1988 = _1970 + _1946;
    bool _1990 = !_1702;
    float _1992 = _1990 ? _165 : as_type<float>(_1974);
    float _1994 = fma(_1976, _1820, _1964);
    float _1996 = fma(_1876, _1986, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1998 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2000 = _1952 + 0.5;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2004 = fma(_1864, _1980, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2006 = _1876;
    float _2008 = _1996;
    float _2010 = _1992;
    if (!_1630)
    {
        _2006 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2012 = _2006;
    float _2014 = _1988 * _1958;
    float _2016 = _2014 * 0.5;
    float _2018 = fma(_1998, _2000, _803);
    float _2020 = fma(_2004, _1802, _1994);
    float _2022 = _2016;
    if (!_1630)
    {
        _869 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2024 = _869;
    if (!_1630)
    {
        float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2028 = fma(_2016, _2012, _2026);
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2034 = fma(_1996, _1772, _2020);
    float _2036 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1630)
    {
        float _2038 = -_2024;
        float _2040 = _2038 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2008 = _2040;
    }
    float _2042 = _2008;
    float _2044 = _1962 + (-0.5);
    out.gl_Position.x = _1557;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _1714;
    out.gl_Position.w = _1529;
    float _2046 = _2030;
    if (!_1630)
    {
        float _2048 = 1.0 / _2030;
        _2046 = _2048;
    }
    float _2050 = _2046;
    float _2052 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2054 = -_2036;
    float _2056 = -_811;
    float _2058 = fma(_2054, _2044, _2056);
    float _2060 = _1992 + 0.5;
    float _2062 = _1968 + (-0.5);
    float _2064 = fma(_2052, _2060, _827);
    float _2066 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2068 = _2042;
    float _2070 = _2058;
    if (!_1630)
    {
        float _2072 = 1.0 / _2042;
        _2068 = _2072;
    }
    float _2074 = _2068;
    float _2076 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2034);
    float _2078 = -_837;
    float _2080 = _2078 + 1.0;
    float _2082 = -_2066;
    float _2084 = -_867;
    float _2086 = fma(_2082, _2062, _2084);
    float _2088 = -_865;
    float _2090 = _2088 + 1.0;
    float _2092 = -_823;
    float _2094 = _2092 + 1.0;
    float _2096 = -_1616;
    float _2098 = fma(_1952, _2096, _2018);
    float _2100 = fma(_1962, _2080, _2058);
    float _2102 = -_2090;
    float _2104 = fma(_1992, _2102, _2064);
    float _2106 = fma(_1968, _2094, _2086);
    if (!_1630)
    {
        float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2110 = -_2024;
        float _2112 = fma(_2050, _2108, _2110);
        _2010 = _2112;
    }
    float _2114 = _2010;
    if (_1630)
    {
        _2070 = 1.0;
    }
    float _2116 = _2070;
    float _2118 = _1714 + _1529;
    float _2120 = _1529 * 0.5;
    out.m_70.x = _2098;
    out.m_70.y = _2100;
    out.m_70.z = _2104;
    out.m_70.w = _2106;
    float _2122 = _2116;
    if (!_1630)
    {
        float _2124 = _2114 * _2074;
        float _2126 = precise::clamp(_2124, 0.0, 1.0);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = _1557 + _1529;
    float _2132 = _2118 * 0.5;
    float _2134 = fma(_1559, -0.5, _2120);
    float _2136 = _2128 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2138 = _2128 > 0.0;
    bool _2140 = isnan(_2128);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = _2130 * 0.5;
    out.m_72.x = _2076;
    out.m_74.x = _2148;
    out.m_74.y = _2134;
    out.m_74.z = _2132;
    out.m_74.w = _1529;
    float _2150 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2152;
    float _2154 = _2150 * _1581;
    float _2156 = -_2150;
    float _2158 = _2156 + 1.0;
    float _2160 = _1598 * _2154;
    float _2162 = _1598 * _2158;
    float _2164 = _1608 * _2154;
    float _2166 = fma(_1604, _2160, _1592);
    float _2168 = fma(_1606, _2160, _1594);
    float _2170 = fma(_1598, _2164, _1596);
    out.m_76.x = _2166;
    out.m_76.y = _2168;
    out.m_76.z = _2170;
    out.m_76.w = _2162;
    if (_2146)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2172 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2172;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _493 = false;
    bool _293 = false;
    bool _191 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2229 = as_type<float>(_111);
        out.gl_Position.z = _2229;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = _129;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2298 = as_type<float>(_149);
        out.gl_Position.z = _2298;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    bool _153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _155 = as_type<int>(_151) & 1;
    bool _157 = _155 != 0;
    int _159 = as_type<int>(_151) & 2;
    bool _161 = _159 != 0;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_161;
    float _169 = _167 ? (-0.5) : 0.5;
    bool _171 = !_153;
    float _189;
    if (!_171)
    {
        float _173 = in.m_52.x;
        float _175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _179 = fma(_177, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _181 = _179 * _175;
        float _183 = floor(_181);
        float _185 = -_183;
        float _187 = _181 + _185;
        _189 = _187;
        _191 = true;
    }
    else
    {
        float _193 = float(_95);
        float _195 = 1.0 / _193;
        float _197 = _129 * _195;
        _189 = _197;
    }
    _191 = false;
    float _199 = _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _199 + _201;
    bool _205 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _207 = isnan(_199);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _213 = _209 || _211;
    float _215 = float(_213);
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _217;
    float _221 = -_215;
    float _223 = _221 + 1.0;
    bool _225 = _199 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _227 = isnan(_199);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _243 = 1.0 / _219;
    float _245 = _235 * _223;
    float _247 = -_235;
    float _249 = _247 + 1.0;
    float _251 = _203 * _243;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _253;
    float _257 = fma(_239, _251, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _259 = fma(_255, _251, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _261 = _257 * _245;
    float _263 = _259 * _245;
    float _265 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[143].x, _261);
    float _267 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[143].y, _263);
    float _269 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[144].x, _265);
    float _271 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[144].y, _267);
    bool _273 = !_241;
    float _291;
    if (!_273)
    {
        float _275 = in.m_52.x;
        float _277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _279 = _275 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _283 = _281 * _277;
        float _285 = floor(_283);
        float _287 = -_285;
        float _289 = _283 + _287;
        _291 = _289;
        _293 = true;
    }
    else
    {
        float _295 = float(_95);
        float _297 = 1.0 / _295;
        float _299 = _129 * _297;
        _291 = _299;
    }
    _293 = false;
    float _301 = _291;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _305 = _301 + _303;
    float _307 = in.m_54.x;
    float _309 = in.m_54.y;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _319 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _321 = isnan(_301);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _335 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _337 = isnan(_301);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _313;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _349;
    float _353 = -_329;
    float _355 = _353 + 1.0;
    bool _357 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_301);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    bool _369 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _371 = 1.0 / _317;
    float _373 = 1.0 / _333;
    float _375 = _351 * _347;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _381 = _345 * _355;
    float _383 = -_345;
    float _385 = _383 + 1.0;
    float _387 = fma(_375, _305, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _389;
    float _393 = _271 * _309;
    float _395 = _367 * _385;
    float _397 = _379 * _371;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _401 = _301 + _399;
    bool _403 = _301 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _405 = isnan(_301);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = _387 * _395;
    float _417 = -_367;
    float _419 = _417 + 1.0;
    float _421 = fma(_397, _401, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _425 = _301 + _423;
    float _427 = _391 * _373;
    float _429 = -_413;
    float _431 = _429 + 1.0;
    float _433 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[115].x, _415);
    float _435 = fma(_427, _425, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _437 = _329 * _431;
    float _439 = fma(_421, _381, _433);
    float _441 = _269 * _307;
    float _443 = fma(_435, _437, _439);
    float _445 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[118].x, _443);
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _459 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _469 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _445 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _465;
    out.m_56.y = _467;
    out.m_56.z = _469;
    out.m_58.x = _459;
    out.m_58.y = _461;
    out.m_58.z = _463;
    out.m_58.w = _471;
    bool _473 = !_369;
    float _491;
    if (!_473)
    {
        float _475 = in.m_52.x;
        float _477 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _479 = _475 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _481 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _483 = _481 * _477;
        float _485 = floor(_483);
        float _487 = -_485;
        float _489 = _483 + _487;
        _491 = _489;
        _493 = true;
    }
    else
    {
        float _495 = float(_95);
        float _497 = 1.0 / _495;
        float _499 = _129 * _497;
        _491 = _499;
    }
    _493 = false;
    float _501 = _491;
    float _503 = in.m_42.x;
    float _505 = in.m_42.y;
    float _507 = in.m_42.z;
    float _509 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _511 = in.m_60.x;
    float _513 = in.m_60.y;
    float _515 = in.m_60.z;
    float _517 = in.m_60.w;
    int _519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _521 = _519 != 0;
    float _523 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _525 = in.m_62.x;
    float _527 = in.m_62.y;
    float _529 = in.m_62.z;
    float _531 = in.m_62.w;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _539 = _537 != 0;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _543 = _541 != 0;
    float _545 = in.m_64.x;
    float _547 = in.m_64.y;
    float _549 = in.m_64.z;
    float _551 = in.m_64.w;
    float _553 = in.m_52.x;
    float _555 = in.m_52.y;
    float _557 = in.m_52.z;
    float _559 = in.m_52.w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _565 = _505 * _513;
    float _567 = _505 * _527;
    float _569 = fma(_503, _511, _565);
    float _571 = fma(_503, _525, _567);
    float _573 = _505 * _547;
    float _575 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _577 = _553 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _579 = fma(_503, _545, _573);
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _583 = _555 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _585 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _575);
    float _587 = _555 + _557;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _591 = fma(_583, -2.0, _581);
    float _593 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _595 = _587 + (-1.0);
    float _597 = _557 * 2.0;
    float _599 = -_589;
    float _601 = fma(_577, 2.0, _599);
    float _603 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _593);
    float _605 = _553 * 2.0;
    float _607 = fma(_595, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _609 = _555 + _553;
    float _611 = fma(_507, _549, _579);
    float _613 = fma(_507, _529, _571);
    float _615 = _555 * 2.0;
    float _617 = floor(_597);
    float _619 = _609 + (-1.0);
    float _621 = fma(_507, _515, _569);
    float _623 = _609;
    float _625 = _515;
    float _627 = _605;
    if (!_521)
    {
        _623 = _557;
    }
    float _629 = _623;
    float _631 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _633 = floor(_605);
    float _635 = _629;
    if (_521)
    {
        _635 = _555;
    }
    float _637 = _635;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_521)
    {
        _625 = _555;
    }
    float _641 = _625;
    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _585);
    float _645 = _641;
    if (_521)
    {
        _645 = _553;
    }
    float _647 = _645;
    float _649 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[83].w, _639);
    float _651 = floor(_615);
    if (!_521)
    {
        _627 = _557;
    }
    float _653 = _627;
    float _655 = _621 + _517;
    float _657 = _653;
    if (_521)
    {
        _657 = _555;
    }
    float _659 = _657;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _663 = _617 >= 0.0;
    bool _665 = isnan(_617);
    bool _667 = _663 || _665;
    bool _669 = isnan(0.0);
    bool _671 = _667 || _669;
    float _673 = _647 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _675 = _617 > 0.0;
    float _677 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _679 = log2(_677);
    bool _681 = _633 > 0.0;
    float _683 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _661);
    bool _685 = _633 >= 0.0;
    bool _687 = isnan(_633);
    bool _689 = _685 || _687;
    bool _691 = isnan(0.0);
    bool _693 = _689 || _691;
    float _695 = _613 + _531;
    float _697 = -_561;
    float _699 = fma(_673, 2.0, _697);
    int _701 = _671 ? 0 : 1;
    float _703 = _659 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _705 = _693 ? 0 : 1;
    float _707 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[78].w, _563);
    bool _709 = _651 > 0.0;
    bool _711 = _651 >= 0.0;
    bool _713 = isnan(_651);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _603);
    float _723 = _611 + _551;
    int _725 = _719 ? 0 : 1;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _729 = _679 * _129;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _733 = ~_725;
    int _735 = _733 + 1;
    int _737 = _735 + 1;
    float _739 = fma(_703, -2.0, _727);
    int _741 = _737;
    if (!_709)
    {
        int _743 = ~_725;
        int _745 = _743 + 1;
        _741 = _745;
    }
    int _747 = _741;
    float _749 = exp2(_729);
    int _751 = ~_705;
    int _753 = _751 + 1;
    int _755 = _753 + 1;
    float _757 = in.m_66.x;
    float _759 = in.m_66.y;
    float _761 = in.m_66.z;
    int _763 = _755;
    if (!_681)
    {
        int _765 = ~_705;
        int _767 = _765 + 1;
        _763 = _767;
    }
    int _769 = _763;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _773 = 1.0 + _771;
    float _775 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[78].z, _731);
    bool _777 = !_535;
    int _779 = _777 ? 0 : 1;
    bool _781 = !_539;
    int _783 = _781 ? 0 : 1;
    float _785 = 1.0 / _773;
    int _787 = ~_701;
    int _789 = _787 + 1;
    int _791 = _789 + 1;
    int _793 = _791;
    if (!_675)
    {
        int _795 = ~_701;
        int _797 = _795 + 1;
        _793 = _797;
    }
    int _799 = _793;
    float _801 = -_129;
    float _803 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[76].x, _601);
    int _805 = abs(_779);
    float _807 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _775);
    int _809 = abs(_783);
    float _811 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _591);
    bool _813 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _815 = isnan(1.0);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _821 = _817 || _819;
    float _823 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _649);
    float _825 = -_129;
    float _827 = fma(_825, (*spvDescriptorSet0.vp_c9)._m0[81].x, _699);
    float _829 = float(_805);
    float _831 = -_749;
    float _833 = _831 + 1.0;
    float _835 = float(_799);
    float _837 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _707);
    bool _839 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _841 = isnan(0.0);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _847 = _843 || _845;
    float _849 = rsqrt(_721);
    float _851 = float(_809);
    float _853 = _829 * _835;
    float _855 = _847 ? _833 : 0.0;
    float _857 = -_723;
    float _859 = _857 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _861 = float(_769);
    float _863 = _853 * (-2.0);
    float _865 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _683);
    float _867 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    float _869 = _803;
    if (_821)
    {
        float _871 = _855 * _785;
        _133 = _871;
    }
    float _873 = _133;
    float _875 = _851 * _861;
    float _877 = -_695;
    float _879 = _877 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _881 = _859 * _859;
    float _883 = fma(_863, _757, _757);
    float _885 = _553 + (-0.5);
    bool _887 = !_543;
    int _889 = _887 ? 0 : 1;
    float _891 = fma(_879, _879, _881);
    float _893 = fma(_631, _863, _631);
    float _895 = fma(_885, (*spvDescriptorSet0.vp_c9)._m0[196].x, _883);
    int _897 = abs(_889);
    float _899 = _875 * (-2.0);
    float _901 = -_655;
    float _903 = _901 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _905 = fma(_893, _873, _895);
    float _907 = float(_747);
    float _909 = fma(_899, _759, _759);
    float _911 = fma(_903, _903, _891);
    float _913 = _555 + (-0.5);
    float _915 = fma(_607, _899, _607);
    float _917 = float(_897);
    float _919 = rsqrt(_911);
    float _921 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[196].y, _909);
    float _923 = _557 + _553;
    float _925 = _905 * 0.15915493667125701904296875;
    float _927 = _917 * _907;
    float _929 = fma(_915, _873, _921);
    float _931 = _923 + (-1.0);
    float _933 = _927 * (-2.0);
    float _935 = rsqrt(_643);
    float _937 = _929 * 0.15915493667125701904296875;
    float _939 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _941 = _557 + (-0.5);
    float _943 = _169 * _849;
    bool _945 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _947 = isnan(0.5);
    bool _949 = _945 || _947;
    bool _951 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _953 = _949 || _951;
    float _955 = fma(_939, _933, _939);
    float _957 = _879 * _919;
    float _959 = _903 * _919;
    float _961 = fma(_933, _761, _761);
    float _963 = _859 * _919;
    float _965 = _925 * 6.283185482025146484375;
    float _967 = sin(_965);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _971 = _959 * _969;
    float _973 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _975 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _977 = _963 * _975;
    float _979 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _943);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _983 = -_971;
    float _985 = fma(_963, _981, _983);
    float _987 = fma(_955, _873, _973);
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _991 = _957 * _989;
    float _993 = _925 * 6.283185482025146484375;
    float _995 = cos(_993);
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _999 = -_977;
    float _1001 = fma(_957, _997, _999);
    float _1003 = _987 * 0.15915493667125701904296875;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1007 = -_991;
    float _1009 = fma(_959, _1005, _1007);
    float _1011 = _165 * _935;
    float _1013 = _1009 * _1009;
    float _1015 = _937 * 6.283185482025146484375;
    float _1017 = sin(_1015);
    float _1019 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1011);
    float _1021 = fma(_985, _985, _1013);
    float _1023 = _509 * _979;
    float _1025 = _523 * _1019;
    float _1027 = fma(_1001, _1001, _1021);
    float _1029 = _937 * 6.283185482025146484375;
    float _1031 = cos(_1029);
    float _1033 = _1003 * 6.283185482025146484375;
    float _1035 = sin(_1033);
    float _1037 = _995 * _1017;
    float _1039 = _967 * _1017;
    float _1041 = _1003 * 6.283185482025146484375;
    float _1043 = cos(_1041);
    float _1045 = _967 * _1031;
    float _1047 = rsqrt(_1027);
    float _1049 = -_1037;
    float _1051 = fma(_1035, _1045, _1049);
    float _1053 = -_1045;
    float _1055 = fma(_1035, _1037, _1053);
    float _1057 = _995 * _1031;
    float _1059 = _1043 * _1023;
    float _1061 = _1017 * _1043;
    float _1063 = _1031 * _1043;
    float _1065 = -_1023;
    float _1067 = _1035 * _1065;
    float _1069 = fma(_1035, _1057, _1039);
    float _1071 = _995 * _1059;
    float _1073 = fma(_1035, _1039, _1057);
    float _1075 = fma(_1063, _1025, _1067);
    float _1077 = _985 * _1047;
    float _1079 = _967 * _1059;
    float _1081 = fma(_1069, _1025, _1071);
    float _1083 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1085 = _1009 * _1047;
    float _1087 = _963 * _1077;
    float _1089 = _1001 * _1047;
    float _1091 = fma(_1055, _1083, _1081);
    float _1093 = _959 * _1085;
    float _1095 = -_1087;
    float _1097 = fma(_957, _1085, _1095);
    float _1099 = fma(_1051, _1025, _1079);
    float _1101 = fma(_1061, _1083, _1075);
    float _1103 = -_1093;
    float _1105 = fma(_963, _1089, _1103);
    float _1107 = _1097 * _1091;
    float _1109 = fma(_1073, _1083, _1099);
    float _1111 = _1105 * _1091;
    float _1113 = fma(_1089, _1101, _1107);
    float _1115 = _957 * _1089;
    float _1117 = fma(_1077, _1101, _1111);
    float _1119 = fma(_959, _1109, _1113);
    float _1121 = -_1115;
    float _1123 = fma(_959, _1077, _1121);
    float _1125 = fma(_957, _1109, _1117);
    float _1127 = _655 + _1119;
    float _1129 = _1123 * _1091;
    float _1131 = _695 + _1125;
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1127 + _1133;
    float _1137 = fma(_1085, _1101, _1129);
    float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1141 = _1131 + _1139;
    float _1143 = _1135 * _1135;
    float _1145 = fma(_963, _1109, _1137);
    float _1147 = fma(_1141, _1141, _1143);
    float _1149 = _723 + _1145;
    float _1151 = sqrt(_1147);
    bool _1153 = _1151 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1155 = _1143;
    float _1157 = _1131;
    float _1159 = _1127;
    float _1161 = _1123;
    float _1163 = _1109;
    float _1165 = _959;
    if (!_1153)
    {
        _1155 = _1149;
    }
    float _1167 = _1155;
    bool _1169 = !_1153;
    float _1171 = _1167;
    if (!_1169)
    {
        float _1173 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1175 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1177 = _1151 + _1175;
        float _1179 = _1149 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = rsqrt(_1147);
        float _1183 = _1177 * _1173;
        float _1185 = _1183 * 0.15915493667125701904296875;
        float _1187 = _1185 * 6.283185482025146484375;
        float _1189 = cos(_1187);
        float _1191 = _1185 * 6.283185482025146484375;
        float _1193 = sin(_1191);
        float _1195 = _1189 + (-1.0);
        float _1197 = _1195 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = fma(_1193, _1179, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1201 = fma(_1149, _1189, _1197);
        float _1203 = _1181 * _1199;
        float _1205 = fma(_1141, _1203, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1207 = fma(_1135, _1203, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1171 = _1201;
        _1157 = _1205;
        _1159 = _1207;
        _1161 = _1185;
    }
    float _1209 = _1171;
    float _1211 = _1157;
    float _1213 = _1159;
    float _1215 = _1161;
    float _1217 = _1209;
    float _1219 = _1211;
    float _1221 = _1213;
    if (!_953)
    {
        float _1223 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1225 = _723 + _1223;
        float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1229 = _695 + _1227;
        float _1231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1233 = -_723;
        float _1235 = _1233 + _1209;
        float _1237 = _1225 * _1225;
        float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1241 = _655 + _1239;
        float _1243 = fma(_1229, _1229, _1237);
        float _1245 = -_695;
        float _1247 = _1245 + _1211;
        float _1249 = fma(_1241, _1241, _1243);
        float _1251 = sqrt(_1249);
        float _1253 = precise::min(_1251, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1255 = _1253 * _1231;
        float _1257 = -_655;
        float _1259 = _1257 + _1213;
        float _1261 = fma(_1247, _1255, _695);
        float _1263 = fma(_1235, _1255, _723);
        float _1265 = fma(_1259, _1255, _655);
        _1217 = _1263;
        _1219 = _1261;
        _1221 = _1265;
    }
    float _1267 = _1217;
    float _1269 = _1219;
    float _1271 = _1221;
    float _1273 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1275 = _1267 + _1273;
    float _1277 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1279 = _1269 + _1277;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1283 = _1271 + _1281;
    float _1285 = _1275 * _1275;
    float _1287 = fma(_1279, _1279, _1285);
    float _1289 = fma(_1283, _1283, _1287);
    float _1291 = rsqrt(_1289);
    float _1293 = sqrt(_1289);
    float _1295 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1297 = _1279 * _1295;
    float _1299 = _1283 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 + _1303;
    float _1307 = sqrt(_1305);
    bool _1309 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = _1307 + _1311;
    float _1315 = _1291;
    float _1317 = _1305;
    float _1319 = _1313;
    float _1321 = _1295;
    if (_1309)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1315 = _1323;
    }
    float _1325 = _1315;
    if (_1309)
    {
        float _1327 = rsqrt(_1305);
        _1317 = _1327;
    }
    float _1329 = _1317;
    float _1331 = _1329;
    if (_1309)
    {
        float _1333 = _1313 * _1325;
        _1319 = _1333;
    }
    float _1335 = _1319;
    if (_1309)
    {
        float _1337 = _1335 * 0.15915493667125701904296875;
        _1163 = _1337;
    }
    float _1339 = _1163;
    float _1341 = _1283;
    if (_1309)
    {
        float _1343 = _1339 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        _1341 = _1345;
    }
    float _1347 = _1341;
    float _1349 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1351 = precise::max(0.0, _1349);
    float _1353 = _1215;
    float _1355 = _1351;
    float _1357 = _1349;
    if (_1309)
    {
        float _1359 = _1339 * 6.283185482025146484375;
        float _1361 = cos(_1359);
        _1353 = _1361;
    }
    float _1363 = _1353;
    float _1365 = -_1295;
    float _1367 = -_1351;
    float _1369 = fma(_1275, _1365, _1367);
    float _1371 = _1369;
    if (_1309)
    {
        float _1373 = _1369 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1355 = _1373;
    }
    float _1375 = _1355;
    float _1377 = _1347;
    float _1379 = _1375;
    if (_1309)
    {
        float _1381 = fma(_1347, _1375, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1377 = _1381;
    }
    float _1383 = _1377;
    float _1385 = _1383;
    if (!_1309)
    {
        _1379 = _1297;
    }
    float _1387 = _1379;
    float _1389 = _1387;
    if (_1309)
    {
        float _1391 = _1363 + (-1.0);
        _1357 = _1391;
    }
    float _1393 = _1357;
    float _1395 = _1393;
    if (_1309)
    {
        float _1397 = _1329 * _1383;
        _1165 = _1397;
    }
    float _1399 = _1165;
    if (!_1309)
    {
        _1385 = _1369;
    }
    float _1401 = _1385;
    float _1403 = _1401;
    if (_1309)
    {
        float _1405 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1405;
    }
    float _1407 = _1321;
    if (_1309)
    {
        float _1409 = _1297 * _1399;
        _1389 = _1409;
    }
    float _1411 = _1389;
    if (!_1309)
    {
        _1395 = _1299;
    }
    float _1413 = _1395;
    float _1415 = _1413;
    if (_1309)
    {
        float _1417 = _1299 * _1399;
        _1415 = _1417;
    }
    float _1419 = _1415;
    if (!_1309)
    {
        _1331 = _1301;
    }
    float _1421 = _1331;
    float _1423 = _1421;
    if (_1309)
    {
        float _1425 = fma(_1369, _1363, _1407);
        _1403 = _1425;
    }
    float _1427 = _1403;
    if (_1309)
    {
        float _1429 = _1411 * _1411;
        _1423 = _1429;
    }
    float _1431 = _1423;
    if (!_1309)
    {
        _1371 = _1303;
    }
    float _1433 = _1371;
    float _1435 = _1433;
    if (_1309)
    {
        float _1437 = _1419 * _1419;
        _1435 = _1437;
    }
    float _1439 = _1435;
    float _1441 = fma(_1427, _1427, _1431);
    float _1443 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1445 = _1441 + _1439;
    float _1447 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1443);
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1457 = rsqrt(_1445);
    float _1459 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1461 = -_1453;
    float _1463 = _1461 + 1.0;
    float _1465 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1467 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1455);
    float _1469 = _1267 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1471 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1447);
    float _1473 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1465);
    float _1475 = abs(_1463);
    float _1477 = log2(_1475);
    float _1479 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1467);
    float _1481 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1483 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1485 = fma(_1269, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1469);
    float _1487 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1489 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1491 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1493 = _1457 * _1411;
    float _1495 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1497 = _1457 * _1427;
    float _1499 = -_1489;
    float _1501 = fma(_1499, _1459, 1.0);
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1505 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1485);
    float _1507 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1495);
    float _1509 = _1457 * _1419;
    float _1511 = -_1503;
    float _1513 = fma(_1497, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1511);
    float _1515 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1517 = _1505 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1519 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1507);
    float _1521 = -_1509;
    float _1523 = fma(_1521, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1513);
    float _1525 = exp2(_1515);
    float _1527 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1529 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1519);
    float _1531 = fma(_1523, -0.5, 0.5);
    float _1533 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1535 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1527);
    float _1537 = fma(_1523, 0.5, 0.5);
    float _1539 = 1.0 / _1529;
    float _1541 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1533);
    float _1543 = _1497 + 1.0;
    float _1545 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1535);
    float _1547 = fma(_1537, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1541);
    float _1551 = log2(_1501);
    float _1553 = -_1497;
    float _1555 = fma(_1525, _1543, _1553);
    float _1557 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1549);
    float _1559 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1545);
    float _1561 = fma(_1537, _1547, -0.212114393711090087890625);
    float _1563 = sqrt(_1531);
    float _1565 = _1557 * _1539;
    float _1567 = _1559 * _1539;
    float _1569 = fma(_1537, _1561, 1.570728778839111328125);
    float _1571 = fma(_1565, 0.5, 0.5);
    float _1573 = fma(_1567, -0.5, 0.5);
    float _1575 = _1551 * 0.693147182464599609375;
    float _1577 = _1575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1579 = _1563 * 0.636619746685028076171875;
    float3 _4555 = float3(_1571, _1573, _1577);
    float _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4555, float3(0.0), isnan(_4555)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4555, float3(0.0), isnan(_4555)), level(0.0)).x;
    float _1583 = -_1569;
    float _1585 = fma(_1579, _1583, 1.0);
    float _1587 = fma(_1555, 0.5, 0.5);
    float3 _4573 = float3(_1571, _1573, _1577);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4573, float3(0.0), isnan(_4573)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4573, float3(0.0), isnan(_4573)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _4590 = float2(_1585, _1587);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4590, float2(0.0), isnan(_4590)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4590, float2(0.0), isnan(_4590)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1612 = _559 > 0.5;
    float _1614 = -_807;
    float _1616 = _1614 + 1.0;
    float _1618 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1620 = _1618 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1622 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1624 = isnan(0.5);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1630 = _1626 || _1628;
    float _1632 = exp2(_1610);
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1638 = _553 > 0.5;
    float _1640 = _1487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1644 = _1642 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1646 = _555 > 0.5;
    float _1648 = 1.0 / _1620;
    float _1650 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1658 = -_169;
    int _1660 = _1646 ? as_type<int>(_1658) : as_type<int>(_169);
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1666 = 1.0 / _1644;
    bool _1668 = _557 > 0.5;
    float _1670 = -_1632;
    float _1672 = _1670 + 1.0;
    float _1674 = fma(_1491, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1640);
    float _1676 = -_169;
    int _1678 = _1612 ? as_type<int>(_1676) : as_type<int>(_169);
    out.m_68.x = _1269;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = 1.0 / _1636;
    float _1686 = _1656 * _1648;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _1692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1694 = _1692 != 0;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1696;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = fma(_1481, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1674);
    int _1706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1708 = _1706 != 0;
    float _1710 = 1.0 / _1664;
    float _1712 = _1698 * _1666;
    float _1714 = fma(_1517, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1704);
    bool _1716 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1718 = isnan(_501);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1724 = _1720 || _1722;
    float _1726 = float(_1724);
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1732 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1734 = isnan(_501);
    bool _1736 = _1732 || _1734;
    bool _1738 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1740 = _1736 || _1738;
    float _1742 = float(_1740);
    float _1744 = 1.0 / _1690;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1748 = _1746 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1750 = _1652 * _1684;
    float _1752 = -_1726;
    float _1754 = _1752 + 1.0;
    float _1756 = -_1742;
    float _1758 = _1756 + 1.0;
    bool _1760 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1762 = isnan(_501);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1768 = _1764 || _1766;
    float _1770 = float(_1768);
    float _1772 = _1742 * _1754;
    float _1774 = 1.0 / _1730;
    float _1776 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1778 = _1776 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1780 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1782 = isnan(_501);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1792;
    float _1796 = -_1770;
    float _1798 = _1796 + 1.0;
    float _1800 = _1778 * _1710;
    float _1802 = _1770 * _1758;
    bool _1804 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1806 = isnan(_501);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = 1.0 / _1748;
    float _1818 = _1794 * _1744;
    float _1820 = _1790 * _1798;
    float _1822 = -_1790;
    float _1824 = _1822 + 1.0;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1828 = _1826 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1830 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1832 = isnan(_501);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    out.m_68.z = _1271;
    float _1842 = _1814 * _1824;
    float _1844 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1844;
    float _1848 = -_1814;
    float _1850 = _1848 + 1.0;
    bool _1852 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1854 = isnan(_501);
    bool _1856 = _1852 || _1854;
    bool _1858 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1860 = _1856 || _1858;
    float _1862 = float(_1860);
    float _1864 = _1828 * _1774;
    float _1866 = -_1840;
    float _1868 = _1866 + 1.0;
    float _1870 = _1840 * _1850;
    float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1874 = _501 + _1872;
    float _1876 = _1846 * _1816;
    bool _1878 = _501 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1880 = isnan(_501);
    bool _1882 = _1878 || _1880;
    bool _1884 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1886 = _1882 || _1884;
    float _1888 = float(_1886);
    float _1890 = -_1862;
    float _1892 = _1890 + 1.0;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1896 = _501 + _1894;
    float _1898 = fma(_1750, _1874, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1900 = _1862 * _1868;
    float _1902 = _1888 * _1892;
    float _1904 = fma(_1686, _1896, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1908 = _501 + _1906;
    float _1910 = -_1888;
    float _1912 = _1910 + 1.0;
    float _1914 = _1898 * _1902;
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1918 = _501 + _1916;
    float _1920 = _723 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1922 = fma(_1800, _1908, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1924 = fma(_1912, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1914);
    float _1926 = fma(_1712, _1918, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1928 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1920);
    float _1930 = _723 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1932 = fma(_1904, _1900, _1924);
    float _1934 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1936 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1928);
    float _1938 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1930);
    float _1940 = -_165;
    int _1942 = _1638 ? as_type<int>(_1940) : as_type<int>(_165);
    float _1944 = fma(_1926, _1870, _1932);
    float _1946 = _1936 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1948 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1938);
    bool _1950 = !_1682;
    float _1952 = _1950 ? _165 : as_type<float>(_1942);
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1956 = _501 + _1954;
    float _1958 = 1.0 / _1946;
    bool _1960 = !_1694;
    float _1962 = _1960 ? _169 : as_type<float>(_1660);
    float _1964 = fma(_1922, _1842, _1944);
    bool _1966 = !_1708;
    float _1968 = _1966 ? _169 : as_type<float>(_1678);
    float _1970 = _1948 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1972 = -_165;
    int _1974 = _1668 ? as_type<int>(_1972) : as_type<int>(_165);
    float _1976 = fma(_1818, _1956, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1978 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1980 = _501 + _1978;
    float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1984 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1986 = _501 + _1984;
    float _1988 = _1970 + _1946;
    bool _1990 = !_1702;
    float _1992 = _1990 ? _165 : as_type<float>(_1974);
    float _1994 = fma(_1976, _1820, _1964);
    float _1996 = fma(_1876, _1986, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1998 = _1934 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2000 = _1952 + 0.5;
    float _2002 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2004 = fma(_1864, _1980, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2006 = _1876;
    float _2008 = _1996;
    float _2010 = _1992;
    if (!_1630)
    {
        _2006 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2012 = _2006;
    float _2014 = _1988 * _1958;
    float _2016 = _2014 * 0.5;
    float _2018 = fma(_1998, _2000, _803);
    float _2020 = fma(_2004, _1802, _1994);
    float _2022 = _2016;
    if (!_1630)
    {
        _869 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2024 = _869;
    if (!_1630)
    {
        float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2028 = fma(_2016, _2012, _2026);
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2034 = fma(_1996, _1772, _2020);
    float _2036 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_1630)
    {
        float _2038 = -_2024;
        float _2040 = _2038 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2008 = _2040;
    }
    float _2042 = _2008;
    float _2044 = _1962 + (-0.5);
    out.gl_Position.x = _1557;
    out.gl_Position.y = _1559;
    out.gl_Position.z = _1714;
    out.gl_Position.w = _1529;
    float _2046 = _2030;
    if (!_1630)
    {
        float _2048 = 1.0 / _2030;
        _2046 = _2048;
    }
    float _2050 = _2046;
    float _2052 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2054 = -_2036;
    float _2056 = -_811;
    float _2058 = fma(_2054, _2044, _2056);
    float _2060 = _1992 + 0.5;
    float _2062 = _1968 + (-0.5);
    float _2064 = fma(_2052, _2060, _827);
    float _2066 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2068 = _2042;
    float _2070 = _2058;
    if (!_1630)
    {
        float _2072 = 1.0 / _2042;
        _2068 = _2072;
    }
    float _2074 = _2068;
    float _2076 = fma(_1726, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2034);
    float _2078 = -_837;
    float _2080 = _2078 + 1.0;
    float _2082 = -_2066;
    float _2084 = -_867;
    float _2086 = fma(_2082, _2062, _2084);
    float _2088 = -_865;
    float _2090 = _2088 + 1.0;
    float _2092 = -_823;
    float _2094 = _2092 + 1.0;
    float _2096 = -_1616;
    float _2098 = fma(_1952, _2096, _2018);
    float _2100 = fma(_1962, _2080, _2058);
    float _2102 = -_2090;
    float _2104 = fma(_1992, _2102, _2064);
    float _2106 = fma(_1968, _2094, _2086);
    if (!_1630)
    {
        float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2110 = -_2024;
        float _2112 = fma(_2050, _2108, _2110);
        _2010 = _2112;
    }
    float _2114 = _2010;
    if (_1630)
    {
        _2070 = 1.0;
    }
    float _2116 = _2070;
    float _2118 = _1714 + _1529;
    float _2120 = _1529 * 0.5;
    out.m_70.x = _2098;
    out.m_70.y = _2100;
    out.m_70.z = _2104;
    out.m_70.w = _2106;
    float _2122 = _2116;
    if (!_1630)
    {
        float _2124 = _2114 * _2074;
        float _2126 = precise::clamp(_2124, 0.0, 1.0);
        _2122 = _2126;
    }
    float _2128 = _2122;
    float _2130 = _1557 + _1529;
    float _2132 = _2118 * 0.5;
    float _2134 = fma(_1559, -0.5, _2120);
    float _2136 = _2128 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2138 = _2128 > 0.0;
    bool _2140 = isnan(_2128);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan(0.0);
    bool _2146 = _2142 || _2144;
    float _2148 = _2130 * 0.5;
    out.m_72.x = _2076;
    out.m_74.x = _2148;
    out.m_74.y = _2134;
    out.m_74.z = _2132;
    out.m_74.w = _1529;
    float _2150 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2152;
    float _2154 = _2150 * _1581;
    float _2156 = -_2150;
    float _2158 = _2156 + 1.0;
    float _2160 = _1598 * _2154;
    float _2162 = _1598 * _2158;
    float _2164 = _1608 * _2154;
    float _2166 = fma(_1604, _2160, _1592);
    float _2168 = fma(_1606, _2160, _1594);
    float _2170 = fma(_1598, _2164, _1596);
    out.m_76.x = _2166;
    out.m_76.y = _2168;
    out.m_76.z = _2170;
    out.m_76.w = _2162;
    if (_2146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2172 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2172;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

