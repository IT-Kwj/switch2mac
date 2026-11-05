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
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _593 = false;
    bool _319 = false;
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
        float _1630 = as_type<float>(_99);
        out.gl_Position.z = _1630;
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
        float _1699 = as_type<float>(_135);
        out.gl_Position.z = _1699;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_47.x;
    float _155 = in.m_47.y;
    float _157 = in.m_47.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = 0.0;
    if (!_151)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _165 = _169;
    }
    float _171 = _165;
    float _173 = _171;
    if (!_151)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    int _179 = as_type<int>(_137) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_137) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_151;
    float _197 = _177;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = _229;
    if (!_151)
    {
        _237 = _139;
    }
    float _239 = _237;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _245 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _247 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].x, _241);
    float _249 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _251 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    bool _255 = !_151;
    float _257 = _239;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _139 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _257 = _277;
    }
    float _279 = _257;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].y, _249);
    float _285 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].z, _251);
    float _287 = fma(_279, _153, _253);
    float _289 = fma(_279, _155, _283);
    float _291 = fma(_279, _157, _285);
    float _293 = fma(_287, _141, _159);
    float _295 = fma(_289, _141, _161);
    float _297 = fma(_291, _141, _163);
    bool _299 = !_281;
    float _317;
    if (!_299)
    {
        float _301 = in.m_54.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_83);
        float _323 = 1.0 / _321;
        float _325 = _117 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = 1.0 / _331;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = 1.0 / _343;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _327 + _357;
    float _361 = _351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _363 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _365 = 1.0 / _335;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _369 = 1.0 / _339;
    float _371 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _327 + _373;
    float _377 = _359 * _349;
    bool _379 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _381 = isnan(_327);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _375 * _345;
    bool _393 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = isnan(_327);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = _327 + _405;
    float _409 = _353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _327 + _411;
    float _415 = -_403;
    float _417 = _415 + 1.0;
    float _419 = _413 * _365;
    out.m_56.x = _361;
    out.m_56.y = _371;
    out.m_56.z = _409;
    out.m_56.w = _355;
    float _421 = _407 * _369;
    bool _423 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_327);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _389 * _417;
    bool _437 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _439 = isnan(_327);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = in.m_54.x;
    bool _451 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _453 = isnan(_327);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -_389;
    float _465 = _463 + 1.0;
    float _467 = _461 * _465;
    float _469 = -_461;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _477;
    float _481 = _447 * _471;
    float _483 = -_447;
    float _485 = _483 + 1.0;
    float _487 = fma(_475, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_479, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _499 = _433 * _485;
    float _501 = fma(_491, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _503 = fma(_495, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _505 = -_433;
    float _507 = _505 + 1.0;
    float _509 = _501 * _499;
    float _511 = _497 * _499;
    float _513 = _363 * _449;
    float _515 = in.m_52.x;
    float _517 = in.m_52.y;
    float _519 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _531 = fma(_503, _481, _519);
    float _533 = fma(_523, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = fma(_527, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_487, _481, _529);
    float _547 = trunc(_513);
    int _549 = int(_547);
    float _551 = fma(_537, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_533, _467, _531);
    float _555 = fma(_543, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _557 = fma(_539, _467, _545);
    float _559 = fma(_551, _435, _553);
    float _561 = fma(_555, _435, _557);
    float _563 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].x, _559);
    float _565 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].y, _561);
    float _567 = _563 * _515;
    float _569 = _565 * _517;
    int _571 = _549 << 4;
    int _573 = _571 + 1968;
    bool _575 = !_367;
    float _591;
    if (!_575)
    {
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _579 = _449 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_83);
        float _597 = 1.0 / _595;
        float _599 = _117 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = in.m_54.z;
    float _605 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _607 = in.m_54.w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _615 = _613 != 0;
    float _617 = in.m_54.y;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _621 = _619 != 0;
    float _623 = 1.0 / _611;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _627 = _625 != 0;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _633 = _631 != 0;
    float _635 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _605);
    float _639 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    bool _641 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _643 = isnan(_601);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _449 > 0.5;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _661 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _663 = isnan(_601);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    bool _675 = _603 > 0.5;
    float _677 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _679 = _449 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _681 = _607 > 0.5;
    float _683 = 1.0 / _659;
    float _685 = -_629;
    float _687 = fma(_679, 2.0, _685);
    float _689 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _677);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _691;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _697 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _699 = _693 * _623;
    bool _701 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _703 = isnan(_601);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[78].z, _695);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _717 = _601 + _715;
    float _719 = -_651;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _727 = -_711;
    float _729 = _727 + 1.0;
    float _731 = fma(_699, _717, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _733 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _735 = isnan(_601);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _711 * _721;
    float _747 = 1.0 / _725;
    float _749 = -_743;
    float _751 = _749 + 1.0;
    float _753 = _743 * _729;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _757 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _763 = _671 * _751;
    float _765 = -_117;
    float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[76].x, _687);
    float _769 = fma(_757, -2.0, _755);
    float _771 = _761 * _683;
    float _773 = _731 * _763;
    float _775 = -_671;
    float _777 = _775 + 1.0;
    uint _780 = uint(int(uint(_573) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[int(_790)][_792];
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _798 = _601 + _796;
    float _800 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[131].x, _773);
    float _802 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _806 = fma(_771, _798, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _814 = _601 + _812;
    int _816 = _573 + 8;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[int(_820)][_822];
    float _826 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _689);
    float _828 = _810 * _747;
    float _830 = -_189;
    int _832 = _655 ? as_type<int>(_830) : as_type<int>(_189);
    float _834 = fma(_806, _753, _800);
    float _836 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = fma(_828, _814, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _840 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _842 = !_615;
    float _844 = _842 ? _189 : as_type<float>(_832);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _848 = _836 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _852 = _697 + _850;
    float _854 = fma(_838, _745, _834);
    float _856 = _802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _858 = _848 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _860 = _617 > 0.5;
    float _862 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _804);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _866 = _856 + _864;
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[28].x, _858);
    float _870 = _844 + 0.5;
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _713);
    float _876 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _769);
    float _878 = fma(_840, _870, _767);
    float _880 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[134].x, _854);
    float _882 = -_189;
    int _884 = _675 ? as_type<int>(_882) : as_type<int>(_189);
    float _886 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _862);
    float _888 = -_193;
    int _890 = _860 ? as_type<int>(_888) : as_type<int>(_193);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[28].z, _868);
    bool _894 = !_627;
    float _896 = _894 ? _189 : as_type<float>(_884);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _900 = !_621;
    float _902 = _900 ? _193 : as_type<float>(_890);
    float _904 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _906 = _892 >= 0.0;
    float _908 = _896 + 0.5;
    float _910 = -_193;
    int _912 = _681 ? as_type<int>(_910) : as_type<int>(_193);
    float _914 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _916 = _902 + (-0.5);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _920 = !_633;
    float _922 = _920 ? _193 : as_type<float>(_912);
    float _924 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _926 = _848 * _848;
    float _928 = _786 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _930 = -_874;
    float _932 = _930 + 1.0;
    float _934 = -_922;
    float _936 = _934 + 0.5;
    float _938 = fma(_852, _852, _926);
    float _940 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _942 = -_914;
    float _944 = -_876;
    float _946 = fma(_942, _916, _944);
    float _948 = _936 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _950 = fma(_866, _866, _938);
    float _952 = _874;
    if (_906)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _952;
    float _956 = -_886;
    float _958 = _956 + 1.0;
    float _960 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _940 * _898;
    float _964 = _948 * _918;
    float _966 = rsqrt(_950);
    float _968 = -_932;
    float _970 = fma(_844, _968, _878);
    float _972 = fma(_902, _958, _946);
    float _974 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>(_954);
    float _982 = _978;
    if (_906)
    {
        float _984 = _954 * 5.0;
        _980 = as_type<int>(_984);
    }
    int _986 = _980;
    out.m_58.x = _970;
    out.m_58.y = _972;
    out.m_58.z = _962;
    out.m_58.w = _964;
    out.m_60.x = _974;
    out.m_60.y = _976;
    out.m_60.z = _978;
    out.m_60.w = _904;
    float _988 = as_type<float>(_986);
    if (_906)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3130 = as_type<float>(_986);
        out.gl_Position.z = _3130;
    }
    float _990 = _848 * _966;
    float _992 = _852 * _966;
    if (_906)
    {
        out.m_45.x = 0.0;
    }
    if (_906)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _994 = -_990;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _998 = _866 * _966;
    float _1000 = -_992;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _1004 = -_990;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1010 = _996 + _1008;
    float _1012 = -_998;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1002 + _1016;
    float _1020 = -_992;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _852);
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1028 = _1014 + _1026;
    float _1030 = _1006 * _1006;
    float _1032 = -_998;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1024);
    float _1038 = fma(_1022, _1022, _1030);
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1042 = fma(_1034, _1034, _1038);
    bool _1044 = _1040 >= 0.0;
    float _1046 = sqrt(_1042);
    if (_1044)
    {
        _988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1048 = _988;
    int _1050 = as_type<int>(_1048);
    if (_1044)
    {
        out.m_45.x = 0.0;
    }
    float _1052 = _966 * _1046;
    if (_1044)
    {
        float _1054 = _1048 * 5.0;
        _1050 = as_type<int>(_1054);
    }
    int _1056 = _1050;
    if (_1044)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3267 = as_type<float>(_1056);
        out.gl_Position.z = _3267;
    }
    if (_1044)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1058 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1060 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1062 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1066 = _1052 * _1058;
    float _1068 = _1052 * _1062;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1072 = _1070 * 0.5;
    float _1074 = _1060 * _1066;
    float _1076 = _1064 * _1068;
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1078);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1080);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1086);
    float _1094 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1088);
    float _1096 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1098 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1102 = _856 + _1096;
    float _1104 = _697 + _1098;
    float _1106 = _836 + _1100;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1110 = _1102 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1114 = _1104 + _1112;
    float _1116 = _1110 * _1110;
    float _1118 = fma(_1114, _1114, _1116);
    float _1120 = sqrt(_1118);
    bool _1122 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1072;
    float _1126 = _1116;
    float _1128 = _1104;
    float _1130 = _1076;
    float _1132 = _1106;
    if (!_1122)
    {
        _1124 = _1102;
    }
    float _1134 = _1124;
    float _1136 = _1134;
    if (!_1122)
    {
        _1126 = _1106;
    }
    float _1138 = _1126;
    bool _1140 = !_1122;
    float _1142 = _1138;
    if (!_1140)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1148 = _1120 + _1146;
        float _1150 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = rsqrt(_1118);
        float _1154 = _1148 * _1144;
        float _1156 = _1154 * 0.15915493667125701904296875;
        float _1158 = _1156 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        float _1162 = _1156 * 6.283185482025146484375;
        float _1164 = sin(_1162);
        float _1166 = _1160 + (-1.0);
        float _1168 = fma(_1164, _1150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = _1152 * _1168;
        float _1174 = fma(_1106, _1160, _1170);
        float _1176 = fma(_1114, _1172, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1178 = fma(_1110, _1172, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1142 = _1174;
        _1128 = _1176;
        _1136 = _1178;
        _1130 = _1172;
    }
    float _1180 = _1142;
    float _1182 = _1128;
    float _1184 = _1136;
    float _1186 = _1130;
    float _1188 = -_990;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1192 = -_992;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1196 = -_998;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = _1194 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 + _1208;
    float _1212 = _1202 * _1202;
    float _1214 = fma(_1206, _1206, _1212);
    float _1216 = fma(_1210, _1210, _1214);
    float _1218 = rsqrt(_1216);
    float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1222 = _1206 * _1220;
    float _1224 = _1210 * _1220;
    float _1226 = _1222 * _1222;
    float _1228 = _1224 * _1224;
    float _1230 = _1226 + _1228;
    float _1232 = sqrt(_1230);
    bool _1234 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1238 = _1232 + _1236;
    float _1240 = _1210;
    float _1242 = _1214;
    float _1244 = _1238;
    float _1246 = _1222;
    if (_1234)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1248;
    }
    float _1250 = _1240;
    if (_1234)
    {
        float _1252 = rsqrt(_1230);
        _1242 = _1252;
    }
    float _1254 = _1242;
    float _1256 = _1254;
    if (_1234)
    {
        float _1258 = _1238 * _1250;
        _1244 = _1258;
    }
    float _1260 = _1244;
    if (_1234)
    {
        float _1262 = _1260 * 0.15915493667125701904296875;
        _1132 = _1262;
    }
    float _1264 = _1132;
    float _1266 = _1218;
    if (_1234)
    {
        float _1268 = _1264 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1266 = _1270;
    }
    float _1272 = _1266;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1186;
    float _1280 = _1276;
    float _1282 = _1274;
    if (_1234)
    {
        float _1284 = _1264 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1278 = _1286;
    }
    float _1288 = _1278;
    float _1290 = -_1220;
    float _1292 = -_1276;
    float _1294 = fma(_1202, _1290, _1292);
    if (!_1234)
    {
        _1280 = _1224;
    }
    float _1296 = _1280;
    float _1298 = _1296;
    if (_1234)
    {
        float _1300 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1300;
    }
    float _1302 = _1282;
    float _1304 = sqrt(_1216);
    float _1306 = _1272;
    float _1308 = _1302;
    if (_1234)
    {
        float _1310 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1312;
    if (_1234)
    {
        float _1316 = _1288 + (-1.0);
        _1308 = _1316;
    }
    float _1318 = _1308;
    float _1320 = _1318;
    if (_1234)
    {
        float _1322 = _1254 * _1312;
        _982 = _1322;
    }
    float _1324 = _982;
    if (!_1234)
    {
        _1256 = _1294;
    }
    float _1326 = _1256;
    float _1328 = _1326;
    if (_1234)
    {
        float _1330 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = _1332;
    if (_1234)
    {
        float _1336 = _1222 * _1324;
        _1246 = _1336;
    }
    float _1338 = _1246;
    if (!_1234)
    {
        _1314 = _1226;
    }
    float _1340 = _1314;
    float _1342 = _1340;
    if (_1234)
    {
        float _1344 = _1224 * _1324;
        _1298 = _1344;
    }
    float _1346 = _1298;
    if (_1234)
    {
        float _1348 = fma(_1294, _1288, _1332);
        _1328 = _1348;
    }
    float _1350 = _1328;
    if (_1234)
    {
        float _1352 = _1338 * _1338;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (!_1234)
    {
        _1334 = _1228;
    }
    float _1356 = _1334;
    float _1358 = _1356;
    if (_1234)
    {
        float _1360 = _1346 * _1346;
        _1358 = _1360;
    }
    float _1362 = _1358;
    float _1364 = fma(_1350, _1350, _1354);
    float _1366 = _1364 + _1362;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1370 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1368);
    float _1372 = precise::clamp(_1370, 0.0, 1.0);
    float _1374 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1376 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = -_1372;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1374);
    float _1386 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1392 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1384);
    float _1394 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = abs(_1382);
    float _1398 = log2(_1396);
    float _1400 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1402 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1390);
    float _1404 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1378 * _1338;
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1418 = _1378 * _1350;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1416);
    float _1426 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1428 = _1378 * _1346;
    float _1430 = -_1422;
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1430);
    float _1434 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1436 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1438 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1424);
    float _1440 = -_1426;
    float _1442 = fma(_1440, _1420, 1.0);
    float _1444 = -_1428;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1432);
    float _1448 = exp2(_1434);
    float _1450 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1438);
    float _1452 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1446, 0.5, 0.5);
    float _1460 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1452);
    float _1462 = _1418 + 1.0;
    float _1464 = log2(_1442);
    float _1466 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1468 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1460);
    float _1470 = fma(_1458, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1472 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1466);
    float _1474 = 1.0 / _1450;
    float _1476 = -_1418;
    float _1478 = fma(_1448, _1462, _1476);
    float _1480 = fma(_1458, _1470, -0.212114393711090087890625);
    float _1482 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1468);
    float _1484 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1472);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1458, _1480, 1.570728778839111328125);
    float _1490 = sqrt(_1454);
    float _1492 = _1464 * 0.693147182464599609375;
    float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1496 = _1482 * _1474;
    float _1498 = _1484 * _1474;
    float _1500 = fma(_1496, 0.5, 0.5);
    float _1502 = fma(_1498, -0.5, 0.5);
    float _1504 = _1490 * 0.636619746685028076171875;
    float _1506 = -_1488;
    float _1508 = fma(_1504, _1506, 1.0);
    float3 _4026 = float3(_1500, _1502, _1494);
    float _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4026, float3(0.0), isnan(_4026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4026, float3(0.0), isnan(_4026)), level(0.0)).x;
    float3 _4037 = float3(_1500, _1502, _1494);
    float4 _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4037, float3(0.0), isnan(_4037)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4037, float3(0.0), isnan(_4037)), level(0.0)).xyzw;
    float _1515 = _1513.x;
    float _1517 = _1513.y;
    float _1519 = _1513.z;
    float _1521 = _1513.w;
    float2 _4054 = float2(_1508, _1486);
    float3 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4054, float2(0.0), isnan(_4054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4054, float2(0.0), isnan(_4054)), level(0.0)).xyz;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1535 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1537 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1535);
    float _1539 = exp2(_1533);
    float _1541 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1537);
    float _1543 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1541);
    float _1545 = _1543 + _1450;
    out.gl_Position.x = _1482;
    out.gl_Position.y = _1484;
    out.gl_Position.z = _1543;
    out.gl_Position.w = _1450;
    float _1547 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1549 = _1545 * 0.5;
    float _1551 = -_1539;
    float _1553 = _1551 + 1.0;
    out.m_45.x = _1547;
    float _1555 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1549;
    out.m_62.w = _1450;
    float _1557 = _1555 * _1510;
    float _1559 = -_1555;
    float _1561 = _1559 + 1.0;
    float _1563 = _1521 * _1557;
    float _1565 = _1531 * _1557;
    float _1567 = _1521 * _1561;
    float _1569 = fma(_1527, _1563, _1515);
    float _1571 = fma(_1529, _1563, _1517);
    float _1573 = fma(_1521, _1565, _1519);
    out.m_64.x = _1569;
    out.m_64.y = _1571;
    out.m_64.z = _1573;
    out.m_64.w = _1567;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _593 = false;
    bool _319 = false;
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
        float _1630 = as_type<float>(_99);
        out.gl_Position.z = _1630;
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
        float _1699 = as_type<float>(_135);
        out.gl_Position.z = _1699;
    }
    if (_127)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_47.x;
    float _155 = in.m_47.y;
    float _157 = in.m_47.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = 0.0;
    if (!_151)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _165 = _169;
    }
    float _171 = _165;
    float _173 = _171;
    if (!_151)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    int _179 = as_type<int>(_137) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_137) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_151;
    float _197 = _177;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = _229;
    if (!_151)
    {
        _237 = _139;
    }
    float _239 = _237;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _245 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _247 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].x, _241);
    float _249 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _251 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    bool _255 = !_151;
    float _257 = _239;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _139 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _257 = _277;
    }
    float _279 = _257;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].y, _249);
    float _285 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].z, _251);
    float _287 = fma(_279, _153, _253);
    float _289 = fma(_279, _155, _283);
    float _291 = fma(_279, _157, _285);
    float _293 = fma(_287, _141, _159);
    float _295 = fma(_289, _141, _161);
    float _297 = fma(_291, _141, _163);
    bool _299 = !_281;
    float _317;
    if (!_299)
    {
        float _301 = in.m_54.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_83);
        float _323 = 1.0 / _321;
        float _325 = _117 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = 1.0 / _331;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = 1.0 / _343;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _327 + _357;
    float _361 = _351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _363 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _365 = 1.0 / _335;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _369 = 1.0 / _339;
    float _371 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _327 + _373;
    float _377 = _359 * _349;
    bool _379 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _381 = isnan(_327);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _375 * _345;
    bool _393 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = isnan(_327);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = _327 + _405;
    float _409 = _353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _327 + _411;
    float _415 = -_403;
    float _417 = _415 + 1.0;
    float _419 = _413 * _365;
    out.m_56.x = _361;
    out.m_56.y = _371;
    out.m_56.z = _409;
    out.m_56.w = _355;
    float _421 = _407 * _369;
    bool _423 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_327);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _389 * _417;
    bool _437 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _439 = isnan(_327);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = in.m_54.x;
    bool _451 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _453 = isnan(_327);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -_389;
    float _465 = _463 + 1.0;
    float _467 = _461 * _465;
    float _469 = -_461;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _477;
    float _481 = _447 * _471;
    float _483 = -_447;
    float _485 = _483 + 1.0;
    float _487 = fma(_475, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_479, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _499 = _433 * _485;
    float _501 = fma(_491, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _503 = fma(_495, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _505 = -_433;
    float _507 = _505 + 1.0;
    float _509 = _501 * _499;
    float _511 = _497 * _499;
    float _513 = _363 * _449;
    float _515 = in.m_52.x;
    float _517 = in.m_52.y;
    float _519 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _531 = fma(_503, _481, _519);
    float _533 = fma(_523, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = fma(_527, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_487, _481, _529);
    float _547 = trunc(_513);
    int _549 = int(_547);
    float _551 = fma(_537, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_533, _467, _531);
    float _555 = fma(_543, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _557 = fma(_539, _467, _545);
    float _559 = fma(_551, _435, _553);
    float _561 = fma(_555, _435, _557);
    float _563 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].x, _559);
    float _565 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].y, _561);
    float _567 = _563 * _515;
    float _569 = _565 * _517;
    int _571 = _549 << 4;
    int _573 = _571 + 1968;
    bool _575 = !_367;
    float _591;
    if (!_575)
    {
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _579 = _449 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_83);
        float _597 = 1.0 / _595;
        float _599 = _117 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = in.m_54.z;
    float _605 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _607 = in.m_54.w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _615 = _613 != 0;
    float _617 = in.m_54.y;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _621 = _619 != 0;
    float _623 = 1.0 / _611;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _627 = _625 != 0;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _633 = _631 != 0;
    float _635 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _605);
    float _639 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    bool _641 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _643 = isnan(_601);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _449 > 0.5;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _661 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _663 = isnan(_601);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    bool _675 = _603 > 0.5;
    float _677 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _679 = _449 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _681 = _607 > 0.5;
    float _683 = 1.0 / _659;
    float _685 = -_629;
    float _687 = fma(_679, 2.0, _685);
    float _689 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _677);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _691;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _697 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _699 = _693 * _623;
    bool _701 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _703 = isnan(_601);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[78].z, _695);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _717 = _601 + _715;
    float _719 = -_651;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _727 = -_711;
    float _729 = _727 + 1.0;
    float _731 = fma(_699, _717, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _733 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _735 = isnan(_601);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _711 * _721;
    float _747 = 1.0 / _725;
    float _749 = -_743;
    float _751 = _749 + 1.0;
    float _753 = _743 * _729;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _757 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _763 = _671 * _751;
    float _765 = -_117;
    float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[76].x, _687);
    float _769 = fma(_757, -2.0, _755);
    float _771 = _761 * _683;
    float _773 = _731 * _763;
    float _775 = -_671;
    float _777 = _775 + 1.0;
    uint _780 = uint(int(uint(_573) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[int(_790)][_792];
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _798 = _601 + _796;
    float _800 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[131].x, _773);
    float _802 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _806 = fma(_771, _798, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _814 = _601 + _812;
    int _816 = _573 + 8;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[int(_820)][_822];
    float _826 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _689);
    float _828 = _810 * _747;
    float _830 = -_189;
    int _832 = _655 ? as_type<int>(_830) : as_type<int>(_189);
    float _834 = fma(_806, _753, _800);
    float _836 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = fma(_828, _814, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _840 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _842 = !_615;
    float _844 = _842 ? _189 : as_type<float>(_832);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _848 = _836 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _852 = _697 + _850;
    float _854 = fma(_838, _745, _834);
    float _856 = _802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _858 = _848 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _860 = _617 > 0.5;
    float _862 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _804);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _866 = _856 + _864;
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[28].x, _858);
    float _870 = _844 + 0.5;
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _713);
    float _876 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _769);
    float _878 = fma(_840, _870, _767);
    float _880 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[134].x, _854);
    float _882 = -_189;
    int _884 = _675 ? as_type<int>(_882) : as_type<int>(_189);
    float _886 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _862);
    float _888 = -_193;
    int _890 = _860 ? as_type<int>(_888) : as_type<int>(_193);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[28].z, _868);
    bool _894 = !_627;
    float _896 = _894 ? _189 : as_type<float>(_884);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _900 = !_621;
    float _902 = _900 ? _193 : as_type<float>(_890);
    float _904 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _906 = _892 >= 0.0;
    float _908 = _896 + 0.5;
    float _910 = -_193;
    int _912 = _681 ? as_type<int>(_910) : as_type<int>(_193);
    float _914 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _916 = _902 + (-0.5);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _920 = !_633;
    float _922 = _920 ? _193 : as_type<float>(_912);
    float _924 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _926 = _848 * _848;
    float _928 = _786 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _930 = -_874;
    float _932 = _930 + 1.0;
    float _934 = -_922;
    float _936 = _934 + 0.5;
    float _938 = fma(_852, _852, _926);
    float _940 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _942 = -_914;
    float _944 = -_876;
    float _946 = fma(_942, _916, _944);
    float _948 = _936 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _950 = fma(_866, _866, _938);
    float _952 = _874;
    if (_906)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _952;
    float _956 = -_886;
    float _958 = _956 + 1.0;
    float _960 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _940 * _898;
    float _964 = _948 * _918;
    float _966 = rsqrt(_950);
    float _968 = -_932;
    float _970 = fma(_844, _968, _878);
    float _972 = fma(_902, _958, _946);
    float _974 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>(_954);
    float _982 = _978;
    if (_906)
    {
        float _984 = _954 * 5.0;
        _980 = as_type<int>(_984);
    }
    int _986 = _980;
    out.m_58.x = _970;
    out.m_58.y = _972;
    out.m_58.z = _962;
    out.m_58.w = _964;
    out.m_60.x = _974;
    out.m_60.y = _976;
    out.m_60.z = _978;
    out.m_60.w = _904;
    float _988 = as_type<float>(_986);
    if (_906)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3130 = as_type<float>(_986);
        out.gl_Position.z = _3130;
    }
    float _990 = _848 * _966;
    float _992 = _852 * _966;
    if (_906)
    {
        out.m_45.x = 0.0;
    }
    if (_906)
    {
        return out;
    }
    float _994 = -_990;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _998 = _866 * _966;
    float _1000 = -_992;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _1004 = -_990;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1010 = _996 + _1008;
    float _1012 = -_998;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1002 + _1016;
    float _1020 = -_992;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _852);
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1028 = _1014 + _1026;
    float _1030 = _1006 * _1006;
    float _1032 = -_998;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1024);
    float _1038 = fma(_1022, _1022, _1030);
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1042 = fma(_1034, _1034, _1038);
    bool _1044 = _1040 >= 0.0;
    float _1046 = sqrt(_1042);
    if (_1044)
    {
        _988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1048 = _988;
    int _1050 = as_type<int>(_1048);
    if (_1044)
    {
        out.m_45.x = 0.0;
    }
    float _1052 = _966 * _1046;
    if (_1044)
    {
        float _1054 = _1048 * 5.0;
        _1050 = as_type<int>(_1054);
    }
    int _1056 = _1050;
    if (_1044)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3267 = as_type<float>(_1056);
        out.gl_Position.z = _3267;
    }
    if (_1044)
    {
        return out;
    }
    float _1058 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1060 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1062 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1066 = _1052 * _1058;
    float _1068 = _1052 * _1062;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1072 = _1070 * 0.5;
    float _1074 = _1060 * _1066;
    float _1076 = _1064 * _1068;
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1078);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1080);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1086);
    float _1094 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1088);
    float _1096 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1098 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1102 = _856 + _1096;
    float _1104 = _697 + _1098;
    float _1106 = _836 + _1100;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1110 = _1102 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1114 = _1104 + _1112;
    float _1116 = _1110 * _1110;
    float _1118 = fma(_1114, _1114, _1116);
    float _1120 = sqrt(_1118);
    bool _1122 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1072;
    float _1126 = _1116;
    float _1128 = _1104;
    float _1130 = _1076;
    float _1132 = _1106;
    if (!_1122)
    {
        _1124 = _1102;
    }
    float _1134 = _1124;
    float _1136 = _1134;
    if (!_1122)
    {
        _1126 = _1106;
    }
    float _1138 = _1126;
    bool _1140 = !_1122;
    float _1142 = _1138;
    if (!_1140)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1148 = _1120 + _1146;
        float _1150 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = rsqrt(_1118);
        float _1154 = _1148 * _1144;
        float _1156 = _1154 * 0.15915493667125701904296875;
        float _1158 = _1156 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        float _1162 = _1156 * 6.283185482025146484375;
        float _1164 = sin(_1162);
        float _1166 = _1160 + (-1.0);
        float _1168 = fma(_1164, _1150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = _1152 * _1168;
        float _1174 = fma(_1106, _1160, _1170);
        float _1176 = fma(_1114, _1172, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1178 = fma(_1110, _1172, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1142 = _1174;
        _1128 = _1176;
        _1136 = _1178;
        _1130 = _1172;
    }
    float _1180 = _1142;
    float _1182 = _1128;
    float _1184 = _1136;
    float _1186 = _1130;
    float _1188 = -_990;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1192 = -_992;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1196 = -_998;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = _1194 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 + _1208;
    float _1212 = _1202 * _1202;
    float _1214 = fma(_1206, _1206, _1212);
    float _1216 = fma(_1210, _1210, _1214);
    float _1218 = rsqrt(_1216);
    float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1222 = _1206 * _1220;
    float _1224 = _1210 * _1220;
    float _1226 = _1222 * _1222;
    float _1228 = _1224 * _1224;
    float _1230 = _1226 + _1228;
    float _1232 = sqrt(_1230);
    bool _1234 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1238 = _1232 + _1236;
    float _1240 = _1210;
    float _1242 = _1214;
    float _1244 = _1238;
    float _1246 = _1222;
    if (_1234)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1248;
    }
    float _1250 = _1240;
    if (_1234)
    {
        float _1252 = rsqrt(_1230);
        _1242 = _1252;
    }
    float _1254 = _1242;
    float _1256 = _1254;
    if (_1234)
    {
        float _1258 = _1238 * _1250;
        _1244 = _1258;
    }
    float _1260 = _1244;
    if (_1234)
    {
        float _1262 = _1260 * 0.15915493667125701904296875;
        _1132 = _1262;
    }
    float _1264 = _1132;
    float _1266 = _1218;
    if (_1234)
    {
        float _1268 = _1264 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1266 = _1270;
    }
    float _1272 = _1266;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1186;
    float _1280 = _1276;
    float _1282 = _1274;
    if (_1234)
    {
        float _1284 = _1264 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1278 = _1286;
    }
    float _1288 = _1278;
    float _1290 = -_1220;
    float _1292 = -_1276;
    float _1294 = fma(_1202, _1290, _1292);
    if (!_1234)
    {
        _1280 = _1224;
    }
    float _1296 = _1280;
    float _1298 = _1296;
    if (_1234)
    {
        float _1300 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1300;
    }
    float _1302 = _1282;
    float _1304 = sqrt(_1216);
    float _1306 = _1272;
    float _1308 = _1302;
    if (_1234)
    {
        float _1310 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1312;
    if (_1234)
    {
        float _1316 = _1288 + (-1.0);
        _1308 = _1316;
    }
    float _1318 = _1308;
    float _1320 = _1318;
    if (_1234)
    {
        float _1322 = _1254 * _1312;
        _982 = _1322;
    }
    float _1324 = _982;
    if (!_1234)
    {
        _1256 = _1294;
    }
    float _1326 = _1256;
    float _1328 = _1326;
    if (_1234)
    {
        float _1330 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = _1332;
    if (_1234)
    {
        float _1336 = _1222 * _1324;
        _1246 = _1336;
    }
    float _1338 = _1246;
    if (!_1234)
    {
        _1314 = _1226;
    }
    float _1340 = _1314;
    float _1342 = _1340;
    if (_1234)
    {
        float _1344 = _1224 * _1324;
        _1298 = _1344;
    }
    float _1346 = _1298;
    if (_1234)
    {
        float _1348 = fma(_1294, _1288, _1332);
        _1328 = _1348;
    }
    float _1350 = _1328;
    if (_1234)
    {
        float _1352 = _1338 * _1338;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (!_1234)
    {
        _1334 = _1228;
    }
    float _1356 = _1334;
    float _1358 = _1356;
    if (_1234)
    {
        float _1360 = _1346 * _1346;
        _1358 = _1360;
    }
    float _1362 = _1358;
    float _1364 = fma(_1350, _1350, _1354);
    float _1366 = _1364 + _1362;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1370 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1368);
    float _1372 = precise::clamp(_1370, 0.0, 1.0);
    float _1374 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1376 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = -_1372;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1374);
    float _1386 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1392 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1384);
    float _1394 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = abs(_1382);
    float _1398 = log2(_1396);
    float _1400 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1402 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1390);
    float _1404 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1378 * _1338;
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1418 = _1378 * _1350;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1416);
    float _1426 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1428 = _1378 * _1346;
    float _1430 = -_1422;
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1430);
    float _1434 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1436 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1438 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1424);
    float _1440 = -_1426;
    float _1442 = fma(_1440, _1420, 1.0);
    float _1444 = -_1428;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1432);
    float _1448 = exp2(_1434);
    float _1450 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1438);
    float _1452 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1446, 0.5, 0.5);
    float _1460 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1452);
    float _1462 = _1418 + 1.0;
    float _1464 = log2(_1442);
    float _1466 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1468 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1460);
    float _1470 = fma(_1458, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1472 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1466);
    float _1474 = 1.0 / _1450;
    float _1476 = -_1418;
    float _1478 = fma(_1448, _1462, _1476);
    float _1480 = fma(_1458, _1470, -0.212114393711090087890625);
    float _1482 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1468);
    float _1484 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1472);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1458, _1480, 1.570728778839111328125);
    float _1490 = sqrt(_1454);
    float _1492 = _1464 * 0.693147182464599609375;
    float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1496 = _1482 * _1474;
    float _1498 = _1484 * _1474;
    float _1500 = fma(_1496, 0.5, 0.5);
    float _1502 = fma(_1498, -0.5, 0.5);
    float _1504 = _1490 * 0.636619746685028076171875;
    float _1506 = -_1488;
    float _1508 = fma(_1504, _1506, 1.0);
    float3 _4026 = float3(_1500, _1502, _1494);
    float _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4026, float3(0.0), isnan(_4026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4026, float3(0.0), isnan(_4026)), level(0.0)).x;
    float3 _4037 = float3(_1500, _1502, _1494);
    float4 _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4037, float3(0.0), isnan(_4037)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4037, float3(0.0), isnan(_4037)), level(0.0)).xyzw;
    float _1515 = _1513.x;
    float _1517 = _1513.y;
    float _1519 = _1513.z;
    float _1521 = _1513.w;
    float2 _4054 = float2(_1508, _1486);
    float3 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4054, float2(0.0), isnan(_4054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4054, float2(0.0), isnan(_4054)), level(0.0)).xyz;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1535 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1537 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1535);
    float _1539 = exp2(_1533);
    float _1541 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1537);
    float _1543 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1541);
    float _1545 = _1543 + _1450;
    out.gl_Position.x = _1482;
    out.gl_Position.y = _1484;
    out.gl_Position.z = _1543;
    out.gl_Position.w = _1450;
    float _1547 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1549 = _1545 * 0.5;
    float _1551 = -_1539;
    float _1553 = _1551 + 1.0;
    out.m_45.x = _1547;
    float _1555 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1549;
    out.m_62.w = _1450;
    float _1557 = _1555 * _1510;
    float _1559 = -_1555;
    float _1561 = _1559 + 1.0;
    float _1563 = _1521 * _1557;
    float _1565 = _1531 * _1557;
    float _1567 = _1521 * _1561;
    float _1569 = fma(_1527, _1563, _1515);
    float _1571 = fma(_1529, _1563, _1517);
    float _1573 = fma(_1521, _1565, _1519);
    out.m_64.x = _1569;
    out.m_64.y = _1571;
    out.m_64.z = _1573;
    out.m_64.w = _1567;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _593 = false;
    bool _319 = false;
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
        float _1630 = as_type<float>(_99);
        out.gl_Position.z = _1630;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1699 = as_type<float>(_135);
        out.gl_Position.z = _1699;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_52.w;
    bool _143 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _145 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _147 = _143 || _145;
    bool _149 = isnan(1.0);
    bool _151 = _147 || _149;
    float _153 = in.m_47.x;
    float _155 = in.m_47.y;
    float _157 = in.m_47.z;
    float _159 = in.m_42.x;
    float _161 = in.m_42.y;
    float _163 = in.m_42.z;
    float _165 = 0.0;
    if (!_151)
    {
        float _167 = _139 * _139;
        float _169 = _167 * 0.5;
        _165 = _169;
    }
    float _171 = _165;
    float _173 = _171;
    if (!_151)
    {
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _173 = _175;
    }
    float _177 = _173;
    int _179 = as_type<int>(_137) & 1;
    bool _181 = _179 != 0;
    int _183 = as_type<int>(_137) & 2;
    bool _185 = _183 != 0;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_151;
    float _197 = _177;
    if (!_195)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _139 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _139);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _227;
    }
    float _229 = _197;
    float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _235 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _237 = _229;
    if (!_151)
    {
        _237 = _139;
    }
    float _239 = _237;
    float _241 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _243 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _245 = _231 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _247 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].x, _241);
    float _249 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].y, _243);
    float _251 = fma(_233, (*spvDescriptorSet0.vp_c10)._m0[8].z, _245);
    float _253 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].x, _247);
    bool _255 = !_151;
    float _257 = _239;
    if (!_255)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _139 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _257 = _277;
    }
    float _279 = _257;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _283 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].y, _249);
    float _285 = fma(_235, (*spvDescriptorSet0.vp_c10)._m0[10].z, _251);
    float _287 = fma(_279, _153, _253);
    float _289 = fma(_279, _155, _283);
    float _291 = fma(_279, _157, _285);
    float _293 = fma(_287, _141, _159);
    float _295 = fma(_289, _141, _161);
    float _297 = fma(_291, _141, _163);
    bool _299 = !_281;
    float _317;
    if (!_299)
    {
        float _301 = in.m_54.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_83);
        float _323 = 1.0 / _321;
        float _325 = _117 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _329;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _345 = 1.0 / _331;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = 1.0 / _343;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _327 + _357;
    float _361 = _351 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _363 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _365 = 1.0 / _335;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _369 = 1.0 / _339;
    float _371 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = _327 + _373;
    float _377 = _359 * _349;
    bool _379 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _381 = isnan(_327);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _375 * _345;
    bool _393 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _395 = isnan(_327);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = _327 + _405;
    float _409 = _353 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _327 + _411;
    float _415 = -_403;
    float _417 = _415 + 1.0;
    float _419 = _413 * _365;
    out.m_56.x = _361;
    out.m_56.y = _371;
    out.m_56.z = _409;
    out.m_56.w = _355;
    float _421 = _407 * _369;
    bool _423 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _425 = isnan(_327);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _389 * _417;
    bool _437 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _439 = isnan(_327);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = in.m_54.x;
    bool _451 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _453 = isnan(_327);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -_389;
    float _465 = _463 + 1.0;
    float _467 = _461 * _465;
    float _469 = -_461;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _477;
    float _481 = _447 * _471;
    float _483 = -_447;
    float _485 = _483 + 1.0;
    float _487 = fma(_475, _419, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _497 = fma(_479, _391, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _499 = _433 * _485;
    float _501 = fma(_491, _391, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _503 = fma(_495, _419, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _505 = -_433;
    float _507 = _505 + 1.0;
    float _509 = _501 * _499;
    float _511 = _497 * _499;
    float _513 = _363 * _449;
    float _515 = in.m_52.x;
    float _517 = in.m_52.y;
    float _519 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _531 = fma(_503, _481, _519);
    float _533 = fma(_523, _421, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _539 = fma(_527, _421, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_487, _481, _529);
    float _547 = trunc(_513);
    int _549 = int(_547);
    float _551 = fma(_537, _377, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _553 = fma(_533, _467, _531);
    float _555 = fma(_543, _377, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _557 = fma(_539, _467, _545);
    float _559 = fma(_551, _435, _553);
    float _561 = fma(_555, _435, _557);
    float _563 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].x, _559);
    float _565 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[147].y, _561);
    float _567 = _563 * _515;
    float _569 = _565 * _517;
    int _571 = _549 << 4;
    int _573 = _571 + 1968;
    bool _575 = !_367;
    float _591;
    if (!_575)
    {
        float _577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _579 = _449 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _581 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _583 = _581 * _577;
        float _585 = floor(_583);
        float _587 = -_585;
        float _589 = _583 + _587;
        _591 = _589;
        _593 = true;
    }
    else
    {
        float _595 = float(_83);
        float _597 = 1.0 / _595;
        float _599 = _117 * _597;
        _591 = _599;
    }
    _593 = false;
    float _601 = _591;
    float _603 = in.m_54.z;
    float _605 = _295 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _607 = in.m_54.w;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _615 = _613 != 0;
    float _617 = in.m_54.y;
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _621 = _619 != 0;
    float _623 = 1.0 / _611;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _627 = _625 != 0;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _633 = _631 != 0;
    float _635 = _295 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _637 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[6].x, _605);
    float _639 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[4].x, _635);
    bool _641 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _643 = isnan(_601);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _655 = _449 > 0.5;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _661 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _663 = isnan(_601);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[4].z, _639);
    bool _675 = _603 > 0.5;
    float _677 = _295 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _679 = _449 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _681 = _607 > 0.5;
    float _683 = 1.0 / _659;
    float _685 = -_629;
    float _687 = fma(_679, 2.0, _685);
    float _689 = fma(_293, (*spvDescriptorSet0.vp_c10)._m0[5].x, _677);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _691;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _697 = _673 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _699 = _693 * _623;
    bool _701 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _703 = isnan(_601);
    bool _705 = _701 || _703;
    bool _707 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _709 = _705 || _707;
    float _711 = float(_709);
    float _713 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[78].z, _695);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _717 = _601 + _715;
    float _719 = -_651;
    float _721 = _719 + 1.0;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _727 = -_711;
    float _729 = _727 + 1.0;
    float _731 = fma(_699, _717, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _733 = _601 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _735 = isnan(_601);
    bool _737 = _733 || _735;
    bool _739 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _741 = _737 || _739;
    float _743 = float(_741);
    float _745 = _711 * _721;
    float _747 = 1.0 / _725;
    float _749 = -_743;
    float _751 = _749 + 1.0;
    float _753 = _743 * _729;
    float _755 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _757 = _617 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _763 = _671 * _751;
    float _765 = -_117;
    float _767 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[76].x, _687);
    float _769 = fma(_757, -2.0, _755);
    float _771 = _761 * _683;
    float _773 = _731 * _763;
    float _775 = -_671;
    float _777 = _775 + 1.0;
    uint _780 = uint(int(uint(_573) >> uint(2)));
    uint _782 = uint(int(uint(int(_780)) >> uint(2)));
    int _784 = int(_780) & 3;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[int(_782)][_784];
    int _788 = int(_780) + 1;
    uint _790 = uint(int(uint(_788) >> uint(2)));
    int _792 = _788 & 3;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[int(_790)][_792];
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _798 = _601 + _796;
    float _800 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[131].x, _773);
    float _802 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _806 = fma(_771, _798, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _814 = _601 + _812;
    int _816 = _573 + 8;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    uint _820 = uint(int(uint(int(_818)) >> uint(2)));
    int _822 = int(_818) & 3;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[int(_820)][_822];
    float _826 = fma(_297, (*spvDescriptorSet0.vp_c10)._m0[5].z, _689);
    float _828 = _810 * _747;
    float _830 = -_189;
    int _832 = _655 ? as_type<int>(_830) : as_type<int>(_189);
    float _834 = fma(_806, _753, _800);
    float _836 = _826 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = fma(_828, _814, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _840 = _653 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _842 = !_615;
    float _844 = _842 ? _189 : as_type<float>(_832);
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _848 = _836 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _852 = _697 + _850;
    float _854 = fma(_838, _745, _834);
    float _856 = _802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _858 = _848 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _860 = _617 > 0.5;
    float _862 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[78].w, _804);
    float _864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _866 = _856 + _864;
    float _868 = fma(_852, (*spvDescriptorSet0.vp_c8)._m0[28].x, _858);
    float _870 = _844 + 0.5;
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _713);
    float _876 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _769);
    float _878 = fma(_840, _870, _767);
    float _880 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[134].x, _854);
    float _882 = -_189;
    int _884 = _675 ? as_type<int>(_882) : as_type<int>(_189);
    float _886 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _862);
    float _888 = -_193;
    int _890 = _860 ? as_type<int>(_888) : as_type<int>(_193);
    float _892 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[28].z, _868);
    bool _894 = !_627;
    float _896 = _894 ? _189 : as_type<float>(_884);
    float _898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _900 = !_621;
    float _902 = _900 ? _193 : as_type<float>(_890);
    float _904 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _906 = _892 >= 0.0;
    float _908 = _896 + 0.5;
    float _910 = -_193;
    int _912 = _681 ? as_type<int>(_910) : as_type<int>(_193);
    float _914 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _916 = _902 + (-0.5);
    float _918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _920 = !_633;
    float _922 = _920 ? _193 : as_type<float>(_912);
    float _924 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _926 = _848 * _848;
    float _928 = _786 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _930 = -_874;
    float _932 = _930 + 1.0;
    float _934 = -_922;
    float _936 = _934 + 0.5;
    float _938 = fma(_852, _852, _926);
    float _940 = _908 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _942 = -_914;
    float _944 = -_876;
    float _946 = fma(_942, _916, _944);
    float _948 = _936 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _950 = fma(_866, _866, _938);
    float _952 = _874;
    if (_906)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _952;
    float _956 = -_886;
    float _958 = _956 + 1.0;
    float _960 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _962 = _940 * _898;
    float _964 = _948 * _918;
    float _966 = rsqrt(_950);
    float _968 = -_932;
    float _970 = fma(_844, _968, _878);
    float _972 = fma(_902, _958, _946);
    float _974 = _928 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _980 = as_type<int>(_954);
    float _982 = _978;
    if (_906)
    {
        float _984 = _954 * 5.0;
        _980 = as_type<int>(_984);
    }
    int _986 = _980;
    out.m_58.x = _970;
    out.m_58.y = _972;
    out.m_58.z = _962;
    out.m_58.w = _964;
    out.m_60.x = _974;
    out.m_60.y = _976;
    out.m_60.z = _978;
    out.m_60.w = _904;
    float _988 = as_type<float>(_986);
    if (_906)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3130 = as_type<float>(_986);
        out.gl_Position.z = _3130;
    }
    float _990 = _848 * _966;
    float _992 = _852 * _966;
    if (_906)
    {
        out.m_45.x = 0.0;
    }
    if (_906)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _994 = -_990;
    float _996 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[18].w, _836);
    float _998 = _866 * _966;
    float _1000 = -_992;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _697);
    float _1004 = -_990;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _848);
    float _1008 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1010 = _996 + _1008;
    float _1012 = -_998;
    float _1014 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[18].w, _856);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1002 + _1016;
    float _1020 = -_992;
    float _1022 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[18].w, _852);
    float _1024 = _1010 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1026 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1028 = _1014 + _1026;
    float _1030 = _1006 * _1006;
    float _1032 = -_998;
    float _1034 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[18].w, _866);
    float _1036 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1024);
    float _1038 = fma(_1022, _1022, _1030);
    float _1040 = fma(_1028, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1036);
    float _1042 = fma(_1034, _1034, _1038);
    bool _1044 = _1040 >= 0.0;
    float _1046 = sqrt(_1042);
    if (_1044)
    {
        _988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1048 = _988;
    int _1050 = as_type<int>(_1048);
    if (_1044)
    {
        out.m_45.x = 0.0;
    }
    float _1052 = _966 * _1046;
    if (_1044)
    {
        float _1054 = _1048 * 5.0;
        _1050 = as_type<int>(_1054);
    }
    int _1056 = _1050;
    if (_1044)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3267 = as_type<float>(_1056);
        out.gl_Position.z = _3267;
    }
    if (_1044)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1058 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1060 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _193);
    float _1062 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1064 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1066 = _1052 * _1058;
    float _1068 = _1052 * _1062;
    float _1070 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1072 = _1070 * 0.5;
    float _1074 = _1060 * _1066;
    float _1076 = _1064 * _1068;
    float _1078 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1080 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1084 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1078);
    float _1086 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1080);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1082);
    float _1090 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1084);
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1086);
    float _1094 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1088);
    float _1096 = _1090 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1098 = _1092 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1100 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1102 = _856 + _1096;
    float _1104 = _697 + _1098;
    float _1106 = _836 + _1100;
    float _1108 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1110 = _1102 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1114 = _1104 + _1112;
    float _1116 = _1110 * _1110;
    float _1118 = fma(_1114, _1114, _1116);
    float _1120 = sqrt(_1118);
    bool _1122 = _1120 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1124 = _1072;
    float _1126 = _1116;
    float _1128 = _1104;
    float _1130 = _1076;
    float _1132 = _1106;
    if (!_1122)
    {
        _1124 = _1102;
    }
    float _1134 = _1124;
    float _1136 = _1134;
    if (!_1122)
    {
        _1126 = _1106;
    }
    float _1138 = _1126;
    bool _1140 = !_1122;
    float _1142 = _1138;
    if (!_1140)
    {
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1148 = _1120 + _1146;
        float _1150 = _1106 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1152 = rsqrt(_1118);
        float _1154 = _1148 * _1144;
        float _1156 = _1154 * 0.15915493667125701904296875;
        float _1158 = _1156 * 6.283185482025146484375;
        float _1160 = cos(_1158);
        float _1162 = _1156 * 6.283185482025146484375;
        float _1164 = sin(_1162);
        float _1166 = _1160 + (-1.0);
        float _1168 = fma(_1164, _1150, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1166 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = _1152 * _1168;
        float _1174 = fma(_1106, _1160, _1170);
        float _1176 = fma(_1114, _1172, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1178 = fma(_1110, _1172, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1142 = _1174;
        _1128 = _1176;
        _1136 = _1178;
        _1130 = _1172;
    }
    float _1180 = _1142;
    float _1182 = _1128;
    float _1184 = _1136;
    float _1186 = _1130;
    float _1188 = -_990;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1192 = -_992;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1182);
    float _1196 = -_998;
    float _1198 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1184);
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = _1194 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 + _1208;
    float _1212 = _1202 * _1202;
    float _1214 = fma(_1206, _1206, _1212);
    float _1216 = fma(_1210, _1210, _1214);
    float _1218 = rsqrt(_1216);
    float _1220 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1222 = _1206 * _1220;
    float _1224 = _1210 * _1220;
    float _1226 = _1222 * _1222;
    float _1228 = _1224 * _1224;
    float _1230 = _1226 + _1228;
    float _1232 = sqrt(_1230);
    bool _1234 = _1232 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1238 = _1232 + _1236;
    float _1240 = _1210;
    float _1242 = _1214;
    float _1244 = _1238;
    float _1246 = _1222;
    if (_1234)
    {
        float _1248 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1240 = _1248;
    }
    float _1250 = _1240;
    if (_1234)
    {
        float _1252 = rsqrt(_1230);
        _1242 = _1252;
    }
    float _1254 = _1242;
    float _1256 = _1254;
    if (_1234)
    {
        float _1258 = _1238 * _1250;
        _1244 = _1258;
    }
    float _1260 = _1244;
    if (_1234)
    {
        float _1262 = _1260 * 0.15915493667125701904296875;
        _1132 = _1262;
    }
    float _1264 = _1132;
    float _1266 = _1218;
    if (_1234)
    {
        float _1268 = _1264 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        _1266 = _1270;
    }
    float _1272 = _1266;
    float _1274 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1276 = precise::max(0.0, _1274);
    float _1278 = _1186;
    float _1280 = _1276;
    float _1282 = _1274;
    if (_1234)
    {
        float _1284 = _1264 * 6.283185482025146484375;
        float _1286 = cos(_1284);
        _1278 = _1286;
    }
    float _1288 = _1278;
    float _1290 = -_1220;
    float _1292 = -_1276;
    float _1294 = fma(_1202, _1290, _1292);
    if (!_1234)
    {
        _1280 = _1224;
    }
    float _1296 = _1280;
    float _1298 = _1296;
    if (_1234)
    {
        float _1300 = _1294 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1282 = _1300;
    }
    float _1302 = _1282;
    float _1304 = sqrt(_1216);
    float _1306 = _1272;
    float _1308 = _1302;
    if (_1234)
    {
        float _1310 = fma(_1272, _1302, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1306 = _1310;
    }
    float _1312 = _1306;
    float _1314 = _1312;
    if (_1234)
    {
        float _1316 = _1288 + (-1.0);
        _1308 = _1316;
    }
    float _1318 = _1308;
    float _1320 = _1318;
    if (_1234)
    {
        float _1322 = _1254 * _1312;
        _982 = _1322;
    }
    float _1324 = _982;
    if (!_1234)
    {
        _1256 = _1294;
    }
    float _1326 = _1256;
    float _1328 = _1326;
    if (_1234)
    {
        float _1330 = _1318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1320 = _1330;
    }
    float _1332 = _1320;
    float _1334 = _1332;
    if (_1234)
    {
        float _1336 = _1222 * _1324;
        _1246 = _1336;
    }
    float _1338 = _1246;
    if (!_1234)
    {
        _1314 = _1226;
    }
    float _1340 = _1314;
    float _1342 = _1340;
    if (_1234)
    {
        float _1344 = _1224 * _1324;
        _1298 = _1344;
    }
    float _1346 = _1298;
    if (_1234)
    {
        float _1348 = fma(_1294, _1288, _1332);
        _1328 = _1348;
    }
    float _1350 = _1328;
    if (_1234)
    {
        float _1352 = _1338 * _1338;
        _1342 = _1352;
    }
    float _1354 = _1342;
    if (!_1234)
    {
        _1334 = _1228;
    }
    float _1356 = _1334;
    float _1358 = _1356;
    if (_1234)
    {
        float _1360 = _1346 * _1346;
        _1358 = _1360;
    }
    float _1362 = _1358;
    float _1364 = fma(_1350, _1350, _1354);
    float _1366 = _1364 + _1362;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1370 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1368);
    float _1372 = precise::clamp(_1370, 0.0, 1.0);
    float _1374 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1376 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = -_1372;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1374);
    float _1386 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = _1190 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1392 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1384);
    float _1394 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = abs(_1382);
    float _1398 = log2(_1396);
    float _1400 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1402 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1390);
    float _1404 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1378 * _1338;
    float _1416 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1418 = _1378 * _1350;
    float _1420 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1424 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1416);
    float _1426 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1428 = _1378 * _1346;
    float _1430 = -_1422;
    float _1432 = fma(_1418, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1430);
    float _1434 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1436 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1438 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1424);
    float _1440 = -_1426;
    float _1442 = fma(_1440, _1420, 1.0);
    float _1444 = -_1428;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1432);
    float _1448 = exp2(_1434);
    float _1450 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1438);
    float _1452 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1454 = fma(_1446, -0.5, 0.5);
    float _1456 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1446, 0.5, 0.5);
    float _1460 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1452);
    float _1462 = _1418 + 1.0;
    float _1464 = log2(_1442);
    float _1466 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1468 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1460);
    float _1470 = fma(_1458, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1472 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1466);
    float _1474 = 1.0 / _1450;
    float _1476 = -_1418;
    float _1478 = fma(_1448, _1462, _1476);
    float _1480 = fma(_1458, _1470, -0.212114393711090087890625);
    float _1482 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1468);
    float _1484 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1472);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1458, _1480, 1.570728778839111328125);
    float _1490 = sqrt(_1454);
    float _1492 = _1464 * 0.693147182464599609375;
    float _1494 = _1492 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1496 = _1482 * _1474;
    float _1498 = _1484 * _1474;
    float _1500 = fma(_1496, 0.5, 0.5);
    float _1502 = fma(_1498, -0.5, 0.5);
    float _1504 = _1490 * 0.636619746685028076171875;
    float _1506 = -_1488;
    float _1508 = fma(_1504, _1506, 1.0);
    float3 _4026 = float3(_1500, _1502, _1494);
    float _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4026, float3(0.0), isnan(_4026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4026, float3(0.0), isnan(_4026)), level(0.0)).x;
    float3 _4037 = float3(_1500, _1502, _1494);
    float4 _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4037, float3(0.0), isnan(_4037)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4037, float3(0.0), isnan(_4037)), level(0.0)).xyzw;
    float _1515 = _1513.x;
    float _1517 = _1513.y;
    float _1519 = _1513.z;
    float _1521 = _1513.w;
    float2 _4054 = float2(_1508, _1486);
    float3 _1525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4054, float2(0.0), isnan(_4054)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4054, float2(0.0), isnan(_4054)), level(0.0)).xyz;
    float _1527 = _1525.x;
    float _1529 = _1525.y;
    float _1531 = _1525.z;
    float _1533 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1535 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1537 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1535);
    float _1539 = exp2(_1533);
    float _1541 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1537);
    float _1543 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1541);
    float _1545 = _1543 + _1450;
    out.gl_Position.x = _1482;
    out.gl_Position.y = _1484;
    out.gl_Position.z = _1543;
    out.gl_Position.w = _1450;
    float _1547 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1549 = _1545 * 0.5;
    float _1551 = -_1539;
    float _1553 = _1551 + 1.0;
    out.m_45.x = _1547;
    float _1555 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1549;
    out.m_62.w = _1450;
    float _1557 = _1555 * _1510;
    float _1559 = -_1555;
    float _1561 = _1559 + 1.0;
    float _1563 = _1521 * _1557;
    float _1565 = _1531 * _1557;
    float _1567 = _1521 * _1561;
    float _1569 = fma(_1527, _1563, _1515);
    float _1571 = fma(_1529, _1563, _1517);
    float _1573 = fma(_1521, _1565, _1519);
    out.m_64.x = _1569;
    out.m_64.y = _1571;
    out.m_64.z = _1573;
    out.m_64.w = _1567;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

