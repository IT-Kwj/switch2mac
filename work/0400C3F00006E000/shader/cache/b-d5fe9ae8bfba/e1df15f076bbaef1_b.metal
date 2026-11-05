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
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
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
    bool _645 = false;
    bool _383 = false;
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
        float _1441 = as_type<float>(_99);
        out.gl_Position.z = _1441;
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
        float _1510 = as_type<float>(_135);
        out.gl_Position.z = _1510;
    }
    if (_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    float _195 = _183 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_189;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_155;
    float _219 = _175;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_155;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _161 = _273;
    }
    float _275 = _161;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_203, 0.5, 0.5);
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_199;
    int _311 = _309 ? 0 : 1;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_287;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_305);
    float _323 = fma(_275, _177, _307);
    int _325 = abs(_311);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _337 = abs(_331);
    float _339 = fma(_275, _179, _327);
    float _341 = float(_321);
    float _343 = fma(_275, _181, _333);
    float _345 = float(_325);
    float _347 = abs(_295);
    float _349 = _341 * _347;
    float _351 = fma(_339, _277, _299);
    float _353 = fma(_343, _277, _301);
    float _355 = float(_337);
    float _357 = fma(_345, _319, _349);
    float _359 = fma(_323, _277, _297);
    float _361 = abs(_315);
    float _363 = fma(_355, _361, _357);
    bool _365 = !_335;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _409 = 1.0 / _395;
    float _411 = 1.0 / _403;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _421 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = 1.0 / _399;
    float _425 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _391 + _427;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _433 = 1.0 / _407;
    float _435 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _391 + _437;
    float _441 = _439 * _409;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _391 + _443;
    out.m_56.x = _435;
    out.m_56.y = _421;
    out.m_56.z = _425;
    out.m_56.w = _419;
    float _447 = _429 * _423;
    float _449 = _445 * _411;
    bool _451 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _453 = isnan(_391);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _465 = _391 + _463;
    float _467 = -_461;
    float _469 = _467 + 1.0;
    float _471 = _465 * _433;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _473;
    bool _477 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _479 = isnan(_391);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _489;
    bool _493 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _495 = isnan(_391);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_475, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_491, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = _487 * _469;
    bool _511 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _513 = isnan(_391);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _527 = -_503;
    float _529 = _527 + 1.0;
    bool _531 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _533 = isnan(_391);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_487;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _551 = _521 * _529;
    float _553 = -_521;
    float _555 = _553 + 1.0;
    float _557 = _503 * _545;
    float _559 = fma(_525, _447, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _561 = fma(_549, _447, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _563 = _541 * _555;
    float _565 = in.m_54.x;
    float _567 = in.m_54.y;
    float _569 = -_541;
    float _571 = _569 + 1.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _573;
    float _577 = _505 * _563;
    float _579 = _507 * _563;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _581;
    float _585 = fma(_575, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _577);
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _579);
    float _591 = fma(_583, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _601 = fma(_559, _551, _587);
    float _603 = fma(_561, _551, _589);
    float _605 = fma(_595, _471, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = fma(_599, _471, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _609 = fma(_585, _557, _601);
    float _611 = fma(_591, _557, _603);
    float _613 = fma(_605, _509, _609);
    float _615 = fma(_607, _509, _611);
    float _617 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[147].x, _613);
    float _619 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[147].y, _615);
    float _621 = _617 * _565;
    float _623 = _619 * _567;
    bool _625 = !_431;
    float _627 = _589;
    float _643;
    if (!_625)
    {
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _631 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        float _647 = float(_83);
        float _649 = 1.0 / _647;
        float _651 = _117 * _649;
        _643 = _651;
    }
    _645 = false;
    float _653 = _643;
    float _655 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _657 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _659 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _661 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _663 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _659);
    float _665 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _661);
    float _667 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _663);
    float _669 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _671 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].x, _655);
    float _673 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].z, _657);
    float _675 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _669);
    float _677 = sqrt(_667);
    float _679 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _665);
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _683 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _675);
    float _685 = _621 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _689 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _691 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].x, _671);
    float _693 = sqrt(_679);
    float _695 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].y, _687);
    float _697 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].w, _689);
    float _699 = _685 * _681;
    float _701 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _703 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].y, _695);
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _707 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].z, _673);
    float _709 = sqrt(_683);
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _713 = _701 * _705;
    float _715 = _691 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _717 = _707 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _719 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].w, _697);
    float _721 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _723 = _677 * _715;
    float _725 = _693 * _711;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _729 = _719 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _731 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _727);
    float _737 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _739 = _709 * _717;
    float _741 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _743 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _745 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _747 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[24].z, _735);
    float _749 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _741);
    float _751 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _743);
    float _753 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].x, _737);
    float _755 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[26].z, _749);
    float _757 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _759 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].w, _751);
    float _761 = _747 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _765 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].w, _757);
    float _767 = _759 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _769 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _753);
    float _771 = _765 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _773 = _767 + _763;
    float _775 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].w, _769);
    float _777 = _771 + _761;
    float _779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _781 = _773 + _779;
    float _783 = _775 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _787 = _777 + _785;
    float _789 = _781 * _781;
    float _791 = fma(_787, _787, _789);
    float _793 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _795 = sqrt(_791);
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _793);
    float _799 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[25].z, _797);
    float _801 = _799 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _803 = _783 + _801;
    bool _805 = _795 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _807 = _801;
    float _809 = _771;
    float _811 = _777;
    float _813 = _773;
    if (!_805)
    {
        _807 = _773;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_805)
    {
        _809 = _803;
    }
    float _819 = _809;
    bool _821 = !_805;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _795 + _827;
        float _831 = rsqrt(_791);
        float _833 = _829 * _825;
        float _835 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = fma(_845, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _853 = fma(_803, _841, _849);
        float _855 = _831 * _851;
        float _857 = fma(_787, _855, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_781, _855, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _823 = _853;
        _811 = _857;
        _817 = _859;
    }
    float _861 = _823;
    float _863 = _811;
    float _865 = _817;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _869 = _861 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _863 + _871;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _865 + _875;
    float _879 = _869 * _869;
    float _881 = fma(_873, _873, _879);
    float _883 = fma(_877, _877, _881);
    float _885 = rsqrt(_883);
    float _887 = sqrt(_883);
    float _889 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _891 = _873 * _889;
    float _893 = _877 * _889;
    float _895 = _891 * _891;
    float _897 = _893 * _893;
    float _899 = _895 + _897;
    float _901 = sqrt(_899);
    bool _903 = _901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _907 = _901 + _905;
    float _909 = _877;
    float _911 = _885;
    float _913 = _907;
    float _915 = _869;
    float _917 = _891;
    if (_903)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _909 = _919;
    }
    float _921 = _909;
    if (_903)
    {
        float _923 = rsqrt(_899);
        _911 = _923;
    }
    float _925 = _911;
    float _927 = _925;
    if (_903)
    {
        float _929 = _907 * _921;
        _913 = _929;
    }
    float _931 = _913;
    if (_903)
    {
        float _933 = _931 * 0.15915493667125701904296875;
        _813 = _933;
    }
    float _935 = _813;
    float _937 = _921;
    float _939 = _935;
    if (_903)
    {
        float _941 = _935 * 6.283185482025146484375;
        float _943 = sin(_941);
        _937 = _943;
    }
    float _945 = _937;
    float _947 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _949 = precise::max(0.0, _947);
    float _951 = _795;
    float _953 = _949;
    if (_903)
    {
        float _955 = _935 * 6.283185482025146484375;
        float _957 = cos(_955);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = -_889;
    float _963 = -_949;
    float _965 = fma(_869, _961, _963);
    if (!_903)
    {
        _915 = _895;
    }
    float _967 = _915;
    float _969 = _967;
    if (_903)
    {
        float _971 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _971;
    }
    float _973 = _953;
    float _975 = _945;
    float _977 = _973;
    if (_903)
    {
        float _979 = fma(_945, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _981;
    if (_903)
    {
        float _985 = _959 + (-1.0);
        _977 = _985;
    }
    float _987 = _977;
    float _989 = _987;
    if (_903)
    {
        float _991 = _925 * _981;
        _627 = _991;
    }
    float _993 = _627;
    if (!_903)
    {
        _927 = _965;
    }
    float _995 = _927;
    float _997 = _995;
    if (_903)
    {
        float _999 = _987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _939 = _999;
    }
    float _1001 = _939;
    if (_903)
    {
        float _1003 = _891 * _993;
        _917 = _1003;
    }
    float _1005 = _917;
    if (!_903)
    {
        _983 = _893;
    }
    float _1007 = _983;
    float _1009 = _1007;
    if (_903)
    {
        float _1011 = _893 * _993;
        _1009 = _1011;
    }
    float _1013 = _1009;
    if (_903)
    {
        float _1015 = fma(_965, _959, _1001);
        _997 = _1015;
    }
    float _1017 = _997;
    if (_903)
    {
        float _1019 = _1005 * _1005;
        _969 = _1019;
    }
    float _1021 = _969;
    if (!_903)
    {
        _989 = _897;
    }
    float _1023 = _989;
    float _1025 = _1023;
    if (_903)
    {
        float _1027 = _1013 * _1013;
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = fma(_1017, _1017, _1021);
    float _1033 = _1031 + _1029;
    float _1035 = _861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1039 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1037);
    float _1041 = precise::clamp(_1039, 0.0, 1.0);
    float _1043 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1045 = rsqrt(_1033);
    float _1047 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1035);
    float _1049 = _861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1051 = -_1041;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1047);
    float _1057 = _861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1059 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1049);
    float _1061 = _861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1063 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1065 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1057);
    float _1067 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1059);
    float _1069 = abs(_1053);
    float _1071 = log2(_1069);
    float _1073 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1061);
    float _1075 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1065);
    float _1077 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1079 = _1045 * _1005;
    float _1081 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1073);
    float _1083 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1085 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1087 = _1045 * _1017;
    float _1089 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1091 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1093 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1085);
    float _1095 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1097 = _1045 * _1013;
    float _1099 = -_1089;
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1099);
    float _1103 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1093);
    float _1105 = -_1095;
    float _1107 = fma(_1105, _1043, 1.0);
    float _1109 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = -_1097;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1101);
    float _1115 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1103);
    float _1117 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1119 = exp2(_1109);
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1125 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1117);
    float _1127 = fma(_1113, 0.5, 0.5);
    float _1129 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1123);
    float _1131 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1125);
    float _1133 = log2(_1107);
    float _1135 = _1087 + 1.0;
    float _1137 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1129);
    float _1139 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1131);
    float _1141 = fma(_1127, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1143 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1137);
    float _1145 = 1.0 / _1115;
    float _1147 = -_1087;
    float _1149 = fma(_1119, _1135, _1147);
    float _1151 = fma(_1127, _1141, -0.212114393711090087890625);
    float _1153 = fma(_1149, 0.5, 0.5);
    float _1155 = fma(_1127, _1151, 1.570728778839111328125);
    float _1157 = sqrt(_1121);
    float _1159 = _1133 * 0.693147182464599609375;
    float _1161 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1163 = _1139 * _1145;
    float _1165 = _1143 * _1145;
    float _1167 = fma(_1163, 0.5, 0.5);
    float _1169 = fma(_1165, -0.5, 0.5);
    float _1171 = _1157 * 0.636619746685028076171875;
    float3 _3236 = float3(_1167, _1169, _1161);
    float _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).x;
    float3 _3247 = float3(_1167, _1169, _1161);
    float4 _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).xyzw;
    float _1178 = _1176.x;
    float _1180 = _1176.y;
    float _1182 = _1176.z;
    float _1184 = _1176.w;
    float _1186 = -_1155;
    float _1188 = fma(_1171, _1186, 1.0);
    float2 _3269 = float2(_1188, _1153);
    float3 _1192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3269, float2(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3269, float2(0.0), isnan(_3269)), level(0.0)).xyz;
    float _1194 = _1192.x;
    float _1196 = _1192.y;
    float _1198 = _1192.z;
    float _1200 = in.m_49.y;
    float _1202 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1204 = _137 > 0.5;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1208 = _653 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1210;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1216 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1220 = _1218 != 0;
    float _1222 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1224 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1216);
    float _1226 = 1.0 / _1212;
    float _1228 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1232 = _1200 > 0.5;
    float _1234 = -_215;
    int _1236 = _1204 ? as_type<int>(_1234) : as_type<int>(_215);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1240 = _1238 != 0;
    float _1242 = -_207;
    int _1244 = _1232 ? as_type<int>(_1242) : as_type<int>(_207);
    float _1246 = _1208 * _1226;
    bool _1248 = !_1220;
    float _1250 = _1248 ? _215 : as_type<float>(_1236);
    float _1252 = exp2(_1202);
    bool _1254 = !_1240;
    float _1256 = _1254 ? _207 : as_type<float>(_1244);
    float _1258 = _1250 + 0.5;
    float _1260 = -_1256;
    float _1262 = _1260 + 0.5;
    bool _1264 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1266 = isnan(_653);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1278 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1280 = isnan(_653);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1298;
    float _1302 = -_1274;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1292, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1308 = fma(_1296, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1310 = fma(_1300, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1312 = _1288 * _1304;
    float _1314 = -_1288;
    float _1316 = _1314 + 1.0;
    float _1318 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1320 = _1276 * _1214;
    float _1322 = _1306 * _1312;
    float _1324 = _1308 * _1312;
    float _1326 = _1310 * _1312;
    float _1328 = _1318 * _1230;
    float _1330 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1322);
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1324);
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1326);
    float _1336 = -_1252;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1330);
    out.m_58.x = _1320;
    out.m_58.y = _1328;
    float _1342 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1334);
    float _1344 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1332);
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1348 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1228);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1352 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1348 + _1115;
    out.m_45.x = _1352;
    float _1366 = _1364 * 0.5;
    out.m_60.x = _1356;
    out.m_60.y = _1362;
    out.m_60.z = _1358;
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1143;
    out.gl_Position.z = _1348;
    out.gl_Position.w = _1115;
    out.m_62.z = _1366;
    out.m_62.w = _1115;
    float _1368 = _1360 * _1173;
    float _1370 = -_1360;
    float _1372 = _1370 + 1.0;
    float _1374 = _1184 * _1368;
    float _1376 = _1198 * _1368;
    float _1378 = fma(_1194, _1374, _1178);
    float _1380 = fma(_1196, _1374, _1180);
    float _1382 = _1184 * _1372;
    float _1384 = fma(_1184, _1376, _1182);
    out.m_64.x = _1378;
    out.m_64.y = _1380;
    out.m_64.z = _1384;
    out.m_64.w = _1382;
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
    bool _645 = false;
    bool _383 = false;
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
        float _1441 = as_type<float>(_99);
        out.gl_Position.z = _1441;
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
        float _1510 = as_type<float>(_135);
        out.gl_Position.z = _1510;
    }
    if (_127)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    float _195 = _183 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_189;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_155;
    float _219 = _175;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_155;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _161 = _273;
    }
    float _275 = _161;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_203, 0.5, 0.5);
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_199;
    int _311 = _309 ? 0 : 1;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_287;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_305);
    float _323 = fma(_275, _177, _307);
    int _325 = abs(_311);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _337 = abs(_331);
    float _339 = fma(_275, _179, _327);
    float _341 = float(_321);
    float _343 = fma(_275, _181, _333);
    float _345 = float(_325);
    float _347 = abs(_295);
    float _349 = _341 * _347;
    float _351 = fma(_339, _277, _299);
    float _353 = fma(_343, _277, _301);
    float _355 = float(_337);
    float _357 = fma(_345, _319, _349);
    float _359 = fma(_323, _277, _297);
    float _361 = abs(_315);
    float _363 = fma(_355, _361, _357);
    bool _365 = !_335;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _409 = 1.0 / _395;
    float _411 = 1.0 / _403;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _421 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = 1.0 / _399;
    float _425 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _391 + _427;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _433 = 1.0 / _407;
    float _435 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _391 + _437;
    float _441 = _439 * _409;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _391 + _443;
    out.m_56.x = _435;
    out.m_56.y = _421;
    out.m_56.z = _425;
    out.m_56.w = _419;
    float _447 = _429 * _423;
    float _449 = _445 * _411;
    bool _451 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _453 = isnan(_391);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _465 = _391 + _463;
    float _467 = -_461;
    float _469 = _467 + 1.0;
    float _471 = _465 * _433;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _473;
    bool _477 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _479 = isnan(_391);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _489;
    bool _493 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _495 = isnan(_391);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_475, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_491, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = _487 * _469;
    bool _511 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _513 = isnan(_391);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _527 = -_503;
    float _529 = _527 + 1.0;
    bool _531 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _533 = isnan(_391);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_487;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _551 = _521 * _529;
    float _553 = -_521;
    float _555 = _553 + 1.0;
    float _557 = _503 * _545;
    float _559 = fma(_525, _447, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _561 = fma(_549, _447, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _563 = _541 * _555;
    float _565 = in.m_54.x;
    float _567 = in.m_54.y;
    float _569 = -_541;
    float _571 = _569 + 1.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _573;
    float _577 = _505 * _563;
    float _579 = _507 * _563;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _581;
    float _585 = fma(_575, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _577);
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _579);
    float _591 = fma(_583, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _601 = fma(_559, _551, _587);
    float _603 = fma(_561, _551, _589);
    float _605 = fma(_595, _471, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = fma(_599, _471, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _609 = fma(_585, _557, _601);
    float _611 = fma(_591, _557, _603);
    float _613 = fma(_605, _509, _609);
    float _615 = fma(_607, _509, _611);
    float _617 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[147].x, _613);
    float _619 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[147].y, _615);
    float _621 = _617 * _565;
    float _623 = _619 * _567;
    bool _625 = !_431;
    float _627 = _589;
    float _643;
    if (!_625)
    {
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _631 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        float _647 = float(_83);
        float _649 = 1.0 / _647;
        float _651 = _117 * _649;
        _643 = _651;
    }
    _645 = false;
    float _653 = _643;
    float _655 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _657 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _659 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _661 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _663 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _659);
    float _665 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _661);
    float _667 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _663);
    float _669 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _671 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].x, _655);
    float _673 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].z, _657);
    float _675 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _669);
    float _677 = sqrt(_667);
    float _679 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _665);
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _683 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _675);
    float _685 = _621 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _689 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _691 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].x, _671);
    float _693 = sqrt(_679);
    float _695 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].y, _687);
    float _697 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].w, _689);
    float _699 = _685 * _681;
    float _701 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _703 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].y, _695);
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _707 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].z, _673);
    float _709 = sqrt(_683);
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _713 = _701 * _705;
    float _715 = _691 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _717 = _707 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _719 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].w, _697);
    float _721 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _723 = _677 * _715;
    float _725 = _693 * _711;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _729 = _719 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _731 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _727);
    float _737 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _739 = _709 * _717;
    float _741 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _743 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _745 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _747 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[24].z, _735);
    float _749 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _741);
    float _751 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _743);
    float _753 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].x, _737);
    float _755 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[26].z, _749);
    float _757 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _759 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].w, _751);
    float _761 = _747 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _765 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].w, _757);
    float _767 = _759 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _769 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _753);
    float _771 = _765 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _773 = _767 + _763;
    float _775 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].w, _769);
    float _777 = _771 + _761;
    float _779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _781 = _773 + _779;
    float _783 = _775 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _787 = _777 + _785;
    float _789 = _781 * _781;
    float _791 = fma(_787, _787, _789);
    float _793 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _795 = sqrt(_791);
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _793);
    float _799 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[25].z, _797);
    float _801 = _799 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _803 = _783 + _801;
    bool _805 = _795 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _807 = _801;
    float _809 = _771;
    float _811 = _777;
    float _813 = _773;
    if (!_805)
    {
        _807 = _773;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_805)
    {
        _809 = _803;
    }
    float _819 = _809;
    bool _821 = !_805;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _795 + _827;
        float _831 = rsqrt(_791);
        float _833 = _829 * _825;
        float _835 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = fma(_845, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _853 = fma(_803, _841, _849);
        float _855 = _831 * _851;
        float _857 = fma(_787, _855, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_781, _855, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _823 = _853;
        _811 = _857;
        _817 = _859;
    }
    float _861 = _823;
    float _863 = _811;
    float _865 = _817;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _869 = _861 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _863 + _871;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _865 + _875;
    float _879 = _869 * _869;
    float _881 = fma(_873, _873, _879);
    float _883 = fma(_877, _877, _881);
    float _885 = rsqrt(_883);
    float _887 = sqrt(_883);
    float _889 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _891 = _873 * _889;
    float _893 = _877 * _889;
    float _895 = _891 * _891;
    float _897 = _893 * _893;
    float _899 = _895 + _897;
    float _901 = sqrt(_899);
    bool _903 = _901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _907 = _901 + _905;
    float _909 = _877;
    float _911 = _885;
    float _913 = _907;
    float _915 = _869;
    float _917 = _891;
    if (_903)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _909 = _919;
    }
    float _921 = _909;
    if (_903)
    {
        float _923 = rsqrt(_899);
        _911 = _923;
    }
    float _925 = _911;
    float _927 = _925;
    if (_903)
    {
        float _929 = _907 * _921;
        _913 = _929;
    }
    float _931 = _913;
    if (_903)
    {
        float _933 = _931 * 0.15915493667125701904296875;
        _813 = _933;
    }
    float _935 = _813;
    float _937 = _921;
    float _939 = _935;
    if (_903)
    {
        float _941 = _935 * 6.283185482025146484375;
        float _943 = sin(_941);
        _937 = _943;
    }
    float _945 = _937;
    float _947 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _949 = precise::max(0.0, _947);
    float _951 = _795;
    float _953 = _949;
    if (_903)
    {
        float _955 = _935 * 6.283185482025146484375;
        float _957 = cos(_955);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = -_889;
    float _963 = -_949;
    float _965 = fma(_869, _961, _963);
    if (!_903)
    {
        _915 = _895;
    }
    float _967 = _915;
    float _969 = _967;
    if (_903)
    {
        float _971 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _971;
    }
    float _973 = _953;
    float _975 = _945;
    float _977 = _973;
    if (_903)
    {
        float _979 = fma(_945, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _981;
    if (_903)
    {
        float _985 = _959 + (-1.0);
        _977 = _985;
    }
    float _987 = _977;
    float _989 = _987;
    if (_903)
    {
        float _991 = _925 * _981;
        _627 = _991;
    }
    float _993 = _627;
    if (!_903)
    {
        _927 = _965;
    }
    float _995 = _927;
    float _997 = _995;
    if (_903)
    {
        float _999 = _987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _939 = _999;
    }
    float _1001 = _939;
    if (_903)
    {
        float _1003 = _891 * _993;
        _917 = _1003;
    }
    float _1005 = _917;
    if (!_903)
    {
        _983 = _893;
    }
    float _1007 = _983;
    float _1009 = _1007;
    if (_903)
    {
        float _1011 = _893 * _993;
        _1009 = _1011;
    }
    float _1013 = _1009;
    if (_903)
    {
        float _1015 = fma(_965, _959, _1001);
        _997 = _1015;
    }
    float _1017 = _997;
    if (_903)
    {
        float _1019 = _1005 * _1005;
        _969 = _1019;
    }
    float _1021 = _969;
    if (!_903)
    {
        _989 = _897;
    }
    float _1023 = _989;
    float _1025 = _1023;
    if (_903)
    {
        float _1027 = _1013 * _1013;
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = fma(_1017, _1017, _1021);
    float _1033 = _1031 + _1029;
    float _1035 = _861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1039 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1037);
    float _1041 = precise::clamp(_1039, 0.0, 1.0);
    float _1043 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1045 = rsqrt(_1033);
    float _1047 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1035);
    float _1049 = _861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1051 = -_1041;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1047);
    float _1057 = _861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1059 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1049);
    float _1061 = _861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1063 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1065 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1057);
    float _1067 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1059);
    float _1069 = abs(_1053);
    float _1071 = log2(_1069);
    float _1073 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1061);
    float _1075 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1065);
    float _1077 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1079 = _1045 * _1005;
    float _1081 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1073);
    float _1083 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1085 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1087 = _1045 * _1017;
    float _1089 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1091 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1093 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1085);
    float _1095 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1097 = _1045 * _1013;
    float _1099 = -_1089;
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1099);
    float _1103 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1093);
    float _1105 = -_1095;
    float _1107 = fma(_1105, _1043, 1.0);
    float _1109 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = -_1097;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1101);
    float _1115 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1103);
    float _1117 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1119 = exp2(_1109);
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1125 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1117);
    float _1127 = fma(_1113, 0.5, 0.5);
    float _1129 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1123);
    float _1131 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1125);
    float _1133 = log2(_1107);
    float _1135 = _1087 + 1.0;
    float _1137 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1129);
    float _1139 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1131);
    float _1141 = fma(_1127, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1143 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1137);
    float _1145 = 1.0 / _1115;
    float _1147 = -_1087;
    float _1149 = fma(_1119, _1135, _1147);
    float _1151 = fma(_1127, _1141, -0.212114393711090087890625);
    float _1153 = fma(_1149, 0.5, 0.5);
    float _1155 = fma(_1127, _1151, 1.570728778839111328125);
    float _1157 = sqrt(_1121);
    float _1159 = _1133 * 0.693147182464599609375;
    float _1161 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1163 = _1139 * _1145;
    float _1165 = _1143 * _1145;
    float _1167 = fma(_1163, 0.5, 0.5);
    float _1169 = fma(_1165, -0.5, 0.5);
    float _1171 = _1157 * 0.636619746685028076171875;
    float3 _3236 = float3(_1167, _1169, _1161);
    float _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).x;
    float3 _3247 = float3(_1167, _1169, _1161);
    float4 _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).xyzw;
    float _1178 = _1176.x;
    float _1180 = _1176.y;
    float _1182 = _1176.z;
    float _1184 = _1176.w;
    float _1186 = -_1155;
    float _1188 = fma(_1171, _1186, 1.0);
    float2 _3269 = float2(_1188, _1153);
    float3 _1192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3269, float2(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3269, float2(0.0), isnan(_3269)), level(0.0)).xyz;
    float _1194 = _1192.x;
    float _1196 = _1192.y;
    float _1198 = _1192.z;
    float _1200 = in.m_49.y;
    float _1202 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1204 = _137 > 0.5;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1208 = _653 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1210;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1216 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1220 = _1218 != 0;
    float _1222 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1224 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1216);
    float _1226 = 1.0 / _1212;
    float _1228 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1232 = _1200 > 0.5;
    float _1234 = -_215;
    int _1236 = _1204 ? as_type<int>(_1234) : as_type<int>(_215);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1240 = _1238 != 0;
    float _1242 = -_207;
    int _1244 = _1232 ? as_type<int>(_1242) : as_type<int>(_207);
    float _1246 = _1208 * _1226;
    bool _1248 = !_1220;
    float _1250 = _1248 ? _215 : as_type<float>(_1236);
    float _1252 = exp2(_1202);
    bool _1254 = !_1240;
    float _1256 = _1254 ? _207 : as_type<float>(_1244);
    float _1258 = _1250 + 0.5;
    float _1260 = -_1256;
    float _1262 = _1260 + 0.5;
    bool _1264 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1266 = isnan(_653);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1278 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1280 = isnan(_653);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1298;
    float _1302 = -_1274;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1292, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1308 = fma(_1296, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1310 = fma(_1300, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1312 = _1288 * _1304;
    float _1314 = -_1288;
    float _1316 = _1314 + 1.0;
    float _1318 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1320 = _1276 * _1214;
    float _1322 = _1306 * _1312;
    float _1324 = _1308 * _1312;
    float _1326 = _1310 * _1312;
    float _1328 = _1318 * _1230;
    float _1330 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1322);
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1324);
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1326);
    float _1336 = -_1252;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1330);
    out.m_58.x = _1320;
    out.m_58.y = _1328;
    float _1342 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1334);
    float _1344 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1332);
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1348 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1228);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1352 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1348 + _1115;
    out.m_45.x = _1352;
    float _1366 = _1364 * 0.5;
    out.m_60.x = _1356;
    out.m_60.y = _1362;
    out.m_60.z = _1358;
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1143;
    out.gl_Position.z = _1348;
    out.gl_Position.w = _1115;
    out.m_62.z = _1366;
    out.m_62.w = _1115;
    float _1368 = _1360 * _1173;
    float _1370 = -_1360;
    float _1372 = _1370 + 1.0;
    float _1374 = _1184 * _1368;
    float _1376 = _1198 * _1368;
    float _1378 = fma(_1194, _1374, _1178);
    float _1380 = fma(_1196, _1374, _1180);
    float _1382 = _1184 * _1372;
    float _1384 = fma(_1184, _1376, _1182);
    out.m_64.x = _1378;
    out.m_64.y = _1380;
    out.m_64.z = _1384;
    out.m_64.w = _1382;
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
    bool _645 = false;
    bool _383 = false;
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
        float _1441 = as_type<float>(_99);
        out.gl_Position.z = _1441;
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
        float _1510 = as_type<float>(_135);
        out.gl_Position.z = _1510;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = _141 * _139;
    float _159 = 0.0;
    float _161 = _145;
    if (!_155)
    {
        float _163 = _145 * _145;
        float _165 = _163 * 0.5;
        _159 = _165;
    }
    float _167 = _159;
    float _169 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _171 = _167;
    if (!_155)
    {
        float _173 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = in.m_47.x;
    float _179 = in.m_47.y;
    float _181 = in.m_47.z;
    float _183 = _169 * 6.283185482025146484375;
    float _185 = floor(_169);
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    float _195 = _183 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _195 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_189;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_155;
    float _219 = _175;
    if (!_217)
    {
        float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = log2(_221);
        float _225 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _227 = _225 + 1.0;
        float _229 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = _145 * _223;
        float _233 = 1.0 / _227;
        float _235 = _229 * 0.693147182464599609375;
        float _237 = exp2(_231);
        float _239 = 1.0 / _235;
        float _241 = _237 + (-1.0);
        float _243 = -_241;
        float _245 = fma(_243, _239, _145);
        float _247 = _245 * _233;
        float _249 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _219 = _249;
    }
    float _251 = _219;
    bool _253 = !_155;
    if (!_253)
    {
        float _255 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _257 = log2(_255);
        float _259 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _261 = _259 + 1.0;
        float _263 = 1.0 / _261;
        float _265 = _145 * _257;
        float _267 = exp2(_265);
        float _269 = -_267;
        float _271 = _269 + 1.0;
        float _273 = _271 * _263;
        _161 = _273;
    }
    float _275 = _161;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    float _287 = fma(_203, 0.5, 0.5);
    bool _289 = _211 < 0.5;
    float _291 = float(_289);
    float _293 = -_211;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_199;
    int _311 = _309 ? 0 : 1;
    float _313 = -_291;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_287;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_305);
    float _323 = fma(_275, _177, _307);
    int _325 = abs(_311);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _337 = abs(_331);
    float _339 = fma(_275, _179, _327);
    float _341 = float(_321);
    float _343 = fma(_275, _181, _333);
    float _345 = float(_325);
    float _347 = abs(_295);
    float _349 = _341 * _347;
    float _351 = fma(_339, _277, _299);
    float _353 = fma(_343, _277, _301);
    float _355 = float(_337);
    float _357 = fma(_345, _319, _349);
    float _359 = fma(_323, _277, _297);
    float _361 = abs(_315);
    float _363 = fma(_355, _361, _357);
    bool _365 = !_335;
    float _381;
    if (!_365)
    {
        float _367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _369 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _371 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _373 = _371 * _367;
        float _375 = floor(_373);
        float _377 = -_375;
        float _379 = _373 + _377;
        _381 = _379;
        _383 = true;
    }
    else
    {
        float _385 = float(_83);
        float _387 = 1.0 / _385;
        float _389 = _117 * _387;
        _381 = _389;
    }
    _383 = false;
    float _391 = _381;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _409 = 1.0 / _395;
    float _411 = 1.0 / _403;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _421 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = 1.0 / _399;
    float _425 = _417 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _429 = _391 + _427;
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _433 = 1.0 / _407;
    float _435 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _391 + _437;
    float _441 = _439 * _409;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _391 + _443;
    out.m_56.x = _435;
    out.m_56.y = _421;
    out.m_56.z = _425;
    out.m_56.w = _419;
    float _447 = _429 * _423;
    float _449 = _445 * _411;
    bool _451 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _453 = isnan(_391);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _465 = _391 + _463;
    float _467 = -_461;
    float _469 = _467 + 1.0;
    float _471 = _465 * _433;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _473;
    bool _477 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _479 = isnan(_391);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _489;
    bool _493 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _495 = isnan(_391);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _501 = _497 || _499;
    float _503 = float(_501);
    float _505 = fma(_475, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = fma(_491, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = _487 * _469;
    bool _511 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _513 = isnan(_391);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _527 = -_503;
    float _529 = _527 + 1.0;
    bool _531 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _533 = isnan(_391);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_487;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _551 = _521 * _529;
    float _553 = -_521;
    float _555 = _553 + 1.0;
    float _557 = _503 * _545;
    float _559 = fma(_525, _447, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _561 = fma(_549, _447, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _563 = _541 * _555;
    float _565 = in.m_54.x;
    float _567 = in.m_54.y;
    float _569 = -_541;
    float _571 = _569 + 1.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _573;
    float _577 = _505 * _563;
    float _579 = _507 * _563;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _581;
    float _585 = fma(_575, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _587 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].x, _577);
    float _589 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[143].y, _579);
    float _591 = fma(_583, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _601 = fma(_559, _551, _587);
    float _603 = fma(_561, _551, _589);
    float _605 = fma(_595, _471, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _607 = fma(_599, _471, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _609 = fma(_585, _557, _601);
    float _611 = fma(_591, _557, _603);
    float _613 = fma(_605, _509, _609);
    float _615 = fma(_607, _509, _611);
    float _617 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[147].x, _613);
    float _619 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[147].y, _615);
    float _621 = _617 * _565;
    float _623 = _619 * _567;
    bool _625 = !_431;
    float _627 = _589;
    float _643;
    if (!_625)
    {
        float _629 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _631 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _633 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _635 = _633 * _629;
        float _637 = floor(_635);
        float _639 = -_637;
        float _641 = _635 + _639;
        _643 = _641;
        _645 = true;
    }
    else
    {
        float _647 = float(_83);
        float _649 = 1.0 / _647;
        float _651 = _117 * _649;
        _643 = _651;
    }
    _645 = false;
    float _653 = _643;
    float _655 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _657 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _659 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _661 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _663 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _659);
    float _665 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _661);
    float _667 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _663);
    float _669 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _671 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].x, _655);
    float _673 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].z, _657);
    float _675 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _669);
    float _677 = sqrt(_667);
    float _679 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _665);
    float _681 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _683 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _675);
    float _685 = _621 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _689 = _351 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _691 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].x, _671);
    float _693 = sqrt(_679);
    float _695 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].y, _687);
    float _697 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[14].w, _689);
    float _699 = _685 * _681;
    float _701 = _623 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _703 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].y, _695);
    float _705 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _707 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].z, _673);
    float _709 = sqrt(_683);
    float _711 = _703 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _713 = _701 * _705;
    float _715 = _691 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _717 = _707 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _719 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[16].w, _697);
    float _721 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _723 = _677 * _715;
    float _725 = _693 * _711;
    float _727 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _729 = _719 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _731 = _725 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _733 = _725 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _735 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[24].x, _727);
    float _737 = _725 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _739 = _709 * _717;
    float _741 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _743 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[26].x, _731);
    float _745 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[24].x, _733);
    float _747 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[24].z, _735);
    float _749 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[26].x, _741);
    float _751 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].z, _743);
    float _753 = fma(_723, (*spvDescriptorSet0.vp_c8)._m0[25].x, _737);
    float _755 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[26].z, _749);
    float _757 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].z, _745);
    float _759 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[26].w, _751);
    float _761 = _747 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _763 = _755 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _765 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[24].w, _757);
    float _767 = _759 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _769 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].z, _753);
    float _771 = _765 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _773 = _767 + _763;
    float _775 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[25].w, _769);
    float _777 = _771 + _761;
    float _779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _781 = _773 + _779;
    float _783 = _775 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _785 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _787 = _777 + _785;
    float _789 = _781 * _781;
    float _791 = fma(_787, _787, _789);
    float _793 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _795 = sqrt(_791);
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[25].x, _793);
    float _799 = fma(_721, (*spvDescriptorSet0.vp_c8)._m0[25].z, _797);
    float _801 = _799 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _803 = _783 + _801;
    bool _805 = _795 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _807 = _801;
    float _809 = _771;
    float _811 = _777;
    float _813 = _773;
    if (!_805)
    {
        _807 = _773;
    }
    float _815 = _807;
    float _817 = _815;
    if (!_805)
    {
        _809 = _803;
    }
    float _819 = _809;
    bool _821 = !_805;
    float _823 = _819;
    if (!_821)
    {
        float _825 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _827 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _829 = _795 + _827;
        float _831 = rsqrt(_791);
        float _833 = _829 * _825;
        float _835 = _803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _837 = _833 * 0.15915493667125701904296875;
        float _839 = _837 * 6.283185482025146484375;
        float _841 = cos(_839);
        float _843 = _837 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = _841 + (-1.0);
        float _849 = _847 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = fma(_845, _835, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _853 = fma(_803, _841, _849);
        float _855 = _831 * _851;
        float _857 = fma(_787, _855, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _859 = fma(_781, _855, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _823 = _853;
        _811 = _857;
        _817 = _859;
    }
    float _861 = _823;
    float _863 = _811;
    float _865 = _817;
    float _867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _869 = _861 + _867;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _873 = _863 + _871;
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _865 + _875;
    float _879 = _869 * _869;
    float _881 = fma(_873, _873, _879);
    float _883 = fma(_877, _877, _881);
    float _885 = rsqrt(_883);
    float _887 = sqrt(_883);
    float _889 = _885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _891 = _873 * _889;
    float _893 = _877 * _889;
    float _895 = _891 * _891;
    float _897 = _893 * _893;
    float _899 = _895 + _897;
    float _901 = sqrt(_899);
    bool _903 = _901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _907 = _901 + _905;
    float _909 = _877;
    float _911 = _885;
    float _913 = _907;
    float _915 = _869;
    float _917 = _891;
    if (_903)
    {
        float _919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _909 = _919;
    }
    float _921 = _909;
    if (_903)
    {
        float _923 = rsqrt(_899);
        _911 = _923;
    }
    float _925 = _911;
    float _927 = _925;
    if (_903)
    {
        float _929 = _907 * _921;
        _913 = _929;
    }
    float _931 = _913;
    if (_903)
    {
        float _933 = _931 * 0.15915493667125701904296875;
        _813 = _933;
    }
    float _935 = _813;
    float _937 = _921;
    float _939 = _935;
    if (_903)
    {
        float _941 = _935 * 6.283185482025146484375;
        float _943 = sin(_941);
        _937 = _943;
    }
    float _945 = _937;
    float _947 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _949 = precise::max(0.0, _947);
    float _951 = _795;
    float _953 = _949;
    if (_903)
    {
        float _955 = _935 * 6.283185482025146484375;
        float _957 = cos(_955);
        _951 = _957;
    }
    float _959 = _951;
    float _961 = -_889;
    float _963 = -_949;
    float _965 = fma(_869, _961, _963);
    if (!_903)
    {
        _915 = _895;
    }
    float _967 = _915;
    float _969 = _967;
    if (_903)
    {
        float _971 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _971;
    }
    float _973 = _953;
    float _975 = _945;
    float _977 = _973;
    if (_903)
    {
        float _979 = fma(_945, _973, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _975 = _979;
    }
    float _981 = _975;
    float _983 = _981;
    if (_903)
    {
        float _985 = _959 + (-1.0);
        _977 = _985;
    }
    float _987 = _977;
    float _989 = _987;
    if (_903)
    {
        float _991 = _925 * _981;
        _627 = _991;
    }
    float _993 = _627;
    if (!_903)
    {
        _927 = _965;
    }
    float _995 = _927;
    float _997 = _995;
    if (_903)
    {
        float _999 = _987 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _939 = _999;
    }
    float _1001 = _939;
    if (_903)
    {
        float _1003 = _891 * _993;
        _917 = _1003;
    }
    float _1005 = _917;
    if (!_903)
    {
        _983 = _893;
    }
    float _1007 = _983;
    float _1009 = _1007;
    if (_903)
    {
        float _1011 = _893 * _993;
        _1009 = _1011;
    }
    float _1013 = _1009;
    if (_903)
    {
        float _1015 = fma(_965, _959, _1001);
        _997 = _1015;
    }
    float _1017 = _997;
    if (_903)
    {
        float _1019 = _1005 * _1005;
        _969 = _1019;
    }
    float _1021 = _969;
    if (!_903)
    {
        _989 = _897;
    }
    float _1023 = _989;
    float _1025 = _1023;
    if (_903)
    {
        float _1027 = _1013 * _1013;
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = fma(_1017, _1017, _1021);
    float _1033 = _1031 + _1029;
    float _1035 = _861 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1037 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1039 = fma(_887, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1037);
    float _1041 = precise::clamp(_1039, 0.0, 1.0);
    float _1043 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1045 = rsqrt(_1033);
    float _1047 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1035);
    float _1049 = _861 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1051 = -_1041;
    float _1053 = _1051 + 1.0;
    float _1055 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1047);
    float _1057 = _861 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1059 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1049);
    float _1061 = _861 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1063 = _1055 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1065 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1057);
    float _1067 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1059);
    float _1069 = abs(_1053);
    float _1071 = log2(_1069);
    float _1073 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1061);
    float _1075 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1065);
    float _1077 = _1067 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1079 = _1045 * _1005;
    float _1081 = fma(_865, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1073);
    float _1083 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1085 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1087 = _1045 * _1017;
    float _1089 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1091 = _1081 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1093 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1085);
    float _1095 = _1063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1097 = _1045 * _1013;
    float _1099 = -_1089;
    float _1101 = fma(_1087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1099);
    float _1103 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1093);
    float _1105 = -_1095;
    float _1107 = fma(_1105, _1043, 1.0);
    float _1109 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1111 = -_1097;
    float _1113 = fma(_1111, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1101);
    float _1115 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1103);
    float _1117 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1119 = exp2(_1109);
    float _1121 = fma(_1113, -0.5, 0.5);
    float _1123 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1125 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1117);
    float _1127 = fma(_1113, 0.5, 0.5);
    float _1129 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1123);
    float _1131 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1125);
    float _1133 = log2(_1107);
    float _1135 = _1087 + 1.0;
    float _1137 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1129);
    float _1139 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1131);
    float _1141 = fma(_1127, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1143 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1137);
    float _1145 = 1.0 / _1115;
    float _1147 = -_1087;
    float _1149 = fma(_1119, _1135, _1147);
    float _1151 = fma(_1127, _1141, -0.212114393711090087890625);
    float _1153 = fma(_1149, 0.5, 0.5);
    float _1155 = fma(_1127, _1151, 1.570728778839111328125);
    float _1157 = sqrt(_1121);
    float _1159 = _1133 * 0.693147182464599609375;
    float _1161 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1163 = _1139 * _1145;
    float _1165 = _1143 * _1145;
    float _1167 = fma(_1163, 0.5, 0.5);
    float _1169 = fma(_1165, -0.5, 0.5);
    float _1171 = _1157 * 0.636619746685028076171875;
    float3 _3236 = float3(_1167, _1169, _1161);
    float _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3236, float3(0.0), isnan(_3236)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3236, float3(0.0), isnan(_3236)), level(0.0)).x;
    float3 _3247 = float3(_1167, _1169, _1161);
    float4 _1176 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3247, float3(0.0), isnan(_3247)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3247, float3(0.0), isnan(_3247)), level(0.0)).xyzw;
    float _1178 = _1176.x;
    float _1180 = _1176.y;
    float _1182 = _1176.z;
    float _1184 = _1176.w;
    float _1186 = -_1155;
    float _1188 = fma(_1171, _1186, 1.0);
    float2 _3269 = float2(_1188, _1153);
    float3 _1192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3269, float2(0.0), isnan(_3269)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3269, float2(0.0), isnan(_3269)), level(0.0)).xyz;
    float _1194 = _1192.x;
    float _1196 = _1192.y;
    float _1198 = _1192.z;
    float _1200 = in.m_49.y;
    float _1202 = _1071 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1204 = _137 > 0.5;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1208 = _653 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1210;
    float _1214 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1216 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1220 = _1218 != 0;
    float _1222 = _363 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1224 = fma(_1083, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1216);
    float _1226 = 1.0 / _1212;
    float _1228 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1224);
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1232 = _1200 > 0.5;
    float _1234 = -_215;
    int _1236 = _1204 ? as_type<int>(_1234) : as_type<int>(_215);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1240 = _1238 != 0;
    float _1242 = -_207;
    int _1244 = _1232 ? as_type<int>(_1242) : as_type<int>(_207);
    float _1246 = _1208 * _1226;
    bool _1248 = !_1220;
    float _1250 = _1248 ? _215 : as_type<float>(_1236);
    float _1252 = exp2(_1202);
    bool _1254 = !_1240;
    float _1256 = _1254 ? _207 : as_type<float>(_1244);
    float _1258 = _1250 + 0.5;
    float _1260 = -_1256;
    float _1262 = _1260 + 0.5;
    bool _1264 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1266 = isnan(_653);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1272 = _1268 || _1270;
    float _1274 = float(_1272);
    float _1276 = _1258 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1278 = _653 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1280 = isnan(_653);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1298;
    float _1302 = -_1274;
    float _1304 = _1302 + 1.0;
    float _1306 = fma(_1292, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1308 = fma(_1296, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1310 = fma(_1300, _1246, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1312 = _1288 * _1304;
    float _1314 = -_1288;
    float _1316 = _1314 + 1.0;
    float _1318 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1320 = _1276 * _1214;
    float _1322 = _1306 * _1312;
    float _1324 = _1308 * _1312;
    float _1326 = _1310 * _1312;
    float _1328 = _1318 * _1230;
    float _1330 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1322);
    float _1332 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1324);
    float _1334 = fma(_1316, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1326);
    float _1336 = -_1252;
    float _1338 = _1336 + 1.0;
    float _1340 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1330);
    out.m_58.x = _1320;
    out.m_58.y = _1328;
    float _1342 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1334);
    float _1344 = fma(_1274, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1332);
    float _1346 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1348 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1228);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1352 = _1222 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1354 = _1344 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1356 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1358 = _1350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1360 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1362 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1364 = _1348 + _1115;
    out.m_45.x = _1352;
    float _1366 = _1364 * 0.5;
    out.m_60.x = _1356;
    out.m_60.y = _1362;
    out.m_60.z = _1358;
    out.gl_Position.x = _1139;
    out.gl_Position.y = _1143;
    out.gl_Position.z = _1348;
    out.gl_Position.w = _1115;
    out.m_62.z = _1366;
    out.m_62.w = _1115;
    float _1368 = _1360 * _1173;
    float _1370 = -_1360;
    float _1372 = _1370 + 1.0;
    float _1374 = _1184 * _1368;
    float _1376 = _1198 * _1368;
    float _1378 = fma(_1194, _1374, _1178);
    float _1380 = fma(_1196, _1374, _1180);
    float _1382 = _1184 * _1372;
    float _1384 = fma(_1184, _1376, _1182);
    out.m_64.x = _1378;
    out.m_64.y = _1380;
    out.m_64.z = _1384;
    out.m_64.w = _1382;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

