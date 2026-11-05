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
    bool _571 = false;
    bool _297 = false;
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
        float _1680 = as_type<float>(_99);
        out.gl_Position.z = _1680;
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
        float _1749 = as_type<float>(_135);
        out.gl_Position.z = _1749;
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
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_54.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _323 = 1.0 / _309;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _327 = 1.0 / _321;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _305 + _335;
    float _339 = _329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _341 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _343 = 1.0 / _313;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _347 = 1.0 / _317;
    float _349 = _325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _305 + _351;
    float _355 = _337 * _327;
    bool _357 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_305);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _353 * _323;
    bool _371 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_305);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _305 + _383;
    float _387 = _331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _305 + _389;
    float _393 = -_381;
    float _395 = _393 + 1.0;
    out.m_56.x = _339;
    out.m_56.y = _349;
    out.m_56.z = _387;
    out.m_56.w = _333;
    float _397 = _391 * _343;
    float _399 = _385 * _347;
    bool _401 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_305);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = in.m_54.x;
    bool _415 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_305);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _367 * _395;
    bool _429 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _431 = isnan(_305);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -_367;
    float _443 = _441 + 1.0;
    float _445 = _439 * _443;
    float _447 = -_439;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = _425 * _449;
    float _461 = -_425;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _473 = fma(_453, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _475 = _411 * _463;
    float _477 = fma(_467, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _479 = fma(_471, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = fma(_457, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = _477 * _475;
    float _485 = _473 * _475;
    float _487 = -_411;
    float _489 = _487 + 1.0;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = _341 * _413;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _483);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _485);
    float _509 = fma(_499, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _511 = fma(_479, _459, _501);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _517 = fma(_505, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_481, _459, _507);
    float _525 = trunc(_495);
    int _527 = int(_525);
    float _529 = fma(_515, _355, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _531 = fma(_509, _445, _511);
    float _533 = fma(_521, _355, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _535 = fma(_517, _445, _523);
    float _537 = fma(_529, _427, _531);
    float _539 = fma(_533, _427, _535);
    float _541 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[147].x, _537);
    float _543 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[147].y, _539);
    float _545 = _541 * _491;
    float _547 = _543 * _493;
    int _549 = _527 << 4;
    int _551 = _549 + 1968;
    bool _553 = !_345;
    float _569;
    if (!_553)
    {
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _557 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        float _573 = float(_83);
        float _575 = 1.0 / _573;
        float _577 = _117 * _575;
        _569 = _577;
    }
    _571 = false;
    float _579 = _569;
    float _581 = in.m_54.w;
    float _583 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _585 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _587 = in.m_54.z;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _591 = _589 != 0;
    float _593 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].x, _583);
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _597 = _595 != 0;
    float _599 = in.m_54.y;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _603 = _601 != 0;
    float _605 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _609 = _607 != 0;
    float _611 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _613 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _615 = _413 > 0.5;
    float _617 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].y, _585);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].z, _605);
    float _623 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].w, _611);
    float _625 = -_191;
    int _627 = _615 ? as_type<int>(_625) : as_type<int>(_191);
    float _629 = -_619;
    float _631 = fma(_613, 2.0, _629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = _581 > 0.5;
    float _639 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].x, _593);
    float _641 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].z, _621);
    bool _643 = _587 > 0.5;
    float _645 = -_117;
    float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[76].x, _631);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _651 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _653 = _599 > 0.5;
    float _655 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].z, _649);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _659 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].w, _623);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _663 = fma(_651, -2.0, _657);
    float _665 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].y, _617);
    float _667 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    float _669 = 1.0 / _635;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _675 = _659 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _677 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _679 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _667);
    float _681 = 1.0 / _673;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _687 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    float _693 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _677);
    float _695 = 1.0 / _685;
    float _697 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _699 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _687);
    float _701 = _691 * _669;
    float _703 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _697);
    float _705 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _693);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _711;
    bool _715 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _717 = isnan(_579);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _699);
    float _729 = _709 * _681;
    bool _731 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _733 = isnan(_579);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _713 * _695;
    bool _745 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _747 = isnan(_579);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -_725;
    float _759 = _757 + 1.0;
    float _761 = sqrt(_727);
    float _763 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _703);
    bool _765 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _767 = isnan(_579);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = _755 * _759;
    float _779 = -_755;
    float _781 = _779 + 1.0;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _785 = _579 + _783;
    float _787 = -_741;
    float _789 = _787 + 1.0;
    float _791 = sqrt(_705);
    float _793 = _741 * _781;
    float _795 = fma(_701, _785, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _797 = _775 * _789;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _801 = _579 + _799;
    float _803 = -_775;
    float _805 = _803 + 1.0;
    float _807 = _795 * _797;
    float _809 = sqrt(_763);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _813 = _579 + _811;
    float _815 = _639 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _817 = _665 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _819 = fma(_729, _801, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[131].x, _807);
    float _823 = fma(_743, _813, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _825 = _761 * _817;
    float _827 = _791 * _815;
    float _829 = _641 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _831 = fma(_819, _793, _821);
    uint _834 = uint(int(uint(_551) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[int(_836)][_838];
    int _842 = int(_834) + 1;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    int _846 = _842 & 3;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[int(_844)][_846];
    float _850 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _852 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _854 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _858 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _850);
    float _860 = fma(_823, _777, _831);
    float _862 = _809 * _829;
    int _864 = _551 + 8;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _852);
    float _876 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _854);
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _876);
    float _886 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].w, _878);
    bool _888 = !_591;
    float _890 = _888 ? _191 : as_type<float>(_627);
    float _892 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].w, _882);
    float _894 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].w, _884);
    float _896 = _886 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _898 = -_195;
    int _900 = _653 ? as_type<int>(_898) : as_type<int>(_195);
    float _902 = _892 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _904 = _894 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = _856 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _914 = _902 + _912;
    float _916 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _663);
    float _918 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _655);
    float _920 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _922 = _914 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _926 = _904 + _924;
    float _928 = _890 + 0.5;
    bool _930 = !_597;
    float _932 = _930 ? _195 : as_type<float>(_900);
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[28].x, _922);
    float _936 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[134].x, _860);
    float _938 = fma(_920, _928, _647);
    float _940 = _914 * _914;
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _934);
    float _944 = _932 + (-0.5);
    float _946 = -_191;
    int _948 = _643 ? as_type<int>(_946) : as_type<int>(_191);
    float _950 = fma(_908, _908, _940);
    float _952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _954 = _942 >= 0.0;
    float _956 = -_910;
    float _958 = -_916;
    float _960 = fma(_956, _944, _958);
    float _962 = -_195;
    int _964 = _637 ? as_type<int>(_962) : as_type<int>(_195);
    float _966 = fma(_926, _926, _950);
    bool _968 = !_603;
    float _970 = _968 ? _191 : as_type<float>(_948);
    float _972 = _936 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _974 = !_609;
    float _976 = _974 ? _195 : as_type<float>(_964);
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _980 = _840 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _982 = -_918;
    float _984 = _982 + 1.0;
    float _986 = _970 + 0.5;
    float _988 = -_976;
    float _990 = _988 + 0.5;
    float _992 = _848 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = -_984;
    float _996 = fma(_890, _994, _938);
    float _998 = -_679;
    float _1000 = _998 + 1.0;
    float _1002 = rsqrt(_966);
    float _1004 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1006 = _940;
    if (_954)
    {
        _1006 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1008 = _1006;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1012 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1014 = fma(_932, _1000, _960);
    float _1016 = _1004 * _952;
    float _1018 = _980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1010 * _978;
    float _1022 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1026 = as_type<int>(_1008);
    float _1028 = _1024;
    if (_954)
    {
        float _1030 = _1008 * 5.0;
        _1026 = as_type<int>(_1030);
    }
    int _1032 = _1026;
    out.m_58.x = _996;
    out.m_58.y = _1014;
    out.m_58.z = _1016;
    out.m_58.w = _1020;
    float _1034 = _914 * _1002;
    out.m_60.x = _1018;
    out.m_60.y = _1022;
    out.m_60.z = _1024;
    out.m_60.w = _972;
    float _1036 = _908 * _1002;
    float _1038 = as_type<float>(_1032);
    if (_954)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_1032);
        out.gl_Position.z = _3295;
    }
    if (_954)
    {
        out.m_45.x = 0.0;
    }
    if (_954)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1040 = -_1034;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1044 = _926 * _1002;
    float _1046 = -_1036;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _896);
    float _1050 = -_1034;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _914);
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1056 = _1042 + _1054;
    float _1058 = -_1044;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _904);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1064 = _1048 + _1062;
    float _1066 = -_1036;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _1070 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1052 * _1052;
    float _1078 = -_1044;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _1082 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1070);
    float _1084 = fma(_1068, _1068, _1076);
    float _1086 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1082);
    float _1088 = fma(_1080, _1080, _1084);
    bool _1090 = _1086 >= 0.0;
    float _1092 = sqrt(_1088);
    if (_1090)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1094 = _1038;
    int _1096 = as_type<int>(_1094);
    if (_1090)
    {
        out.m_45.x = 0.0;
    }
    if (_1090)
    {
        float _1098 = _1094 * 5.0;
        _1096 = as_type<int>(_1098);
    }
    int _1100 = _1096;
    float _1102 = _1002 * _1092;
    if (_1090)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3425 = as_type<float>(_1100);
        out.gl_Position.z = _3425;
    }
    if (_1090)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1104 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1108 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1112 = _1102 * _1104;
    float _1114 = _1102 * _1108;
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1118 = _1116 * 0.5;
    float _1120 = _1106 * _1112;
    float _1122 = _1110 * _1114;
    float _1124 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1126 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    float _1132 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1126);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1128);
    float _1136 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1138 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1132);
    float _1140 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1134);
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1146 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1148 = _904 + _1142;
    float _1150 = _896 + _1144;
    float _1152 = _902 + _1146;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1148 + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = _1156 * _1156;
    float _1164 = fma(_1160, _1160, _1162);
    float _1166 = sqrt(_1164);
    bool _1168 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1122;
    float _1172 = _1118;
    float _1174 = _1162;
    float _1176 = _1166;
    float _1178 = _1156;
    if (!_1168)
    {
        _1170 = _1150;
    }
    float _1180 = _1170;
    float _1182 = _1180;
    if (!_1168)
    {
        _1172 = _1148;
    }
    float _1184 = _1172;
    float _1186 = _1184;
    if (!_1168)
    {
        _1174 = _1152;
    }
    float _1188 = _1174;
    bool _1190 = !_1168;
    float _1192 = _1188;
    if (!_1190)
    {
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1198 = _1166 + _1196;
        float _1200 = rsqrt(_1164);
        float _1202 = _1198 * _1194;
        float _1204 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = _1202 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = _1206 * 6.283185482025146484375;
        float _1214 = sin(_1212);
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1214, _1204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = _1200 * _1218;
        float _1224 = fma(_1152, _1210, _1220);
        float _1226 = fma(_1160, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1228 = fma(_1156, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1192 = _1224;
        _1182 = _1226;
        _1186 = _1228;
        _1176 = _1222;
    }
    float _1230 = _1192;
    float _1232 = _1182;
    float _1234 = _1186;
    float _1236 = _1176;
    float _1238 = -_1034;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1242 = -_1036;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1246 = -_1044;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1240 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1244 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1248 + _1258;
    float _1262 = _1252 * _1252;
    float _1264 = fma(_1256, _1256, _1262);
    float _1266 = fma(_1260, _1260, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1272 = _1256 * _1270;
    float _1274 = _1260 * _1270;
    float _1276 = _1272 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 + _1278;
    float _1282 = sqrt(_1280);
    bool _1284 = _1282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = _1282 + _1286;
    float _1290 = _1260;
    float _1292 = _1264;
    float _1294 = _1288;
    float _1296 = _1272;
    if (_1284)
    {
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1298;
    }
    float _1300 = _1290;
    if (_1284)
    {
        float _1302 = rsqrt(_1280);
        _1292 = _1302;
    }
    float _1304 = _1292;
    float _1306 = _1304;
    if (_1284)
    {
        float _1308 = _1288 * _1300;
        _1294 = _1308;
    }
    float _1310 = _1294;
    if (_1284)
    {
        float _1312 = _1310 * 0.15915493667125701904296875;
        _1178 = _1312;
    }
    float _1314 = _1178;
    float _1316 = _1268;
    if (_1284)
    {
        float _1318 = _1314 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1326 = precise::max(0.0, _1324);
    float _1328 = _1236;
    float _1330 = _1326;
    float _1332 = _1324;
    if (_1284)
    {
        float _1334 = _1314 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        _1328 = _1336;
    }
    float _1338 = _1328;
    float _1340 = -_1270;
    float _1342 = -_1326;
    float _1344 = fma(_1252, _1340, _1342);
    if (!_1284)
    {
        _1330 = _1274;
    }
    float _1346 = _1330;
    float _1348 = _1346;
    if (_1284)
    {
        float _1350 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1350;
    }
    float _1352 = _1332;
    float _1354 = sqrt(_1266);
    float _1356 = _1322;
    float _1358 = _1352;
    if (_1284)
    {
        float _1360 = fma(_1322, _1352, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1356 = _1360;
    }
    float _1362 = _1356;
    float _1364 = _1362;
    if (_1284)
    {
        float _1366 = _1338 + (-1.0);
        _1358 = _1366;
    }
    float _1368 = _1358;
    float _1370 = _1368;
    if (_1284)
    {
        float _1372 = _1304 * _1362;
        _1028 = _1372;
    }
    float _1374 = _1028;
    if (!_1284)
    {
        _1306 = _1344;
    }
    float _1376 = _1306;
    float _1378 = _1376;
    if (_1284)
    {
        float _1380 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1370 = _1380;
    }
    float _1382 = _1370;
    float _1384 = _1382;
    if (_1284)
    {
        float _1386 = _1272 * _1374;
        _1296 = _1386;
    }
    float _1388 = _1296;
    if (!_1284)
    {
        _1364 = _1276;
    }
    float _1390 = _1364;
    float _1392 = _1390;
    if (_1284)
    {
        float _1394 = _1274 * _1374;
        _1348 = _1394;
    }
    float _1396 = _1348;
    if (_1284)
    {
        float _1398 = fma(_1344, _1338, _1382);
        _1378 = _1398;
    }
    float _1400 = _1378;
    if (_1284)
    {
        float _1402 = _1388 * _1388;
        _1392 = _1402;
    }
    float _1404 = _1392;
    if (!_1284)
    {
        _1384 = _1278;
    }
    float _1406 = _1384;
    float _1408 = _1406;
    if (_1284)
    {
        float _1410 = _1396 * _1396;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = fma(_1400, _1400, _1404);
    float _1416 = _1414 + _1412;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1420 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1418);
    float _1422 = precise::clamp(_1420, 0.0, 1.0);
    float _1424 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1426 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = rsqrt(_1416);
    float _1430 = -_1422;
    float _1432 = _1430 + 1.0;
    float _1434 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1424);
    float _1436 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1438 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1426);
    float _1440 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1442 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1434);
    float _1444 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1436);
    float _1446 = abs(_1432);
    float _1448 = log2(_1446);
    float _1450 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1438);
    float _1452 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1440);
    float _1454 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1452);
    float _1462 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1428 * _1388;
    float _1466 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = _1428 * _1400;
    float _1470 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1478 = _1428 * _1396;
    float _1480 = -_1472;
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1480);
    float _1484 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1486 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1488 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1474);
    float _1490 = -_1476;
    float _1492 = fma(_1490, _1470, 1.0);
    float _1494 = -_1478;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1482);
    float _1498 = exp2(_1484);
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1502 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1504 = fma(_1496, -0.5, 0.5);
    float _1506 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1502);
    float _1512 = _1468 + 1.0;
    float _1514 = log2(_1492);
    float _1516 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1506);
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1520 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1522 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1524 = 1.0 / _1500;
    float _1526 = -_1468;
    float _1528 = fma(_1498, _1512, _1526);
    float _1530 = fma(_1508, _1520, -0.212114393711090087890625);
    float _1532 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1518);
    float _1534 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1522);
    float _1536 = fma(_1528, 0.5, 0.5);
    float _1538 = fma(_1508, _1530, 1.570728778839111328125);
    float _1540 = sqrt(_1504);
    float _1542 = _1514 * 0.693147182464599609375;
    float _1544 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1546 = _1532 * _1524;
    float _1548 = _1534 * _1524;
    float _1550 = fma(_1546, 0.5, 0.5);
    float _1552 = fma(_1548, -0.5, 0.5);
    float _1554 = _1540 * 0.636619746685028076171875;
    float _1556 = -_1538;
    float _1558 = fma(_1554, _1556, 1.0);
    float3 _4186 = float3(_1550, _1552, _1544);
    float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4186, float3(0.0), isnan(_4186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4186, float3(0.0), isnan(_4186)), level(0.0)).x;
    float3 _4197 = float3(_1550, _1552, _1544);
    float4 _1563 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4197, float3(0.0), isnan(_4197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4197, float3(0.0), isnan(_4197)), level(0.0)).xyzw;
    float _1565 = _1563.x;
    float _1567 = _1563.y;
    float _1569 = _1563.z;
    float _1571 = _1563.w;
    float2 _4214 = float2(_1558, _1536);
    float3 _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1577 = _1575.x;
    float _1579 = _1575.y;
    float _1581 = _1575.z;
    float _1583 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1585 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1587 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1585);
    float _1589 = exp2(_1583);
    float _1591 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1587);
    float _1593 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1591);
    float _1595 = _1593 + _1500;
    out.gl_Position.x = _1532;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1593;
    out.gl_Position.w = _1500;
    float _1597 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1599 = _1595 * 0.5;
    float _1601 = -_1589;
    float _1603 = _1601 + 1.0;
    out.m_45.x = _1597;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1599;
    out.m_62.w = _1500;
    float _1607 = _1605 * _1560;
    float _1609 = -_1605;
    float _1611 = _1609 + 1.0;
    float _1613 = _1571 * _1607;
    float _1615 = _1581 * _1607;
    float _1617 = _1571 * _1611;
    float _1619 = fma(_1577, _1613, _1565);
    float _1621 = fma(_1579, _1613, _1567);
    float _1623 = fma(_1571, _1615, _1569);
    out.m_64.x = _1619;
    out.m_64.y = _1621;
    out.m_64.z = _1623;
    out.m_64.w = _1617;
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
    bool _571 = false;
    bool _297 = false;
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
        float _1680 = as_type<float>(_99);
        out.gl_Position.z = _1680;
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
        float _1749 = as_type<float>(_135);
        out.gl_Position.z = _1749;
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
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_54.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _323 = 1.0 / _309;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _327 = 1.0 / _321;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _305 + _335;
    float _339 = _329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _341 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _343 = 1.0 / _313;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _347 = 1.0 / _317;
    float _349 = _325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _305 + _351;
    float _355 = _337 * _327;
    bool _357 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_305);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _353 * _323;
    bool _371 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_305);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _305 + _383;
    float _387 = _331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _305 + _389;
    float _393 = -_381;
    float _395 = _393 + 1.0;
    out.m_56.x = _339;
    out.m_56.y = _349;
    out.m_56.z = _387;
    out.m_56.w = _333;
    float _397 = _391 * _343;
    float _399 = _385 * _347;
    bool _401 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_305);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = in.m_54.x;
    bool _415 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_305);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _367 * _395;
    bool _429 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _431 = isnan(_305);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -_367;
    float _443 = _441 + 1.0;
    float _445 = _439 * _443;
    float _447 = -_439;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = _425 * _449;
    float _461 = -_425;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _473 = fma(_453, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _475 = _411 * _463;
    float _477 = fma(_467, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _479 = fma(_471, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = fma(_457, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = _477 * _475;
    float _485 = _473 * _475;
    float _487 = -_411;
    float _489 = _487 + 1.0;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = _341 * _413;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _483);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _485);
    float _509 = fma(_499, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _511 = fma(_479, _459, _501);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _517 = fma(_505, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_481, _459, _507);
    float _525 = trunc(_495);
    int _527 = int(_525);
    float _529 = fma(_515, _355, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _531 = fma(_509, _445, _511);
    float _533 = fma(_521, _355, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _535 = fma(_517, _445, _523);
    float _537 = fma(_529, _427, _531);
    float _539 = fma(_533, _427, _535);
    float _541 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[147].x, _537);
    float _543 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[147].y, _539);
    float _545 = _541 * _491;
    float _547 = _543 * _493;
    int _549 = _527 << 4;
    int _551 = _549 + 1968;
    bool _553 = !_345;
    float _569;
    if (!_553)
    {
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _557 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        float _573 = float(_83);
        float _575 = 1.0 / _573;
        float _577 = _117 * _575;
        _569 = _577;
    }
    _571 = false;
    float _579 = _569;
    float _581 = in.m_54.w;
    float _583 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _585 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _587 = in.m_54.z;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _591 = _589 != 0;
    float _593 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].x, _583);
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _597 = _595 != 0;
    float _599 = in.m_54.y;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _603 = _601 != 0;
    float _605 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _609 = _607 != 0;
    float _611 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _613 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _615 = _413 > 0.5;
    float _617 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].y, _585);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].z, _605);
    float _623 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].w, _611);
    float _625 = -_191;
    int _627 = _615 ? as_type<int>(_625) : as_type<int>(_191);
    float _629 = -_619;
    float _631 = fma(_613, 2.0, _629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = _581 > 0.5;
    float _639 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].x, _593);
    float _641 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].z, _621);
    bool _643 = _587 > 0.5;
    float _645 = -_117;
    float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[76].x, _631);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _651 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _653 = _599 > 0.5;
    float _655 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].z, _649);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _659 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].w, _623);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _663 = fma(_651, -2.0, _657);
    float _665 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].y, _617);
    float _667 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    float _669 = 1.0 / _635;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _675 = _659 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _677 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _679 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _667);
    float _681 = 1.0 / _673;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _687 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    float _693 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _677);
    float _695 = 1.0 / _685;
    float _697 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _699 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _687);
    float _701 = _691 * _669;
    float _703 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _697);
    float _705 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _693);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _711;
    bool _715 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _717 = isnan(_579);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _699);
    float _729 = _709 * _681;
    bool _731 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _733 = isnan(_579);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _713 * _695;
    bool _745 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _747 = isnan(_579);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -_725;
    float _759 = _757 + 1.0;
    float _761 = sqrt(_727);
    float _763 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _703);
    bool _765 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _767 = isnan(_579);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = _755 * _759;
    float _779 = -_755;
    float _781 = _779 + 1.0;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _785 = _579 + _783;
    float _787 = -_741;
    float _789 = _787 + 1.0;
    float _791 = sqrt(_705);
    float _793 = _741 * _781;
    float _795 = fma(_701, _785, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _797 = _775 * _789;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _801 = _579 + _799;
    float _803 = -_775;
    float _805 = _803 + 1.0;
    float _807 = _795 * _797;
    float _809 = sqrt(_763);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _813 = _579 + _811;
    float _815 = _639 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _817 = _665 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _819 = fma(_729, _801, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[131].x, _807);
    float _823 = fma(_743, _813, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _825 = _761 * _817;
    float _827 = _791 * _815;
    float _829 = _641 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _831 = fma(_819, _793, _821);
    uint _834 = uint(int(uint(_551) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[int(_836)][_838];
    int _842 = int(_834) + 1;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    int _846 = _842 & 3;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[int(_844)][_846];
    float _850 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _852 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _854 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _858 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _850);
    float _860 = fma(_823, _777, _831);
    float _862 = _809 * _829;
    int _864 = _551 + 8;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _852);
    float _876 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _854);
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _876);
    float _886 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].w, _878);
    bool _888 = !_591;
    float _890 = _888 ? _191 : as_type<float>(_627);
    float _892 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].w, _882);
    float _894 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].w, _884);
    float _896 = _886 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _898 = -_195;
    int _900 = _653 ? as_type<int>(_898) : as_type<int>(_195);
    float _902 = _892 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _904 = _894 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = _856 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _914 = _902 + _912;
    float _916 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _663);
    float _918 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _655);
    float _920 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _922 = _914 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _926 = _904 + _924;
    float _928 = _890 + 0.5;
    bool _930 = !_597;
    float _932 = _930 ? _195 : as_type<float>(_900);
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[28].x, _922);
    float _936 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[134].x, _860);
    float _938 = fma(_920, _928, _647);
    float _940 = _914 * _914;
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _934);
    float _944 = _932 + (-0.5);
    float _946 = -_191;
    int _948 = _643 ? as_type<int>(_946) : as_type<int>(_191);
    float _950 = fma(_908, _908, _940);
    float _952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _954 = _942 >= 0.0;
    float _956 = -_910;
    float _958 = -_916;
    float _960 = fma(_956, _944, _958);
    float _962 = -_195;
    int _964 = _637 ? as_type<int>(_962) : as_type<int>(_195);
    float _966 = fma(_926, _926, _950);
    bool _968 = !_603;
    float _970 = _968 ? _191 : as_type<float>(_948);
    float _972 = _936 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _974 = !_609;
    float _976 = _974 ? _195 : as_type<float>(_964);
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _980 = _840 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _982 = -_918;
    float _984 = _982 + 1.0;
    float _986 = _970 + 0.5;
    float _988 = -_976;
    float _990 = _988 + 0.5;
    float _992 = _848 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = -_984;
    float _996 = fma(_890, _994, _938);
    float _998 = -_679;
    float _1000 = _998 + 1.0;
    float _1002 = rsqrt(_966);
    float _1004 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1006 = _940;
    if (_954)
    {
        _1006 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1008 = _1006;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1012 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1014 = fma(_932, _1000, _960);
    float _1016 = _1004 * _952;
    float _1018 = _980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1010 * _978;
    float _1022 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1026 = as_type<int>(_1008);
    float _1028 = _1024;
    if (_954)
    {
        float _1030 = _1008 * 5.0;
        _1026 = as_type<int>(_1030);
    }
    int _1032 = _1026;
    out.m_58.x = _996;
    out.m_58.y = _1014;
    out.m_58.z = _1016;
    out.m_58.w = _1020;
    float _1034 = _914 * _1002;
    out.m_60.x = _1018;
    out.m_60.y = _1022;
    out.m_60.z = _1024;
    out.m_60.w = _972;
    float _1036 = _908 * _1002;
    float _1038 = as_type<float>(_1032);
    if (_954)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_1032);
        out.gl_Position.z = _3295;
    }
    if (_954)
    {
        out.m_45.x = 0.0;
    }
    if (_954)
    {
        return out;
    }
    float _1040 = -_1034;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1044 = _926 * _1002;
    float _1046 = -_1036;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _896);
    float _1050 = -_1034;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _914);
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1056 = _1042 + _1054;
    float _1058 = -_1044;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _904);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1064 = _1048 + _1062;
    float _1066 = -_1036;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _1070 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1052 * _1052;
    float _1078 = -_1044;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _1082 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1070);
    float _1084 = fma(_1068, _1068, _1076);
    float _1086 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1082);
    float _1088 = fma(_1080, _1080, _1084);
    bool _1090 = _1086 >= 0.0;
    float _1092 = sqrt(_1088);
    if (_1090)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1094 = _1038;
    int _1096 = as_type<int>(_1094);
    if (_1090)
    {
        out.m_45.x = 0.0;
    }
    if (_1090)
    {
        float _1098 = _1094 * 5.0;
        _1096 = as_type<int>(_1098);
    }
    int _1100 = _1096;
    float _1102 = _1002 * _1092;
    if (_1090)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3425 = as_type<float>(_1100);
        out.gl_Position.z = _3425;
    }
    if (_1090)
    {
        return out;
    }
    float _1104 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1108 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1112 = _1102 * _1104;
    float _1114 = _1102 * _1108;
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1118 = _1116 * 0.5;
    float _1120 = _1106 * _1112;
    float _1122 = _1110 * _1114;
    float _1124 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1126 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    float _1132 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1126);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1128);
    float _1136 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1138 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1132);
    float _1140 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1134);
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1146 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1148 = _904 + _1142;
    float _1150 = _896 + _1144;
    float _1152 = _902 + _1146;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1148 + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = _1156 * _1156;
    float _1164 = fma(_1160, _1160, _1162);
    float _1166 = sqrt(_1164);
    bool _1168 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1122;
    float _1172 = _1118;
    float _1174 = _1162;
    float _1176 = _1166;
    float _1178 = _1156;
    if (!_1168)
    {
        _1170 = _1150;
    }
    float _1180 = _1170;
    float _1182 = _1180;
    if (!_1168)
    {
        _1172 = _1148;
    }
    float _1184 = _1172;
    float _1186 = _1184;
    if (!_1168)
    {
        _1174 = _1152;
    }
    float _1188 = _1174;
    bool _1190 = !_1168;
    float _1192 = _1188;
    if (!_1190)
    {
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1198 = _1166 + _1196;
        float _1200 = rsqrt(_1164);
        float _1202 = _1198 * _1194;
        float _1204 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = _1202 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = _1206 * 6.283185482025146484375;
        float _1214 = sin(_1212);
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1214, _1204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = _1200 * _1218;
        float _1224 = fma(_1152, _1210, _1220);
        float _1226 = fma(_1160, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1228 = fma(_1156, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1192 = _1224;
        _1182 = _1226;
        _1186 = _1228;
        _1176 = _1222;
    }
    float _1230 = _1192;
    float _1232 = _1182;
    float _1234 = _1186;
    float _1236 = _1176;
    float _1238 = -_1034;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1242 = -_1036;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1246 = -_1044;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1240 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1244 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1248 + _1258;
    float _1262 = _1252 * _1252;
    float _1264 = fma(_1256, _1256, _1262);
    float _1266 = fma(_1260, _1260, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1272 = _1256 * _1270;
    float _1274 = _1260 * _1270;
    float _1276 = _1272 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 + _1278;
    float _1282 = sqrt(_1280);
    bool _1284 = _1282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = _1282 + _1286;
    float _1290 = _1260;
    float _1292 = _1264;
    float _1294 = _1288;
    float _1296 = _1272;
    if (_1284)
    {
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1298;
    }
    float _1300 = _1290;
    if (_1284)
    {
        float _1302 = rsqrt(_1280);
        _1292 = _1302;
    }
    float _1304 = _1292;
    float _1306 = _1304;
    if (_1284)
    {
        float _1308 = _1288 * _1300;
        _1294 = _1308;
    }
    float _1310 = _1294;
    if (_1284)
    {
        float _1312 = _1310 * 0.15915493667125701904296875;
        _1178 = _1312;
    }
    float _1314 = _1178;
    float _1316 = _1268;
    if (_1284)
    {
        float _1318 = _1314 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1326 = precise::max(0.0, _1324);
    float _1328 = _1236;
    float _1330 = _1326;
    float _1332 = _1324;
    if (_1284)
    {
        float _1334 = _1314 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        _1328 = _1336;
    }
    float _1338 = _1328;
    float _1340 = -_1270;
    float _1342 = -_1326;
    float _1344 = fma(_1252, _1340, _1342);
    if (!_1284)
    {
        _1330 = _1274;
    }
    float _1346 = _1330;
    float _1348 = _1346;
    if (_1284)
    {
        float _1350 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1350;
    }
    float _1352 = _1332;
    float _1354 = sqrt(_1266);
    float _1356 = _1322;
    float _1358 = _1352;
    if (_1284)
    {
        float _1360 = fma(_1322, _1352, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1356 = _1360;
    }
    float _1362 = _1356;
    float _1364 = _1362;
    if (_1284)
    {
        float _1366 = _1338 + (-1.0);
        _1358 = _1366;
    }
    float _1368 = _1358;
    float _1370 = _1368;
    if (_1284)
    {
        float _1372 = _1304 * _1362;
        _1028 = _1372;
    }
    float _1374 = _1028;
    if (!_1284)
    {
        _1306 = _1344;
    }
    float _1376 = _1306;
    float _1378 = _1376;
    if (_1284)
    {
        float _1380 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1370 = _1380;
    }
    float _1382 = _1370;
    float _1384 = _1382;
    if (_1284)
    {
        float _1386 = _1272 * _1374;
        _1296 = _1386;
    }
    float _1388 = _1296;
    if (!_1284)
    {
        _1364 = _1276;
    }
    float _1390 = _1364;
    float _1392 = _1390;
    if (_1284)
    {
        float _1394 = _1274 * _1374;
        _1348 = _1394;
    }
    float _1396 = _1348;
    if (_1284)
    {
        float _1398 = fma(_1344, _1338, _1382);
        _1378 = _1398;
    }
    float _1400 = _1378;
    if (_1284)
    {
        float _1402 = _1388 * _1388;
        _1392 = _1402;
    }
    float _1404 = _1392;
    if (!_1284)
    {
        _1384 = _1278;
    }
    float _1406 = _1384;
    float _1408 = _1406;
    if (_1284)
    {
        float _1410 = _1396 * _1396;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = fma(_1400, _1400, _1404);
    float _1416 = _1414 + _1412;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1420 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1418);
    float _1422 = precise::clamp(_1420, 0.0, 1.0);
    float _1424 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1426 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = rsqrt(_1416);
    float _1430 = -_1422;
    float _1432 = _1430 + 1.0;
    float _1434 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1424);
    float _1436 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1438 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1426);
    float _1440 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1442 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1434);
    float _1444 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1436);
    float _1446 = abs(_1432);
    float _1448 = log2(_1446);
    float _1450 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1438);
    float _1452 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1440);
    float _1454 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1452);
    float _1462 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1428 * _1388;
    float _1466 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = _1428 * _1400;
    float _1470 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1478 = _1428 * _1396;
    float _1480 = -_1472;
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1480);
    float _1484 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1486 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1488 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1474);
    float _1490 = -_1476;
    float _1492 = fma(_1490, _1470, 1.0);
    float _1494 = -_1478;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1482);
    float _1498 = exp2(_1484);
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1502 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1504 = fma(_1496, -0.5, 0.5);
    float _1506 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1502);
    float _1512 = _1468 + 1.0;
    float _1514 = log2(_1492);
    float _1516 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1506);
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1520 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1522 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1524 = 1.0 / _1500;
    float _1526 = -_1468;
    float _1528 = fma(_1498, _1512, _1526);
    float _1530 = fma(_1508, _1520, -0.212114393711090087890625);
    float _1532 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1518);
    float _1534 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1522);
    float _1536 = fma(_1528, 0.5, 0.5);
    float _1538 = fma(_1508, _1530, 1.570728778839111328125);
    float _1540 = sqrt(_1504);
    float _1542 = _1514 * 0.693147182464599609375;
    float _1544 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1546 = _1532 * _1524;
    float _1548 = _1534 * _1524;
    float _1550 = fma(_1546, 0.5, 0.5);
    float _1552 = fma(_1548, -0.5, 0.5);
    float _1554 = _1540 * 0.636619746685028076171875;
    float _1556 = -_1538;
    float _1558 = fma(_1554, _1556, 1.0);
    float3 _4186 = float3(_1550, _1552, _1544);
    float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4186, float3(0.0), isnan(_4186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4186, float3(0.0), isnan(_4186)), level(0.0)).x;
    float3 _4197 = float3(_1550, _1552, _1544);
    float4 _1563 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4197, float3(0.0), isnan(_4197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4197, float3(0.0), isnan(_4197)), level(0.0)).xyzw;
    float _1565 = _1563.x;
    float _1567 = _1563.y;
    float _1569 = _1563.z;
    float _1571 = _1563.w;
    float2 _4214 = float2(_1558, _1536);
    float3 _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1577 = _1575.x;
    float _1579 = _1575.y;
    float _1581 = _1575.z;
    float _1583 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1585 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1587 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1585);
    float _1589 = exp2(_1583);
    float _1591 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1587);
    float _1593 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1591);
    float _1595 = _1593 + _1500;
    out.gl_Position.x = _1532;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1593;
    out.gl_Position.w = _1500;
    float _1597 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1599 = _1595 * 0.5;
    float _1601 = -_1589;
    float _1603 = _1601 + 1.0;
    out.m_45.x = _1597;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1599;
    out.m_62.w = _1500;
    float _1607 = _1605 * _1560;
    float _1609 = -_1605;
    float _1611 = _1609 + 1.0;
    float _1613 = _1571 * _1607;
    float _1615 = _1581 * _1607;
    float _1617 = _1571 * _1611;
    float _1619 = fma(_1577, _1613, _1565);
    float _1621 = fma(_1579, _1613, _1567);
    float _1623 = fma(_1571, _1615, _1569);
    out.m_64.x = _1619;
    out.m_64.y = _1621;
    out.m_64.z = _1623;
    out.m_64.w = _1617;
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
    bool _571 = false;
    bool _297 = false;
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
        float _1680 = as_type<float>(_99);
        out.gl_Position.z = _1680;
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
        float _1749 = as_type<float>(_135);
        out.gl_Position.z = _1749;
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
    float _167 = _139;
    if (!_151)
    {
        float _169 = _139 * _139;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_151)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    int _181 = as_type<int>(_137) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_137) & 2;
    bool _187 = _185 != 0;
    bool _189 = !_183;
    float _191 = _189 ? (-0.5) : 0.5;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_151;
    float _199 = _179;
    if (!_197)
    {
        float _201 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = log2(_201);
        float _205 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _207 = _205 + 1.0;
        float _209 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = _139 * _203;
        float _213 = 1.0 / _207;
        float _215 = _209 * 0.693147182464599609375;
        float _217 = exp2(_211);
        float _219 = 1.0 / _215;
        float _221 = _217 + (-1.0);
        float _223 = -_221;
        float _225 = fma(_223, _219, _139);
        float _227 = _225 * _213;
        float _229 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _229;
    }
    float _231 = _199;
    bool _233 = !_151;
    if (!_233)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = 1.0 / _241;
        float _245 = _139 * _237;
        float _247 = exp2(_245);
        float _249 = -_247;
        float _251 = _249 + 1.0;
        float _253 = _251 * _243;
        _167 = _253;
    }
    float _255 = _167;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _259 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _261 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _265 = fma(_255, _153, _259);
    float _267 = fma(_255, _155, _261);
    float _269 = fma(_255, _157, _263);
    float _271 = fma(_265, _141, _159);
    float _273 = fma(_267, _141, _161);
    float _275 = fma(_269, _141, _163);
    bool _277 = !_257;
    float _295;
    if (!_277)
    {
        float _279 = in.m_54.x;
        float _281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _283 = _279 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _285 = fma(_283, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _287 = _285 * _281;
        float _289 = floor(_287);
        float _291 = -_289;
        float _293 = _287 + _291;
        _295 = _293;
        _297 = true;
    }
    else
    {
        float _299 = float(_83);
        float _301 = 1.0 / _299;
        float _303 = _117 * _301;
        _295 = _303;
    }
    _297 = false;
    float _305 = _295;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _313 = _311 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _323 = 1.0 / _309;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _327 = 1.0 / _321;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _337 = _305 + _335;
    float _339 = _329 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _341 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _343 = 1.0 / _313;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _347 = 1.0 / _317;
    float _349 = _325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _305 + _351;
    float _355 = _337 * _327;
    bool _357 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _359 = isnan(_305);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = _353 * _323;
    bool _371 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _373 = isnan(_305);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _385 = _305 + _383;
    float _387 = _331 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _305 + _389;
    float _393 = -_381;
    float _395 = _393 + 1.0;
    out.m_56.x = _339;
    out.m_56.y = _349;
    out.m_56.z = _387;
    out.m_56.w = _333;
    float _397 = _391 * _343;
    float _399 = _385 * _347;
    bool _401 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _403 = isnan(_305);
    bool _405 = _401 || _403;
    bool _407 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _409 = _405 || _407;
    float _411 = float(_409);
    float _413 = in.m_54.x;
    bool _415 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _417 = isnan(_305);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _423 = _419 || _421;
    float _425 = float(_423);
    float _427 = _367 * _395;
    bool _429 = _305 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _431 = isnan(_305);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = -_367;
    float _443 = _441 + 1.0;
    float _445 = _439 * _443;
    float _447 = -_439;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _459 = _425 * _449;
    float _461 = -_425;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _473 = fma(_453, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _475 = _411 * _463;
    float _477 = fma(_467, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _479 = fma(_471, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _481 = fma(_457, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _483 = _477 * _475;
    float _485 = _473 * _475;
    float _487 = -_411;
    float _489 = _487 + 1.0;
    float _491 = in.m_52.x;
    float _493 = in.m_52.y;
    float _495 = _341 * _413;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _499 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _497;
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _483);
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _485);
    float _509 = fma(_499, _399, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _511 = fma(_479, _459, _501);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _517 = fma(_505, _399, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _523 = fma(_481, _459, _507);
    float _525 = trunc(_495);
    int _527 = int(_525);
    float _529 = fma(_515, _355, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _531 = fma(_509, _445, _511);
    float _533 = fma(_521, _355, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _535 = fma(_517, _445, _523);
    float _537 = fma(_529, _427, _531);
    float _539 = fma(_533, _427, _535);
    float _541 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[147].x, _537);
    float _543 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[147].y, _539);
    float _545 = _541 * _491;
    float _547 = _543 * _493;
    int _549 = _527 << 4;
    int _551 = _549 + 1968;
    bool _553 = !_345;
    float _569;
    if (!_553)
    {
        float _555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _557 = _413 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _559 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _561 = _559 * _555;
        float _563 = floor(_561);
        float _565 = -_563;
        float _567 = _561 + _565;
        _569 = _567;
        _571 = true;
    }
    else
    {
        float _573 = float(_83);
        float _575 = 1.0 / _573;
        float _577 = _117 * _575;
        _569 = _577;
    }
    _571 = false;
    float _579 = _569;
    float _581 = in.m_54.w;
    float _583 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _585 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _587 = in.m_54.z;
    int _589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _591 = _589 != 0;
    float _593 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].x, _583);
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _597 = _595 != 0;
    float _599 = in.m_54.y;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _603 = _601 != 0;
    float _605 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _609 = _607 != 0;
    float _611 = _273 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _613 = _413 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _615 = _413 > 0.5;
    float _617 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].y, _585);
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _621 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].z, _605);
    float _623 = fma(_271, (*spvDescriptorSet0.vp_c10)._m0[14].w, _611);
    float _625 = -_191;
    int _627 = _615 ? as_type<int>(_625) : as_type<int>(_191);
    float _629 = -_619;
    float _631 = fma(_613, 2.0, _629);
    float _633 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _635 = _633 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _637 = _581 > 0.5;
    float _639 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].x, _593);
    float _641 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].z, _621);
    bool _643 = _587 > 0.5;
    float _645 = -_117;
    float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[76].x, _631);
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _651 = _599 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _653 = _599 > 0.5;
    float _655 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[78].z, _649);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _659 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].w, _623);
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _663 = fma(_651, -2.0, _657);
    float _665 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[16].y, _617);
    float _667 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[78].w, _661);
    float _669 = 1.0 / _635;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _675 = _659 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _677 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _679 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _667);
    float _681 = 1.0 / _673;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _687 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _689;
    float _693 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _677);
    float _695 = 1.0 / _685;
    float _697 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _699 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _687);
    float _701 = _691 * _669;
    float _703 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _697);
    float _705 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _693);
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _711;
    bool _715 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _717 = isnan(_579);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _699);
    float _729 = _709 * _681;
    bool _731 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _733 = isnan(_579);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _713 * _695;
    bool _745 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _747 = isnan(_579);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -_725;
    float _759 = _757 + 1.0;
    float _761 = sqrt(_727);
    float _763 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _703);
    bool _765 = _579 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _767 = isnan(_579);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = _755 * _759;
    float _779 = -_755;
    float _781 = _779 + 1.0;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _785 = _579 + _783;
    float _787 = -_741;
    float _789 = _787 + 1.0;
    float _791 = sqrt(_705);
    float _793 = _741 * _781;
    float _795 = fma(_701, _785, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _797 = _775 * _789;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _801 = _579 + _799;
    float _803 = -_775;
    float _805 = _803 + 1.0;
    float _807 = _795 * _797;
    float _809 = sqrt(_763);
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _813 = _579 + _811;
    float _815 = _639 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _817 = _665 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _819 = fma(_729, _801, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _821 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[131].x, _807);
    float _823 = fma(_743, _813, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _825 = _761 * _817;
    float _827 = _791 * _815;
    float _829 = _641 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _831 = fma(_819, _793, _821);
    uint _834 = uint(int(uint(_551) >> uint(2)));
    uint _836 = uint(int(uint(int(_834)) >> uint(2)));
    int _838 = int(_834) & 3;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[int(_836)][_838];
    int _842 = int(_834) + 1;
    uint _844 = uint(int(uint(_842) >> uint(2)));
    int _846 = _842 & 3;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[int(_844)][_846];
    float _850 = _825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _852 = _825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _854 = _825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _858 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[24].x, _850);
    float _860 = fma(_823, _777, _831);
    float _862 = _809 * _829;
    int _864 = _551 + 8;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[int(_868)][_870];
    float _874 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[25].x, _852);
    float _876 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[26].x, _854);
    float _878 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _858);
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _882 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _874);
    float _884 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _876);
    float _886 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].w, _878);
    bool _888 = !_591;
    float _890 = _888 ? _191 : as_type<float>(_627);
    float _892 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].w, _882);
    float _894 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].w, _884);
    float _896 = _886 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _898 = -_195;
    int _900 = _653 ? as_type<int>(_898) : as_type<int>(_195);
    float _902 = _892 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _904 = _894 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _908 = _896 + _906;
    float _910 = _856 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _914 = _902 + _912;
    float _916 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _663);
    float _918 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _655);
    float _920 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _922 = _914 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _924 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _926 = _904 + _924;
    float _928 = _890 + 0.5;
    bool _930 = !_597;
    float _932 = _930 ? _195 : as_type<float>(_900);
    float _934 = fma(_908, (*spvDescriptorSet0.vp_c8)._m0[28].x, _922);
    float _936 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[134].x, _860);
    float _938 = fma(_920, _928, _647);
    float _940 = _914 * _914;
    float _942 = fma(_926, (*spvDescriptorSet0.vp_c8)._m0[28].z, _934);
    float _944 = _932 + (-0.5);
    float _946 = -_191;
    int _948 = _643 ? as_type<int>(_946) : as_type<int>(_191);
    float _950 = fma(_908, _908, _940);
    float _952 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _954 = _942 >= 0.0;
    float _956 = -_910;
    float _958 = -_916;
    float _960 = fma(_956, _944, _958);
    float _962 = -_195;
    int _964 = _637 ? as_type<int>(_962) : as_type<int>(_195);
    float _966 = fma(_926, _926, _950);
    bool _968 = !_603;
    float _970 = _968 ? _191 : as_type<float>(_948);
    float _972 = _936 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _974 = !_609;
    float _976 = _974 ? _195 : as_type<float>(_964);
    float _978 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _980 = _840 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _982 = -_918;
    float _984 = _982 + 1.0;
    float _986 = _970 + 0.5;
    float _988 = -_976;
    float _990 = _988 + 0.5;
    float _992 = _848 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = -_984;
    float _996 = fma(_890, _994, _938);
    float _998 = -_679;
    float _1000 = _998 + 1.0;
    float _1002 = rsqrt(_966);
    float _1004 = _986 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1006 = _940;
    if (_954)
    {
        _1006 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1008 = _1006;
    float _1010 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1012 = _872 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1014 = fma(_932, _1000, _960);
    float _1016 = _1004 * _952;
    float _1018 = _980 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1010 * _978;
    float _1022 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1024 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1026 = as_type<int>(_1008);
    float _1028 = _1024;
    if (_954)
    {
        float _1030 = _1008 * 5.0;
        _1026 = as_type<int>(_1030);
    }
    int _1032 = _1026;
    out.m_58.x = _996;
    out.m_58.y = _1014;
    out.m_58.z = _1016;
    out.m_58.w = _1020;
    float _1034 = _914 * _1002;
    out.m_60.x = _1018;
    out.m_60.y = _1022;
    out.m_60.z = _1024;
    out.m_60.w = _972;
    float _1036 = _908 * _1002;
    float _1038 = as_type<float>(_1032);
    if (_954)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3295 = as_type<float>(_1032);
        out.gl_Position.z = _3295;
    }
    if (_954)
    {
        out.m_45.x = 0.0;
    }
    if (_954)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1040 = -_1034;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _902);
    float _1044 = _926 * _1002;
    float _1046 = -_1036;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[18].w, _896);
    float _1050 = -_1034;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _914);
    float _1054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1056 = _1042 + _1054;
    float _1058 = -_1044;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _904);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1064 = _1048 + _1062;
    float _1066 = -_1036;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[18].w, _908);
    float _1070 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1060 + _1072;
    float _1076 = _1052 * _1052;
    float _1078 = -_1044;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _1082 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1070);
    float _1084 = fma(_1068, _1068, _1076);
    float _1086 = fma(_1074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1082);
    float _1088 = fma(_1080, _1080, _1084);
    bool _1090 = _1086 >= 0.0;
    float _1092 = sqrt(_1088);
    if (_1090)
    {
        _1038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1094 = _1038;
    int _1096 = as_type<int>(_1094);
    if (_1090)
    {
        out.m_45.x = 0.0;
    }
    if (_1090)
    {
        float _1098 = _1094 * 5.0;
        _1096 = as_type<int>(_1098);
    }
    int _1100 = _1096;
    float _1102 = _1002 * _1092;
    if (_1090)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3425 = as_type<float>(_1100);
        out.gl_Position.z = _3425;
    }
    if (_1090)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1104 = _547 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1106 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _195);
    float _1108 = _545 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1112 = _1102 * _1104;
    float _1114 = _1102 * _1108;
    float _1116 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1118 = _1116 * 0.5;
    float _1120 = _1106 * _1112;
    float _1122 = _1110 * _1114;
    float _1124 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1126 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1130 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1124);
    float _1132 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1126);
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1128);
    float _1136 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1130);
    float _1138 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1132);
    float _1140 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1134);
    float _1142 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1144 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1146 = _1140 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1148 = _904 + _1142;
    float _1150 = _896 + _1144;
    float _1152 = _902 + _1146;
    float _1154 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1156 = _1148 + _1154;
    float _1158 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1160 = _1150 + _1158;
    float _1162 = _1156 * _1156;
    float _1164 = fma(_1160, _1160, _1162);
    float _1166 = sqrt(_1164);
    bool _1168 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1122;
    float _1172 = _1118;
    float _1174 = _1162;
    float _1176 = _1166;
    float _1178 = _1156;
    if (!_1168)
    {
        _1170 = _1150;
    }
    float _1180 = _1170;
    float _1182 = _1180;
    if (!_1168)
    {
        _1172 = _1148;
    }
    float _1184 = _1172;
    float _1186 = _1184;
    if (!_1168)
    {
        _1174 = _1152;
    }
    float _1188 = _1174;
    bool _1190 = !_1168;
    float _1192 = _1188;
    if (!_1190)
    {
        float _1194 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1196 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1198 = _1166 + _1196;
        float _1200 = rsqrt(_1164);
        float _1202 = _1198 * _1194;
        float _1204 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1206 = _1202 * 0.15915493667125701904296875;
        float _1208 = _1206 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        float _1212 = _1206 * 6.283185482025146484375;
        float _1214 = sin(_1212);
        float _1216 = _1210 + (-1.0);
        float _1218 = fma(_1214, _1204, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1216 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1222 = _1200 * _1218;
        float _1224 = fma(_1152, _1210, _1220);
        float _1226 = fma(_1160, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1228 = fma(_1156, _1222, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1192 = _1224;
        _1182 = _1226;
        _1186 = _1228;
        _1176 = _1222;
    }
    float _1230 = _1192;
    float _1232 = _1182;
    float _1234 = _1186;
    float _1236 = _1176;
    float _1238 = -_1034;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1242 = -_1036;
    float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1232);
    float _1246 = -_1044;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1234);
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1252 = _1240 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1256 = _1244 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1248 + _1258;
    float _1262 = _1252 * _1252;
    float _1264 = fma(_1256, _1256, _1262);
    float _1266 = fma(_1260, _1260, _1264);
    float _1268 = rsqrt(_1266);
    float _1270 = _1268 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1272 = _1256 * _1270;
    float _1274 = _1260 * _1270;
    float _1276 = _1272 * _1272;
    float _1278 = _1274 * _1274;
    float _1280 = _1276 + _1278;
    float _1282 = sqrt(_1280);
    bool _1284 = _1282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1288 = _1282 + _1286;
    float _1290 = _1260;
    float _1292 = _1264;
    float _1294 = _1288;
    float _1296 = _1272;
    if (_1284)
    {
        float _1298 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1290 = _1298;
    }
    float _1300 = _1290;
    if (_1284)
    {
        float _1302 = rsqrt(_1280);
        _1292 = _1302;
    }
    float _1304 = _1292;
    float _1306 = _1304;
    if (_1284)
    {
        float _1308 = _1288 * _1300;
        _1294 = _1308;
    }
    float _1310 = _1294;
    if (_1284)
    {
        float _1312 = _1310 * 0.15915493667125701904296875;
        _1178 = _1312;
    }
    float _1314 = _1178;
    float _1316 = _1268;
    if (_1284)
    {
        float _1318 = _1314 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1326 = precise::max(0.0, _1324);
    float _1328 = _1236;
    float _1330 = _1326;
    float _1332 = _1324;
    if (_1284)
    {
        float _1334 = _1314 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        _1328 = _1336;
    }
    float _1338 = _1328;
    float _1340 = -_1270;
    float _1342 = -_1326;
    float _1344 = fma(_1252, _1340, _1342);
    if (!_1284)
    {
        _1330 = _1274;
    }
    float _1346 = _1330;
    float _1348 = _1346;
    if (_1284)
    {
        float _1350 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1332 = _1350;
    }
    float _1352 = _1332;
    float _1354 = sqrt(_1266);
    float _1356 = _1322;
    float _1358 = _1352;
    if (_1284)
    {
        float _1360 = fma(_1322, _1352, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1356 = _1360;
    }
    float _1362 = _1356;
    float _1364 = _1362;
    if (_1284)
    {
        float _1366 = _1338 + (-1.0);
        _1358 = _1366;
    }
    float _1368 = _1358;
    float _1370 = _1368;
    if (_1284)
    {
        float _1372 = _1304 * _1362;
        _1028 = _1372;
    }
    float _1374 = _1028;
    if (!_1284)
    {
        _1306 = _1344;
    }
    float _1376 = _1306;
    float _1378 = _1376;
    if (_1284)
    {
        float _1380 = _1368 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1370 = _1380;
    }
    float _1382 = _1370;
    float _1384 = _1382;
    if (_1284)
    {
        float _1386 = _1272 * _1374;
        _1296 = _1386;
    }
    float _1388 = _1296;
    if (!_1284)
    {
        _1364 = _1276;
    }
    float _1390 = _1364;
    float _1392 = _1390;
    if (_1284)
    {
        float _1394 = _1274 * _1374;
        _1348 = _1394;
    }
    float _1396 = _1348;
    if (_1284)
    {
        float _1398 = fma(_1344, _1338, _1382);
        _1378 = _1398;
    }
    float _1400 = _1378;
    if (_1284)
    {
        float _1402 = _1388 * _1388;
        _1392 = _1402;
    }
    float _1404 = _1392;
    if (!_1284)
    {
        _1384 = _1278;
    }
    float _1406 = _1384;
    float _1408 = _1406;
    if (_1284)
    {
        float _1410 = _1396 * _1396;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = fma(_1400, _1400, _1404);
    float _1416 = _1414 + _1412;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1420 = fma(_1354, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1418);
    float _1422 = precise::clamp(_1420, 0.0, 1.0);
    float _1424 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1426 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1428 = rsqrt(_1416);
    float _1430 = -_1422;
    float _1432 = _1430 + 1.0;
    float _1434 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1424);
    float _1436 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1438 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1426);
    float _1440 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1442 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1434);
    float _1444 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1436);
    float _1446 = abs(_1432);
    float _1448 = log2(_1446);
    float _1450 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1438);
    float _1452 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1440);
    float _1454 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = _1442 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1458 = _1450 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1460 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1452);
    float _1462 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1464 = _1428 * _1388;
    float _1466 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = _1428 * _1400;
    float _1470 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1472 = _1464 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1474 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1478 = _1428 * _1396;
    float _1480 = -_1472;
    float _1482 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1480);
    float _1484 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1486 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1488 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1474);
    float _1490 = -_1476;
    float _1492 = fma(_1490, _1470, 1.0);
    float _1494 = -_1478;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1482);
    float _1498 = exp2(_1484);
    float _1500 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1488);
    float _1502 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1504 = fma(_1496, -0.5, 0.5);
    float _1506 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1508 = fma(_1496, 0.5, 0.5);
    float _1510 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1502);
    float _1512 = _1468 + 1.0;
    float _1514 = log2(_1492);
    float _1516 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1506);
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1510);
    float _1520 = fma(_1508, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1522 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1516);
    float _1524 = 1.0 / _1500;
    float _1526 = -_1468;
    float _1528 = fma(_1498, _1512, _1526);
    float _1530 = fma(_1508, _1520, -0.212114393711090087890625);
    float _1532 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1518);
    float _1534 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1522);
    float _1536 = fma(_1528, 0.5, 0.5);
    float _1538 = fma(_1508, _1530, 1.570728778839111328125);
    float _1540 = sqrt(_1504);
    float _1542 = _1514 * 0.693147182464599609375;
    float _1544 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1546 = _1532 * _1524;
    float _1548 = _1534 * _1524;
    float _1550 = fma(_1546, 0.5, 0.5);
    float _1552 = fma(_1548, -0.5, 0.5);
    float _1554 = _1540 * 0.636619746685028076171875;
    float _1556 = -_1538;
    float _1558 = fma(_1554, _1556, 1.0);
    float3 _4186 = float3(_1550, _1552, _1544);
    float _1560 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4186, float3(0.0), isnan(_4186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4186, float3(0.0), isnan(_4186)), level(0.0)).x;
    float3 _4197 = float3(_1550, _1552, _1544);
    float4 _1563 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4197, float3(0.0), isnan(_4197)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4197, float3(0.0), isnan(_4197)), level(0.0)).xyzw;
    float _1565 = _1563.x;
    float _1567 = _1563.y;
    float _1569 = _1563.z;
    float _1571 = _1563.w;
    float2 _4214 = float2(_1558, _1536);
    float3 _1575 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4214, float2(0.0), isnan(_4214)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4214, float2(0.0), isnan(_4214)), level(0.0)).xyz;
    float _1577 = _1575.x;
    float _1579 = _1575.y;
    float _1581 = _1575.z;
    float _1583 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1585 = _1458 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1587 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1585);
    float _1589 = exp2(_1583);
    float _1591 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1587);
    float _1593 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1591);
    float _1595 = _1593 + _1500;
    out.gl_Position.x = _1532;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1593;
    out.gl_Position.w = _1500;
    float _1597 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1599 = _1595 * 0.5;
    float _1601 = -_1589;
    float _1603 = _1601 + 1.0;
    out.m_45.x = _1597;
    float _1605 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1599;
    out.m_62.w = _1500;
    float _1607 = _1605 * _1560;
    float _1609 = -_1605;
    float _1611 = _1609 + 1.0;
    float _1613 = _1571 * _1607;
    float _1615 = _1581 * _1607;
    float _1617 = _1571 * _1611;
    float _1619 = fma(_1577, _1613, _1565);
    float _1621 = fma(_1579, _1613, _1567);
    float _1623 = fma(_1571, _1615, _1569);
    out.m_64.x = _1619;
    out.m_64.y = _1621;
    out.m_64.z = _1623;
    out.m_64.w = _1617;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

