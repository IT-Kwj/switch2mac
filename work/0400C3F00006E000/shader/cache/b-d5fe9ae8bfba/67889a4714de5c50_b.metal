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
    float4 m_53 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _395 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1335 = as_type<float>(_99);
        out.gl_Position.z = _1335;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1404 = as_type<float>(_135);
        out.gl_Position.z = _1404;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
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
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
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
    float _277;
    if (!_259)
    {
        float _261 = in.m_51.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_83);
        float _283 = 1.0 / _281;
        float _285 = _117 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _297 = 1.0 / _291;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _303 = _293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _305 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _307 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _287 + _309;
    bool _313 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_287);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    out.m_53.x = _303;
    out.m_53.y = _305;
    out.m_53.z = _307;
    out.m_53.w = _301;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _327 = -_323;
    float _329 = _327 + 1.0;
    float _331 = _311 * _297;
    bool _333 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_287);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _329;
    float _355 = fma(_347, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _355 * _353;
    float _365 = _357 * _353;
    float _367 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _369 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _371 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[144].x, _367);
    float _373 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[144].y, _369);
    bool _375 = !_325;
    float _393;
    if (!_375)
    {
        float _377 = in.m_51.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_83);
        float _399 = 1.0 / _397;
        float _401 = _117 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = as_type<float>(int(gl_VertexIndex));
    float _407 = in.m_49.x;
    float _409 = in.m_49.y;
    int _411 = as_type<int>(_405) & 1;
    bool _413 = _411 != 0;
    int _415 = as_type<int>(_405) & 2;
    bool _417 = _415 != 0;
    float _419 = _373 * _409;
    bool _421 = !_417;
    float _423 = _421 ? (-0.5) : 0.5;
    float _425 = _371 * _407;
    bool _427 = !_413;
    float _429 = _427 ? (-0.5) : 0.5;
    float _431 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _435 = isnan(0.5);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _441 = _437 || _439;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    float _445 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _429);
    float _449 = _431 * _443;
    float _451 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _453 = _445 * _447;
    float _455 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _449 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
    float _461 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _463 = _449 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _469 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _463);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _477 = _469 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _471);
    float _481 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _483 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _485 = _475 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _487 = _479 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _489 = _477 + _481;
    float _491 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _483);
    float _493 = _485 + _487;
    float _495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _497 = _489 + _495;
    float _499 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    float _501 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _503 = _493 + _501;
    float _505 = _497 * _497;
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = fma(_503, _503, _505);
    float _511 = _507 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _513 = _507 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _515 = sqrt(_509);
    float _517 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[11].x, _511);
    float _519 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[10].x, _513);
    float _521 = _485;
    float _523 = _449;
    if (_441)
    {
        _521 = 1.0;
    }
    float _525 = _521;
    float _527 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[11].z, _517);
    float _529 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[10].z, _519);
    float _531 = _527 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _533 = _449 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _535 = _529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _537 = 1.0 / _531;
    float _539 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
    float _541 = _535 + _531;
    bool _543 = _515 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _545 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _547 = _545 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _549 = _507 + _547;
    float _551 = _541 * _537;
    float _553 = _551 * 0.5;
    float _555 = _547;
    float _557 = _541;
    float _559 = _531;
    float _561 = _549;
    float _563 = _525;
    if (!_543)
    {
        _555 = _493;
    }
    float _565 = _555;
    float _567 = _565;
    if (!_543)
    {
        _557 = _489;
    }
    float _569 = _557;
    float _571 = _569;
    if (!_543)
    {
        _559 = _549;
    }
    float _573 = _559;
    bool _575 = !_543;
    float _577 = _573;
    if (!_575)
    {
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _583 = _515 + _581;
        float _585 = rsqrt(_509);
        float _587 = _583 * _579;
        float _589 = _549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _591 = _587 * 0.15915493667125701904296875;
        float _593 = _591 * 6.283185482025146484375;
        float _595 = cos(_593);
        float _597 = _591 * 6.283185482025146484375;
        float _599 = sin(_597);
        float _601 = _595 + (-1.0);
        float _603 = _601 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _605 = fma(_599, _589, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _607 = fma(_549, _595, _603);
        float _609 = _585 * _605;
        float _611 = fma(_503, _609, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _613 = fma(_497, _609, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _577 = _607;
        _567 = _611;
        _571 = _613;
    }
    float _615 = _577;
    float _617 = _567;
    float _619 = _571;
    if (!_441)
    {
        float _621 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _623 = _621 * 0.15915493667125701904296875;
        float _625 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _629 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[30].w, _627);
        float _631 = _623 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _625 * 0.15915493667125701904296875;
        float _637 = _623 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = 1.0 / _633;
        float _643 = _635 * 6.283185482025146484375;
        float _645 = cos(_643);
        float _647 = _639 * _641;
        float _649 = _635 * 6.283185482025146484375;
        float _651 = sin(_649);
        float _653 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _655 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _653;
        float _657 = _645 * _647;
        float _659 = 1.0 / _629;
        float _661 = 1.0 / _657;
        float _663 = 1.0 / _655;
        float _665 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _667 = _659 * _665;
        float _669 = _651 * _661;
        float _671 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _673 = fma(_669, _667, _671);
        float _675 = _673 * _663;
        float _677 = precise::clamp(_675, 0.0, 1.0);
        _561 = _663;
        _523 = _659;
        _563 = _677;
    }
    float _679 = _561;
    float _681 = _523;
    float _683 = _563;
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _615 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _691 = _617 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _695 = _619 + _693;
    float _697 = _687 * _687;
    float _699 = fma(_691, _691, _697);
    float _701 = fma(_695, _695, _699);
    float _703 = rsqrt(_701);
    float _705 = sqrt(_701);
    float _707 = _703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _709 = _691 * _707;
    float _711 = _695 * _707;
    float _713 = _709 * _709;
    float _715 = _711 * _711;
    float _717 = _713 + _715;
    float _719 = sqrt(_717);
    bool _721 = _719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _725 = _719 + _723;
    float _727 = _703;
    float _729 = _717;
    float _731 = _725;
    float _733 = _679;
    float _735 = _687;
    float _737 = _707;
    if (_721)
    {
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _727 = _739;
    }
    float _741 = _727;
    if (_721)
    {
        float _743 = rsqrt(_717);
        _729 = _743;
    }
    float _745 = _729;
    float _747 = _745;
    if (_721)
    {
        float _749 = _725 * _741;
        _731 = _749;
    }
    float _751 = _731;
    if (_721)
    {
        float _753 = _751 * 0.15915493667125701904296875;
        _733 = _753;
    }
    float _755 = _733;
    float _757 = _695;
    float _759 = _755;
    if (_721)
    {
        float _761 = _755 * 6.283185482025146484375;
        float _763 = sin(_761);
        _757 = _763;
    }
    float _765 = _757;
    float _767 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _769 = precise::max(0.0, _767);
    float _771 = _681;
    float _773 = _769;
    float _775 = _767;
    if (_721)
    {
        float _777 = _755 * 6.283185482025146484375;
        float _779 = cos(_777);
        _771 = _779;
    }
    float _781 = _771;
    float _783 = -_707;
    float _785 = -_769;
    float _787 = fma(_687, _783, _785);
    if (!_721)
    {
        _735 = _711;
    }
    float _789 = _735;
    float _791 = _789;
    if (_721)
    {
        float _793 = _787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _793;
    }
    float _795 = _773;
    float _797 = _765;
    float _799 = _795;
    if (_721)
    {
        float _801 = fma(_765, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _797 = _801;
    }
    float _803 = _797;
    float _805 = _803;
    if (!_721)
    {
        _799 = _709;
    }
    float _807 = _799;
    float _809 = _807;
    if (_721)
    {
        float _811 = _781 + (-1.0);
        _775 = _811;
    }
    float _813 = _775;
    float _815 = _813;
    if (_721)
    {
        float _817 = _745 * _803;
        _737 = _817;
    }
    float _819 = _737;
    if (!_721)
    {
        _805 = _787;
    }
    float _821 = _805;
    float _823 = _821;
    if (_721)
    {
        float _825 = _813 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _759 = _825;
    }
    float _827 = _759;
    if (_721)
    {
        float _829 = _709 * _819;
        _809 = _829;
    }
    float _831 = _809;
    if (!_721)
    {
        _747 = _713;
    }
    float _833 = _747;
    float _835 = _833;
    if (_721)
    {
        float _837 = _711 * _819;
        _791 = _837;
    }
    float _839 = _791;
    if (_721)
    {
        float _841 = fma(_787, _781, _827);
        _823 = _841;
    }
    float _843 = _823;
    if (_721)
    {
        float _845 = _831 * _831;
        _835 = _845;
    }
    float _847 = _835;
    if (!_721)
    {
        _815 = _715;
    }
    float _849 = _815;
    float _851 = _849;
    if (_721)
    {
        float _853 = _839 * _839;
        _851 = _853;
    }
    float _855 = _851;
    float _857 = fma(_843, _843, _847);
    float _859 = _615 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _861 = _857 + _855;
    float _863 = _615 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _867 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[23].w, _865);
    float _869 = precise::clamp(_867, 0.0, 1.0);
    float _871 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _873 = rsqrt(_861);
    float _875 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _863);
    float _877 = _615 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _879 = -_869;
    float _881 = _879 + 1.0;
    float _883 = _615 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _885 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[2].z, _875);
    float _887 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[1].x, _877);
    float _889 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _859);
    float _891 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[3].x, _883);
    float _893 = abs(_881);
    float _895 = log2(_893);
    float _897 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[1].z, _887);
    float _899 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[0].z, _889);
    float _901 = _885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _903 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[3].z, _891);
    float _905 = _897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _907 = _899 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _909 = _873 * _831;
    float _911 = _873 * _843;
    float _913 = _905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _915 = _901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _919 = _873 * _839;
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[7].x, _913);
    float _923 = -_915;
    float _925 = fma(_923, _871, 1.0);
    float _927 = -_917;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _927);
    float _931 = _903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _933 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _921);
    float _935 = _895 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _937 = -_919;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _929);
    float _941 = _905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[7].w, _933);
    float _945 = log2(_925);
    float _947 = fma(_939, -0.5, 0.5);
    float _949 = _905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _951 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[4].x, _941);
    float _953 = fma(_939, 0.5, 0.5);
    float _955 = _911 + 1.0;
    float _957 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[5].x, _949);
    float _959 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _951);
    float _961 = exp2(_935);
    float _963 = fma(_953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _965 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _957);
    float _967 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[4].w, _959);
    float _969 = fma(_953, _963, -0.212114393711090087890625);
    float _971 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[5].w, _965);
    float _973 = 1.0 / _943;
    float _975 = _945 * 0.693147182464599609375;
    float _977 = fma(_953, _969, 1.570728778839111328125);
    float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _981 = sqrt(_947);
    float _983 = -_911;
    float _985 = fma(_961, _955, _983);
    float _987 = fma(_985, 0.5, 0.5);
    float _989 = _967 * _973;
    float _991 = _971 * _973;
    float _993 = fma(_989, 0.5, 0.5);
    float _995 = fma(_991, -0.5, 0.5);
    float _997 = _981 * 0.636619746685028076171875;
    float3 _2813 = float3(_993, _995, _979);
    float _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2813, float3(0.0), isnan(_2813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2813, float3(0.0), isnan(_2813)), level(0.0)).x;
    float3 _2824 = float3(_993, _995, _979);
    float4 _1002 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2824, float3(0.0), isnan(_2824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2824, float3(0.0), isnan(_2824)), level(0.0)).xyzw;
    float _1004 = _1002.x;
    float _1006 = _1002.y;
    float _1008 = _1002.z;
    float _1010 = _1002.w;
    float _1012 = -_977;
    float _1014 = fma(_997, _1012, 1.0);
    float2 _2846 = float2(_1014, _987);
    float3 _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2846, float2(0.0), isnan(_2846)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2846, float2(0.0), isnan(_2846)), level(0.0)).xyz;
    float _1020 = _1018.x;
    float _1022 = _1018.y;
    float _1024 = _1018.z;
    float _1026 = in.m_51.x;
    float _1028 = in.m_51.y;
    float _1030 = _895 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1040 = 1.0 / _1034;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1046 = _905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1054 = _1052 != 0;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1056;
    float _1060 = 1.0 / _1038;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1066;
    float _1070 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1046);
    float _1072 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1070);
    float _1074 = 1.0 / _1044;
    bool _1076 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1078 = isnan(_403);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1090 = _1026 > 0.5;
    float _1092 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1072);
    bool _1094 = _1028 > 0.5;
    float _1096 = -_1086;
    float _1098 = _1096 + 1.0;
    float _1100 = -_429;
    int _1102 = _1090 ? as_type<int>(_1100) : as_type<int>(_429);
    float _1104 = _1058 * _1060;
    float _1106 = _1064 * _1040;
    bool _1108 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1110 = isnan(_403);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1122 = _403 + _1120;
    bool _1124 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1126 = isnan(_403);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = exp2(_1030);
    float _1138 = -_423;
    int _1140 = _1094 ? as_type<int>(_1138) : as_type<int>(_423);
    float _1142 = _1118 * _1098;
    float _1144 = _1068 * _1074;
    float _1146 = -_1118;
    float _1148 = _1146 + 1.0;
    bool _1150 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1152 = isnan(_403);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = fma(_1104, _1122, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1166 = _403 + _1164;
    float _1168 = _1134 * _1148;
    float _1170 = -_1134;
    float _1172 = _1170 + 1.0;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1176 = _403 + _1174;
    float _1178 = fma(_1106, _1166, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1180 = !_1050;
    float _1182 = _1180 ? _429 : as_type<float>(_1102);
    float _1184 = _1160 * _1172;
    float _1186 = -_1160;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1144, _1176, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1194 = _1162 * _1184;
    bool _1196 = !_1054;
    float _1198 = _1196 ? _423 : as_type<float>(_1140);
    float _1200 = _1092 + _943;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1194);
    float _1204 = _1182 + 0.5;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = fma(_1178, _1168, _1202);
    float _1210 = -_1198;
    float _1212 = _1210 + 0.5;
    bool _1214 = _683 > 0.0;
    bool _1216 = isnan(_683);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = fma(_1190, _1142, _1208);
    float _1228 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _967;
    out.gl_Position.y = _971;
    out.gl_Position.z = _1092;
    out.gl_Position.w = _943;
    float _1232 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1226);
    float _1234 = -_1136;
    float _1236 = _1234 + 1.0;
    float _1238 = _1200 * 0.5;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1244 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1246 = _683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1256 = -_1244;
    float _1258 = _1256 + 1.0;
    float _1260 = _1228 * _1192;
    float _1262 = _1230 * _1206;
    out.m_58.x = _1224;
    out.m_58.y = _1248;
    out.m_58.z = _1250;
    out.m_58.w = _1252;
    out.m_60.x = _1260;
    out.m_60.y = _1262;
    out.m_62.z = _1238;
    out.m_62.w = _943;
    out.m_45.x = _1254;
    float _1264 = _1244 * _999;
    float _1266 = _1010 * _1258;
    float _1268 = _1010 * _1264;
    float _1270 = _1024 * _1264;
    float _1272 = fma(_1020, _1268, _1004);
    float _1274 = fma(_1022, _1268, _1006);
    float _1276 = fma(_1010, _1270, _1008);
    out.m_64.x = _1272;
    out.m_64.y = _1274;
    out.m_64.z = _1276;
    out.m_64.w = _1266;
    if (_1222)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1278 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1278;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _395 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1335 = as_type<float>(_99);
        out.gl_Position.z = _1335;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1404 = as_type<float>(_135);
        out.gl_Position.z = _1404;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
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
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
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
    float _277;
    if (!_259)
    {
        float _261 = in.m_51.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_83);
        float _283 = 1.0 / _281;
        float _285 = _117 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _297 = 1.0 / _291;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _303 = _293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _305 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _307 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _287 + _309;
    bool _313 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_287);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    out.m_53.x = _303;
    out.m_53.y = _305;
    out.m_53.z = _307;
    out.m_53.w = _301;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _327 = -_323;
    float _329 = _327 + 1.0;
    float _331 = _311 * _297;
    bool _333 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_287);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _329;
    float _355 = fma(_347, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _355 * _353;
    float _365 = _357 * _353;
    float _367 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _369 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _371 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[144].x, _367);
    float _373 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[144].y, _369);
    bool _375 = !_325;
    float _393;
    if (!_375)
    {
        float _377 = in.m_51.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_83);
        float _399 = 1.0 / _397;
        float _401 = _117 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = as_type<float>(int(gl_VertexIndex));
    float _407 = in.m_49.x;
    float _409 = in.m_49.y;
    int _411 = as_type<int>(_405) & 1;
    bool _413 = _411 != 0;
    int _415 = as_type<int>(_405) & 2;
    bool _417 = _415 != 0;
    float _419 = _373 * _409;
    bool _421 = !_417;
    float _423 = _421 ? (-0.5) : 0.5;
    float _425 = _371 * _407;
    bool _427 = !_413;
    float _429 = _427 ? (-0.5) : 0.5;
    float _431 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _435 = isnan(0.5);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _441 = _437 || _439;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    float _445 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _429);
    float _449 = _431 * _443;
    float _451 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _453 = _445 * _447;
    float _455 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _449 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
    float _461 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _463 = _449 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _469 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _463);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _477 = _469 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _471);
    float _481 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _483 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _485 = _475 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _487 = _479 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _489 = _477 + _481;
    float _491 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _483);
    float _493 = _485 + _487;
    float _495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _497 = _489 + _495;
    float _499 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    float _501 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _503 = _493 + _501;
    float _505 = _497 * _497;
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = fma(_503, _503, _505);
    float _511 = _507 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _513 = _507 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _515 = sqrt(_509);
    float _517 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[11].x, _511);
    float _519 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[10].x, _513);
    float _521 = _485;
    float _523 = _449;
    if (_441)
    {
        _521 = 1.0;
    }
    float _525 = _521;
    float _527 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[11].z, _517);
    float _529 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[10].z, _519);
    float _531 = _527 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _533 = _449 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _535 = _529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _537 = 1.0 / _531;
    float _539 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
    float _541 = _535 + _531;
    bool _543 = _515 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _545 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _547 = _545 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _549 = _507 + _547;
    float _551 = _541 * _537;
    float _553 = _551 * 0.5;
    float _555 = _547;
    float _557 = _541;
    float _559 = _531;
    float _561 = _549;
    float _563 = _525;
    if (!_543)
    {
        _555 = _493;
    }
    float _565 = _555;
    float _567 = _565;
    if (!_543)
    {
        _557 = _489;
    }
    float _569 = _557;
    float _571 = _569;
    if (!_543)
    {
        _559 = _549;
    }
    float _573 = _559;
    bool _575 = !_543;
    float _577 = _573;
    if (!_575)
    {
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _583 = _515 + _581;
        float _585 = rsqrt(_509);
        float _587 = _583 * _579;
        float _589 = _549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _591 = _587 * 0.15915493667125701904296875;
        float _593 = _591 * 6.283185482025146484375;
        float _595 = cos(_593);
        float _597 = _591 * 6.283185482025146484375;
        float _599 = sin(_597);
        float _601 = _595 + (-1.0);
        float _603 = _601 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _605 = fma(_599, _589, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _607 = fma(_549, _595, _603);
        float _609 = _585 * _605;
        float _611 = fma(_503, _609, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _613 = fma(_497, _609, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _577 = _607;
        _567 = _611;
        _571 = _613;
    }
    float _615 = _577;
    float _617 = _567;
    float _619 = _571;
    if (!_441)
    {
        float _621 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _623 = _621 * 0.15915493667125701904296875;
        float _625 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _629 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[30].w, _627);
        float _631 = _623 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _625 * 0.15915493667125701904296875;
        float _637 = _623 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = 1.0 / _633;
        float _643 = _635 * 6.283185482025146484375;
        float _645 = cos(_643);
        float _647 = _639 * _641;
        float _649 = _635 * 6.283185482025146484375;
        float _651 = sin(_649);
        float _653 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _655 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _653;
        float _657 = _645 * _647;
        float _659 = 1.0 / _629;
        float _661 = 1.0 / _657;
        float _663 = 1.0 / _655;
        float _665 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _667 = _659 * _665;
        float _669 = _651 * _661;
        float _671 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _673 = fma(_669, _667, _671);
        float _675 = _673 * _663;
        float _677 = precise::clamp(_675, 0.0, 1.0);
        _561 = _663;
        _523 = _659;
        _563 = _677;
    }
    float _679 = _561;
    float _681 = _523;
    float _683 = _563;
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _615 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _691 = _617 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _695 = _619 + _693;
    float _697 = _687 * _687;
    float _699 = fma(_691, _691, _697);
    float _701 = fma(_695, _695, _699);
    float _703 = rsqrt(_701);
    float _705 = sqrt(_701);
    float _707 = _703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _709 = _691 * _707;
    float _711 = _695 * _707;
    float _713 = _709 * _709;
    float _715 = _711 * _711;
    float _717 = _713 + _715;
    float _719 = sqrt(_717);
    bool _721 = _719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _725 = _719 + _723;
    float _727 = _703;
    float _729 = _717;
    float _731 = _725;
    float _733 = _679;
    float _735 = _687;
    float _737 = _707;
    if (_721)
    {
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _727 = _739;
    }
    float _741 = _727;
    if (_721)
    {
        float _743 = rsqrt(_717);
        _729 = _743;
    }
    float _745 = _729;
    float _747 = _745;
    if (_721)
    {
        float _749 = _725 * _741;
        _731 = _749;
    }
    float _751 = _731;
    if (_721)
    {
        float _753 = _751 * 0.15915493667125701904296875;
        _733 = _753;
    }
    float _755 = _733;
    float _757 = _695;
    float _759 = _755;
    if (_721)
    {
        float _761 = _755 * 6.283185482025146484375;
        float _763 = sin(_761);
        _757 = _763;
    }
    float _765 = _757;
    float _767 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _769 = precise::max(0.0, _767);
    float _771 = _681;
    float _773 = _769;
    float _775 = _767;
    if (_721)
    {
        float _777 = _755 * 6.283185482025146484375;
        float _779 = cos(_777);
        _771 = _779;
    }
    float _781 = _771;
    float _783 = -_707;
    float _785 = -_769;
    float _787 = fma(_687, _783, _785);
    if (!_721)
    {
        _735 = _711;
    }
    float _789 = _735;
    float _791 = _789;
    if (_721)
    {
        float _793 = _787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _793;
    }
    float _795 = _773;
    float _797 = _765;
    float _799 = _795;
    if (_721)
    {
        float _801 = fma(_765, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _797 = _801;
    }
    float _803 = _797;
    float _805 = _803;
    if (!_721)
    {
        _799 = _709;
    }
    float _807 = _799;
    float _809 = _807;
    if (_721)
    {
        float _811 = _781 + (-1.0);
        _775 = _811;
    }
    float _813 = _775;
    float _815 = _813;
    if (_721)
    {
        float _817 = _745 * _803;
        _737 = _817;
    }
    float _819 = _737;
    if (!_721)
    {
        _805 = _787;
    }
    float _821 = _805;
    float _823 = _821;
    if (_721)
    {
        float _825 = _813 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _759 = _825;
    }
    float _827 = _759;
    if (_721)
    {
        float _829 = _709 * _819;
        _809 = _829;
    }
    float _831 = _809;
    if (!_721)
    {
        _747 = _713;
    }
    float _833 = _747;
    float _835 = _833;
    if (_721)
    {
        float _837 = _711 * _819;
        _791 = _837;
    }
    float _839 = _791;
    if (_721)
    {
        float _841 = fma(_787, _781, _827);
        _823 = _841;
    }
    float _843 = _823;
    if (_721)
    {
        float _845 = _831 * _831;
        _835 = _845;
    }
    float _847 = _835;
    if (!_721)
    {
        _815 = _715;
    }
    float _849 = _815;
    float _851 = _849;
    if (_721)
    {
        float _853 = _839 * _839;
        _851 = _853;
    }
    float _855 = _851;
    float _857 = fma(_843, _843, _847);
    float _859 = _615 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _861 = _857 + _855;
    float _863 = _615 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _867 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[23].w, _865);
    float _869 = precise::clamp(_867, 0.0, 1.0);
    float _871 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _873 = rsqrt(_861);
    float _875 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _863);
    float _877 = _615 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _879 = -_869;
    float _881 = _879 + 1.0;
    float _883 = _615 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _885 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[2].z, _875);
    float _887 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[1].x, _877);
    float _889 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _859);
    float _891 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[3].x, _883);
    float _893 = abs(_881);
    float _895 = log2(_893);
    float _897 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[1].z, _887);
    float _899 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[0].z, _889);
    float _901 = _885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _903 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[3].z, _891);
    float _905 = _897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _907 = _899 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _909 = _873 * _831;
    float _911 = _873 * _843;
    float _913 = _905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _915 = _901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _919 = _873 * _839;
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[7].x, _913);
    float _923 = -_915;
    float _925 = fma(_923, _871, 1.0);
    float _927 = -_917;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _927);
    float _931 = _903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _933 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _921);
    float _935 = _895 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _937 = -_919;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _929);
    float _941 = _905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[7].w, _933);
    float _945 = log2(_925);
    float _947 = fma(_939, -0.5, 0.5);
    float _949 = _905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _951 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[4].x, _941);
    float _953 = fma(_939, 0.5, 0.5);
    float _955 = _911 + 1.0;
    float _957 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[5].x, _949);
    float _959 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _951);
    float _961 = exp2(_935);
    float _963 = fma(_953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _965 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _957);
    float _967 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[4].w, _959);
    float _969 = fma(_953, _963, -0.212114393711090087890625);
    float _971 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[5].w, _965);
    float _973 = 1.0 / _943;
    float _975 = _945 * 0.693147182464599609375;
    float _977 = fma(_953, _969, 1.570728778839111328125);
    float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _981 = sqrt(_947);
    float _983 = -_911;
    float _985 = fma(_961, _955, _983);
    float _987 = fma(_985, 0.5, 0.5);
    float _989 = _967 * _973;
    float _991 = _971 * _973;
    float _993 = fma(_989, 0.5, 0.5);
    float _995 = fma(_991, -0.5, 0.5);
    float _997 = _981 * 0.636619746685028076171875;
    float3 _2813 = float3(_993, _995, _979);
    float _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2813, float3(0.0), isnan(_2813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2813, float3(0.0), isnan(_2813)), level(0.0)).x;
    float3 _2824 = float3(_993, _995, _979);
    float4 _1002 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2824, float3(0.0), isnan(_2824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2824, float3(0.0), isnan(_2824)), level(0.0)).xyzw;
    float _1004 = _1002.x;
    float _1006 = _1002.y;
    float _1008 = _1002.z;
    float _1010 = _1002.w;
    float _1012 = -_977;
    float _1014 = fma(_997, _1012, 1.0);
    float2 _2846 = float2(_1014, _987);
    float3 _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2846, float2(0.0), isnan(_2846)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2846, float2(0.0), isnan(_2846)), level(0.0)).xyz;
    float _1020 = _1018.x;
    float _1022 = _1018.y;
    float _1024 = _1018.z;
    float _1026 = in.m_51.x;
    float _1028 = in.m_51.y;
    float _1030 = _895 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1040 = 1.0 / _1034;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1046 = _905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1054 = _1052 != 0;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1056;
    float _1060 = 1.0 / _1038;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1066;
    float _1070 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1046);
    float _1072 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1070);
    float _1074 = 1.0 / _1044;
    bool _1076 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1078 = isnan(_403);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1090 = _1026 > 0.5;
    float _1092 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1072);
    bool _1094 = _1028 > 0.5;
    float _1096 = -_1086;
    float _1098 = _1096 + 1.0;
    float _1100 = -_429;
    int _1102 = _1090 ? as_type<int>(_1100) : as_type<int>(_429);
    float _1104 = _1058 * _1060;
    float _1106 = _1064 * _1040;
    bool _1108 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1110 = isnan(_403);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1122 = _403 + _1120;
    bool _1124 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1126 = isnan(_403);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = exp2(_1030);
    float _1138 = -_423;
    int _1140 = _1094 ? as_type<int>(_1138) : as_type<int>(_423);
    float _1142 = _1118 * _1098;
    float _1144 = _1068 * _1074;
    float _1146 = -_1118;
    float _1148 = _1146 + 1.0;
    bool _1150 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1152 = isnan(_403);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = fma(_1104, _1122, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1166 = _403 + _1164;
    float _1168 = _1134 * _1148;
    float _1170 = -_1134;
    float _1172 = _1170 + 1.0;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1176 = _403 + _1174;
    float _1178 = fma(_1106, _1166, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1180 = !_1050;
    float _1182 = _1180 ? _429 : as_type<float>(_1102);
    float _1184 = _1160 * _1172;
    float _1186 = -_1160;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1144, _1176, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1194 = _1162 * _1184;
    bool _1196 = !_1054;
    float _1198 = _1196 ? _423 : as_type<float>(_1140);
    float _1200 = _1092 + _943;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1194);
    float _1204 = _1182 + 0.5;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = fma(_1178, _1168, _1202);
    float _1210 = -_1198;
    float _1212 = _1210 + 0.5;
    bool _1214 = _683 > 0.0;
    bool _1216 = isnan(_683);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = fma(_1190, _1142, _1208);
    float _1228 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _967;
    out.gl_Position.y = _971;
    out.gl_Position.z = _1092;
    out.gl_Position.w = _943;
    float _1232 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1226);
    float _1234 = -_1136;
    float _1236 = _1234 + 1.0;
    float _1238 = _1200 * 0.5;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1244 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1246 = _683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1256 = -_1244;
    float _1258 = _1256 + 1.0;
    float _1260 = _1228 * _1192;
    float _1262 = _1230 * _1206;
    out.m_58.x = _1224;
    out.m_58.y = _1248;
    out.m_58.z = _1250;
    out.m_58.w = _1252;
    out.m_60.x = _1260;
    out.m_60.y = _1262;
    out.m_62.z = _1238;
    out.m_62.w = _943;
    out.m_45.x = _1254;
    float _1264 = _1244 * _999;
    float _1266 = _1010 * _1258;
    float _1268 = _1010 * _1264;
    float _1270 = _1024 * _1264;
    float _1272 = fma(_1020, _1268, _1004);
    float _1274 = fma(_1022, _1268, _1006);
    float _1276 = fma(_1010, _1270, _1008);
    out.m_64.x = _1272;
    out.m_64.y = _1274;
    out.m_64.z = _1276;
    out.m_64.w = _1266;
    if (_1222)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1278 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1278;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _395 = false;
    bool _279 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _1335 = as_type<float>(_99);
        out.gl_Position.z = _1335;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_113)
    {
        float _119 = float(_83);
        _93 = _119;
    }
    float _121 = _93;
    bool _123 = _117 >= _121;
    bool _125 = !_113;
    bool _127 = _123 || _125;
    float _129 = _121;
    if (_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _129;
    if (_127)
    {
        out.m_45.x = 0.0;
    }
    if (_127)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1404 = as_type<float>(_135);
        out.gl_Position.z = _1404;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.w;
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _141 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _143 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
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
        float _195 = 1.0 / _189;
        float _197 = _191 * 0.693147182464599609375;
        float _199 = exp2(_193);
        float _201 = 1.0 / _197;
        float _203 = _199 + (-1.0);
        float _205 = -_203;
        float _207 = fma(_205, _201, _139);
        float _209 = _207 * _195;
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
    float _277;
    if (!_259)
    {
        float _261 = in.m_51.x;
        float _263 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _265 = _261 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _267 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _269 = _267 * _263;
        float _271 = floor(_269);
        float _273 = -_271;
        float _275 = _269 + _273;
        _277 = _275;
        _279 = true;
    }
    else
    {
        float _281 = float(_83);
        float _283 = 1.0 / _281;
        float _285 = _117 * _283;
        _277 = _285;
    }
    _279 = false;
    float _287 = _277;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _291 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _289;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _297 = 1.0 / _291;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _303 = _293 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _305 = _295 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _307 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _311 = _287 + _309;
    bool _313 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_287);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    out.m_53.x = _303;
    out.m_53.y = _305;
    out.m_53.z = _307;
    out.m_53.w = _301;
    bool _325 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _327 = -_323;
    float _329 = _327 + 1.0;
    float _331 = _311 * _297;
    bool _333 = _287 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_287);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = _343 * _329;
    float _355 = fma(_347, _331, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = fma(_351, _331, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _359 = -_343;
    float _361 = _359 + 1.0;
    float _363 = _355 * _353;
    float _365 = _357 * _353;
    float _367 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _369 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _371 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[144].x, _367);
    float _373 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[144].y, _369);
    bool _375 = !_325;
    float _393;
    if (!_375)
    {
        float _377 = in.m_51.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_83);
        float _399 = 1.0 / _397;
        float _401 = _117 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = as_type<float>(int(gl_VertexIndex));
    float _407 = in.m_49.x;
    float _409 = in.m_49.y;
    int _411 = as_type<int>(_405) & 1;
    bool _413 = _411 != 0;
    int _415 = as_type<int>(_405) & 2;
    bool _417 = _415 != 0;
    float _419 = _373 * _409;
    bool _421 = !_417;
    float _423 = _421 ? (-0.5) : 0.5;
    float _425 = _371 * _407;
    bool _427 = !_413;
    float _429 = _427 ? (-0.5) : 0.5;
    float _431 = _419 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _435 = isnan(0.5);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _441 = _437 || _439;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _423);
    float _445 = _425 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _429);
    float _449 = _431 * _443;
    float _451 = _255 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _453 = _445 * _447;
    float _455 = _255 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _449 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _459 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].x, _451);
    float _461 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _463 = _449 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[26].x, _457);
    float _467 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _469 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[6].z, _459);
    float _471 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[24].x, _463);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[26].z, _465);
    float _475 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _477 = _469 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _479 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[24].z, _471);
    float _481 = _473 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _483 = _255 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _485 = _475 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _487 = _479 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _489 = _477 + _481;
    float _491 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].x, _483);
    float _493 = _485 + _487;
    float _495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _497 = _489 + _495;
    float _499 = fma(_257, (*spvDescriptorSet0.vp_c10)._m0[5].z, _491);
    float _501 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _503 = _493 + _501;
    float _505 = _497 * _497;
    float _507 = _499 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = fma(_503, _503, _505);
    float _511 = _507 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _513 = _507 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _515 = sqrt(_509);
    float _517 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[11].x, _511);
    float _519 = fma(_485, (*spvDescriptorSet0.vp_c8)._m0[10].x, _513);
    float _521 = _485;
    float _523 = _449;
    if (_441)
    {
        _521 = 1.0;
    }
    float _525 = _521;
    float _527 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[11].z, _517);
    float _529 = fma(_477, (*spvDescriptorSet0.vp_c8)._m0[10].z, _519);
    float _531 = _527 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _533 = _449 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _535 = _529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _537 = 1.0 / _531;
    float _539 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[25].x, _533);
    float _541 = _535 + _531;
    bool _543 = _515 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _545 = fma(_461, (*spvDescriptorSet0.vp_c8)._m0[25].z, _539);
    float _547 = _545 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _549 = _507 + _547;
    float _551 = _541 * _537;
    float _553 = _551 * 0.5;
    float _555 = _547;
    float _557 = _541;
    float _559 = _531;
    float _561 = _549;
    float _563 = _525;
    if (!_543)
    {
        _555 = _493;
    }
    float _565 = _555;
    float _567 = _565;
    if (!_543)
    {
        _557 = _489;
    }
    float _569 = _557;
    float _571 = _569;
    if (!_543)
    {
        _559 = _549;
    }
    float _573 = _559;
    bool _575 = !_543;
    float _577 = _573;
    if (!_575)
    {
        float _579 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _583 = _515 + _581;
        float _585 = rsqrt(_509);
        float _587 = _583 * _579;
        float _589 = _549 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _591 = _587 * 0.15915493667125701904296875;
        float _593 = _591 * 6.283185482025146484375;
        float _595 = cos(_593);
        float _597 = _591 * 6.283185482025146484375;
        float _599 = sin(_597);
        float _601 = _595 + (-1.0);
        float _603 = _601 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _605 = fma(_599, _589, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _607 = fma(_549, _595, _603);
        float _609 = _585 * _605;
        float _611 = fma(_503, _609, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _613 = fma(_497, _609, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _577 = _607;
        _567 = _611;
        _571 = _613;
    }
    float _615 = _577;
    float _617 = _567;
    float _619 = _571;
    if (!_441)
    {
        float _621 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _623 = _621 * 0.15915493667125701904296875;
        float _625 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _627 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _629 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[30].w, _627);
        float _631 = _623 * 6.283185482025146484375;
        float _633 = cos(_631);
        float _635 = _625 * 0.15915493667125701904296875;
        float _637 = _623 * 6.283185482025146484375;
        float _639 = sin(_637);
        float _641 = 1.0 / _633;
        float _643 = _635 * 6.283185482025146484375;
        float _645 = cos(_643);
        float _647 = _639 * _641;
        float _649 = _635 * 6.283185482025146484375;
        float _651 = sin(_649);
        float _653 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _655 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _653;
        float _657 = _645 * _647;
        float _659 = 1.0 / _629;
        float _661 = 1.0 / _657;
        float _663 = 1.0 / _655;
        float _665 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _667 = _659 * _665;
        float _669 = _651 * _661;
        float _671 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _673 = fma(_669, _667, _671);
        float _675 = _673 * _663;
        float _677 = precise::clamp(_675, 0.0, 1.0);
        _561 = _663;
        _523 = _659;
        _563 = _677;
    }
    float _679 = _561;
    float _681 = _523;
    float _683 = _563;
    float _685 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _687 = _615 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _691 = _617 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _695 = _619 + _693;
    float _697 = _687 * _687;
    float _699 = fma(_691, _691, _697);
    float _701 = fma(_695, _695, _699);
    float _703 = rsqrt(_701);
    float _705 = sqrt(_701);
    float _707 = _703 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _709 = _691 * _707;
    float _711 = _695 * _707;
    float _713 = _709 * _709;
    float _715 = _711 * _711;
    float _717 = _713 + _715;
    float _719 = sqrt(_717);
    bool _721 = _719 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _725 = _719 + _723;
    float _727 = _703;
    float _729 = _717;
    float _731 = _725;
    float _733 = _679;
    float _735 = _687;
    float _737 = _707;
    if (_721)
    {
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _727 = _739;
    }
    float _741 = _727;
    if (_721)
    {
        float _743 = rsqrt(_717);
        _729 = _743;
    }
    float _745 = _729;
    float _747 = _745;
    if (_721)
    {
        float _749 = _725 * _741;
        _731 = _749;
    }
    float _751 = _731;
    if (_721)
    {
        float _753 = _751 * 0.15915493667125701904296875;
        _733 = _753;
    }
    float _755 = _733;
    float _757 = _695;
    float _759 = _755;
    if (_721)
    {
        float _761 = _755 * 6.283185482025146484375;
        float _763 = sin(_761);
        _757 = _763;
    }
    float _765 = _757;
    float _767 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _769 = precise::max(0.0, _767);
    float _771 = _681;
    float _773 = _769;
    float _775 = _767;
    if (_721)
    {
        float _777 = _755 * 6.283185482025146484375;
        float _779 = cos(_777);
        _771 = _779;
    }
    float _781 = _771;
    float _783 = -_707;
    float _785 = -_769;
    float _787 = fma(_687, _783, _785);
    if (!_721)
    {
        _735 = _711;
    }
    float _789 = _735;
    float _791 = _789;
    if (_721)
    {
        float _793 = _787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _773 = _793;
    }
    float _795 = _773;
    float _797 = _765;
    float _799 = _795;
    if (_721)
    {
        float _801 = fma(_765, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _797 = _801;
    }
    float _803 = _797;
    float _805 = _803;
    if (!_721)
    {
        _799 = _709;
    }
    float _807 = _799;
    float _809 = _807;
    if (_721)
    {
        float _811 = _781 + (-1.0);
        _775 = _811;
    }
    float _813 = _775;
    float _815 = _813;
    if (_721)
    {
        float _817 = _745 * _803;
        _737 = _817;
    }
    float _819 = _737;
    if (!_721)
    {
        _805 = _787;
    }
    float _821 = _805;
    float _823 = _821;
    if (_721)
    {
        float _825 = _813 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _759 = _825;
    }
    float _827 = _759;
    if (_721)
    {
        float _829 = _709 * _819;
        _809 = _829;
    }
    float _831 = _809;
    if (!_721)
    {
        _747 = _713;
    }
    float _833 = _747;
    float _835 = _833;
    if (_721)
    {
        float _837 = _711 * _819;
        _791 = _837;
    }
    float _839 = _791;
    if (_721)
    {
        float _841 = fma(_787, _781, _827);
        _823 = _841;
    }
    float _843 = _823;
    if (_721)
    {
        float _845 = _831 * _831;
        _835 = _845;
    }
    float _847 = _835;
    if (!_721)
    {
        _815 = _715;
    }
    float _849 = _815;
    float _851 = _849;
    if (_721)
    {
        float _853 = _839 * _839;
        _851 = _853;
    }
    float _855 = _851;
    float _857 = fma(_843, _843, _847);
    float _859 = _615 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _861 = _857 + _855;
    float _863 = _615 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _867 = fma(_705, (*spvDescriptorSet0.vp_c15)._m0[23].w, _865);
    float _869 = precise::clamp(_867, 0.0, 1.0);
    float _871 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _873 = rsqrt(_861);
    float _875 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[2].x, _863);
    float _877 = _615 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _879 = -_869;
    float _881 = _879 + 1.0;
    float _883 = _615 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _885 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[2].z, _875);
    float _887 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[1].x, _877);
    float _889 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[0].x, _859);
    float _891 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[3].x, _883);
    float _893 = abs(_881);
    float _895 = log2(_893);
    float _897 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[1].z, _887);
    float _899 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[0].z, _889);
    float _901 = _885 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _903 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[3].z, _891);
    float _905 = _897 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _907 = _899 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _909 = _873 * _831;
    float _911 = _873 * _843;
    float _913 = _905 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _915 = _901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _917 = _909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _919 = _873 * _839;
    float _921 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[7].x, _913);
    float _923 = -_915;
    float _925 = fma(_923, _871, 1.0);
    float _927 = -_917;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c15)._m0[21].y, _927);
    float _931 = _903 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _933 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _921);
    float _935 = _895 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _937 = -_919;
    float _939 = fma(_937, (*spvDescriptorSet0.vp_c15)._m0[21].z, _929);
    float _941 = _905 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _943 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[7].w, _933);
    float _945 = log2(_925);
    float _947 = fma(_939, -0.5, 0.5);
    float _949 = _905 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _951 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[4].x, _941);
    float _953 = fma(_939, 0.5, 0.5);
    float _955 = _911 + 1.0;
    float _957 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[5].x, _949);
    float _959 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _951);
    float _961 = exp2(_935);
    float _963 = fma(_953, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _965 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _957);
    float _967 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[4].w, _959);
    float _969 = fma(_953, _963, -0.212114393711090087890625);
    float _971 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[5].w, _965);
    float _973 = 1.0 / _943;
    float _975 = _945 * 0.693147182464599609375;
    float _977 = fma(_953, _969, 1.570728778839111328125);
    float _979 = _975 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _981 = sqrt(_947);
    float _983 = -_911;
    float _985 = fma(_961, _955, _983);
    float _987 = fma(_985, 0.5, 0.5);
    float _989 = _967 * _973;
    float _991 = _971 * _973;
    float _993 = fma(_989, 0.5, 0.5);
    float _995 = fma(_991, -0.5, 0.5);
    float _997 = _981 * 0.636619746685028076171875;
    float3 _2813 = float3(_993, _995, _979);
    float _999 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2813, float3(0.0), isnan(_2813)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2813, float3(0.0), isnan(_2813)), level(0.0)).x;
    float3 _2824 = float3(_993, _995, _979);
    float4 _1002 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2824, float3(0.0), isnan(_2824)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2824, float3(0.0), isnan(_2824)), level(0.0)).xyzw;
    float _1004 = _1002.x;
    float _1006 = _1002.y;
    float _1008 = _1002.z;
    float _1010 = _1002.w;
    float _1012 = -_977;
    float _1014 = fma(_997, _1012, 1.0);
    float2 _2846 = float2(_1014, _987);
    float3 _1018 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2846, float2(0.0), isnan(_2846)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2846, float2(0.0), isnan(_2846)), level(0.0)).xyz;
    float _1020 = _1018.x;
    float _1022 = _1018.y;
    float _1024 = _1018.z;
    float _1026 = in.m_51.x;
    float _1028 = in.m_51.y;
    float _1030 = _895 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1038 = _1036 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1040 = 1.0 / _1034;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1046 = _905 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    int _1052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1054 = _1052 != 0;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1058 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1056;
    float _1060 = 1.0 / _1038;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1066;
    float _1070 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1046);
    float _1072 = fma(_901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1070);
    float _1074 = 1.0 / _1044;
    bool _1076 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1078 = isnan(_403);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1084 = _1080 || _1082;
    float _1086 = float(_1084);
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1090 = _1026 > 0.5;
    float _1092 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1072);
    bool _1094 = _1028 > 0.5;
    float _1096 = -_1086;
    float _1098 = _1096 + 1.0;
    float _1100 = -_429;
    int _1102 = _1090 ? as_type<int>(_1100) : as_type<int>(_429);
    float _1104 = _1058 * _1060;
    float _1106 = _1064 * _1040;
    bool _1108 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1110 = isnan(_403);
    bool _1112 = _1108 || _1110;
    bool _1114 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1116 = _1112 || _1114;
    float _1118 = float(_1116);
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1122 = _403 + _1120;
    bool _1124 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1126 = isnan(_403);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1132 = _1128 || _1130;
    float _1134 = float(_1132);
    float _1136 = exp2(_1030);
    float _1138 = -_423;
    int _1140 = _1094 ? as_type<int>(_1138) : as_type<int>(_423);
    float _1142 = _1118 * _1098;
    float _1144 = _1068 * _1074;
    float _1146 = -_1118;
    float _1148 = _1146 + 1.0;
    bool _1150 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1152 = isnan(_403);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = fma(_1104, _1122, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1166 = _403 + _1164;
    float _1168 = _1134 * _1148;
    float _1170 = -_1134;
    float _1172 = _1170 + 1.0;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1176 = _403 + _1174;
    float _1178 = fma(_1106, _1166, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1180 = !_1050;
    float _1182 = _1180 ? _429 : as_type<float>(_1102);
    float _1184 = _1160 * _1172;
    float _1186 = -_1160;
    float _1188 = _1186 + 1.0;
    float _1190 = fma(_1144, _1176, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1194 = _1162 * _1184;
    bool _1196 = !_1054;
    float _1198 = _1196 ? _423 : as_type<float>(_1140);
    float _1200 = _1092 + _943;
    float _1202 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1194);
    float _1204 = _1182 + 0.5;
    float _1206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1208 = fma(_1178, _1168, _1202);
    float _1210 = -_1198;
    float _1212 = _1210 + 0.5;
    bool _1214 = _683 > 0.0;
    bool _1216 = isnan(_683);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = fma(_1190, _1142, _1208);
    float _1228 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.gl_Position.x = _967;
    out.gl_Position.y = _971;
    out.gl_Position.z = _1092;
    out.gl_Position.w = _943;
    float _1232 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1226);
    float _1234 = -_1136;
    float _1236 = _1234 + 1.0;
    float _1238 = _1200 * 0.5;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1244 = _1236 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1246 = _683 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1248 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1250 = _1242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1252 = _1232 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1256 = -_1244;
    float _1258 = _1256 + 1.0;
    float _1260 = _1228 * _1192;
    float _1262 = _1230 * _1206;
    out.m_58.x = _1224;
    out.m_58.y = _1248;
    out.m_58.z = _1250;
    out.m_58.w = _1252;
    out.m_60.x = _1260;
    out.m_60.y = _1262;
    out.m_62.z = _1238;
    out.m_62.w = _943;
    out.m_45.x = _1254;
    float _1264 = _1244 * _999;
    float _1266 = _1010 * _1258;
    float _1268 = _1010 * _1264;
    float _1270 = _1024 * _1264;
    float _1272 = fma(_1020, _1268, _1004);
    float _1274 = fma(_1022, _1268, _1006);
    float _1276 = fma(_1010, _1270, _1008);
    out.m_64.x = _1272;
    out.m_64.y = _1274;
    out.m_64.z = _1276;
    out.m_64.w = _1266;
    if (_1222)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1278 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1278;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

