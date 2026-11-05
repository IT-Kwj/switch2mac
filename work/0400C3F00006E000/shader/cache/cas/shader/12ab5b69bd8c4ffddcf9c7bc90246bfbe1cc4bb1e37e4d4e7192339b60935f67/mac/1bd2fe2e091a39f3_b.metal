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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _929 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1721 = as_type<float>(_99);
        out.gl_Position.z = _1721;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1789 = as_type<float>(_135);
        out.gl_Position.z = _1789;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_51.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = exp2(_193);
        float _197 = _191 * 0.693147182464599609375;
        float _199 = 1.0 / _197;
        float _201 = 1.0 / _189;
        float _203 = _195 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _199, _139);
        float _209 = _207 * _201;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _261 = _253;
    float _279;
    if (!_259)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_83);
        float _285 = 1.0 / _283;
        float _287 = _117 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _289 + _291;
    float _295 = as_type<float>(int(gl_VertexIndex));
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _313 = 1.0 / _299;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _323 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_289);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _303;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _289 + _337;
    float _341 = 1.0 / _311;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _289 + _343;
    float _347 = _339 * _313;
    bool _349 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _351 = isnan(_289);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_289);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    int _373 = as_type<int>(_295) & 1;
    bool _375 = _373 != 0;
    int _377 = as_type<int>(_295) & 2;
    bool _379 = _377 != 0;
    float _381 = 1.0 / _307;
    float _383 = _345 * _335;
    bool _385 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _387 = isnan(_289);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_371;
    float _399 = _397 + 1.0;
    bool _401 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _403 = isnan(_289);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -_395;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _321;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _289 + _419;
    float _423 = _333 * _399;
    float _425 = -_333;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = _421 * _341;
    float _435 = -_359;
    float _437 = _435 + 1.0;
    float _439 = 1.0 / _317;
    float _441 = _293 * _381;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _445 = _289 + _443;
    float _447 = _411 * _437;
    float _449 = -_411;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    float _457 = fma(_431, _441, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = _445 * _417;
    float _461 = _371 * _415;
    bool _463 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_289);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = _395 * _451;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _483 = _289 + _481;
    bool _485 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _487 = isnan(_289);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = -_473;
    float _503 = _501 + 1.0;
    float _505 = fma(_479, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_455, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = _473 * _427;
    float _511 = _483 * _439;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = _495 * _503;
    float _519 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _521 = fma(_515, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _523 = _505 * _517;
    float _525 = _507 * _517;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _527;
    float _531 = -_495;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_529, _441, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[143].y, _525);
    float _549 = fma(_537, _433, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _551 = fma(_519, _509, _545);
    float _553 = fma(_541, _433, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = in.m_51.x;
    float _557 = in.m_51.y;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _559;
    float _563 = fma(_521, _509, _547);
    float _565 = fma(_543, _423, _551);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _567;
    float _571 = fma(_561, _511, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _573 = fma(_457, _423, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _579 = fma(_549, _461, _565);
    float _581 = fma(_569, _511, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _587 = fma(_553, _461, _573);
    float _589 = fma(_577, _459, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _591 = fma(_571, _475, _579);
    float _593 = fma(_585, _459, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _595 = fma(_581, _475, _587);
    float _597 = fma(_589, _447, _591);
    float _599 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _601 = fma(_593, _447, _595);
    float _603 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[149].x, _597);
    float _605 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _599);
    float _607 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[149].y, _601);
    bool _609 = !_375;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = _603 * _555;
    bool _615 = !_379;
    float _617 = _615 ? (-0.5) : 0.5;
    float _619 = _607 * _557;
    float _621 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    float _625 = _613 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _617);
    float _629 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _631 = _621 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _633 = _625 * _623;
    float _635 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _621 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _639 = _629 * _627;
    float _641 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _605);
    float _643 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[8].x, _631);
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[10].x, _637);
    float _649 = _641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    float _653 = -_639;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[8].z, _645);
    float _657 = -_639;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[10].z, _647);
    float _661 = in.m_53.z;
    float _663 = in.m_53.w;
    float _665 = _651 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _667 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _669 = _649 + _659;
    float _671 = _621 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _673 = _665 + _655;
    float _675 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _667);
    float _677 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _679 = _669 + _677;
    float _681 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[9].x, _671);
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _685 = _673 + _683;
    float _687 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _675);
    float _689 = _679 * _679;
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _693 = _685 * _685;
    float _695 = -_639;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[9].z, _681);
    float _699 = _687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _701 = _693 + _689;
    float _703 = _699 + _697;
    float _705 = sqrt(_701);
    bool _707 = _661 > 0.5;
    bool _709 = _663 > 0.5;
    bool _711 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _713 = _697;
    float _715 = _621;
    float _717 = _675;
    float _719 = _639;
    float _721 = _691;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _725 = _679;
    if (!_711)
    {
        _713 = _689;
    }
    float _727 = _713;
    float _729 = _727;
    if (!_711)
    {
        _715 = _693;
    }
    float _731 = _715;
    float _733 = _731;
    if (!_711)
    {
        _717 = _673;
    }
    float _735 = _717;
    float _737 = _735;
    if (!_711)
    {
        _261 = _669;
    }
    float _739 = _261;
    float _741 = _739;
    if (!_711)
    {
        _719 = _703;
    }
    float _743 = _719;
    bool _745 = !_711;
    float _747 = _743;
    if (!_745)
    {
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _753 = _705 + _751;
        float _755 = _703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = rsqrt(_701);
        float _759 = _753 * _749;
        float _761 = _759 * 0.15915493667125701904296875;
        float _763 = _761 * 6.283185482025146484375;
        float _765 = sin(_763);
        float _767 = _761 * 6.283185482025146484375;
        float _769 = cos(_767);
        float _771 = fma(_765, _755, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _773 = _757 * _771;
        float _775 = _769 + (-1.0);
        float _777 = fma(_685, _773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _779 = fma(_679, _773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _781 = _775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _785 = _777 + _783;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _789 = _779 + _787;
        float _791 = fma(_703, _769, _781);
        float _793 = _785 * _785;
        float _795 = _789 * _789;
        _747 = _791;
        _733 = _793;
        _729 = _795;
        _737 = _777;
        _741 = _779;
    }
    float _797 = _747;
    float _799 = _733;
    float _801 = _729;
    float _803 = _737;
    float _805 = _741;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _809 = _797 + _807;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _817 = _815 != 0;
    float _819 = fma(_809, _809, _799);
    float _821 = -_611;
    int _823 = _707 ? as_type<int>(_821) : as_type<int>(_611);
    float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _827 = -_617;
    int _829 = _709 ? as_type<int>(_827) : as_type<int>(_617);
    float _831 = _819 + _801;
    bool _833 = !_813;
    float _835 = _833 ? _611 : as_type<float>(_823);
    float _837 = _611 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _839 = !_817;
    float _841 = _839 ? _617 : as_type<float>(_829);
    float _843 = _835 + 0.5;
    float _845 = sqrt(_831);
    float _847 = -_841;
    float _849 = _847 + 0.5;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _853 = _849 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _857 = _851 * _691;
    float _859 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].y);
    float _861 = _853 * _825;
    float _863 = _617 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _865 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].y);
    out.m_58.w = _855;
    float _867 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[9].x, (*spvDescriptorSet0.vp_c10)._m0[9].y);
    bool _869 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _871 = isnan(_845);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _877 = _873 || _875;
    out.m_60.z = _857;
    out.m_60.w = _861;
    float _879 = -_863;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c10)._m0[8].z, _859);
    float _883 = -_863;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _887 = -_863;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[10].z, _865);
    float _891 = _837;
    float _893 = _803;
    if (!_877)
    {
        _891 = 1.0;
    }
    float _895 = _891;
    bool _897 = !_877;
    float _899 = _895;
    if (!_897)
    {
        bool _901 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _903 = isnan(_845);
        bool _905 = _901 || _903;
        bool _907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _909 = _905 || _907;
        if (!_909)
        {
            float _911 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _913 = _845 + _911;
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _921 = _919 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _923 = 1.0 / _917;
            float _925 = _913 * _923;
            float _927 = fma(_925, _921, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _899 = _927;
            _929 = true;
        }
        else
        {
            bool _931 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _933 = isnan(_845);
            bool _935 = _931 || _933;
            bool _937 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _939 = _935 || _937;
            if (!_939)
            {
                float _941 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _943 = _845 + _941;
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _945 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _953 = 1.0 / _947;
                float _955 = _943 * _953;
                float _957 = fma(_955, _951, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _899 = _957;
                _929 = true;
            }
            else
            {
                _899 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _929 = false;
    float _959 = _899;
    float _961 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _963 = _803 + _961;
    float _965 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _967 = _797 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _971 = _805 + _969;
    bool _973 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    float _983 = fma(_963, _959, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _985 = fma(_967, _959, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _987 = fma(_971, _959, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _989 = _959;
    float _991 = _971;
    float _993 = _985;
    float _995 = _963;
    if (_981)
    {
        _893 = _983;
    }
    float _997 = _893;
    float _999 = _997;
    if (_981)
    {
        _989 = _985;
    }
    float _1001 = _989;
    float _1003 = _1001;
    if (_981)
    {
        _991 = _987;
    }
    float _1005 = _991;
    float _1007 = _1005;
    if (!_981)
    {
        float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1011 = _699 + _1009;
        float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1015 = _665 + _1013;
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1019 = -_665;
        float _1021 = _1019 + _983;
        float _1023 = _1011 * _1011;
        float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1027 = _649 + _1025;
        float _1029 = -_699;
        float _1031 = _1029 + _985;
        float _1033 = -_649;
        float _1035 = _1033 + _987;
        float _1037 = fma(_1015, _1015, _1023);
        float _1039 = fma(_1027, _1027, _1037);
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1043 = sqrt(_1039);
        float _1045 = _1041 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1047 = _1043 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1049 = isnan(_1043);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1055 = _1051 || _1053;
        float _1057 = precise::min(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1059 = _1057 * _1017;
        float _1061 = _1045 * _1059;
        float _1063 = _963;
        float _1065 = _1057;
        float _1067 = _1043;
        float _1069 = _1061;
        float _1071 = _1045;
        _993 = _1031;
        if (_1055)
        {
            float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1063 = _1073;
        }
        float _1075 = _1063;
        if (_1055)
        {
            float _1077 = precise::max(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1065 = _1077;
        }
        float _1079 = _1065;
        float _1081 = fma(_1031, _1061, _699);
        if (_1055)
        {
            float _1083 = _1079 * _1075;
            _1067 = _1083;
        }
        float _1085 = _1067;
        float _1087 = fma(_1021, _1061, _665);
        float _1089 = fma(_1035, _1061, _649);
        float _1091 = _1087;
        float _1093 = _1085;
        _995 = _1089;
        if (_1055)
        {
            float _1095 = _1045 * _1085;
            _1069 = _1095;
        }
        float _1097 = _1069;
        _721 = _1097;
        if (!_1055)
        {
            _1071 = _1087;
        }
        float _1099 = _1071;
        float _1101 = _1099;
        if (!_1055)
        {
            _1091 = _1081;
        }
        float _1103 = _1091;
        float _1105 = _1103;
        if (_1055)
        {
            float _1107 = fma(_1021, _1097, _665);
            _1101 = _1107;
        }
        float _1109 = _1101;
        _999 = _1109;
        if (!_1055)
        {
            _1093 = _1089;
        }
        float _1111 = _1093;
        _1007 = _1111;
        if (_1055)
        {
            float _1113 = fma(_1031, _1097, _699);
            _1105 = _1113;
        }
        float _1115 = _1105;
        _1003 = _1115;
        if (_1055)
        {
            float _1117 = fma(_1035, _1097, _649);
            _1007 = _1117;
        }
    }
    float _1119 = _1003;
    float _1121 = _999;
    float _1123 = _1007;
    float _1125 = _993;
    float _1127 = _995;
    float _1129 = _721;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1119 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1121 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1123 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = rsqrt(_1147);
    float _1151 = _1137 * _1149;
    float _1153 = _1141 * _1149;
    float _1155 = _1133 * _1149;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1161 = _1157 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 + _1163;
    float _1167 = sqrt(_1165);
    bool _1169 = _1167 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1167 + _1171;
    float _1175 = _1125;
    float _1177 = _1165;
    float _1179 = _1173;
    float _1181 = _1129;
    float _1183 = _1149;
    if (_1169)
    {
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1185;
    }
    float _1187 = _1175;
    if (_1169)
    {
        float _1189 = rsqrt(_1165);
        _1177 = _1189;
    }
    float _1191 = _1177;
    float _1193 = _1191;
    if (_1169)
    {
        float _1195 = _1173 * _1187;
        _1179 = _1195;
    }
    float _1197 = _1179;
    if (_1169)
    {
        float _1199 = _1197 * 0.15915493667125701904296875;
        _1181 = _1199;
    }
    float _1201 = _1181;
    float _1203 = _1127;
    if (_1169)
    {
        float _1205 = _1201 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        _1203 = _1207;
    }
    float _1209 = _1203;
    float _1211 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1213 = precise::max(0.0, _1211);
    float _1215 = _1187;
    float _1217 = _1213;
    if (_1169)
    {
        float _1219 = _1201 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        _1215 = _1221;
    }
    float _1223 = _1215;
    float _1225 = -_1155;
    float _1227 = -_1213;
    float _1229 = fma(_1225, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1227);
    if (_1169)
    {
        float _1231 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1183 = _1231;
    }
    float _1233 = _1183;
    float _1235 = sqrt(_1147);
    float _1237 = _1233;
    float _1239 = _1209;
    if (_1169)
    {
        float _1241 = fma(_1209, _1233, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1237 = _1241;
    }
    float _1243 = _1237;
    float _1245 = _1243;
    if (!_1169)
    {
        _1239 = _1157;
    }
    float _1247 = _1239;
    float _1249 = _1247;
    float _1251 = _1223;
    if (_1169)
    {
        float _1253 = _1223 + (-1.0);
        _1217 = _1253;
    }
    float _1255 = _1217;
    float _1257 = _1255;
    if (_1169)
    {
        float _1259 = _1191 * _1243;
        _723 = _1259;
    }
    float _1261 = _723;
    if (!_1169)
    {
        _1245 = _1229;
    }
    float _1263 = _1245;
    float _1265 = _1263;
    if (_1169)
    {
        float _1267 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _725 = _1267;
    }
    float _1269 = _725;
    if (_1169)
    {
        float _1271 = _1157 * _1261;
        _1249 = _1271;
    }
    float _1273 = _1249;
    if (!_1169)
    {
        _1257 = _1159;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    if (_1169)
    {
        float _1279 = _1159 * _1261;
        _1277 = _1279;
    }
    float _1281 = _1277;
    if (!_1169)
    {
        _1193 = _1161;
    }
    float _1283 = _1193;
    float _1285 = _1283;
    if (_1169)
    {
        float _1287 = fma(_1229, _1223, _1269);
        _1265 = _1287;
    }
    float _1289 = _1265;
    if (_1169)
    {
        float _1291 = _1273 * _1273;
        _1285 = _1291;
    }
    float _1293 = _1285;
    if (!_1169)
    {
        _1251 = _1163;
    }
    float _1295 = _1251;
    float _1297 = _1295;
    if (_1169)
    {
        float _1299 = _1281 * _1281;
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_1289, _1289, _1293);
    float _1305 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1303 + _1301;
    float _1309 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1319 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = -_1315;
    float _1325 = _1323 + 1.0;
    float _1327 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1329 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1331 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    float _1333 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1335 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1327);
    float _1337 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1339 = abs(_1325);
    float _1341 = log2(_1339);
    float _1343 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1331);
    float _1345 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1333);
    float _1347 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1335);
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1353 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1345);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1321 * _1273;
    float _1359 = _1321 * _1289;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1363 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1321 * _1281;
    float _1369 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1361);
    float _1371 = -_1349;
    float _1373 = fma(_1371, _1317, 1.0);
    float _1375 = -_1365;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1375);
    float _1379 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1381 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1369);
    float _1383 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1385 = -_1367;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1377);
    float _1389 = exp2(_1379);
    float _1391 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1381);
    float _1393 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1395 = fma(_1387, -0.5, 0.5);
    float _1397 = fma(_1387, 0.5, 0.5);
    float _1399 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1383);
    float _1401 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1393);
    float _1403 = _1359 + 1.0;
    float _1405 = log2(_1373);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1401);
    float _1411 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1413 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1415 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1409);
    float _1417 = 1.0 / _1391;
    float _1419 = -_1359;
    float _1421 = fma(_1389, _1403, _1419);
    float _1423 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1425 = fma(_1397, _1413, 1.570728778839111328125);
    float _1427 = fma(_1421, 0.5, 0.5);
    float _1429 = sqrt(_1395);
    float _1431 = _1405 * 0.693147182464599609375;
    float _1433 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1435 = _1415 * _1417;
    float _1437 = _1423 * _1417;
    float _1439 = fma(_1435, 0.5, 0.5);
    float _1441 = fma(_1437, -0.5, 0.5);
    float _1443 = _1429 * 0.636619746685028076171875;
    float _1445 = -_1425;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _3929 = float3(_1439, _1441, _1433);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3929, float3(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3929, float3(0.0), isnan(_3929)), level(0.0)).x;
    float3 _3940 = float3(_1439, _1441, _1433);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3940, float3(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3940, float3(0.0), isnan(_3940)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _3957 = float2(_1447, _1427);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3957, float2(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3957, float2(0.0), isnan(_3957)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = _699 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1474 = _885 * _1155;
    float _1476 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1478 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1472);
    float _1480 = _699 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1482;
    float _1486 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1478);
    float _1488 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1480);
    float _1490 = fma(_881, _1151, _1474);
    bool _1492 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.5);
    bool _1500 = _1496 || _1498;
    float _1502 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = 1.0 / _1484;
    float _1506 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1488);
    float _1508 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1510 = fma(_889, _1153, _1490);
    float _1512 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1514 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1508);
    float _1516 = abs(_1510);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1520 = _1516 + _1518;
    float _1522 = 1.0 / _1502;
    float _1524 = _1512 + _1502;
    float _1526 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1514);
    float _1528 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1526);
    float _1530 = exp2(_1476);
    float _1532 = _1520 * _1504;
    float _1534 = precise::clamp(_1532, 0.0, 1.0);
    float _1536 = fma(_1534, -2.0, 3.0);
    float _1538 = _1534 * _1534;
    float _1540 = _1524 * _1522;
    float _1542 = _1540 * 0.5;
    float _1544 = _1524;
    if (_1500)
    {
        _1544 = 1.0;
    }
    float _1546 = _1544;
    float _1548 = _1546;
    if (!_1500)
    {
        float _1550 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1554 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1552);
        float _1556 = _1550 * 0.15915493667125701904296875;
        float _1558 = _1556 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        float _1562 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1564 = _1562 * 0.15915493667125701904296875;
        float _1566 = _1556 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        float _1570 = 1.0 / _1560;
        float _1572 = _1564 * 6.283185482025146484375;
        float _1574 = cos(_1572);
        float _1576 = _1568 * _1570;
        float _1578 = 1.0 / _1554;
        float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1582 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1580;
        float _1584 = _1574 * _1576;
        float _1586 = _1564 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        float _1590 = 1.0 / _1584;
        float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1594 = _1578 * _1592;
        float _1596 = 1.0 / _1582;
        float _1598 = _1588 * _1590;
        float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1602 = fma(_1598, _1594, _1600);
        float _1604 = _1602 * _1596;
        float _1606 = precise::clamp(_1604, 0.0, 1.0);
        _1548 = _1606;
    }
    float _1608 = _1548;
    float _1610 = -_1530;
    float _1612 = _1610 + 1.0;
    float _1614 = _1538 * _1536;
    float _1616 = _1391 * 0.5;
    bool _1618 = _1608 > 0.0;
    bool _1620 = isnan(_1608);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.0);
    bool _1626 = _1622 || _1624;
    float _1628 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1630 = _1614 * _1608;
    float _1632 = _1528 + _1391;
    float _1634 = _1415 + _1391;
    float _1636 = _1628 * _1449;
    float _1638 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1640 = -_1628;
    float _1642 = _1640 + 1.0;
    float _1644 = fma(_1423, -0.5, _1616);
    float _1646 = _1460 * _1636;
    float _1648 = _1470 * _1636;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _1528;
    out.gl_Position.w = _1391;
    float _1650 = fma(_1466, _1646, _1454);
    float _1652 = fma(_1468, _1646, _1456);
    float _1654 = _1632 * 0.5;
    float _1656 = _1634 * 0.5;
    float _1658 = _1638 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1660 = _1460 * _1642;
    float _1662 = fma(_1460, _1648, _1458);
    out.m_62.x = _1656;
    out.m_62.y = _1644;
    out.m_62.z = _1654;
    out.m_62.w = _1391;
    out.m_47.x = _1658;
    out.m_64.x = _1650;
    out.m_64.y = _1652;
    out.m_64.z = _1662;
    out.m_64.w = _1660;
    if (_1626)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1664 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1664;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _929 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1721 = as_type<float>(_99);
        out.gl_Position.z = _1721;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1789 = as_type<float>(_135);
        out.gl_Position.z = _1789;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_51.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = exp2(_193);
        float _197 = _191 * 0.693147182464599609375;
        float _199 = 1.0 / _197;
        float _201 = 1.0 / _189;
        float _203 = _195 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _199, _139);
        float _209 = _207 * _201;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _261 = _253;
    float _279;
    if (!_259)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_83);
        float _285 = 1.0 / _283;
        float _287 = _117 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _289 + _291;
    float _295 = as_type<float>(int(gl_VertexIndex));
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _313 = 1.0 / _299;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _323 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_289);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _303;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _289 + _337;
    float _341 = 1.0 / _311;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _289 + _343;
    float _347 = _339 * _313;
    bool _349 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _351 = isnan(_289);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_289);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    int _373 = as_type<int>(_295) & 1;
    bool _375 = _373 != 0;
    int _377 = as_type<int>(_295) & 2;
    bool _379 = _377 != 0;
    float _381 = 1.0 / _307;
    float _383 = _345 * _335;
    bool _385 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _387 = isnan(_289);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_371;
    float _399 = _397 + 1.0;
    bool _401 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _403 = isnan(_289);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -_395;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _321;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _289 + _419;
    float _423 = _333 * _399;
    float _425 = -_333;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = _421 * _341;
    float _435 = -_359;
    float _437 = _435 + 1.0;
    float _439 = 1.0 / _317;
    float _441 = _293 * _381;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _445 = _289 + _443;
    float _447 = _411 * _437;
    float _449 = -_411;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    float _457 = fma(_431, _441, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = _445 * _417;
    float _461 = _371 * _415;
    bool _463 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_289);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = _395 * _451;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _483 = _289 + _481;
    bool _485 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _487 = isnan(_289);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = -_473;
    float _503 = _501 + 1.0;
    float _505 = fma(_479, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_455, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = _473 * _427;
    float _511 = _483 * _439;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = _495 * _503;
    float _519 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _521 = fma(_515, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _523 = _505 * _517;
    float _525 = _507 * _517;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _527;
    float _531 = -_495;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_529, _441, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[143].y, _525);
    float _549 = fma(_537, _433, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _551 = fma(_519, _509, _545);
    float _553 = fma(_541, _433, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = in.m_51.x;
    float _557 = in.m_51.y;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _559;
    float _563 = fma(_521, _509, _547);
    float _565 = fma(_543, _423, _551);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _567;
    float _571 = fma(_561, _511, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _573 = fma(_457, _423, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _579 = fma(_549, _461, _565);
    float _581 = fma(_569, _511, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _587 = fma(_553, _461, _573);
    float _589 = fma(_577, _459, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _591 = fma(_571, _475, _579);
    float _593 = fma(_585, _459, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _595 = fma(_581, _475, _587);
    float _597 = fma(_589, _447, _591);
    float _599 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _601 = fma(_593, _447, _595);
    float _603 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[149].x, _597);
    float _605 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _599);
    float _607 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[149].y, _601);
    bool _609 = !_375;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = _603 * _555;
    bool _615 = !_379;
    float _617 = _615 ? (-0.5) : 0.5;
    float _619 = _607 * _557;
    float _621 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    float _625 = _613 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _617);
    float _629 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _631 = _621 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _633 = _625 * _623;
    float _635 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _621 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _639 = _629 * _627;
    float _641 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _605);
    float _643 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[8].x, _631);
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[10].x, _637);
    float _649 = _641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    float _653 = -_639;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[8].z, _645);
    float _657 = -_639;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[10].z, _647);
    float _661 = in.m_53.z;
    float _663 = in.m_53.w;
    float _665 = _651 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _667 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _669 = _649 + _659;
    float _671 = _621 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _673 = _665 + _655;
    float _675 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _667);
    float _677 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _679 = _669 + _677;
    float _681 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[9].x, _671);
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _685 = _673 + _683;
    float _687 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _675);
    float _689 = _679 * _679;
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _693 = _685 * _685;
    float _695 = -_639;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[9].z, _681);
    float _699 = _687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _701 = _693 + _689;
    float _703 = _699 + _697;
    float _705 = sqrt(_701);
    bool _707 = _661 > 0.5;
    bool _709 = _663 > 0.5;
    bool _711 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _713 = _697;
    float _715 = _621;
    float _717 = _675;
    float _719 = _639;
    float _721 = _691;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _725 = _679;
    if (!_711)
    {
        _713 = _689;
    }
    float _727 = _713;
    float _729 = _727;
    if (!_711)
    {
        _715 = _693;
    }
    float _731 = _715;
    float _733 = _731;
    if (!_711)
    {
        _717 = _673;
    }
    float _735 = _717;
    float _737 = _735;
    if (!_711)
    {
        _261 = _669;
    }
    float _739 = _261;
    float _741 = _739;
    if (!_711)
    {
        _719 = _703;
    }
    float _743 = _719;
    bool _745 = !_711;
    float _747 = _743;
    if (!_745)
    {
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _753 = _705 + _751;
        float _755 = _703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = rsqrt(_701);
        float _759 = _753 * _749;
        float _761 = _759 * 0.15915493667125701904296875;
        float _763 = _761 * 6.283185482025146484375;
        float _765 = sin(_763);
        float _767 = _761 * 6.283185482025146484375;
        float _769 = cos(_767);
        float _771 = fma(_765, _755, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _773 = _757 * _771;
        float _775 = _769 + (-1.0);
        float _777 = fma(_685, _773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _779 = fma(_679, _773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _781 = _775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _785 = _777 + _783;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _789 = _779 + _787;
        float _791 = fma(_703, _769, _781);
        float _793 = _785 * _785;
        float _795 = _789 * _789;
        _747 = _791;
        _733 = _793;
        _729 = _795;
        _737 = _777;
        _741 = _779;
    }
    float _797 = _747;
    float _799 = _733;
    float _801 = _729;
    float _803 = _737;
    float _805 = _741;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _809 = _797 + _807;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _817 = _815 != 0;
    float _819 = fma(_809, _809, _799);
    float _821 = -_611;
    int _823 = _707 ? as_type<int>(_821) : as_type<int>(_611);
    float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _827 = -_617;
    int _829 = _709 ? as_type<int>(_827) : as_type<int>(_617);
    float _831 = _819 + _801;
    bool _833 = !_813;
    float _835 = _833 ? _611 : as_type<float>(_823);
    float _837 = _611 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _839 = !_817;
    float _841 = _839 ? _617 : as_type<float>(_829);
    float _843 = _835 + 0.5;
    float _845 = sqrt(_831);
    float _847 = -_841;
    float _849 = _847 + 0.5;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _853 = _849 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _857 = _851 * _691;
    float _859 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].y);
    float _861 = _853 * _825;
    float _863 = _617 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _865 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].y);
    out.m_58.w = _855;
    float _867 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[9].x, (*spvDescriptorSet0.vp_c10)._m0[9].y);
    bool _869 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _871 = isnan(_845);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _877 = _873 || _875;
    out.m_60.z = _857;
    out.m_60.w = _861;
    float _879 = -_863;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c10)._m0[8].z, _859);
    float _883 = -_863;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _887 = -_863;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[10].z, _865);
    float _891 = _837;
    float _893 = _803;
    if (!_877)
    {
        _891 = 1.0;
    }
    float _895 = _891;
    bool _897 = !_877;
    float _899 = _895;
    if (!_897)
    {
        bool _901 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _903 = isnan(_845);
        bool _905 = _901 || _903;
        bool _907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _909 = _905 || _907;
        if (!_909)
        {
            float _911 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _913 = _845 + _911;
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _921 = _919 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _923 = 1.0 / _917;
            float _925 = _913 * _923;
            float _927 = fma(_925, _921, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _899 = _927;
            _929 = true;
        }
        else
        {
            bool _931 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _933 = isnan(_845);
            bool _935 = _931 || _933;
            bool _937 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _939 = _935 || _937;
            if (!_939)
            {
                float _941 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _943 = _845 + _941;
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _945 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _953 = 1.0 / _947;
                float _955 = _943 * _953;
                float _957 = fma(_955, _951, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _899 = _957;
                _929 = true;
            }
            else
            {
                _899 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _929 = false;
    float _959 = _899;
    float _961 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _963 = _803 + _961;
    float _965 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _967 = _797 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _971 = _805 + _969;
    bool _973 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    float _983 = fma(_963, _959, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _985 = fma(_967, _959, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _987 = fma(_971, _959, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _989 = _959;
    float _991 = _971;
    float _993 = _985;
    float _995 = _963;
    if (_981)
    {
        _893 = _983;
    }
    float _997 = _893;
    float _999 = _997;
    if (_981)
    {
        _989 = _985;
    }
    float _1001 = _989;
    float _1003 = _1001;
    if (_981)
    {
        _991 = _987;
    }
    float _1005 = _991;
    float _1007 = _1005;
    if (!_981)
    {
        float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1011 = _699 + _1009;
        float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1015 = _665 + _1013;
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1019 = -_665;
        float _1021 = _1019 + _983;
        float _1023 = _1011 * _1011;
        float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1027 = _649 + _1025;
        float _1029 = -_699;
        float _1031 = _1029 + _985;
        float _1033 = -_649;
        float _1035 = _1033 + _987;
        float _1037 = fma(_1015, _1015, _1023);
        float _1039 = fma(_1027, _1027, _1037);
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1043 = sqrt(_1039);
        float _1045 = _1041 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1047 = _1043 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1049 = isnan(_1043);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1055 = _1051 || _1053;
        float _1057 = precise::min(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1059 = _1057 * _1017;
        float _1061 = _1045 * _1059;
        float _1063 = _963;
        float _1065 = _1057;
        float _1067 = _1043;
        float _1069 = _1061;
        float _1071 = _1045;
        _993 = _1031;
        if (_1055)
        {
            float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1063 = _1073;
        }
        float _1075 = _1063;
        if (_1055)
        {
            float _1077 = precise::max(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1065 = _1077;
        }
        float _1079 = _1065;
        float _1081 = fma(_1031, _1061, _699);
        if (_1055)
        {
            float _1083 = _1079 * _1075;
            _1067 = _1083;
        }
        float _1085 = _1067;
        float _1087 = fma(_1021, _1061, _665);
        float _1089 = fma(_1035, _1061, _649);
        float _1091 = _1087;
        float _1093 = _1085;
        _995 = _1089;
        if (_1055)
        {
            float _1095 = _1045 * _1085;
            _1069 = _1095;
        }
        float _1097 = _1069;
        _721 = _1097;
        if (!_1055)
        {
            _1071 = _1087;
        }
        float _1099 = _1071;
        float _1101 = _1099;
        if (!_1055)
        {
            _1091 = _1081;
        }
        float _1103 = _1091;
        float _1105 = _1103;
        if (_1055)
        {
            float _1107 = fma(_1021, _1097, _665);
            _1101 = _1107;
        }
        float _1109 = _1101;
        _999 = _1109;
        if (!_1055)
        {
            _1093 = _1089;
        }
        float _1111 = _1093;
        _1007 = _1111;
        if (_1055)
        {
            float _1113 = fma(_1031, _1097, _699);
            _1105 = _1113;
        }
        float _1115 = _1105;
        _1003 = _1115;
        if (_1055)
        {
            float _1117 = fma(_1035, _1097, _649);
            _1007 = _1117;
        }
    }
    float _1119 = _1003;
    float _1121 = _999;
    float _1123 = _1007;
    float _1125 = _993;
    float _1127 = _995;
    float _1129 = _721;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1119 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1121 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1123 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = rsqrt(_1147);
    float _1151 = _1137 * _1149;
    float _1153 = _1141 * _1149;
    float _1155 = _1133 * _1149;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1161 = _1157 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 + _1163;
    float _1167 = sqrt(_1165);
    bool _1169 = _1167 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1167 + _1171;
    float _1175 = _1125;
    float _1177 = _1165;
    float _1179 = _1173;
    float _1181 = _1129;
    float _1183 = _1149;
    if (_1169)
    {
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1185;
    }
    float _1187 = _1175;
    if (_1169)
    {
        float _1189 = rsqrt(_1165);
        _1177 = _1189;
    }
    float _1191 = _1177;
    float _1193 = _1191;
    if (_1169)
    {
        float _1195 = _1173 * _1187;
        _1179 = _1195;
    }
    float _1197 = _1179;
    if (_1169)
    {
        float _1199 = _1197 * 0.15915493667125701904296875;
        _1181 = _1199;
    }
    float _1201 = _1181;
    float _1203 = _1127;
    if (_1169)
    {
        float _1205 = _1201 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        _1203 = _1207;
    }
    float _1209 = _1203;
    float _1211 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1213 = precise::max(0.0, _1211);
    float _1215 = _1187;
    float _1217 = _1213;
    if (_1169)
    {
        float _1219 = _1201 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        _1215 = _1221;
    }
    float _1223 = _1215;
    float _1225 = -_1155;
    float _1227 = -_1213;
    float _1229 = fma(_1225, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1227);
    if (_1169)
    {
        float _1231 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1183 = _1231;
    }
    float _1233 = _1183;
    float _1235 = sqrt(_1147);
    float _1237 = _1233;
    float _1239 = _1209;
    if (_1169)
    {
        float _1241 = fma(_1209, _1233, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1237 = _1241;
    }
    float _1243 = _1237;
    float _1245 = _1243;
    if (!_1169)
    {
        _1239 = _1157;
    }
    float _1247 = _1239;
    float _1249 = _1247;
    float _1251 = _1223;
    if (_1169)
    {
        float _1253 = _1223 + (-1.0);
        _1217 = _1253;
    }
    float _1255 = _1217;
    float _1257 = _1255;
    if (_1169)
    {
        float _1259 = _1191 * _1243;
        _723 = _1259;
    }
    float _1261 = _723;
    if (!_1169)
    {
        _1245 = _1229;
    }
    float _1263 = _1245;
    float _1265 = _1263;
    if (_1169)
    {
        float _1267 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _725 = _1267;
    }
    float _1269 = _725;
    if (_1169)
    {
        float _1271 = _1157 * _1261;
        _1249 = _1271;
    }
    float _1273 = _1249;
    if (!_1169)
    {
        _1257 = _1159;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    if (_1169)
    {
        float _1279 = _1159 * _1261;
        _1277 = _1279;
    }
    float _1281 = _1277;
    if (!_1169)
    {
        _1193 = _1161;
    }
    float _1283 = _1193;
    float _1285 = _1283;
    if (_1169)
    {
        float _1287 = fma(_1229, _1223, _1269);
        _1265 = _1287;
    }
    float _1289 = _1265;
    if (_1169)
    {
        float _1291 = _1273 * _1273;
        _1285 = _1291;
    }
    float _1293 = _1285;
    if (!_1169)
    {
        _1251 = _1163;
    }
    float _1295 = _1251;
    float _1297 = _1295;
    if (_1169)
    {
        float _1299 = _1281 * _1281;
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_1289, _1289, _1293);
    float _1305 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1303 + _1301;
    float _1309 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1319 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = -_1315;
    float _1325 = _1323 + 1.0;
    float _1327 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1329 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1331 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    float _1333 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1335 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1327);
    float _1337 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1339 = abs(_1325);
    float _1341 = log2(_1339);
    float _1343 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1331);
    float _1345 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1333);
    float _1347 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1335);
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1353 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1345);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1321 * _1273;
    float _1359 = _1321 * _1289;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1363 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1321 * _1281;
    float _1369 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1361);
    float _1371 = -_1349;
    float _1373 = fma(_1371, _1317, 1.0);
    float _1375 = -_1365;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1375);
    float _1379 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1381 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1369);
    float _1383 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1385 = -_1367;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1377);
    float _1389 = exp2(_1379);
    float _1391 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1381);
    float _1393 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1395 = fma(_1387, -0.5, 0.5);
    float _1397 = fma(_1387, 0.5, 0.5);
    float _1399 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1383);
    float _1401 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1393);
    float _1403 = _1359 + 1.0;
    float _1405 = log2(_1373);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1401);
    float _1411 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1413 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1415 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1409);
    float _1417 = 1.0 / _1391;
    float _1419 = -_1359;
    float _1421 = fma(_1389, _1403, _1419);
    float _1423 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1425 = fma(_1397, _1413, 1.570728778839111328125);
    float _1427 = fma(_1421, 0.5, 0.5);
    float _1429 = sqrt(_1395);
    float _1431 = _1405 * 0.693147182464599609375;
    float _1433 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1435 = _1415 * _1417;
    float _1437 = _1423 * _1417;
    float _1439 = fma(_1435, 0.5, 0.5);
    float _1441 = fma(_1437, -0.5, 0.5);
    float _1443 = _1429 * 0.636619746685028076171875;
    float _1445 = -_1425;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _3929 = float3(_1439, _1441, _1433);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3929, float3(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3929, float3(0.0), isnan(_3929)), level(0.0)).x;
    float3 _3940 = float3(_1439, _1441, _1433);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3940, float3(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3940, float3(0.0), isnan(_3940)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _3957 = float2(_1447, _1427);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3957, float2(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3957, float2(0.0), isnan(_3957)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = _699 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1474 = _885 * _1155;
    float _1476 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1478 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1472);
    float _1480 = _699 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1482;
    float _1486 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1478);
    float _1488 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1480);
    float _1490 = fma(_881, _1151, _1474);
    bool _1492 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.5);
    bool _1500 = _1496 || _1498;
    float _1502 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = 1.0 / _1484;
    float _1506 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1488);
    float _1508 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1510 = fma(_889, _1153, _1490);
    float _1512 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1514 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1508);
    float _1516 = abs(_1510);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1520 = _1516 + _1518;
    float _1522 = 1.0 / _1502;
    float _1524 = _1512 + _1502;
    float _1526 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1514);
    float _1528 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1526);
    float _1530 = exp2(_1476);
    float _1532 = _1520 * _1504;
    float _1534 = precise::clamp(_1532, 0.0, 1.0);
    float _1536 = fma(_1534, -2.0, 3.0);
    float _1538 = _1534 * _1534;
    float _1540 = _1524 * _1522;
    float _1542 = _1540 * 0.5;
    float _1544 = _1524;
    if (_1500)
    {
        _1544 = 1.0;
    }
    float _1546 = _1544;
    float _1548 = _1546;
    if (!_1500)
    {
        float _1550 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1554 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1552);
        float _1556 = _1550 * 0.15915493667125701904296875;
        float _1558 = _1556 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        float _1562 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1564 = _1562 * 0.15915493667125701904296875;
        float _1566 = _1556 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        float _1570 = 1.0 / _1560;
        float _1572 = _1564 * 6.283185482025146484375;
        float _1574 = cos(_1572);
        float _1576 = _1568 * _1570;
        float _1578 = 1.0 / _1554;
        float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1582 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1580;
        float _1584 = _1574 * _1576;
        float _1586 = _1564 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        float _1590 = 1.0 / _1584;
        float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1594 = _1578 * _1592;
        float _1596 = 1.0 / _1582;
        float _1598 = _1588 * _1590;
        float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1602 = fma(_1598, _1594, _1600);
        float _1604 = _1602 * _1596;
        float _1606 = precise::clamp(_1604, 0.0, 1.0);
        _1548 = _1606;
    }
    float _1608 = _1548;
    float _1610 = -_1530;
    float _1612 = _1610 + 1.0;
    float _1614 = _1538 * _1536;
    float _1616 = _1391 * 0.5;
    bool _1618 = _1608 > 0.0;
    bool _1620 = isnan(_1608);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.0);
    bool _1626 = _1622 || _1624;
    float _1628 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1630 = _1614 * _1608;
    float _1632 = _1528 + _1391;
    float _1634 = _1415 + _1391;
    float _1636 = _1628 * _1449;
    float _1638 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1640 = -_1628;
    float _1642 = _1640 + 1.0;
    float _1644 = fma(_1423, -0.5, _1616);
    float _1646 = _1460 * _1636;
    float _1648 = _1470 * _1636;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _1528;
    out.gl_Position.w = _1391;
    float _1650 = fma(_1466, _1646, _1454);
    float _1652 = fma(_1468, _1646, _1456);
    float _1654 = _1632 * 0.5;
    float _1656 = _1634 * 0.5;
    float _1658 = _1638 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1660 = _1460 * _1642;
    float _1662 = fma(_1460, _1648, _1458);
    out.m_62.x = _1656;
    out.m_62.y = _1644;
    out.m_62.z = _1654;
    out.m_62.w = _1391;
    out.m_47.x = _1658;
    out.m_64.x = _1650;
    out.m_64.y = _1652;
    out.m_64.z = _1662;
    out.m_64.w = _1660;
    if (_1626)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1664 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1664;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _929 = false;
    bool _281 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_47.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1721 = as_type<float>(_99);
        out.gl_Position.z = _1721;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1789 = as_type<float>(_135);
        out.gl_Position.z = _1789;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_51.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_49.x;
    float _153 = in.m_49.y;
    float _155 = in.m_49.z;
    float _157 = in.m_44.x;
    float _159 = in.m_44.y;
    float _161 = in.m_44.z;
    float _163 = 0.0;
    float _165 = _139;
    if (!_149)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = _171;
    if (!_149)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    bool _179 = !_149;
    float _181 = _177;
    if (!_179)
    {
        float _183 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _185 = log2(_183);
        float _187 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _189 = _187 + 1.0;
        float _191 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _193 = _139 * _185;
        float _195 = exp2(_193);
        float _197 = _191 * 0.693147182464599609375;
        float _199 = 1.0 / _197;
        float _201 = 1.0 / _189;
        float _203 = _195 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _199, _139);
        float _209 = _207 * _201;
        float _211 = _209 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _211;
    }
    float _213 = _181;
    bool _215 = !_149;
    if (!_215)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = 1.0 / _223;
        float _227 = _139 * _219;
        float _229 = exp2(_227);
        float _231 = -_229;
        float _233 = _231 + 1.0;
        float _235 = _233 * _225;
        _165 = _235;
    }
    float _237 = _165;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _241 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _243 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _245 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _247 = fma(_237, _151, _241);
    float _249 = fma(_237, _153, _243);
    float _251 = fma(_237, _155, _245);
    float _253 = fma(_247, _137, _157);
    float _255 = fma(_249, _137, _159);
    float _257 = fma(_251, _137, _161);
    bool _259 = !_239;
    float _261 = _253;
    float _279;
    if (!_259)
    {
        float _263 = in.m_53.x;
        float _265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _267 = _263 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _271 = _269 * _265;
        float _273 = floor(_271);
        float _275 = -_273;
        float _277 = _271 + _275;
        _279 = _277;
        _281 = true;
    }
    else
    {
        float _283 = float(_83);
        float _285 = 1.0 / _283;
        float _287 = _117 * _285;
        _279 = _287;
    }
    _281 = false;
    float _289 = _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = _289 + _291;
    float _295 = as_type<float>(int(gl_VertexIndex));
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _313 = 1.0 / _299;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _323 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_289);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = 1.0 / _303;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = _289 + _337;
    float _341 = 1.0 / _311;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _289 + _343;
    float _347 = _339 * _313;
    bool _349 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _351 = isnan(_289);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _363 = isnan(_289);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    int _373 = as_type<int>(_295) & 1;
    bool _375 = _373 != 0;
    int _377 = as_type<int>(_295) & 2;
    bool _379 = _377 != 0;
    float _381 = 1.0 / _307;
    float _383 = _345 * _335;
    bool _385 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _387 = isnan(_289);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -_371;
    float _399 = _397 + 1.0;
    bool _401 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _403 = isnan(_289);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = -_395;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _321;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _421 = _289 + _419;
    float _423 = _333 * _399;
    float _425 = -_333;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _429;
    float _433 = _421 * _341;
    float _435 = -_359;
    float _437 = _435 + 1.0;
    float _439 = 1.0 / _317;
    float _441 = _293 * _381;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _445 = _289 + _443;
    float _447 = _411 * _437;
    float _449 = -_411;
    float _451 = _449 + 1.0;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _453;
    float _457 = fma(_431, _441, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = _445 * _417;
    float _461 = _371 * _415;
    bool _463 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_289);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = _395 * _451;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _483 = _289 + _481;
    bool _485 = _289 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _487 = isnan(_289);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _499 = _497 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _501 = -_473;
    float _503 = _501 + 1.0;
    float _505 = fma(_479, _347, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_455, _347, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = _473 * _427;
    float _511 = _483 * _439;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _517 = _495 * _503;
    float _519 = fma(_499, _383, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _521 = fma(_515, _383, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _523 = _505 * _517;
    float _525 = _507 * _517;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _527;
    float _531 = -_495;
    float _533 = _531 + 1.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _543 = fma(_529, _441, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _545 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _547 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[143].y, _525);
    float _549 = fma(_537, _433, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _551 = fma(_519, _509, _545);
    float _553 = fma(_541, _433, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _555 = in.m_51.x;
    float _557 = in.m_51.y;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _559;
    float _563 = fma(_521, _509, _547);
    float _565 = fma(_543, _423, _551);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _567;
    float _571 = fma(_561, _511, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _573 = fma(_457, _423, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _579 = fma(_549, _461, _565);
    float _581 = fma(_569, _511, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _587 = fma(_553, _461, _573);
    float _589 = fma(_577, _459, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _591 = fma(_571, _475, _579);
    float _593 = fma(_585, _459, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _595 = fma(_581, _475, _587);
    float _597 = fma(_589, _447, _591);
    float _599 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _601 = fma(_593, _447, _595);
    float _603 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[149].x, _597);
    float _605 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _599);
    float _607 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[149].y, _601);
    bool _609 = !_375;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = _603 * _555;
    bool _615 = !_379;
    float _617 = _615 ? (-0.5) : 0.5;
    float _619 = _607 * _557;
    float _621 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _623 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    float _625 = _613 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _627 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _617);
    float _629 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _631 = _621 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _633 = _625 * _623;
    float _635 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = _621 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _639 = _629 * _627;
    float _641 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _605);
    float _643 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    float _645 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[8].x, _631);
    float _647 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[10].x, _637);
    float _649 = _641 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _651 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _643);
    float _653 = -_639;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c10)._m0[8].z, _645);
    float _657 = -_639;
    float _659 = fma(_657, (*spvDescriptorSet0.vp_c10)._m0[10].z, _647);
    float _661 = in.m_53.z;
    float _663 = in.m_53.w;
    float _665 = _651 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _667 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _669 = _649 + _659;
    float _671 = _621 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _673 = _665 + _655;
    float _675 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _667);
    float _677 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _679 = _669 + _677;
    float _681 = fma(_633, (*spvDescriptorSet0.vp_c10)._m0[9].x, _671);
    float _683 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _685 = _673 + _683;
    float _687 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _675);
    float _689 = _679 * _679;
    float _691 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _693 = _685 * _685;
    float _695 = -_639;
    float _697 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[9].z, _681);
    float _699 = _687 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _701 = _693 + _689;
    float _703 = _699 + _697;
    float _705 = sqrt(_701);
    bool _707 = _661 > 0.5;
    bool _709 = _663 > 0.5;
    bool _711 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _713 = _697;
    float _715 = _621;
    float _717 = _675;
    float _719 = _639;
    float _721 = _691;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _725 = _679;
    if (!_711)
    {
        _713 = _689;
    }
    float _727 = _713;
    float _729 = _727;
    if (!_711)
    {
        _715 = _693;
    }
    float _731 = _715;
    float _733 = _731;
    if (!_711)
    {
        _717 = _673;
    }
    float _735 = _717;
    float _737 = _735;
    if (!_711)
    {
        _261 = _669;
    }
    float _739 = _261;
    float _741 = _739;
    if (!_711)
    {
        _719 = _703;
    }
    float _743 = _719;
    bool _745 = !_711;
    float _747 = _743;
    if (!_745)
    {
        float _749 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _751 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _753 = _705 + _751;
        float _755 = _703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _757 = rsqrt(_701);
        float _759 = _753 * _749;
        float _761 = _759 * 0.15915493667125701904296875;
        float _763 = _761 * 6.283185482025146484375;
        float _765 = sin(_763);
        float _767 = _761 * 6.283185482025146484375;
        float _769 = cos(_767);
        float _771 = fma(_765, _755, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _773 = _757 * _771;
        float _775 = _769 + (-1.0);
        float _777 = fma(_685, _773, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _779 = fma(_679, _773, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _781 = _775 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _785 = _777 + _783;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _789 = _779 + _787;
        float _791 = fma(_703, _769, _781);
        float _793 = _785 * _785;
        float _795 = _789 * _789;
        _747 = _791;
        _733 = _793;
        _729 = _795;
        _737 = _777;
        _741 = _779;
    }
    float _797 = _747;
    float _799 = _733;
    float _801 = _729;
    float _803 = _737;
    float _805 = _741;
    float _807 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _809 = _797 + _807;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _813 = _811 != 0;
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _817 = _815 != 0;
    float _819 = fma(_809, _809, _799);
    float _821 = -_611;
    int _823 = _707 ? as_type<int>(_821) : as_type<int>(_611);
    float _825 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _827 = -_617;
    int _829 = _709 ? as_type<int>(_827) : as_type<int>(_617);
    float _831 = _819 + _801;
    bool _833 = !_813;
    float _835 = _833 ? _611 : as_type<float>(_823);
    float _837 = _611 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _839 = !_817;
    float _841 = _839 ? _617 : as_type<float>(_829);
    float _843 = _835 + 0.5;
    float _845 = sqrt(_831);
    float _847 = -_841;
    float _849 = _847 + 0.5;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _853 = _849 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _857 = _851 * _691;
    float _859 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[8].x, (*spvDescriptorSet0.vp_c10)._m0[8].y);
    float _861 = _853 * _825;
    float _863 = _617 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _865 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[10].x, (*spvDescriptorSet0.vp_c10)._m0[10].y);
    out.m_58.w = _855;
    float _867 = fma(_837, (*spvDescriptorSet0.vp_c10)._m0[9].x, (*spvDescriptorSet0.vp_c10)._m0[9].y);
    bool _869 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _871 = isnan(_845);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _877 = _873 || _875;
    out.m_60.z = _857;
    out.m_60.w = _861;
    float _879 = -_863;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c10)._m0[8].z, _859);
    float _883 = -_863;
    float _885 = fma(_883, (*spvDescriptorSet0.vp_c10)._m0[9].z, _867);
    float _887 = -_863;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c10)._m0[10].z, _865);
    float _891 = _837;
    float _893 = _803;
    if (!_877)
    {
        _891 = 1.0;
    }
    float _895 = _891;
    bool _897 = !_877;
    float _899 = _895;
    if (!_897)
    {
        bool _901 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _903 = isnan(_845);
        bool _905 = _901 || _903;
        bool _907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _909 = _905 || _907;
        if (!_909)
        {
            float _911 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _913 = _845 + _911;
            float _915 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _917 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _915;
            float _919 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _921 = _919 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _923 = 1.0 / _917;
            float _925 = _913 * _923;
            float _927 = fma(_925, _921, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _899 = _927;
            _929 = true;
        }
        else
        {
            bool _931 = _845 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _933 = isnan(_845);
            bool _935 = _931 || _933;
            bool _937 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _939 = _935 || _937;
            if (!_939)
            {
                float _941 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _943 = _845 + _941;
                float _945 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _947 = _945 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _949 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _951 = _949 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _953 = 1.0 / _947;
                float _955 = _943 * _953;
                float _957 = fma(_955, _951, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _899 = _957;
                _929 = true;
            }
            else
            {
                _899 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _929 = false;
    float _959 = _899;
    float _961 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _963 = _803 + _961;
    float _965 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _967 = _797 + _965;
    float _969 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _971 = _805 + _969;
    bool _973 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _975 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.5);
    bool _981 = _977 || _979;
    float _983 = fma(_963, _959, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _985 = fma(_967, _959, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _987 = fma(_971, _959, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _989 = _959;
    float _991 = _971;
    float _993 = _985;
    float _995 = _963;
    if (_981)
    {
        _893 = _983;
    }
    float _997 = _893;
    float _999 = _997;
    if (_981)
    {
        _989 = _985;
    }
    float _1001 = _989;
    float _1003 = _1001;
    if (_981)
    {
        _991 = _987;
    }
    float _1005 = _991;
    float _1007 = _1005;
    if (!_981)
    {
        float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1011 = _699 + _1009;
        float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1015 = _665 + _1013;
        float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1019 = -_665;
        float _1021 = _1019 + _983;
        float _1023 = _1011 * _1011;
        float _1025 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1027 = _649 + _1025;
        float _1029 = -_699;
        float _1031 = _1029 + _985;
        float _1033 = -_649;
        float _1035 = _1033 + _987;
        float _1037 = fma(_1015, _1015, _1023);
        float _1039 = fma(_1027, _1027, _1037);
        float _1041 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1043 = sqrt(_1039);
        float _1045 = _1041 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        bool _1047 = _1043 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1049 = isnan(_1043);
        bool _1051 = _1047 || _1049;
        bool _1053 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1055 = _1051 || _1053;
        float _1057 = precise::min(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1059 = _1057 * _1017;
        float _1061 = _1045 * _1059;
        float _1063 = _963;
        float _1065 = _1057;
        float _1067 = _1043;
        float _1069 = _1061;
        float _1071 = _1045;
        _993 = _1031;
        if (_1055)
        {
            float _1073 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1063 = _1073;
        }
        float _1075 = _1063;
        if (_1055)
        {
            float _1077 = precise::max(_1043, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1065 = _1077;
        }
        float _1079 = _1065;
        float _1081 = fma(_1031, _1061, _699);
        if (_1055)
        {
            float _1083 = _1079 * _1075;
            _1067 = _1083;
        }
        float _1085 = _1067;
        float _1087 = fma(_1021, _1061, _665);
        float _1089 = fma(_1035, _1061, _649);
        float _1091 = _1087;
        float _1093 = _1085;
        _995 = _1089;
        if (_1055)
        {
            float _1095 = _1045 * _1085;
            _1069 = _1095;
        }
        float _1097 = _1069;
        _721 = _1097;
        if (!_1055)
        {
            _1071 = _1087;
        }
        float _1099 = _1071;
        float _1101 = _1099;
        if (!_1055)
        {
            _1091 = _1081;
        }
        float _1103 = _1091;
        float _1105 = _1103;
        if (_1055)
        {
            float _1107 = fma(_1021, _1097, _665);
            _1101 = _1107;
        }
        float _1109 = _1101;
        _999 = _1109;
        if (!_1055)
        {
            _1093 = _1089;
        }
        float _1111 = _1093;
        _1007 = _1111;
        if (_1055)
        {
            float _1113 = fma(_1031, _1097, _699);
            _1105 = _1113;
        }
        float _1115 = _1105;
        _1003 = _1115;
        if (_1055)
        {
            float _1117 = fma(_1035, _1097, _649);
            _1007 = _1117;
        }
    }
    float _1119 = _1003;
    float _1121 = _999;
    float _1123 = _1007;
    float _1125 = _993;
    float _1127 = _995;
    float _1129 = _721;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1133 = _1119 + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1137 = _1121 + _1135;
    float _1139 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1141 = _1123 + _1139;
    float _1143 = _1133 * _1133;
    float _1145 = fma(_1137, _1137, _1143);
    float _1147 = fma(_1141, _1141, _1145);
    float _1149 = rsqrt(_1147);
    float _1151 = _1137 * _1149;
    float _1153 = _1141 * _1149;
    float _1155 = _1133 * _1149;
    float _1157 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1153 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1161 = _1157 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 + _1163;
    float _1167 = sqrt(_1165);
    bool _1169 = _1167 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1171 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = _1167 + _1171;
    float _1175 = _1125;
    float _1177 = _1165;
    float _1179 = _1173;
    float _1181 = _1129;
    float _1183 = _1149;
    if (_1169)
    {
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1175 = _1185;
    }
    float _1187 = _1175;
    if (_1169)
    {
        float _1189 = rsqrt(_1165);
        _1177 = _1189;
    }
    float _1191 = _1177;
    float _1193 = _1191;
    if (_1169)
    {
        float _1195 = _1173 * _1187;
        _1179 = _1195;
    }
    float _1197 = _1179;
    if (_1169)
    {
        float _1199 = _1197 * 0.15915493667125701904296875;
        _1181 = _1199;
    }
    float _1201 = _1181;
    float _1203 = _1127;
    if (_1169)
    {
        float _1205 = _1201 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        _1203 = _1207;
    }
    float _1209 = _1203;
    float _1211 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1213 = precise::max(0.0, _1211);
    float _1215 = _1187;
    float _1217 = _1213;
    if (_1169)
    {
        float _1219 = _1201 * 6.283185482025146484375;
        float _1221 = cos(_1219);
        _1215 = _1221;
    }
    float _1223 = _1215;
    float _1225 = -_1155;
    float _1227 = -_1213;
    float _1229 = fma(_1225, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1227);
    if (_1169)
    {
        float _1231 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1183 = _1231;
    }
    float _1233 = _1183;
    float _1235 = sqrt(_1147);
    float _1237 = _1233;
    float _1239 = _1209;
    if (_1169)
    {
        float _1241 = fma(_1209, _1233, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1237 = _1241;
    }
    float _1243 = _1237;
    float _1245 = _1243;
    if (!_1169)
    {
        _1239 = _1157;
    }
    float _1247 = _1239;
    float _1249 = _1247;
    float _1251 = _1223;
    if (_1169)
    {
        float _1253 = _1223 + (-1.0);
        _1217 = _1253;
    }
    float _1255 = _1217;
    float _1257 = _1255;
    if (_1169)
    {
        float _1259 = _1191 * _1243;
        _723 = _1259;
    }
    float _1261 = _723;
    if (!_1169)
    {
        _1245 = _1229;
    }
    float _1263 = _1245;
    float _1265 = _1263;
    if (_1169)
    {
        float _1267 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _725 = _1267;
    }
    float _1269 = _725;
    if (_1169)
    {
        float _1271 = _1157 * _1261;
        _1249 = _1271;
    }
    float _1273 = _1249;
    if (!_1169)
    {
        _1257 = _1159;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    if (_1169)
    {
        float _1279 = _1159 * _1261;
        _1277 = _1279;
    }
    float _1281 = _1277;
    if (!_1169)
    {
        _1193 = _1161;
    }
    float _1283 = _1193;
    float _1285 = _1283;
    if (_1169)
    {
        float _1287 = fma(_1229, _1223, _1269);
        _1265 = _1287;
    }
    float _1289 = _1265;
    if (_1169)
    {
        float _1291 = _1273 * _1273;
        _1285 = _1291;
    }
    float _1293 = _1285;
    if (!_1169)
    {
        _1251 = _1163;
    }
    float _1295 = _1251;
    float _1297 = _1295;
    if (_1169)
    {
        float _1299 = _1281 * _1281;
        _1297 = _1299;
    }
    float _1301 = _1297;
    float _1303 = fma(_1289, _1289, _1293);
    float _1305 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1307 = _1303 + _1301;
    float _1309 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1319 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = -_1315;
    float _1325 = _1323 + 1.0;
    float _1327 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1329 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1331 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1305);
    float _1333 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1335 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1327);
    float _1337 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1339 = abs(_1325);
    float _1341 = log2(_1339);
    float _1343 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1331);
    float _1345 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1333);
    float _1347 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1335);
    float _1349 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1353 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1345);
    float _1355 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1357 = _1321 * _1273;
    float _1359 = _1321 * _1289;
    float _1361 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1363 = _1353 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1365 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1367 = _1321 * _1281;
    float _1369 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1361);
    float _1371 = -_1349;
    float _1373 = fma(_1371, _1317, 1.0);
    float _1375 = -_1365;
    float _1377 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1375);
    float _1379 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1381 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1369);
    float _1383 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1385 = -_1367;
    float _1387 = fma(_1385, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1377);
    float _1389 = exp2(_1379);
    float _1391 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1381);
    float _1393 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1395 = fma(_1387, -0.5, 0.5);
    float _1397 = fma(_1387, 0.5, 0.5);
    float _1399 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1383);
    float _1401 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1393);
    float _1403 = _1359 + 1.0;
    float _1405 = log2(_1373);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1401);
    float _1411 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1399);
    float _1413 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1415 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1409);
    float _1417 = 1.0 / _1391;
    float _1419 = -_1359;
    float _1421 = fma(_1389, _1403, _1419);
    float _1423 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1425 = fma(_1397, _1413, 1.570728778839111328125);
    float _1427 = fma(_1421, 0.5, 0.5);
    float _1429 = sqrt(_1395);
    float _1431 = _1405 * 0.693147182464599609375;
    float _1433 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1435 = _1415 * _1417;
    float _1437 = _1423 * _1417;
    float _1439 = fma(_1435, 0.5, 0.5);
    float _1441 = fma(_1437, -0.5, 0.5);
    float _1443 = _1429 * 0.636619746685028076171875;
    float _1445 = -_1425;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _3929 = float3(_1439, _1441, _1433);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3929, float3(0.0), isnan(_3929)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3929, float3(0.0), isnan(_3929)), level(0.0)).x;
    float3 _3940 = float3(_1439, _1441, _1433);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3940, float3(0.0), isnan(_3940)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3940, float3(0.0), isnan(_3940)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _3957 = float2(_1447, _1427);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3957, float2(0.0), isnan(_3957)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3957, float2(0.0), isnan(_3957)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = _699 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1474 = _885 * _1155;
    float _1476 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1478 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1472);
    float _1480 = _699 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _1482;
    float _1486 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1478);
    float _1488 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1480);
    float _1490 = fma(_881, _1151, _1474);
    bool _1492 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1494 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1496 = _1492 || _1494;
    bool _1498 = isnan(0.5);
    bool _1500 = _1496 || _1498;
    float _1502 = _1486 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1504 = 1.0 / _1484;
    float _1506 = fma(_649, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1488);
    float _1508 = _1351 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1510 = fma(_889, _1153, _1490);
    float _1512 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1514 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1508);
    float _1516 = abs(_1510);
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _1520 = _1516 + _1518;
    float _1522 = 1.0 / _1502;
    float _1524 = _1512 + _1502;
    float _1526 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1514);
    float _1528 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1526);
    float _1530 = exp2(_1476);
    float _1532 = _1520 * _1504;
    float _1534 = precise::clamp(_1532, 0.0, 1.0);
    float _1536 = fma(_1534, -2.0, 3.0);
    float _1538 = _1534 * _1534;
    float _1540 = _1524 * _1522;
    float _1542 = _1540 * 0.5;
    float _1544 = _1524;
    if (_1500)
    {
        _1544 = 1.0;
    }
    float _1546 = _1544;
    float _1548 = _1546;
    if (!_1500)
    {
        float _1550 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1554 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1552);
        float _1556 = _1550 * 0.15915493667125701904296875;
        float _1558 = _1556 * 6.283185482025146484375;
        float _1560 = cos(_1558);
        float _1562 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1564 = _1562 * 0.15915493667125701904296875;
        float _1566 = _1556 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        float _1570 = 1.0 / _1560;
        float _1572 = _1564 * 6.283185482025146484375;
        float _1574 = cos(_1572);
        float _1576 = _1568 * _1570;
        float _1578 = 1.0 / _1554;
        float _1580 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1582 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1580;
        float _1584 = _1574 * _1576;
        float _1586 = _1564 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        float _1590 = 1.0 / _1584;
        float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1594 = _1578 * _1592;
        float _1596 = 1.0 / _1582;
        float _1598 = _1588 * _1590;
        float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1602 = fma(_1598, _1594, _1600);
        float _1604 = _1602 * _1596;
        float _1606 = precise::clamp(_1604, 0.0, 1.0);
        _1548 = _1606;
    }
    float _1608 = _1548;
    float _1610 = -_1530;
    float _1612 = _1610 + 1.0;
    float _1614 = _1538 * _1536;
    float _1616 = _1391 * 0.5;
    bool _1618 = _1608 > 0.0;
    bool _1620 = isnan(_1608);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(0.0);
    bool _1626 = _1622 || _1624;
    float _1628 = _1612 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1630 = _1614 * _1608;
    float _1632 = _1528 + _1391;
    float _1634 = _1415 + _1391;
    float _1636 = _1628 * _1449;
    float _1638 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1640 = -_1628;
    float _1642 = _1640 + 1.0;
    float _1644 = fma(_1423, -0.5, _1616);
    float _1646 = _1460 * _1636;
    float _1648 = _1470 * _1636;
    out.gl_Position.x = _1415;
    out.gl_Position.y = _1423;
    out.gl_Position.z = _1528;
    out.gl_Position.w = _1391;
    float _1650 = fma(_1466, _1646, _1454);
    float _1652 = fma(_1468, _1646, _1456);
    float _1654 = _1632 * 0.5;
    float _1656 = _1634 * 0.5;
    float _1658 = _1638 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1660 = _1460 * _1642;
    float _1662 = fma(_1460, _1648, _1458);
    out.m_62.x = _1656;
    out.m_62.y = _1644;
    out.m_62.z = _1654;
    out.m_62.w = _1391;
    out.m_47.x = _1658;
    out.m_64.x = _1650;
    out.m_64.y = _1652;
    out.m_64.z = _1662;
    out.m_64.w = _1660;
    if (_1626)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1664 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1664;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

