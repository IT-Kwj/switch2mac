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
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1134 = false;
    bool _445 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1624 = as_type<float>(_101);
        out.gl_Position.z = _1624;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1692 = as_type<float>(_137);
        out.gl_Position.z = _1692;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    bool _141 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _143 = as_type<int>(_139) & 1;
    bool _145 = _143 != 0;
    int _147 = as_type<int>(_139) & 2;
    bool _149 = _147 != 0;
    bool _151 = !_145;
    float _153 = _151 ? (-0.5) : 0.5;
    bool _155 = !_149;
    float _157 = _155 ? (-0.5) : 0.5;
    bool _159 = !_141;
    float _177;
    if (!_159)
    {
        float _161 = in.m_54.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_85);
        float _183 = 1.0 / _181;
        float _185 = _119 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _195 = _193 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _203 = _201 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _205 = 1.0 / _191;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _209 = 1.0 / _195;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _219 = _187 + _217;
    float _221 = _207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _223 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _227 = 1.0 / _203;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _187 + _229;
    float _233 = 1.0 / _199;
    float _235 = _231 * _209;
    bool _237 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_187);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = _219 * _227;
    float _251 = _211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _187 + _253;
    float _257 = _255 * _205;
    bool _259 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _261 = isnan(_187);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    out.m_56.x = _221;
    out.m_56.y = _223;
    out.m_56.z = _251;
    out.m_56.w = _215;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _187 + _271;
    float _275 = -_269;
    float _277 = _275 + 1.0;
    float _279 = _273 * _233;
    bool _281 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_187);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _247 * _277;
    float _295 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _297 = -_247;
    float _299 = _297 + 1.0;
    bool _301 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_187);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = in.m_54.x;
    bool _315 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_187);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_311;
    float _329 = _327 + 1.0;
    float _331 = _311 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = _291 * _329;
    float _343 = -_291;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = fma(_335, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _325 * _345;
    float _359 = fma(_339, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_349, _235, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = fma(_353, _235, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = _355 * _357;
    float _367 = -_325;
    float _369 = _367 + 1.0;
    float _371 = _359 * _357;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _383 = _295 * _313;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _387 = fma(_379, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_361, _341, _381);
    float _391 = fma(_375, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _397 = trunc(_383);
    int _399 = int(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _405 = fma(_363, _341, _385);
    float _407 = fma(_387, _331, _389);
    float _409 = fma(_395, _249, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_403, _249, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = fma(_391, _331, _405);
    float _415 = fma(_409, _293, _407);
    float _417 = fma(_411, _293, _413);
    float _419 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[147].x, _415);
    float _421 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[147].y, _417);
    int _423 = _399 << 4;
    int _425 = _423 + 1968;
    bool _427 = !_225;
    float _443;
    if (!_427)
    {
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_85);
        float _449 = 1.0 / _447;
        float _451 = _119 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_54.z;
    float _457 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _463 = in.m_54.w;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _465;
    bool _469 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _471 = isnan(_453);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = in.m_54.y;
    float _487 = 1.0 / _461;
    float _489 = 1.0 / _483;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    float _501 = -_491;
    float _503 = fma(_457, 2.0, _501);
    bool _505 = _455 > 0.5;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _511 = _467 * _487;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _515 = _453 + _513;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _519 = _517 != 0;
    float _521 = -_479;
    float _523 = _521 + 1.0;
    bool _525 = _463 > 0.5;
    float _527 = fma(_511, _515, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _529 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _531 = isnan(_453);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _485 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _543 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _545 = isnan(_453);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_119;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[76].x, _503);
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _561 = _559 != 0;
    float _563 = -_539;
    float _565 = _563 + 1.0;
    bool _567 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _569 = isnan(_453);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -_553;
    float _581 = _579 + 1.0;
    float _583 = _479 * _565;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _589 = _539 * _581;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _593 = in.m_44.x;
    float _595 = in.m_44.y;
    float _597 = in.m_44.z;
    float _599 = 1.0 / _587;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _603 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _591);
    float _605 = _577 * _523;
    float _607 = fma(_541, -2.0, _601);
    bool _609 = _313 > 0.5;
    float _611 = _527 * _605;
    float _613 = -_577;
    float _615 = _613 + 1.0;
    float _617 = _509 * _489;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _621 = _453 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _623;
    float _627 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _611);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _631 = _453 + _629;
    float _633 = fma(_617, _621, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _635 = _625 * _599;
    uint _638 = uint(int(uint(_425) >> uint(2)));
    uint _640 = uint(int(uint(int(_638)) >> uint(2)));
    int _642 = int(_638) & 3;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[int(_640)][_642];
    int _646 = int(_638) + 1;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    int _650 = _646 & 3;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[int(_648)][_650];
    float _654 = fma(_633, _583, _627);
    float _656 = -_153;
    int _658 = _609 ? as_type<int>(_656) : as_type<int>(_153);
    float _660 = fma(_635, _631, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _666 = _595 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = fma(_660, _589, _654);
    bool _670 = _485 > 0.5;
    int _672 = _425 + 8;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[int(_676)][_678];
    float _682 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _684 = _595 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _686 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _690 = _595 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _692 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[4].x, _684);
    float _694 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    bool _696 = !_495;
    float _698 = _696 ? _153 : as_type<float>(_658);
    float _700 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[6].x, _690);
    float _702 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].z, _692);
    float _704 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _706 = _664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _708 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _710 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _714 = _704 + _712;
    float _716 = -_157;
    int _718 = _670 ? as_type<int>(_716) : as_type<int>(_157);
    float _720 = _708 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = _710 + _722;
    float _726 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _607);
    float _728 = _688 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _730 = _714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _732 = !_499;
    float _734 = _732 ? _157 : as_type<float>(_718);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _720 + _736;
    float _740 = _698 + 0.5;
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[28].x, _730);
    float _744 = _714 * _714;
    float _746 = _734 + (-0.5);
    float _748 = fma(_706, _740, _557);
    float _750 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[28].z, _742);
    float _752 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[134].x, _668);
    float _754 = -_153;
    int _756 = _505 ? as_type<int>(_754) : as_type<int>(_153);
    float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _760 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _762 = -_728;
    float _764 = -_726;
    float _766 = fma(_762, _746, _764);
    bool _768 = _750 >= 0.0;
    float _770 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _603);
    float _772 = -_157;
    int _774 = _525 ? as_type<int>(_772) : as_type<int>(_157);
    float _776 = fma(_724, _724, _744);
    bool _778 = !_519;
    float _780 = _778 ? _153 : as_type<float>(_756);
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _784 = !_561;
    float _786 = _784 ? _157 : as_type<float>(_774);
    float _788 = -_760;
    float _790 = _788 + 1.0;
    float _792 = fma(_738, _738, _776);
    float _794 = _780 + 0.5;
    float _796 = -_770;
    float _798 = _796 + 1.0;
    float _800 = -_786;
    float _802 = _800 + 0.5;
    float _804 = fma(_734, _790, _766);
    float _806 = _794 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _808 = rsqrt(_792);
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _812 = _776;
    float _814 = _704;
    if (_768)
    {
        _812 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _816 = _812;
    float _818 = _644 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _820 = _652 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _822 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _824 = _806 * _758;
    float _826 = -_798;
    float _828 = fma(_698, _826, _748);
    float _830 = _810 * _782;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _752 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _840 = as_type<int>(_816);
    if (_768)
    {
        float _842 = _816 * 5.0;
        _840 = as_type<int>(_842);
    }
    int _844 = _840;
    out.m_58.x = _828;
    out.m_58.y = _804;
    out.m_58.z = _824;
    out.m_58.w = _830;
    float _846 = _714 * _808;
    float _848 = _724 * _808;
    out.m_60.x = _832;
    out.m_60.y = _834;
    out.m_60.z = _836;
    out.m_60.w = _838;
    if (_768)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2898 = as_type<float>(_844);
        out.gl_Position.z = _2898;
    }
    if (_768)
    {
        out.m_47.x = 0.0;
    }
    if (_768)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _850 = -_846;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _854 = _738 * _808;
    float _856 = -_848;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _860 = -_846;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _866 = _852 + _864;
    float _868 = -_854;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _874 = _858 + _872;
    float _876 = -_848;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _724);
    float _880 = _866 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _870 + _882;
    float _886 = _862 * _862;
    float _888 = in.m_62.x;
    float _890 = in.m_62.y;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = -_854;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _738);
    float _898 = fma(_878, _878, _886);
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _902 = fma(_896, _896, _898);
    bool _904 = _900 >= 0.0;
    float _906 = sqrt(_902);
    float _908 = _884;
    if (_904)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _910 = _908;
    int _912 = as_type<int>(_910);
    if (_904)
    {
        out.m_47.x = 0.0;
    }
    float _914 = _419 * _888;
    float _916 = _421 * _890;
    float _918 = _808 * _906;
    if (_904)
    {
        float _920 = _910 * 5.0;
        _912 = as_type<int>(_920);
    }
    int _922 = _912;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_922);
        out.gl_Position.z = _3040;
    }
    if (_904)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _924 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _926 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _157);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _153);
    float _932 = _924 * _918;
    float _934 = _926 * _918;
    float _936 = _918 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _938 = _936 * 0.5;
    float _940 = _928 * _932;
    float _942 = _930 * _934;
    float _944 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _946 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _948 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].x, _944);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _946);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].z, _950);
    float _956 = _952 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _958 = _954 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _960 = _710 + _956;
    float _962 = _720 + _958;
    float _964 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _960 + _966;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _964);
    float _976 = _968 * _968;
    float _978 = _972 * _972;
    float _980 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].z, _974);
    float _982 = _976 + _978;
    float _984 = _980 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _986 = sqrt(_982);
    float _988 = _704 + _984;
    bool _990 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = _980;
    float _994 = _984;
    float _996 = _940;
    float _998 = _960;
    float _1000 = _982;
    if (!_990)
    {
        _814 = _978;
    }
    float _1002 = _814;
    float _1004 = _1002;
    if (!_990)
    {
        _992 = _976;
    }
    float _1006 = _992;
    float _1008 = _1006;
    if (!_990)
    {
        _994 = _962;
    }
    float _1010 = _994;
    float _1012 = _1010;
    if (!_990)
    {
        _996 = _988;
    }
    float _1014 = _996;
    bool _1016 = !_990;
    float _1018 = _1014;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _986 + _1022;
        float _1026 = _988 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = rsqrt(_982);
        float _1030 = _1024 * _1020;
        float _1032 = _1030 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = sin(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = fma(_1036, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1044 = _1028 * _1042;
        float _1046 = _1040 + (-1.0);
        float _1048 = fma(_968, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1050 = fma(_972, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1052 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1056 = _1048 + _1054;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1060 = _1050 + _1058;
        float _1062 = fma(_988, _1040, _1052);
        float _1064 = _1056 * _1056;
        float _1066 = _1060 * _1060;
        _1018 = _1062;
        _1008 = _1064;
        _1004 = _1066;
        _998 = _1048;
        _1012 = _1050;
    }
    float _1068 = _1018;
    float _1070 = _1008;
    float _1072 = _1004;
    float _1074 = _998;
    float _1076 = _1012;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1080 = _1068 + _1078;
    float _1082 = fma(_1080, _1080, _1070);
    float _1084 = _1082 + _1072;
    float _1086 = sqrt(_1084);
    bool _1088 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1090 = isnan(_1086);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1096 = _1092 || _1094;
    float _1098 = _1070;
    if (!_1096)
    {
        _1098 = 1.0;
    }
    float _1100 = _1098;
    bool _1102 = !_1096;
    float _1104 = _1100;
    if (!_1102)
    {
        bool _1106 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1108 = isnan(_1086);
        bool _1110 = _1106 || _1108;
        bool _1112 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1114 = _1110 || _1112;
        if (!_1114)
        {
            float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1118 = _1086 + _1116;
            float _1120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1122 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1120;
            float _1124 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1126 = _1124 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1128 = 1.0 / _1122;
            float _1130 = _1118 * _1128;
            float _1132 = fma(_1130, _1126, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1104 = _1132;
            _1134 = true;
        }
        else
        {
            bool _1136 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1138 = isnan(_1086);
            bool _1140 = _1136 || _1138;
            bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1144 = _1140 || _1142;
            if (!_1144)
            {
                float _1146 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1148 = _1086 + _1146;
                float _1150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1152 = _1150 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1154 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1156 = _1154 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1158 = 1.0 / _1152;
                float _1160 = _1148 * _1158;
                float _1162 = fma(_1160, _1156, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1104 = _1162;
                _1134 = true;
            }
            else
            {
                _1104 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1134 = false;
    float _1164 = _1104;
    float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1168 = _1068 + _1166;
    float _1170 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1172 = _1074 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1176 = _1076 + _1174;
    float _1178 = fma(_1168, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1180 = fma(_1172, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1182 = fma(_1176, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1184 = -_846;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1178);
    float _1188 = -_848;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1192 = -_854;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1186 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1202, _1202, _1208);
    float _1212 = fma(_1206, _1206, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1202 * _1216;
    float _1220 = _1206 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1214;
    float _1238 = _1226;
    float _1240 = _1234;
    float _1242 = _1168;
    float _1244 = _1198;
    float _1246 = _1218;
    if (_1230)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1248;
    }
    float _1250 = _1236;
    if (_1230)
    {
        float _1252 = rsqrt(_1226);
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1230)
    {
        float _1256 = _1234 * _1250;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1242 = _1260;
    }
    float _1262 = _1242;
    float _1264 = _1250;
    float _1266 = _1262;
    if (_1230)
    {
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1264 = _1270;
    }
    float _1272 = _1264;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1206;
    float _1280 = _1276;
    if (_1230)
    {
        float _1282 = _1262 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        _1278 = _1284;
    }
    float _1286 = _1278;
    float _1288 = -_1216;
    float _1290 = -_1276;
    float _1292 = fma(_1198, _1288, _1290);
    float _1294 = _1292;
    if (!_1230)
    {
        _1244 = _1220;
    }
    float _1296 = _1244;
    float _1298 = _1296;
    if (_1230)
    {
        float _1300 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1300;
    }
    float _1302 = _1280;
    float _1304 = _1272;
    float _1306 = _1302;
    if (_1230)
    {
        float _1308 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1304 = _1308;
    }
    float _1310 = _1304;
    float _1312 = _1310;
    if (_1230)
    {
        float _1314 = _1286 + (-1.0);
        _1306 = _1314;
    }
    float _1316 = _1306;
    float _1318 = _1316;
    if (_1230)
    {
        float _1320 = _1254 * _1310;
        _1000 = _1320;
    }
    float _1322 = _1000;
    if (!_1230)
    {
        _1312 = _1222;
    }
    float _1324 = _1312;
    float _1326 = sqrt(_1212);
    float _1328 = _1324;
    if (_1230)
    {
        float _1330 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1330;
    }
    float _1332 = _1266;
    if (_1230)
    {
        float _1334 = _1218 * _1322;
        _1246 = _1334;
    }
    float _1336 = _1246;
    if (_1230)
    {
        float _1338 = _1220 * _1322;
        _1298 = _1338;
    }
    float _1340 = _1298;
    if (!_1230)
    {
        _1318 = _1224;
    }
    float _1342 = _1318;
    float _1344 = _1342;
    if (_1230)
    {
        float _1346 = fma(_1292, _1286, _1332);
        _1294 = _1346;
    }
    float _1348 = _1294;
    if (_1230)
    {
        float _1350 = _1336 * _1336;
        _1328 = _1350;
    }
    float _1352 = _1328;
    if (_1230)
    {
        float _1354 = _1340 * _1340;
        _1344 = _1354;
    }
    float _1356 = _1344;
    float _1358 = fma(_1348, _1348, _1352);
    float _1360 = _1358 + _1356;
    float _1362 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1366 = fma(_1326, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1364);
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1372 = rsqrt(_1360);
    float _1374 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1362);
    float _1376 = -_1368;
    float _1378 = _1376 + 1.0;
    float _1380 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1370);
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1386 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1380);
    float _1390 = abs(_1378);
    float _1392 = log2(_1390);
    float _1394 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1382);
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1400 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1386);
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1404 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1388);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = _1372 * _1336;
    float _1410 = -_1402;
    float _1412 = fma(_1410, _1398, 1.0);
    float _1414 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1400);
    float _1416 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1420 = _1372 * _1348;
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1424 = _1372 * _1340;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1418);
    float _1428 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1430 = -_1422;
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1430);
    float _1434 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1436 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1426);
    float _1438 = log2(_1412);
    float _1440 = -_1424;
    float _1442 = fma(_1440, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1432);
    float _1444 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1436);
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1450 = fma(_1442, -0.5, 0.5);
    float _1452 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1442, 0.5, 0.5);
    float _1456 = exp2(_1428);
    float _1458 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1448);
    float _1460 = _1420 + 1.0;
    float _1462 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1464 = fma(_1454, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1458);
    float _1468 = 1.0 / _1446;
    float _1470 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1466);
    float _1472 = fma(_1454, _1464, -0.212114393711090087890625);
    float _1474 = _1438 * 0.693147182464599609375;
    float _1476 = fma(_1454, _1472, 1.570728778839111328125);
    float _1478 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = sqrt(_1450);
    float _1482 = -_1420;
    float _1484 = fma(_1456, _1460, _1482);
    float _1486 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1462);
    float _1488 = fma(_1484, 0.5, 0.5);
    float _1490 = _1486 * _1468;
    float _1492 = _1470 * _1468;
    float _1494 = fma(_1490, 0.5, 0.5);
    float _1496 = fma(_1492, -0.5, 0.5);
    float _1498 = _1480 * 0.636619746685028076171875;
    float _1500 = -_1476;
    float _1502 = fma(_1498, _1500, 1.0);
    float3 _4012 = float3(_1494, _1496, _1478);
    float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4012, float3(0.0), isnan(_4012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4012, float3(0.0), isnan(_4012)), level(0.0)).x;
    float3 _4023 = float3(_1494, _1496, _1478);
    float4 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4023, float3(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4023, float3(0.0), isnan(_4023)), level(0.0)).xyzw;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = _1507.w;
    float2 _4040 = float2(_1502, _1488);
    float3 _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4040, float2(0.0), isnan(_4040)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4040, float2(0.0), isnan(_4040)), level(0.0)).xyz;
    float _1521 = _1519.x;
    float _1523 = _1519.y;
    float _1525 = _1519.z;
    float _1527 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1529 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1531 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1529);
    float _1533 = exp2(_1527);
    float _1535 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1531);
    float _1537 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1535);
    float _1539 = _1537 + _1446;
    out.gl_Position.x = _1486;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _1446;
    float _1541 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1543 = _1539 * 0.5;
    float _1545 = -_1533;
    float _1547 = _1545 + 1.0;
    out.m_47.x = _1541;
    float _1549 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1543;
    out.m_64.w = _1446;
    float _1551 = _1549 * _1504;
    float _1553 = -_1549;
    float _1555 = _1553 + 1.0;
    float _1557 = _1515 * _1551;
    float _1559 = _1525 * _1551;
    float _1561 = _1515 * _1555;
    float _1563 = fma(_1521, _1557, _1509);
    float _1565 = fma(_1523, _1557, _1511);
    float _1567 = fma(_1515, _1559, _1513);
    out.m_66.x = _1563;
    out.m_66.y = _1565;
    out.m_66.z = _1567;
    out.m_66.w = _1561;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1134 = false;
    bool _445 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1624 = as_type<float>(_101);
        out.gl_Position.z = _1624;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1692 = as_type<float>(_137);
        out.gl_Position.z = _1692;
    }
    if (_131)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    bool _141 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _143 = as_type<int>(_139) & 1;
    bool _145 = _143 != 0;
    int _147 = as_type<int>(_139) & 2;
    bool _149 = _147 != 0;
    bool _151 = !_145;
    float _153 = _151 ? (-0.5) : 0.5;
    bool _155 = !_149;
    float _157 = _155 ? (-0.5) : 0.5;
    bool _159 = !_141;
    float _177;
    if (!_159)
    {
        float _161 = in.m_54.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_85);
        float _183 = 1.0 / _181;
        float _185 = _119 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _195 = _193 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _203 = _201 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _205 = 1.0 / _191;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _209 = 1.0 / _195;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _219 = _187 + _217;
    float _221 = _207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _223 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _227 = 1.0 / _203;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _187 + _229;
    float _233 = 1.0 / _199;
    float _235 = _231 * _209;
    bool _237 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_187);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = _219 * _227;
    float _251 = _211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _187 + _253;
    float _257 = _255 * _205;
    bool _259 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _261 = isnan(_187);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    out.m_56.x = _221;
    out.m_56.y = _223;
    out.m_56.z = _251;
    out.m_56.w = _215;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _187 + _271;
    float _275 = -_269;
    float _277 = _275 + 1.0;
    float _279 = _273 * _233;
    bool _281 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_187);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _247 * _277;
    float _295 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _297 = -_247;
    float _299 = _297 + 1.0;
    bool _301 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_187);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = in.m_54.x;
    bool _315 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_187);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_311;
    float _329 = _327 + 1.0;
    float _331 = _311 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = _291 * _329;
    float _343 = -_291;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = fma(_335, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _325 * _345;
    float _359 = fma(_339, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_349, _235, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = fma(_353, _235, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = _355 * _357;
    float _367 = -_325;
    float _369 = _367 + 1.0;
    float _371 = _359 * _357;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _383 = _295 * _313;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _387 = fma(_379, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_361, _341, _381);
    float _391 = fma(_375, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _397 = trunc(_383);
    int _399 = int(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _405 = fma(_363, _341, _385);
    float _407 = fma(_387, _331, _389);
    float _409 = fma(_395, _249, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_403, _249, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = fma(_391, _331, _405);
    float _415 = fma(_409, _293, _407);
    float _417 = fma(_411, _293, _413);
    float _419 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[147].x, _415);
    float _421 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[147].y, _417);
    int _423 = _399 << 4;
    int _425 = _423 + 1968;
    bool _427 = !_225;
    float _443;
    if (!_427)
    {
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_85);
        float _449 = 1.0 / _447;
        float _451 = _119 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_54.z;
    float _457 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _463 = in.m_54.w;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _465;
    bool _469 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _471 = isnan(_453);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = in.m_54.y;
    float _487 = 1.0 / _461;
    float _489 = 1.0 / _483;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    float _501 = -_491;
    float _503 = fma(_457, 2.0, _501);
    bool _505 = _455 > 0.5;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _511 = _467 * _487;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _515 = _453 + _513;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _519 = _517 != 0;
    float _521 = -_479;
    float _523 = _521 + 1.0;
    bool _525 = _463 > 0.5;
    float _527 = fma(_511, _515, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _529 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _531 = isnan(_453);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _485 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _543 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _545 = isnan(_453);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_119;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[76].x, _503);
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _561 = _559 != 0;
    float _563 = -_539;
    float _565 = _563 + 1.0;
    bool _567 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _569 = isnan(_453);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -_553;
    float _581 = _579 + 1.0;
    float _583 = _479 * _565;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _589 = _539 * _581;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _593 = in.m_44.x;
    float _595 = in.m_44.y;
    float _597 = in.m_44.z;
    float _599 = 1.0 / _587;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _603 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _591);
    float _605 = _577 * _523;
    float _607 = fma(_541, -2.0, _601);
    bool _609 = _313 > 0.5;
    float _611 = _527 * _605;
    float _613 = -_577;
    float _615 = _613 + 1.0;
    float _617 = _509 * _489;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _621 = _453 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _623;
    float _627 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _611);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _631 = _453 + _629;
    float _633 = fma(_617, _621, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _635 = _625 * _599;
    uint _638 = uint(int(uint(_425) >> uint(2)));
    uint _640 = uint(int(uint(int(_638)) >> uint(2)));
    int _642 = int(_638) & 3;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[int(_640)][_642];
    int _646 = int(_638) + 1;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    int _650 = _646 & 3;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[int(_648)][_650];
    float _654 = fma(_633, _583, _627);
    float _656 = -_153;
    int _658 = _609 ? as_type<int>(_656) : as_type<int>(_153);
    float _660 = fma(_635, _631, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _666 = _595 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = fma(_660, _589, _654);
    bool _670 = _485 > 0.5;
    int _672 = _425 + 8;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[int(_676)][_678];
    float _682 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _684 = _595 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _686 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _690 = _595 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _692 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[4].x, _684);
    float _694 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    bool _696 = !_495;
    float _698 = _696 ? _153 : as_type<float>(_658);
    float _700 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[6].x, _690);
    float _702 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].z, _692);
    float _704 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _706 = _664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _708 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _710 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _714 = _704 + _712;
    float _716 = -_157;
    int _718 = _670 ? as_type<int>(_716) : as_type<int>(_157);
    float _720 = _708 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = _710 + _722;
    float _726 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _607);
    float _728 = _688 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _730 = _714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _732 = !_499;
    float _734 = _732 ? _157 : as_type<float>(_718);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _720 + _736;
    float _740 = _698 + 0.5;
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[28].x, _730);
    float _744 = _714 * _714;
    float _746 = _734 + (-0.5);
    float _748 = fma(_706, _740, _557);
    float _750 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[28].z, _742);
    float _752 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[134].x, _668);
    float _754 = -_153;
    int _756 = _505 ? as_type<int>(_754) : as_type<int>(_153);
    float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _760 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _762 = -_728;
    float _764 = -_726;
    float _766 = fma(_762, _746, _764);
    bool _768 = _750 >= 0.0;
    float _770 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _603);
    float _772 = -_157;
    int _774 = _525 ? as_type<int>(_772) : as_type<int>(_157);
    float _776 = fma(_724, _724, _744);
    bool _778 = !_519;
    float _780 = _778 ? _153 : as_type<float>(_756);
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _784 = !_561;
    float _786 = _784 ? _157 : as_type<float>(_774);
    float _788 = -_760;
    float _790 = _788 + 1.0;
    float _792 = fma(_738, _738, _776);
    float _794 = _780 + 0.5;
    float _796 = -_770;
    float _798 = _796 + 1.0;
    float _800 = -_786;
    float _802 = _800 + 0.5;
    float _804 = fma(_734, _790, _766);
    float _806 = _794 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _808 = rsqrt(_792);
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _812 = _776;
    float _814 = _704;
    if (_768)
    {
        _812 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _816 = _812;
    float _818 = _644 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _820 = _652 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _822 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _824 = _806 * _758;
    float _826 = -_798;
    float _828 = fma(_698, _826, _748);
    float _830 = _810 * _782;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _752 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _840 = as_type<int>(_816);
    if (_768)
    {
        float _842 = _816 * 5.0;
        _840 = as_type<int>(_842);
    }
    int _844 = _840;
    out.m_58.x = _828;
    out.m_58.y = _804;
    out.m_58.z = _824;
    out.m_58.w = _830;
    float _846 = _714 * _808;
    float _848 = _724 * _808;
    out.m_60.x = _832;
    out.m_60.y = _834;
    out.m_60.z = _836;
    out.m_60.w = _838;
    if (_768)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2898 = as_type<float>(_844);
        out.gl_Position.z = _2898;
    }
    if (_768)
    {
        out.m_47.x = 0.0;
    }
    if (_768)
    {
        return out;
    }
    float _850 = -_846;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _854 = _738 * _808;
    float _856 = -_848;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _860 = -_846;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _866 = _852 + _864;
    float _868 = -_854;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _874 = _858 + _872;
    float _876 = -_848;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _724);
    float _880 = _866 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _870 + _882;
    float _886 = _862 * _862;
    float _888 = in.m_62.x;
    float _890 = in.m_62.y;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = -_854;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _738);
    float _898 = fma(_878, _878, _886);
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _902 = fma(_896, _896, _898);
    bool _904 = _900 >= 0.0;
    float _906 = sqrt(_902);
    float _908 = _884;
    if (_904)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _910 = _908;
    int _912 = as_type<int>(_910);
    if (_904)
    {
        out.m_47.x = 0.0;
    }
    float _914 = _419 * _888;
    float _916 = _421 * _890;
    float _918 = _808 * _906;
    if (_904)
    {
        float _920 = _910 * 5.0;
        _912 = as_type<int>(_920);
    }
    int _922 = _912;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_922);
        out.gl_Position.z = _3040;
    }
    if (_904)
    {
        return out;
    }
    float _924 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _926 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _157);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _153);
    float _932 = _924 * _918;
    float _934 = _926 * _918;
    float _936 = _918 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _938 = _936 * 0.5;
    float _940 = _928 * _932;
    float _942 = _930 * _934;
    float _944 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _946 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _948 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].x, _944);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _946);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].z, _950);
    float _956 = _952 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _958 = _954 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _960 = _710 + _956;
    float _962 = _720 + _958;
    float _964 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _960 + _966;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _964);
    float _976 = _968 * _968;
    float _978 = _972 * _972;
    float _980 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].z, _974);
    float _982 = _976 + _978;
    float _984 = _980 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _986 = sqrt(_982);
    float _988 = _704 + _984;
    bool _990 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = _980;
    float _994 = _984;
    float _996 = _940;
    float _998 = _960;
    float _1000 = _982;
    if (!_990)
    {
        _814 = _978;
    }
    float _1002 = _814;
    float _1004 = _1002;
    if (!_990)
    {
        _992 = _976;
    }
    float _1006 = _992;
    float _1008 = _1006;
    if (!_990)
    {
        _994 = _962;
    }
    float _1010 = _994;
    float _1012 = _1010;
    if (!_990)
    {
        _996 = _988;
    }
    float _1014 = _996;
    bool _1016 = !_990;
    float _1018 = _1014;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _986 + _1022;
        float _1026 = _988 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = rsqrt(_982);
        float _1030 = _1024 * _1020;
        float _1032 = _1030 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = sin(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = fma(_1036, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1044 = _1028 * _1042;
        float _1046 = _1040 + (-1.0);
        float _1048 = fma(_968, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1050 = fma(_972, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1052 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1056 = _1048 + _1054;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1060 = _1050 + _1058;
        float _1062 = fma(_988, _1040, _1052);
        float _1064 = _1056 * _1056;
        float _1066 = _1060 * _1060;
        _1018 = _1062;
        _1008 = _1064;
        _1004 = _1066;
        _998 = _1048;
        _1012 = _1050;
    }
    float _1068 = _1018;
    float _1070 = _1008;
    float _1072 = _1004;
    float _1074 = _998;
    float _1076 = _1012;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1080 = _1068 + _1078;
    float _1082 = fma(_1080, _1080, _1070);
    float _1084 = _1082 + _1072;
    float _1086 = sqrt(_1084);
    bool _1088 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1090 = isnan(_1086);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1096 = _1092 || _1094;
    float _1098 = _1070;
    if (!_1096)
    {
        _1098 = 1.0;
    }
    float _1100 = _1098;
    bool _1102 = !_1096;
    float _1104 = _1100;
    if (!_1102)
    {
        bool _1106 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1108 = isnan(_1086);
        bool _1110 = _1106 || _1108;
        bool _1112 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1114 = _1110 || _1112;
        if (!_1114)
        {
            float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1118 = _1086 + _1116;
            float _1120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1122 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1120;
            float _1124 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1126 = _1124 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1128 = 1.0 / _1122;
            float _1130 = _1118 * _1128;
            float _1132 = fma(_1130, _1126, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1104 = _1132;
            _1134 = true;
        }
        else
        {
            bool _1136 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1138 = isnan(_1086);
            bool _1140 = _1136 || _1138;
            bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1144 = _1140 || _1142;
            if (!_1144)
            {
                float _1146 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1148 = _1086 + _1146;
                float _1150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1152 = _1150 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1154 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1156 = _1154 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1158 = 1.0 / _1152;
                float _1160 = _1148 * _1158;
                float _1162 = fma(_1160, _1156, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1104 = _1162;
                _1134 = true;
            }
            else
            {
                _1104 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1134 = false;
    float _1164 = _1104;
    float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1168 = _1068 + _1166;
    float _1170 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1172 = _1074 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1176 = _1076 + _1174;
    float _1178 = fma(_1168, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1180 = fma(_1172, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1182 = fma(_1176, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1184 = -_846;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1178);
    float _1188 = -_848;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1192 = -_854;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1186 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1202, _1202, _1208);
    float _1212 = fma(_1206, _1206, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1202 * _1216;
    float _1220 = _1206 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1214;
    float _1238 = _1226;
    float _1240 = _1234;
    float _1242 = _1168;
    float _1244 = _1198;
    float _1246 = _1218;
    if (_1230)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1248;
    }
    float _1250 = _1236;
    if (_1230)
    {
        float _1252 = rsqrt(_1226);
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1230)
    {
        float _1256 = _1234 * _1250;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1242 = _1260;
    }
    float _1262 = _1242;
    float _1264 = _1250;
    float _1266 = _1262;
    if (_1230)
    {
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1264 = _1270;
    }
    float _1272 = _1264;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1206;
    float _1280 = _1276;
    if (_1230)
    {
        float _1282 = _1262 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        _1278 = _1284;
    }
    float _1286 = _1278;
    float _1288 = -_1216;
    float _1290 = -_1276;
    float _1292 = fma(_1198, _1288, _1290);
    float _1294 = _1292;
    if (!_1230)
    {
        _1244 = _1220;
    }
    float _1296 = _1244;
    float _1298 = _1296;
    if (_1230)
    {
        float _1300 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1300;
    }
    float _1302 = _1280;
    float _1304 = _1272;
    float _1306 = _1302;
    if (_1230)
    {
        float _1308 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1304 = _1308;
    }
    float _1310 = _1304;
    float _1312 = _1310;
    if (_1230)
    {
        float _1314 = _1286 + (-1.0);
        _1306 = _1314;
    }
    float _1316 = _1306;
    float _1318 = _1316;
    if (_1230)
    {
        float _1320 = _1254 * _1310;
        _1000 = _1320;
    }
    float _1322 = _1000;
    if (!_1230)
    {
        _1312 = _1222;
    }
    float _1324 = _1312;
    float _1326 = sqrt(_1212);
    float _1328 = _1324;
    if (_1230)
    {
        float _1330 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1330;
    }
    float _1332 = _1266;
    if (_1230)
    {
        float _1334 = _1218 * _1322;
        _1246 = _1334;
    }
    float _1336 = _1246;
    if (_1230)
    {
        float _1338 = _1220 * _1322;
        _1298 = _1338;
    }
    float _1340 = _1298;
    if (!_1230)
    {
        _1318 = _1224;
    }
    float _1342 = _1318;
    float _1344 = _1342;
    if (_1230)
    {
        float _1346 = fma(_1292, _1286, _1332);
        _1294 = _1346;
    }
    float _1348 = _1294;
    if (_1230)
    {
        float _1350 = _1336 * _1336;
        _1328 = _1350;
    }
    float _1352 = _1328;
    if (_1230)
    {
        float _1354 = _1340 * _1340;
        _1344 = _1354;
    }
    float _1356 = _1344;
    float _1358 = fma(_1348, _1348, _1352);
    float _1360 = _1358 + _1356;
    float _1362 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1366 = fma(_1326, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1364);
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1372 = rsqrt(_1360);
    float _1374 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1362);
    float _1376 = -_1368;
    float _1378 = _1376 + 1.0;
    float _1380 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1370);
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1386 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1380);
    float _1390 = abs(_1378);
    float _1392 = log2(_1390);
    float _1394 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1382);
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1400 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1386);
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1404 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1388);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = _1372 * _1336;
    float _1410 = -_1402;
    float _1412 = fma(_1410, _1398, 1.0);
    float _1414 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1400);
    float _1416 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1420 = _1372 * _1348;
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1424 = _1372 * _1340;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1418);
    float _1428 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1430 = -_1422;
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1430);
    float _1434 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1436 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1426);
    float _1438 = log2(_1412);
    float _1440 = -_1424;
    float _1442 = fma(_1440, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1432);
    float _1444 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1436);
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1450 = fma(_1442, -0.5, 0.5);
    float _1452 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1442, 0.5, 0.5);
    float _1456 = exp2(_1428);
    float _1458 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1448);
    float _1460 = _1420 + 1.0;
    float _1462 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1464 = fma(_1454, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1458);
    float _1468 = 1.0 / _1446;
    float _1470 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1466);
    float _1472 = fma(_1454, _1464, -0.212114393711090087890625);
    float _1474 = _1438 * 0.693147182464599609375;
    float _1476 = fma(_1454, _1472, 1.570728778839111328125);
    float _1478 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = sqrt(_1450);
    float _1482 = -_1420;
    float _1484 = fma(_1456, _1460, _1482);
    float _1486 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1462);
    float _1488 = fma(_1484, 0.5, 0.5);
    float _1490 = _1486 * _1468;
    float _1492 = _1470 * _1468;
    float _1494 = fma(_1490, 0.5, 0.5);
    float _1496 = fma(_1492, -0.5, 0.5);
    float _1498 = _1480 * 0.636619746685028076171875;
    float _1500 = -_1476;
    float _1502 = fma(_1498, _1500, 1.0);
    float3 _4012 = float3(_1494, _1496, _1478);
    float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4012, float3(0.0), isnan(_4012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4012, float3(0.0), isnan(_4012)), level(0.0)).x;
    float3 _4023 = float3(_1494, _1496, _1478);
    float4 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4023, float3(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4023, float3(0.0), isnan(_4023)), level(0.0)).xyzw;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = _1507.w;
    float2 _4040 = float2(_1502, _1488);
    float3 _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4040, float2(0.0), isnan(_4040)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4040, float2(0.0), isnan(_4040)), level(0.0)).xyz;
    float _1521 = _1519.x;
    float _1523 = _1519.y;
    float _1525 = _1519.z;
    float _1527 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1529 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1531 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1529);
    float _1533 = exp2(_1527);
    float _1535 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1531);
    float _1537 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1535);
    float _1539 = _1537 + _1446;
    out.gl_Position.x = _1486;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _1446;
    float _1541 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1543 = _1539 * 0.5;
    float _1545 = -_1533;
    float _1547 = _1545 + 1.0;
    out.m_47.x = _1541;
    float _1549 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1543;
    out.m_64.w = _1446;
    float _1551 = _1549 * _1504;
    float _1553 = -_1549;
    float _1555 = _1553 + 1.0;
    float _1557 = _1515 * _1551;
    float _1559 = _1525 * _1551;
    float _1561 = _1515 * _1555;
    float _1563 = fma(_1521, _1557, _1509);
    float _1565 = fma(_1523, _1557, _1511);
    float _1567 = fma(_1515, _1559, _1513);
    out.m_66.x = _1563;
    out.m_66.y = _1565;
    out.m_66.z = _1567;
    out.m_66.w = _1561;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1134 = false;
    bool _445 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1624 = as_type<float>(_101);
        out.gl_Position.z = _1624;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1692 = as_type<float>(_137);
        out.gl_Position.z = _1692;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    bool _141 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _143 = as_type<int>(_139) & 1;
    bool _145 = _143 != 0;
    int _147 = as_type<int>(_139) & 2;
    bool _149 = _147 != 0;
    bool _151 = !_145;
    float _153 = _151 ? (-0.5) : 0.5;
    bool _155 = !_149;
    float _157 = _155 ? (-0.5) : 0.5;
    bool _159 = !_141;
    float _177;
    if (!_159)
    {
        float _161 = in.m_54.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_85);
        float _183 = 1.0 / _181;
        float _185 = _119 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _191 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _189;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _195 = _193 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _199 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _197;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _203 = _201 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _205 = 1.0 / _191;
    float _207 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _209 = 1.0 / _195;
    float _211 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _219 = _187 + _217;
    float _221 = _207 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _223 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _225 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _227 = 1.0 / _203;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _231 = _187 + _229;
    float _233 = 1.0 / _199;
    float _235 = _231 * _209;
    bool _237 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _239 = isnan(_187);
    bool _241 = _237 || _239;
    bool _243 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _245 = _241 || _243;
    float _247 = float(_245);
    float _249 = _219 * _227;
    float _251 = _211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _255 = _187 + _253;
    float _257 = _255 * _205;
    bool _259 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _261 = isnan(_187);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    out.m_56.x = _221;
    out.m_56.y = _223;
    out.m_56.z = _251;
    out.m_56.w = _215;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _187 + _271;
    float _275 = -_269;
    float _277 = _275 + 1.0;
    float _279 = _273 * _233;
    bool _281 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _283 = isnan(_187);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _247 * _277;
    float _295 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _297 = -_247;
    float _299 = _297 + 1.0;
    bool _301 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_187);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = in.m_54.x;
    bool _315 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _317 = isnan(_187);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = -_311;
    float _329 = _327 + 1.0;
    float _331 = _311 * _299;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = _291 * _329;
    float _343 = -_291;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = fma(_335, _257, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _357 = _325 * _345;
    float _359 = fma(_339, _257, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = fma(_349, _235, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _363 = fma(_353, _235, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _365 = _355 * _357;
    float _367 = -_325;
    float _369 = _367 + 1.0;
    float _371 = _359 * _357;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _377;
    float _381 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _365);
    float _383 = _295 * _313;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _387 = fma(_379, _279, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_361, _341, _381);
    float _391 = fma(_375, _279, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _397 = trunc(_383);
    int _399 = int(_397);
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _405 = fma(_363, _341, _385);
    float _407 = fma(_387, _331, _389);
    float _409 = fma(_395, _249, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _411 = fma(_403, _249, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _413 = fma(_391, _331, _405);
    float _415 = fma(_409, _293, _407);
    float _417 = fma(_411, _293, _413);
    float _419 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[147].x, _415);
    float _421 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[147].y, _417);
    int _423 = _399 << 4;
    int _425 = _423 + 1968;
    bool _427 = !_225;
    float _443;
    if (!_427)
    {
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _431 = _313 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_85);
        float _449 = 1.0 / _447;
        float _451 = _119 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    float _455 = in.m_54.z;
    float _457 = _313 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _463 = in.m_54.w;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _465;
    bool _469 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _471 = isnan(_453);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _485 = in.m_54.y;
    float _487 = 1.0 / _461;
    float _489 = 1.0 / _483;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _495 = _493 != 0;
    int _497 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _499 = _497 != 0;
    float _501 = -_491;
    float _503 = fma(_457, 2.0, _501);
    bool _505 = _455 > 0.5;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _511 = _467 * _487;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _515 = _453 + _513;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _519 = _517 != 0;
    float _521 = -_479;
    float _523 = _521 + 1.0;
    bool _525 = _463 > 0.5;
    float _527 = fma(_511, _515, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _529 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _531 = isnan(_453);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = _485 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _543 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _545 = isnan(_453);
    bool _547 = _543 || _545;
    bool _549 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _551 = _547 || _549;
    float _553 = float(_551);
    float _555 = -_119;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[76].x, _503);
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _561 = _559 != 0;
    float _563 = -_539;
    float _565 = _563 + 1.0;
    bool _567 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _569 = isnan(_453);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = -_553;
    float _581 = _579 + 1.0;
    float _583 = _479 * _565;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _589 = _539 * _581;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _593 = in.m_44.x;
    float _595 = in.m_44.y;
    float _597 = in.m_44.z;
    float _599 = 1.0 / _587;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _603 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[78].z, _591);
    float _605 = _577 * _523;
    float _607 = fma(_541, -2.0, _601);
    bool _609 = _313 > 0.5;
    float _611 = _527 * _605;
    float _613 = -_577;
    float _615 = _613 + 1.0;
    float _617 = _509 * _489;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _621 = _453 + _619;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _623;
    float _627 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _611);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _631 = _453 + _629;
    float _633 = fma(_617, _621, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _635 = _625 * _599;
    uint _638 = uint(int(uint(_425) >> uint(2)));
    uint _640 = uint(int(uint(int(_638)) >> uint(2)));
    int _642 = int(_638) & 3;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[int(_640)][_642];
    int _646 = int(_638) + 1;
    uint _648 = uint(int(uint(_646) >> uint(2)));
    int _650 = _646 & 3;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[int(_648)][_650];
    float _654 = fma(_633, _583, _627);
    float _656 = -_153;
    int _658 = _609 ? as_type<int>(_656) : as_type<int>(_153);
    float _660 = fma(_635, _631, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _666 = _595 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _668 = fma(_660, _589, _654);
    bool _670 = _485 > 0.5;
    int _672 = _425 + 8;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[int(_676)][_678];
    float _682 = fma(_485, (*spvDescriptorSet0.vp_c9)._m0[78].w, _662);
    float _684 = _595 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _686 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[5].x, _666);
    float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _690 = _595 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _692 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[4].x, _684);
    float _694 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[5].z, _686);
    bool _696 = !_495;
    float _698 = _696 ? _153 : as_type<float>(_658);
    float _700 = fma(_593, (*spvDescriptorSet0.vp_c10)._m0[6].x, _690);
    float _702 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[4].z, _692);
    float _704 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _706 = _664 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _708 = fma(_597, (*spvDescriptorSet0.vp_c10)._m0[6].z, _700);
    float _710 = _702 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _714 = _704 + _712;
    float _716 = -_157;
    int _718 = _670 ? as_type<int>(_716) : as_type<int>(_157);
    float _720 = _708 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _722 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _724 = _710 + _722;
    float _726 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _607);
    float _728 = _688 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _730 = _714 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _732 = !_499;
    float _734 = _732 ? _157 : as_type<float>(_718);
    float _736 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _738 = _720 + _736;
    float _740 = _698 + 0.5;
    float _742 = fma(_724, (*spvDescriptorSet0.vp_c8)._m0[28].x, _730);
    float _744 = _714 * _714;
    float _746 = _734 + (-0.5);
    float _748 = fma(_706, _740, _557);
    float _750 = fma(_738, (*spvDescriptorSet0.vp_c8)._m0[28].z, _742);
    float _752 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[134].x, _668);
    float _754 = -_153;
    int _756 = _505 ? as_type<int>(_754) : as_type<int>(_153);
    float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _760 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _682);
    float _762 = -_728;
    float _764 = -_726;
    float _766 = fma(_762, _746, _764);
    bool _768 = _750 >= 0.0;
    float _770 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _603);
    float _772 = -_157;
    int _774 = _525 ? as_type<int>(_772) : as_type<int>(_157);
    float _776 = fma(_724, _724, _744);
    bool _778 = !_519;
    float _780 = _778 ? _153 : as_type<float>(_756);
    float _782 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _784 = !_561;
    float _786 = _784 ? _157 : as_type<float>(_774);
    float _788 = -_760;
    float _790 = _788 + 1.0;
    float _792 = fma(_738, _738, _776);
    float _794 = _780 + 0.5;
    float _796 = -_770;
    float _798 = _796 + 1.0;
    float _800 = -_786;
    float _802 = _800 + 0.5;
    float _804 = fma(_734, _790, _766);
    float _806 = _794 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _808 = rsqrt(_792);
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _812 = _776;
    float _814 = _704;
    if (_768)
    {
        _812 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _816 = _812;
    float _818 = _644 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _820 = _652 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _822 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _824 = _806 * _758;
    float _826 = -_798;
    float _828 = fma(_698, _826, _748);
    float _830 = _810 * _782;
    float _832 = _818 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _834 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _836 = _822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _838 = _752 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _840 = as_type<int>(_816);
    if (_768)
    {
        float _842 = _816 * 5.0;
        _840 = as_type<int>(_842);
    }
    int _844 = _840;
    out.m_58.x = _828;
    out.m_58.y = _804;
    out.m_58.z = _824;
    out.m_58.w = _830;
    float _846 = _714 * _808;
    float _848 = _724 * _808;
    out.m_60.x = _832;
    out.m_60.y = _834;
    out.m_60.z = _836;
    out.m_60.w = _838;
    if (_768)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2898 = as_type<float>(_844);
        out.gl_Position.z = _2898;
    }
    if (_768)
    {
        out.m_47.x = 0.0;
    }
    if (_768)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _850 = -_846;
    float _852 = fma(_850, (*spvDescriptorSet0.vp_c9)._m0[18].w, _704);
    float _854 = _738 * _808;
    float _856 = -_848;
    float _858 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[18].w, _710);
    float _860 = -_846;
    float _862 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[18].w, _714);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _866 = _852 + _864;
    float _868 = -_854;
    float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[18].w, _720);
    float _872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _874 = _858 + _872;
    float _876 = -_848;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[18].w, _724);
    float _880 = _866 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _884 = _870 + _882;
    float _886 = _862 * _862;
    float _888 = in.m_62.x;
    float _890 = in.m_62.y;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[28].x, _880);
    float _894 = -_854;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[18].w, _738);
    float _898 = fma(_878, _878, _886);
    float _900 = fma(_884, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    float _902 = fma(_896, _896, _898);
    bool _904 = _900 >= 0.0;
    float _906 = sqrt(_902);
    float _908 = _884;
    if (_904)
    {
        _908 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _910 = _908;
    int _912 = as_type<int>(_910);
    if (_904)
    {
        out.m_47.x = 0.0;
    }
    float _914 = _419 * _888;
    float _916 = _421 * _890;
    float _918 = _808 * _906;
    if (_904)
    {
        float _920 = _910 * 5.0;
        _912 = as_type<int>(_920);
    }
    int _922 = _912;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_922);
        out.gl_Position.z = _3040;
    }
    if (_904)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _924 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _926 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _928 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _157);
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _153);
    float _932 = _924 * _918;
    float _934 = _926 * _918;
    float _936 = _918 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _938 = _936 * 0.5;
    float _940 = _928 * _932;
    float _942 = _930 * _934;
    float _944 = _940 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _946 = _940 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _948 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].x, _944);
    float _950 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _946);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[24].z, _948);
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[26].z, _950);
    float _956 = _952 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _958 = _954 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _960 = _710 + _956;
    float _962 = _720 + _958;
    float _964 = _940 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _966 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _968 = _960 + _966;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _962 + _970;
    float _974 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _964);
    float _976 = _968 * _968;
    float _978 = _972 * _972;
    float _980 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[25].z, _974);
    float _982 = _976 + _978;
    float _984 = _980 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _986 = sqrt(_982);
    float _988 = _704 + _984;
    bool _990 = _986 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _992 = _980;
    float _994 = _984;
    float _996 = _940;
    float _998 = _960;
    float _1000 = _982;
    if (!_990)
    {
        _814 = _978;
    }
    float _1002 = _814;
    float _1004 = _1002;
    if (!_990)
    {
        _992 = _976;
    }
    float _1006 = _992;
    float _1008 = _1006;
    if (!_990)
    {
        _994 = _962;
    }
    float _1010 = _994;
    float _1012 = _1010;
    if (!_990)
    {
        _996 = _988;
    }
    float _1014 = _996;
    bool _1016 = !_990;
    float _1018 = _1014;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _986 + _1022;
        float _1026 = _988 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1028 = rsqrt(_982);
        float _1030 = _1024 * _1020;
        float _1032 = _1030 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = sin(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = cos(_1038);
        float _1042 = fma(_1036, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1044 = _1028 * _1042;
        float _1046 = _1040 + (-1.0);
        float _1048 = fma(_968, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1050 = fma(_972, _1044, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1052 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1056 = _1048 + _1054;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1060 = _1050 + _1058;
        float _1062 = fma(_988, _1040, _1052);
        float _1064 = _1056 * _1056;
        float _1066 = _1060 * _1060;
        _1018 = _1062;
        _1008 = _1064;
        _1004 = _1066;
        _998 = _1048;
        _1012 = _1050;
    }
    float _1068 = _1018;
    float _1070 = _1008;
    float _1072 = _1004;
    float _1074 = _998;
    float _1076 = _1012;
    float _1078 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1080 = _1068 + _1078;
    float _1082 = fma(_1080, _1080, _1070);
    float _1084 = _1082 + _1072;
    float _1086 = sqrt(_1084);
    bool _1088 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1090 = isnan(_1086);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1096 = _1092 || _1094;
    float _1098 = _1070;
    if (!_1096)
    {
        _1098 = 1.0;
    }
    float _1100 = _1098;
    bool _1102 = !_1096;
    float _1104 = _1100;
    if (!_1102)
    {
        bool _1106 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1108 = isnan(_1086);
        bool _1110 = _1106 || _1108;
        bool _1112 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1114 = _1110 || _1112;
        if (!_1114)
        {
            float _1116 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1118 = _1086 + _1116;
            float _1120 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1122 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1120;
            float _1124 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1126 = _1124 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1128 = 1.0 / _1122;
            float _1130 = _1118 * _1128;
            float _1132 = fma(_1130, _1126, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1104 = _1132;
            _1134 = true;
        }
        else
        {
            bool _1136 = _1086 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1138 = isnan(_1086);
            bool _1140 = _1136 || _1138;
            bool _1142 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1144 = _1140 || _1142;
            if (!_1144)
            {
                float _1146 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1148 = _1086 + _1146;
                float _1150 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1152 = _1150 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1154 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1156 = _1154 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1158 = 1.0 / _1152;
                float _1160 = _1148 * _1158;
                float _1162 = fma(_1160, _1156, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1104 = _1162;
                _1134 = true;
            }
            else
            {
                _1104 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1134 = false;
    float _1164 = _1104;
    float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1168 = _1068 + _1166;
    float _1170 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1172 = _1074 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1176 = _1076 + _1174;
    float _1178 = fma(_1168, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1180 = fma(_1172, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1182 = fma(_1176, _1164, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1184 = -_846;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1178);
    float _1188 = -_848;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1192 = -_854;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1186 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1202, _1202, _1208);
    float _1212 = fma(_1206, _1206, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1202 * _1216;
    float _1220 = _1206 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1214;
    float _1238 = _1226;
    float _1240 = _1234;
    float _1242 = _1168;
    float _1244 = _1198;
    float _1246 = _1218;
    if (_1230)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1248;
    }
    float _1250 = _1236;
    if (_1230)
    {
        float _1252 = rsqrt(_1226);
        _1238 = _1252;
    }
    float _1254 = _1238;
    if (_1230)
    {
        float _1256 = _1234 * _1250;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1242 = _1260;
    }
    float _1262 = _1242;
    float _1264 = _1250;
    float _1266 = _1262;
    if (_1230)
    {
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1264 = _1270;
    }
    float _1272 = _1264;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1206;
    float _1280 = _1276;
    if (_1230)
    {
        float _1282 = _1262 * 6.283185482025146484375;
        float _1284 = cos(_1282);
        _1278 = _1284;
    }
    float _1286 = _1278;
    float _1288 = -_1216;
    float _1290 = -_1276;
    float _1292 = fma(_1198, _1288, _1290);
    float _1294 = _1292;
    if (!_1230)
    {
        _1244 = _1220;
    }
    float _1296 = _1244;
    float _1298 = _1296;
    if (_1230)
    {
        float _1300 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1300;
    }
    float _1302 = _1280;
    float _1304 = _1272;
    float _1306 = _1302;
    if (_1230)
    {
        float _1308 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1304 = _1308;
    }
    float _1310 = _1304;
    float _1312 = _1310;
    if (_1230)
    {
        float _1314 = _1286 + (-1.0);
        _1306 = _1314;
    }
    float _1316 = _1306;
    float _1318 = _1316;
    if (_1230)
    {
        float _1320 = _1254 * _1310;
        _1000 = _1320;
    }
    float _1322 = _1000;
    if (!_1230)
    {
        _1312 = _1222;
    }
    float _1324 = _1312;
    float _1326 = sqrt(_1212);
    float _1328 = _1324;
    if (_1230)
    {
        float _1330 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1266 = _1330;
    }
    float _1332 = _1266;
    if (_1230)
    {
        float _1334 = _1218 * _1322;
        _1246 = _1334;
    }
    float _1336 = _1246;
    if (_1230)
    {
        float _1338 = _1220 * _1322;
        _1298 = _1338;
    }
    float _1340 = _1298;
    if (!_1230)
    {
        _1318 = _1224;
    }
    float _1342 = _1318;
    float _1344 = _1342;
    if (_1230)
    {
        float _1346 = fma(_1292, _1286, _1332);
        _1294 = _1346;
    }
    float _1348 = _1294;
    if (_1230)
    {
        float _1350 = _1336 * _1336;
        _1328 = _1350;
    }
    float _1352 = _1328;
    if (_1230)
    {
        float _1354 = _1340 * _1340;
        _1344 = _1354;
    }
    float _1356 = _1344;
    float _1358 = fma(_1348, _1348, _1352);
    float _1360 = _1358 + _1356;
    float _1362 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1366 = fma(_1326, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1364);
    float _1368 = precise::clamp(_1366, 0.0, 1.0);
    float _1370 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1372 = rsqrt(_1360);
    float _1374 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1362);
    float _1376 = -_1368;
    float _1378 = _1376 + 1.0;
    float _1380 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1382 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1370);
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1386 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1380);
    float _1390 = abs(_1378);
    float _1392 = log2(_1390);
    float _1394 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1396 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1382);
    float _1398 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1400 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1386);
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1404 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1388);
    float _1406 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1408 = _1372 * _1336;
    float _1410 = -_1402;
    float _1412 = fma(_1410, _1398, 1.0);
    float _1414 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1400);
    float _1416 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1418 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1420 = _1372 * _1348;
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1424 = _1372 * _1340;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1418);
    float _1428 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1430 = -_1422;
    float _1432 = fma(_1420, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1430);
    float _1434 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1436 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1426);
    float _1438 = log2(_1412);
    float _1440 = -_1424;
    float _1442 = fma(_1440, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1432);
    float _1444 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1446 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1436);
    float _1448 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1450 = fma(_1442, -0.5, 0.5);
    float _1452 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1444);
    float _1454 = fma(_1442, 0.5, 0.5);
    float _1456 = exp2(_1428);
    float _1458 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1448);
    float _1460 = _1420 + 1.0;
    float _1462 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1452);
    float _1464 = fma(_1454, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1458);
    float _1468 = 1.0 / _1446;
    float _1470 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1466);
    float _1472 = fma(_1454, _1464, -0.212114393711090087890625);
    float _1474 = _1438 * 0.693147182464599609375;
    float _1476 = fma(_1454, _1472, 1.570728778839111328125);
    float _1478 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1480 = sqrt(_1450);
    float _1482 = -_1420;
    float _1484 = fma(_1456, _1460, _1482);
    float _1486 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1462);
    float _1488 = fma(_1484, 0.5, 0.5);
    float _1490 = _1486 * _1468;
    float _1492 = _1470 * _1468;
    float _1494 = fma(_1490, 0.5, 0.5);
    float _1496 = fma(_1492, -0.5, 0.5);
    float _1498 = _1480 * 0.636619746685028076171875;
    float _1500 = -_1476;
    float _1502 = fma(_1498, _1500, 1.0);
    float3 _4012 = float3(_1494, _1496, _1478);
    float _1504 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4012, float3(0.0), isnan(_4012)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4012, float3(0.0), isnan(_4012)), level(0.0)).x;
    float3 _4023 = float3(_1494, _1496, _1478);
    float4 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4023, float3(0.0), isnan(_4023)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4023, float3(0.0), isnan(_4023)), level(0.0)).xyzw;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = _1507.w;
    float2 _4040 = float2(_1502, _1488);
    float3 _1519 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4040, float2(0.0), isnan(_4040)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4040, float2(0.0), isnan(_4040)), level(0.0)).xyz;
    float _1521 = _1519.x;
    float _1523 = _1519.y;
    float _1525 = _1519.z;
    float _1527 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1529 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1531 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1529);
    float _1533 = exp2(_1527);
    float _1535 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1531);
    float _1537 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1535);
    float _1539 = _1537 + _1446;
    out.gl_Position.x = _1486;
    out.gl_Position.y = _1470;
    out.gl_Position.z = _1537;
    out.gl_Position.w = _1446;
    float _1541 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1543 = _1539 * 0.5;
    float _1545 = -_1533;
    float _1547 = _1545 + 1.0;
    out.m_47.x = _1541;
    float _1549 = _1547 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1543;
    out.m_64.w = _1446;
    float _1551 = _1549 * _1504;
    float _1553 = -_1549;
    float _1555 = _1553 + 1.0;
    float _1557 = _1515 * _1551;
    float _1559 = _1525 * _1551;
    float _1561 = _1515 * _1555;
    float _1563 = fma(_1521, _1557, _1509);
    float _1565 = fma(_1523, _1557, _1511);
    float _1567 = fma(_1515, _1559, _1513);
    out.m_66.x = _1563;
    out.m_66.y = _1565;
    out.m_66.z = _1567;
    out.m_66.w = _1561;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

