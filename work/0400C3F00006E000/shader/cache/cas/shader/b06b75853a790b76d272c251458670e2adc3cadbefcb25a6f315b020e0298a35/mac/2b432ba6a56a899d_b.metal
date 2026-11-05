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
    bool _643 = false;
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
        float _1731 = as_type<float>(_99);
        out.gl_Position.z = _1731;
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
        float _1800 = as_type<float>(_135);
        out.gl_Position.z = _1800;
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
    float _641;
    if (!_625)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _629 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_83);
        float _647 = 1.0 / _645;
        float _649 = _117 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = in.m_49.y;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _663 = _137 > 0.5;
    float _665 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = 1.0 / _657;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _675 = _673 != 0;
    float _677 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _679 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _681 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _683 = 1.0 / _661;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _685;
    float _689 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _677);
    float _691 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _679);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _695 = _651 + _693;
    float _697 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _689);
    bool _699 = _653 > 0.5;
    float _701 = 1.0 / _687;
    float _703 = _695 * _667;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _707 = _651 + _705;
    float _709 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _681);
    float _711 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _715 = _651 + _713;
    float _717 = _707 * _683;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _727;
    float _731 = _697 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = fma(_721, _703, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _743 = _715 * _701;
    float _745 = fma(_725, _703, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _747 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _749 = isnan(_651);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _763 = fma(_729, _703, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _765 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _767 = isnan(_651);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_737, _717, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _779 = -_757;
    float _781 = _779 + 1.0;
    float _783 = fma(_741, _717, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _785 = fma(_761, _717, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _787 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _789 = isnan(_651);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _775 * _781;
    float _801 = -_775;
    float _803 = _801 + 1.0;
    bool _805 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _807 = isnan(_651);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _711 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _819 = -_797;
    float _821 = _819 + 1.0;
    float _823 = _797 * _803;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _825;
    float _829 = _815 * _821;
    float _831 = -_815;
    float _833 = _831 + 1.0;
    float _835 = _745 * _829;
    float _837 = _733 * _829;
    float _839 = _763 * _829;
    float _841 = _709 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].x, _835);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _845;
    float _849 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _841 + _851;
    float _855 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].y, _837);
    float _857 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].z, _839);
    float _859 = fma(_777, _823, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _731 + _861;
    float _865 = _853 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _867;
    float _871 = fma(_783, _823, _855);
    float _873 = fma(_785, _823, _857);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _817 + _875;
    float _879 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].x, _865);
    float _881 = -_215;
    int _883 = _663 ? as_type<int>(_881) : as_type<int>(_215);
    float _885 = fma(_869, _743, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _889 = fma(_847, _743, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _879);
    bool _893 = !_671;
    float _895 = _893 ? _215 : as_type<float>(_883);
    float _897 = fma(_885, _799, _859);
    float _899 = -_207;
    int _901 = _699 ? as_type<int>(_899) : as_type<int>(_207);
    float _903 = _853 * _853;
    bool _905 = _891 >= 0.0;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _909 = !_675;
    float _911 = _909 ? _207 : as_type<float>(_901);
    float _913 = _895 + 0.5;
    float _915 = fma(_849, _799, _871);
    float _917 = fma(_889, _799, _873);
    float _919 = fma(_863, _863, _903);
    float _921 = _913 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _923 = -_911;
    float _925 = _923 + 0.5;
    float _927 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].x, _897);
    float _929 = fma(_877, _877, _919);
    float _931 = _921 * _887;
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _935 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].y, _915);
    float _937 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].z, _917);
    float _939 = rsqrt(_929);
    float _941 = _903;
    float _943 = _841;
    if (_905)
    {
        _941 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _945 = _941;
    float _947 = _933 * _907;
    float _949 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _951 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _953 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _955 = as_type<int>(_945);
    if (_905)
    {
        float _957 = _945 * 5.0;
        _955 = as_type<int>(_957);
    }
    int _959 = _955;
    float _961 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _931;
    out.m_58.y = _947;
    if (_905)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3155 = as_type<float>(_959);
        out.gl_Position.z = _3155;
    }
    float _967 = _853 * _939;
    float _969 = _863 * _939;
    out.m_60.x = _961;
    out.m_60.y = _963;
    out.m_60.z = _965;
    if (_905)
    {
        out.m_45.x = 0.0;
    }
    if (_905)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _971 = -_967;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _841);
    float _975 = _877 * _939;
    float _977 = -_969;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    float _981 = -_967;
    float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _987 = _973 + _985;
    float _989 = -_975;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _817);
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _995 = _979 + _993;
    float _997 = -_969;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _1001 = _987 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1005 = _991 + _1003;
    float _1007 = _983 * _983;
    float _1009 = -_975;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1001);
    float _1015 = _363 * _621;
    float _1017 = fma(_999, _999, _1007);
    float _1019 = _363 * _623;
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1013);
    float _1023 = fma(_1011, _1011, _1017);
    bool _1025 = _1021 >= 0.0;
    float _1027 = sqrt(_1023);
    float _1029 = _1005;
    if (_1025)
    {
        _1029 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1031 = _1029;
    int _1033 = as_type<int>(_1031);
    if (_1025)
    {
        out.m_45.x = 0.0;
    }
    float _1035 = _939 * _1027;
    if (_1025)
    {
        float _1037 = _1031 * 5.0;
        _1033 = as_type<int>(_1037);
    }
    int _1039 = _1033;
    if (_1025)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3305 = as_type<float>(_1039);
        out.gl_Position.z = _3305;
    }
    if (_1025)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1041 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1045 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _1049 = _1035 * _1041;
    float _1051 = _1035 * _1043;
    float _1053 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1055 = _1053 * 0.5;
    float _1057 = _1045 * _1049;
    float _1059 = _1047 * _1051;
    float _1061 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1067 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1061);
    float _1069 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1063);
    float _1071 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1065);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1067);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1069);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1071);
    float _1079 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1081 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1083 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1085 = _817 + _1079;
    float _1087 = _731 + _1081;
    float _1089 = _841 + _1083;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1093 = _1085 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1097 = _1087 + _1095;
    float _1099 = _1093 * _1093;
    float _1101 = fma(_1097, _1097, _1099);
    float _1103 = sqrt(_1101);
    bool _1105 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1107 = _1077;
    float _1109 = _1083;
    float _1111 = _1087;
    if (!_1105)
    {
        _943 = _1087;
    }
    float _1113 = _943;
    float _1115 = _1113;
    if (!_1105)
    {
        _1107 = _1085;
    }
    float _1117 = _1107;
    float _1119 = _1117;
    if (!_1105)
    {
        _1109 = _1089;
    }
    float _1121 = _1109;
    bool _1123 = !_1105;
    float _1125 = _1121;
    if (!_1123)
    {
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1131 = _1103 + _1129;
        float _1133 = _1089 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = rsqrt(_1101);
        float _1137 = _1131 * _1127;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = _1139 * 6.283185482025146484375;
        float _1143 = cos(_1141);
        float _1145 = _1139 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = _1143 + (-1.0);
        float _1151 = fma(_1147, _1133, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1153 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = _1135 * _1151;
        float _1157 = fma(_1089, _1143, _1153);
        float _1159 = fma(_1097, _1155, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1161 = fma(_1093, _1155, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1125 = _1157;
        _1115 = _1159;
        _1119 = _1161;
    }
    float _1163 = _1125;
    float _1165 = _1115;
    float _1167 = _1119;
    float _1169 = -_967;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1163);
    float _1173 = -_969;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1165);
    float _1177 = -_975;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1183 = _1171 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = _1175 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = _1179 + _1189;
    float _1193 = _1183 * _1183;
    float _1195 = fma(_1187, _1187, _1193);
    float _1197 = fma(_1191, _1191, _1195);
    float _1199 = rsqrt(_1197);
    float _1201 = sqrt(_1197);
    float _1203 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1205 = _1187 * _1203;
    float _1207 = _1191 * _1203;
    float _1209 = _1205 * _1205;
    float _1211 = _1207 * _1207;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1213);
    float _1217 = precise::clamp(_1215, 0.0, 1.0);
    float _1219 = _1209 + _1211;
    float _1221 = sqrt(_1219);
    bool _1223 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1227 = _1221 + _1225;
    float _1229 = _1191;
    float _1231 = _1219;
    float _1233 = _1227;
    float _1235 = _1203;
    if (_1223)
    {
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1237;
    }
    float _1239 = _1229;
    if (_1223)
    {
        float _1241 = rsqrt(_1219);
        _1231 = _1241;
    }
    float _1243 = _1231;
    if (_1223)
    {
        float _1245 = _1227 * _1239;
        _1233 = _1245;
    }
    float _1247 = _1233;
    if (_1223)
    {
        float _1249 = _1247 * 0.15915493667125701904296875;
        _1111 = _1249;
    }
    float _1251 = _1111;
    float _1253 = _1193;
    float _1255 = _1251;
    if (_1223)
    {
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        _1253 = _1259;
    }
    float _1261 = _1253;
    float _1263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1265 = precise::max(0.0, _1263);
    float _1267 = _1199;
    float _1269 = _1263;
    float _1271 = _1265;
    if (_1223)
    {
        float _1273 = _1251 * 6.283185482025146484375;
        float _1275 = cos(_1273);
        _1267 = _1275;
    }
    float _1277 = _1267;
    float _1279 = -_1203;
    float _1281 = -_1265;
    float _1283 = fma(_1183, _1279, _1281);
    float _1285 = _1283;
    if (_1223)
    {
        float _1287 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1287;
    }
    float _1289 = _1269;
    float _1291 = _1261;
    float _1293 = _1289;
    if (_1223)
    {
        float _1295 = fma(_1261, _1289, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1295;
    }
    float _1297 = _1271;
    float _1299 = _1297;
    if (!_1223)
    {
        _1291 = _1205;
    }
    float _1301 = _1291;
    float _1303 = _1301;
    float _1305 = _1277;
    if (_1223)
    {
        float _1307 = _1277 + (-1.0);
        _1293 = _1307;
    }
    float _1309 = _1293;
    float _1311 = _1309;
    if (_1223)
    {
        float _1313 = _1243 * _1297;
        _1235 = _1313;
    }
    float _1315 = _1235;
    if (!_1223)
    {
        _1299 = _1283;
    }
    float _1317 = _1299;
    float _1319 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1321 = _1317;
    if (_1223)
    {
        float _1323 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1323;
    }
    float _1325 = _1255;
    if (_1223)
    {
        float _1327 = _1205 * _1315;
        _1303 = _1327;
    }
    float _1329 = _1303;
    if (!_1223)
    {
        _1311 = _1207;
    }
    float _1331 = _1311;
    float _1333 = _1331;
    if (_1223)
    {
        float _1335 = _1207 * _1315;
        _1333 = _1335;
    }
    float _1337 = _1333;
    if (_1223)
    {
        float _1339 = fma(_1283, _1277, _1325);
        _1321 = _1339;
    }
    float _1341 = _1321;
    if (!_1223)
    {
        _1285 = _1209;
    }
    float _1343 = _1285;
    float _1345 = _1343;
    if (_1223)
    {
        float _1347 = _1329 * _1329;
        _1345 = _1347;
    }
    float _1349 = _1345;
    float _1351 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1223)
    {
        _1305 = _1211;
    }
    float _1353 = _1305;
    float _1355 = _1353;
    if (_1223)
    {
        float _1357 = _1337 * _1337;
        _1355 = _1357;
    }
    float _1359 = _1355;
    float _1361 = fma(_1341, _1341, _1349);
    float _1363 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1365 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1351);
    float _1367 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1319);
    float _1369 = _1361 + _1359;
    float _1371 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1363);
    float _1373 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1375 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1365);
    float _1377 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1367);
    float _1379 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1371);
    float _1381 = rsqrt(_1369);
    float _1383 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1373);
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = -_1217;
    float _1391 = _1389 + 1.0;
    float _1393 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1397 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1401 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1403 = abs(_1391);
    float _1405 = log2(_1403);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1397);
    float _1409 = -_1399;
    float _1411 = fma(_1409, _1395, 1.0);
    float _1413 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1407);
    float _1417 = _1381 * _1329;
    float _1419 = _1381 * _1341;
    float _1421 = _1381 * _1337;
    float _1423 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1415);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1427 = log2(_1411);
    float _1429 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1431 = -_1425;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1431);
    float _1435 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1437 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1429);
    float _1439 = -_1421;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1433);
    float _1443 = 1.0 / _1423;
    float _1445 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1447 = _1419 + 1.0;
    float _1449 = fma(_1441, -0.5, 0.5);
    float _1451 = fma(_1441, 0.5, 0.5);
    float _1453 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1445);
    float _1455 = exp2(_1435);
    float _1457 = fma(_1451, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1459 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1453);
    float _1461 = _1427 * 0.693147182464599609375;
    float _1463 = fma(_1451, _1457, -0.212114393711090087890625);
    float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1467 = sqrt(_1449);
    float _1469 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1437);
    float _1471 = fma(_1451, _1463, 1.570728778839111328125);
    float _1473 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1475 = -_1419;
    float _1477 = fma(_1455, _1447, _1475);
    float _1479 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1459);
    float _1481 = _1473 * _1443;
    float _1483 = fma(_1477, 0.5, 0.5);
    float _1485 = _1479 * _1443;
    float _1487 = fma(_1481, -0.5, 0.5);
    float _1489 = _1467 * 0.636619746685028076171875;
    float _1491 = fma(_1485, 0.5, 0.5);
    float _1493 = -_1471;
    float _1495 = fma(_1489, _1493, 1.0);
    float3 _4071 = float3(_1491, _1487, _1465);
    float _1497 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4071, float3(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4071, float3(0.0), isnan(_4071)), level(0.0)).x;
    float3 _4082 = float3(_1491, _1487, _1465);
    float4 _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4082, float3(0.0), isnan(_4082)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4082, float3(0.0), isnan(_4082)), level(0.0)).xyzw;
    float _1502 = _1500.x;
    float _1504 = _1500.y;
    float _1506 = _1500.z;
    float _1508 = _1500.w;
    float2 _4099 = float2(_1495, _1483);
    float3 _1512 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4099, float2(0.0), isnan(_4099)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4099, float2(0.0), isnan(_4099)), level(0.0)).xyz;
    float _1514 = _1512.x;
    float _1516 = _1512.y;
    float _1518 = _1512.z;
    float _1520 = _973 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1522 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1524 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1526 = isnan(0.5);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1532 = _1528 || _1530;
    float _1534 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1520);
    float _1536 = _973 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1538 = exp2(_1522);
    float _1540 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1534);
    float _1542 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1536);
    float _1544 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1542);
    float _1548 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1550 = 1.0 / _1544;
    float _1552 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1548);
    float _1556 = _1552 + _1544;
    float _1558 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1554);
    float _1560 = _1385;
    if (_1532)
    {
        _1560 = 1.0;
    }
    float _1562 = _1560;
    float _1564 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1558);
    float _1566 = _1556 * _1550;
    float _1568 = _1566 * 0.5;
    float _1570 = _1562;
    if (!_1532)
    {
        float _1572 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1574 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1576 = _1572 * 0.15915493667125701904296875;
        float _1578 = _1574 * 0.15915493667125701904296875;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1582 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
        float _1584 = _1576 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        float _1588 = _1576 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = 1.0 / _1586;
        float _1594 = _1578 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = _1590 * _1592;
        float _1600 = _1578 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        float _1604 = _1596 * _1598;
        float _1606 = 1.0 / _1582;
        float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1610 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1608;
        float _1612 = 1.0 / _1604;
        float _1614 = 1.0 / _1610;
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1618 = _1606 * _1616;
        float _1620 = _1602 * _1612;
        float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1624 = fma(_1620, _1618, _1622);
        float _1626 = _1624 * _1614;
        float _1628 = precise::clamp(_1626, 0.0, 1.0);
        _1570 = _1628;
    }
    float _1630 = _1570;
    float _1632 = _1564 + _1423;
    float _1634 = -_1538;
    float _1636 = _1634 + 1.0;
    bool _1638 = _1630 > 0.0;
    bool _1640 = isnan(_1630);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    float _1648 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1650 = _1632 * 0.5;
    float _1652 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1656 = _1652 * _1497;
    float _1658 = -_1652;
    float _1660 = _1658 + 1.0;
    out.gl_Position.x = _1479;
    out.gl_Position.y = _1473;
    out.gl_Position.z = _1564;
    out.gl_Position.w = _1423;
    float _1662 = _1508 * _1656;
    float _1664 = _1518 * _1656;
    float _1666 = _1508 * _1660;
    out.m_62.z = _1650;
    out.m_62.w = _1423;
    float _1668 = fma(_1514, _1662, _1502);
    float _1670 = fma(_1516, _1662, _1504);
    float _1672 = fma(_1508, _1664, _1506);
    out.m_45.x = _1654;
    out.m_64.x = _1668;
    out.m_64.y = _1670;
    out.m_64.z = _1672;
    out.m_64.w = _1666;
    if (_1646)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1674;
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
    bool _643 = false;
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
        float _1731 = as_type<float>(_99);
        out.gl_Position.z = _1731;
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
        float _1800 = as_type<float>(_135);
        out.gl_Position.z = _1800;
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
    float _641;
    if (!_625)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _629 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_83);
        float _647 = 1.0 / _645;
        float _649 = _117 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = in.m_49.y;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _663 = _137 > 0.5;
    float _665 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = 1.0 / _657;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _675 = _673 != 0;
    float _677 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _679 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _681 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _683 = 1.0 / _661;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _685;
    float _689 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _677);
    float _691 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _679);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _695 = _651 + _693;
    float _697 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _689);
    bool _699 = _653 > 0.5;
    float _701 = 1.0 / _687;
    float _703 = _695 * _667;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _707 = _651 + _705;
    float _709 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _681);
    float _711 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _715 = _651 + _713;
    float _717 = _707 * _683;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _727;
    float _731 = _697 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = fma(_721, _703, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _743 = _715 * _701;
    float _745 = fma(_725, _703, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _747 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _749 = isnan(_651);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _763 = fma(_729, _703, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _765 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _767 = isnan(_651);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_737, _717, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _779 = -_757;
    float _781 = _779 + 1.0;
    float _783 = fma(_741, _717, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _785 = fma(_761, _717, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _787 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _789 = isnan(_651);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _775 * _781;
    float _801 = -_775;
    float _803 = _801 + 1.0;
    bool _805 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _807 = isnan(_651);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _711 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _819 = -_797;
    float _821 = _819 + 1.0;
    float _823 = _797 * _803;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _825;
    float _829 = _815 * _821;
    float _831 = -_815;
    float _833 = _831 + 1.0;
    float _835 = _745 * _829;
    float _837 = _733 * _829;
    float _839 = _763 * _829;
    float _841 = _709 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].x, _835);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _845;
    float _849 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _841 + _851;
    float _855 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].y, _837);
    float _857 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].z, _839);
    float _859 = fma(_777, _823, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _731 + _861;
    float _865 = _853 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _867;
    float _871 = fma(_783, _823, _855);
    float _873 = fma(_785, _823, _857);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _817 + _875;
    float _879 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].x, _865);
    float _881 = -_215;
    int _883 = _663 ? as_type<int>(_881) : as_type<int>(_215);
    float _885 = fma(_869, _743, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _889 = fma(_847, _743, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _879);
    bool _893 = !_671;
    float _895 = _893 ? _215 : as_type<float>(_883);
    float _897 = fma(_885, _799, _859);
    float _899 = -_207;
    int _901 = _699 ? as_type<int>(_899) : as_type<int>(_207);
    float _903 = _853 * _853;
    bool _905 = _891 >= 0.0;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _909 = !_675;
    float _911 = _909 ? _207 : as_type<float>(_901);
    float _913 = _895 + 0.5;
    float _915 = fma(_849, _799, _871);
    float _917 = fma(_889, _799, _873);
    float _919 = fma(_863, _863, _903);
    float _921 = _913 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _923 = -_911;
    float _925 = _923 + 0.5;
    float _927 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].x, _897);
    float _929 = fma(_877, _877, _919);
    float _931 = _921 * _887;
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _935 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].y, _915);
    float _937 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].z, _917);
    float _939 = rsqrt(_929);
    float _941 = _903;
    float _943 = _841;
    if (_905)
    {
        _941 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _945 = _941;
    float _947 = _933 * _907;
    float _949 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _951 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _953 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _955 = as_type<int>(_945);
    if (_905)
    {
        float _957 = _945 * 5.0;
        _955 = as_type<int>(_957);
    }
    int _959 = _955;
    float _961 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _931;
    out.m_58.y = _947;
    if (_905)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3155 = as_type<float>(_959);
        out.gl_Position.z = _3155;
    }
    float _967 = _853 * _939;
    float _969 = _863 * _939;
    out.m_60.x = _961;
    out.m_60.y = _963;
    out.m_60.z = _965;
    if (_905)
    {
        out.m_45.x = 0.0;
    }
    if (_905)
    {
        return out;
    }
    float _971 = -_967;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _841);
    float _975 = _877 * _939;
    float _977 = -_969;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    float _981 = -_967;
    float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _987 = _973 + _985;
    float _989 = -_975;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _817);
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _995 = _979 + _993;
    float _997 = -_969;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _1001 = _987 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1005 = _991 + _1003;
    float _1007 = _983 * _983;
    float _1009 = -_975;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1001);
    float _1015 = _363 * _621;
    float _1017 = fma(_999, _999, _1007);
    float _1019 = _363 * _623;
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1013);
    float _1023 = fma(_1011, _1011, _1017);
    bool _1025 = _1021 >= 0.0;
    float _1027 = sqrt(_1023);
    float _1029 = _1005;
    if (_1025)
    {
        _1029 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1031 = _1029;
    int _1033 = as_type<int>(_1031);
    if (_1025)
    {
        out.m_45.x = 0.0;
    }
    float _1035 = _939 * _1027;
    if (_1025)
    {
        float _1037 = _1031 * 5.0;
        _1033 = as_type<int>(_1037);
    }
    int _1039 = _1033;
    if (_1025)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3305 = as_type<float>(_1039);
        out.gl_Position.z = _3305;
    }
    if (_1025)
    {
        return out;
    }
    float _1041 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1045 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _1049 = _1035 * _1041;
    float _1051 = _1035 * _1043;
    float _1053 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1055 = _1053 * 0.5;
    float _1057 = _1045 * _1049;
    float _1059 = _1047 * _1051;
    float _1061 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1067 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1061);
    float _1069 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1063);
    float _1071 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1065);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1067);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1069);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1071);
    float _1079 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1081 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1083 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1085 = _817 + _1079;
    float _1087 = _731 + _1081;
    float _1089 = _841 + _1083;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1093 = _1085 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1097 = _1087 + _1095;
    float _1099 = _1093 * _1093;
    float _1101 = fma(_1097, _1097, _1099);
    float _1103 = sqrt(_1101);
    bool _1105 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1107 = _1077;
    float _1109 = _1083;
    float _1111 = _1087;
    if (!_1105)
    {
        _943 = _1087;
    }
    float _1113 = _943;
    float _1115 = _1113;
    if (!_1105)
    {
        _1107 = _1085;
    }
    float _1117 = _1107;
    float _1119 = _1117;
    if (!_1105)
    {
        _1109 = _1089;
    }
    float _1121 = _1109;
    bool _1123 = !_1105;
    float _1125 = _1121;
    if (!_1123)
    {
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1131 = _1103 + _1129;
        float _1133 = _1089 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = rsqrt(_1101);
        float _1137 = _1131 * _1127;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = _1139 * 6.283185482025146484375;
        float _1143 = cos(_1141);
        float _1145 = _1139 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = _1143 + (-1.0);
        float _1151 = fma(_1147, _1133, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1153 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = _1135 * _1151;
        float _1157 = fma(_1089, _1143, _1153);
        float _1159 = fma(_1097, _1155, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1161 = fma(_1093, _1155, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1125 = _1157;
        _1115 = _1159;
        _1119 = _1161;
    }
    float _1163 = _1125;
    float _1165 = _1115;
    float _1167 = _1119;
    float _1169 = -_967;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1163);
    float _1173 = -_969;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1165);
    float _1177 = -_975;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1183 = _1171 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = _1175 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = _1179 + _1189;
    float _1193 = _1183 * _1183;
    float _1195 = fma(_1187, _1187, _1193);
    float _1197 = fma(_1191, _1191, _1195);
    float _1199 = rsqrt(_1197);
    float _1201 = sqrt(_1197);
    float _1203 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1205 = _1187 * _1203;
    float _1207 = _1191 * _1203;
    float _1209 = _1205 * _1205;
    float _1211 = _1207 * _1207;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1213);
    float _1217 = precise::clamp(_1215, 0.0, 1.0);
    float _1219 = _1209 + _1211;
    float _1221 = sqrt(_1219);
    bool _1223 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1227 = _1221 + _1225;
    float _1229 = _1191;
    float _1231 = _1219;
    float _1233 = _1227;
    float _1235 = _1203;
    if (_1223)
    {
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1237;
    }
    float _1239 = _1229;
    if (_1223)
    {
        float _1241 = rsqrt(_1219);
        _1231 = _1241;
    }
    float _1243 = _1231;
    if (_1223)
    {
        float _1245 = _1227 * _1239;
        _1233 = _1245;
    }
    float _1247 = _1233;
    if (_1223)
    {
        float _1249 = _1247 * 0.15915493667125701904296875;
        _1111 = _1249;
    }
    float _1251 = _1111;
    float _1253 = _1193;
    float _1255 = _1251;
    if (_1223)
    {
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        _1253 = _1259;
    }
    float _1261 = _1253;
    float _1263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1265 = precise::max(0.0, _1263);
    float _1267 = _1199;
    float _1269 = _1263;
    float _1271 = _1265;
    if (_1223)
    {
        float _1273 = _1251 * 6.283185482025146484375;
        float _1275 = cos(_1273);
        _1267 = _1275;
    }
    float _1277 = _1267;
    float _1279 = -_1203;
    float _1281 = -_1265;
    float _1283 = fma(_1183, _1279, _1281);
    float _1285 = _1283;
    if (_1223)
    {
        float _1287 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1287;
    }
    float _1289 = _1269;
    float _1291 = _1261;
    float _1293 = _1289;
    if (_1223)
    {
        float _1295 = fma(_1261, _1289, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1295;
    }
    float _1297 = _1271;
    float _1299 = _1297;
    if (!_1223)
    {
        _1291 = _1205;
    }
    float _1301 = _1291;
    float _1303 = _1301;
    float _1305 = _1277;
    if (_1223)
    {
        float _1307 = _1277 + (-1.0);
        _1293 = _1307;
    }
    float _1309 = _1293;
    float _1311 = _1309;
    if (_1223)
    {
        float _1313 = _1243 * _1297;
        _1235 = _1313;
    }
    float _1315 = _1235;
    if (!_1223)
    {
        _1299 = _1283;
    }
    float _1317 = _1299;
    float _1319 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1321 = _1317;
    if (_1223)
    {
        float _1323 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1323;
    }
    float _1325 = _1255;
    if (_1223)
    {
        float _1327 = _1205 * _1315;
        _1303 = _1327;
    }
    float _1329 = _1303;
    if (!_1223)
    {
        _1311 = _1207;
    }
    float _1331 = _1311;
    float _1333 = _1331;
    if (_1223)
    {
        float _1335 = _1207 * _1315;
        _1333 = _1335;
    }
    float _1337 = _1333;
    if (_1223)
    {
        float _1339 = fma(_1283, _1277, _1325);
        _1321 = _1339;
    }
    float _1341 = _1321;
    if (!_1223)
    {
        _1285 = _1209;
    }
    float _1343 = _1285;
    float _1345 = _1343;
    if (_1223)
    {
        float _1347 = _1329 * _1329;
        _1345 = _1347;
    }
    float _1349 = _1345;
    float _1351 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1223)
    {
        _1305 = _1211;
    }
    float _1353 = _1305;
    float _1355 = _1353;
    if (_1223)
    {
        float _1357 = _1337 * _1337;
        _1355 = _1357;
    }
    float _1359 = _1355;
    float _1361 = fma(_1341, _1341, _1349);
    float _1363 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1365 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1351);
    float _1367 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1319);
    float _1369 = _1361 + _1359;
    float _1371 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1363);
    float _1373 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1375 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1365);
    float _1377 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1367);
    float _1379 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1371);
    float _1381 = rsqrt(_1369);
    float _1383 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1373);
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = -_1217;
    float _1391 = _1389 + 1.0;
    float _1393 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1397 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1401 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1403 = abs(_1391);
    float _1405 = log2(_1403);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1397);
    float _1409 = -_1399;
    float _1411 = fma(_1409, _1395, 1.0);
    float _1413 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1407);
    float _1417 = _1381 * _1329;
    float _1419 = _1381 * _1341;
    float _1421 = _1381 * _1337;
    float _1423 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1415);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1427 = log2(_1411);
    float _1429 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1431 = -_1425;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1431);
    float _1435 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1437 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1429);
    float _1439 = -_1421;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1433);
    float _1443 = 1.0 / _1423;
    float _1445 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1447 = _1419 + 1.0;
    float _1449 = fma(_1441, -0.5, 0.5);
    float _1451 = fma(_1441, 0.5, 0.5);
    float _1453 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1445);
    float _1455 = exp2(_1435);
    float _1457 = fma(_1451, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1459 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1453);
    float _1461 = _1427 * 0.693147182464599609375;
    float _1463 = fma(_1451, _1457, -0.212114393711090087890625);
    float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1467 = sqrt(_1449);
    float _1469 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1437);
    float _1471 = fma(_1451, _1463, 1.570728778839111328125);
    float _1473 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1475 = -_1419;
    float _1477 = fma(_1455, _1447, _1475);
    float _1479 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1459);
    float _1481 = _1473 * _1443;
    float _1483 = fma(_1477, 0.5, 0.5);
    float _1485 = _1479 * _1443;
    float _1487 = fma(_1481, -0.5, 0.5);
    float _1489 = _1467 * 0.636619746685028076171875;
    float _1491 = fma(_1485, 0.5, 0.5);
    float _1493 = -_1471;
    float _1495 = fma(_1489, _1493, 1.0);
    float3 _4071 = float3(_1491, _1487, _1465);
    float _1497 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4071, float3(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4071, float3(0.0), isnan(_4071)), level(0.0)).x;
    float3 _4082 = float3(_1491, _1487, _1465);
    float4 _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4082, float3(0.0), isnan(_4082)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4082, float3(0.0), isnan(_4082)), level(0.0)).xyzw;
    float _1502 = _1500.x;
    float _1504 = _1500.y;
    float _1506 = _1500.z;
    float _1508 = _1500.w;
    float2 _4099 = float2(_1495, _1483);
    float3 _1512 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4099, float2(0.0), isnan(_4099)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4099, float2(0.0), isnan(_4099)), level(0.0)).xyz;
    float _1514 = _1512.x;
    float _1516 = _1512.y;
    float _1518 = _1512.z;
    float _1520 = _973 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1522 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1524 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1526 = isnan(0.5);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1532 = _1528 || _1530;
    float _1534 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1520);
    float _1536 = _973 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1538 = exp2(_1522);
    float _1540 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1534);
    float _1542 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1536);
    float _1544 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1542);
    float _1548 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1550 = 1.0 / _1544;
    float _1552 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1548);
    float _1556 = _1552 + _1544;
    float _1558 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1554);
    float _1560 = _1385;
    if (_1532)
    {
        _1560 = 1.0;
    }
    float _1562 = _1560;
    float _1564 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1558);
    float _1566 = _1556 * _1550;
    float _1568 = _1566 * 0.5;
    float _1570 = _1562;
    if (!_1532)
    {
        float _1572 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1574 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1576 = _1572 * 0.15915493667125701904296875;
        float _1578 = _1574 * 0.15915493667125701904296875;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1582 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
        float _1584 = _1576 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        float _1588 = _1576 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = 1.0 / _1586;
        float _1594 = _1578 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = _1590 * _1592;
        float _1600 = _1578 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        float _1604 = _1596 * _1598;
        float _1606 = 1.0 / _1582;
        float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1610 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1608;
        float _1612 = 1.0 / _1604;
        float _1614 = 1.0 / _1610;
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1618 = _1606 * _1616;
        float _1620 = _1602 * _1612;
        float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1624 = fma(_1620, _1618, _1622);
        float _1626 = _1624 * _1614;
        float _1628 = precise::clamp(_1626, 0.0, 1.0);
        _1570 = _1628;
    }
    float _1630 = _1570;
    float _1632 = _1564 + _1423;
    float _1634 = -_1538;
    float _1636 = _1634 + 1.0;
    bool _1638 = _1630 > 0.0;
    bool _1640 = isnan(_1630);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    float _1648 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1650 = _1632 * 0.5;
    float _1652 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1656 = _1652 * _1497;
    float _1658 = -_1652;
    float _1660 = _1658 + 1.0;
    out.gl_Position.x = _1479;
    out.gl_Position.y = _1473;
    out.gl_Position.z = _1564;
    out.gl_Position.w = _1423;
    float _1662 = _1508 * _1656;
    float _1664 = _1518 * _1656;
    float _1666 = _1508 * _1660;
    out.m_62.z = _1650;
    out.m_62.w = _1423;
    float _1668 = fma(_1514, _1662, _1502);
    float _1670 = fma(_1516, _1662, _1504);
    float _1672 = fma(_1508, _1664, _1506);
    out.m_45.x = _1654;
    out.m_64.x = _1668;
    out.m_64.y = _1670;
    out.m_64.z = _1672;
    out.m_64.w = _1666;
    if (_1646)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1674;
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
    bool _643 = false;
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
        float _1731 = as_type<float>(_99);
        out.gl_Position.z = _1731;
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
        float _1800 = as_type<float>(_135);
        out.gl_Position.z = _1800;
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
    float _641;
    if (!_625)
    {
        float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _629 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _631 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _633 = _631 * _627;
        float _635 = floor(_633);
        float _637 = -_635;
        float _639 = _633 + _637;
        _641 = _639;
        _643 = true;
    }
    else
    {
        float _645 = float(_83);
        float _647 = 1.0 / _645;
        float _649 = _117 * _647;
        _641 = _649;
    }
    _643 = false;
    float _651 = _641;
    float _653 = in.m_49.y;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _655;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _663 = _137 > 0.5;
    float _665 = _351 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _667 = 1.0 / _657;
    int _669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _671 = _669 != 0;
    int _673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _675 = _673 != 0;
    float _677 = _351 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _679 = _351 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _681 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _665);
    float _683 = 1.0 / _661;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _685;
    float _689 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _677);
    float _691 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _679);
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _695 = _651 + _693;
    float _697 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].z, _689);
    bool _699 = _653 > 0.5;
    float _701 = 1.0 / _687;
    float _703 = _695 * _667;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _707 = _651 + _705;
    float _709 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].z, _681);
    float _711 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].z, _691);
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _715 = _651 + _713;
    float _717 = _707 * _683;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _723;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _727;
    float _731 = _697 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _733 = fma(_721, _703, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _743 = _715 * _701;
    float _745 = fma(_725, _703, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _747 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _749 = isnan(_651);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _763 = fma(_729, _703, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _765 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _767 = isnan(_651);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_737, _717, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _779 = -_757;
    float _781 = _779 + 1.0;
    float _783 = fma(_741, _717, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _785 = fma(_761, _717, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _787 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _789 = isnan(_651);
    bool _791 = _787 || _789;
    bool _793 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _795 = _791 || _793;
    float _797 = float(_795);
    float _799 = _775 * _781;
    float _801 = -_775;
    float _803 = _801 + 1.0;
    bool _805 = _651 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _807 = isnan(_651);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _711 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _819 = -_797;
    float _821 = _819 + 1.0;
    float _823 = _797 * _803;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _825;
    float _829 = _815 * _821;
    float _831 = -_815;
    float _833 = _831 + 1.0;
    float _835 = _745 * _829;
    float _837 = _733 * _829;
    float _839 = _763 * _829;
    float _841 = _709 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].x, _835);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _845;
    float _849 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _851 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _853 = _841 + _851;
    float _855 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].y, _837);
    float _857 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[123].z, _839);
    float _859 = fma(_777, _823, _843);
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _863 = _731 + _861;
    float _865 = _853 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _867;
    float _871 = fma(_783, _823, _855);
    float _873 = fma(_785, _823, _857);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _877 = _817 + _875;
    float _879 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[28].x, _865);
    float _881 = -_215;
    int _883 = _663 ? as_type<int>(_881) : as_type<int>(_215);
    float _885 = fma(_869, _743, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _887 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _889 = fma(_847, _743, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _891 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[28].z, _879);
    bool _893 = !_671;
    float _895 = _893 ? _215 : as_type<float>(_883);
    float _897 = fma(_885, _799, _859);
    float _899 = -_207;
    int _901 = _699 ? as_type<int>(_899) : as_type<int>(_207);
    float _903 = _853 * _853;
    bool _905 = _891 >= 0.0;
    float _907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _909 = !_675;
    float _911 = _909 ? _207 : as_type<float>(_901);
    float _913 = _895 + 0.5;
    float _915 = fma(_849, _799, _871);
    float _917 = fma(_889, _799, _873);
    float _919 = fma(_863, _863, _903);
    float _921 = _913 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _923 = -_911;
    float _925 = _923 + 0.5;
    float _927 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].x, _897);
    float _929 = fma(_877, _877, _919);
    float _931 = _921 * _887;
    float _933 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _935 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].y, _915);
    float _937 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[126].z, _917);
    float _939 = rsqrt(_929);
    float _941 = _903;
    float _943 = _841;
    if (_905)
    {
        _941 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _945 = _941;
    float _947 = _933 * _907;
    float _949 = _927 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _951 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _953 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _955 = as_type<int>(_945);
    if (_905)
    {
        float _957 = _945 * 5.0;
        _955 = as_type<int>(_957);
    }
    int _959 = _955;
    float _961 = _949 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _931;
    out.m_58.y = _947;
    if (_905)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3155 = as_type<float>(_959);
        out.gl_Position.z = _3155;
    }
    float _967 = _853 * _939;
    float _969 = _863 * _939;
    out.m_60.x = _961;
    out.m_60.y = _963;
    out.m_60.z = _965;
    if (_905)
    {
        out.m_45.x = 0.0;
    }
    if (_905)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _971 = -_967;
    float _973 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _841);
    float _975 = _877 * _939;
    float _977 = -_969;
    float _979 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[18].w, _731);
    float _981 = -_967;
    float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[18].w, _853);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _987 = _973 + _985;
    float _989 = -_975;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _817);
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _995 = _979 + _993;
    float _997 = -_969;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _863);
    float _1001 = _987 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1005 = _991 + _1003;
    float _1007 = _983 * _983;
    float _1009 = -_975;
    float _1011 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _877);
    float _1013 = fma(_995, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1001);
    float _1015 = _363 * _621;
    float _1017 = fma(_999, _999, _1007);
    float _1019 = _363 * _623;
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1013);
    float _1023 = fma(_1011, _1011, _1017);
    bool _1025 = _1021 >= 0.0;
    float _1027 = sqrt(_1023);
    float _1029 = _1005;
    if (_1025)
    {
        _1029 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1031 = _1029;
    int _1033 = as_type<int>(_1031);
    if (_1025)
    {
        out.m_45.x = 0.0;
    }
    float _1035 = _939 * _1027;
    if (_1025)
    {
        float _1037 = _1031 * 5.0;
        _1033 = as_type<int>(_1037);
    }
    int _1039 = _1033;
    if (_1025)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3305 = as_type<float>(_1039);
        out.gl_Position.z = _3305;
    }
    if (_1025)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1041 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1043 = _1015 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1045 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _1047 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _1049 = _1035 * _1041;
    float _1051 = _1035 * _1043;
    float _1053 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1055 = _1053 * 0.5;
    float _1057 = _1045 * _1049;
    float _1059 = _1047 * _1051;
    float _1061 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1063 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1065 = _1057 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1067 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1061);
    float _1069 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1063);
    float _1071 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1065);
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1067);
    float _1075 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1069);
    float _1077 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1071);
    float _1079 = _1073 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1081 = _1075 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1083 = _1077 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1085 = _817 + _1079;
    float _1087 = _731 + _1081;
    float _1089 = _841 + _1083;
    float _1091 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1093 = _1085 + _1091;
    float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1097 = _1087 + _1095;
    float _1099 = _1093 * _1093;
    float _1101 = fma(_1097, _1097, _1099);
    float _1103 = sqrt(_1101);
    bool _1105 = _1103 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1107 = _1077;
    float _1109 = _1083;
    float _1111 = _1087;
    if (!_1105)
    {
        _943 = _1087;
    }
    float _1113 = _943;
    float _1115 = _1113;
    if (!_1105)
    {
        _1107 = _1085;
    }
    float _1117 = _1107;
    float _1119 = _1117;
    if (!_1105)
    {
        _1109 = _1089;
    }
    float _1121 = _1109;
    bool _1123 = !_1105;
    float _1125 = _1121;
    if (!_1123)
    {
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1131 = _1103 + _1129;
        float _1133 = _1089 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1135 = rsqrt(_1101);
        float _1137 = _1131 * _1127;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = _1139 * 6.283185482025146484375;
        float _1143 = cos(_1141);
        float _1145 = _1139 * 6.283185482025146484375;
        float _1147 = sin(_1145);
        float _1149 = _1143 + (-1.0);
        float _1151 = fma(_1147, _1133, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1153 = _1149 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1155 = _1135 * _1151;
        float _1157 = fma(_1089, _1143, _1153);
        float _1159 = fma(_1097, _1155, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1161 = fma(_1093, _1155, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1125 = _1157;
        _1115 = _1159;
        _1119 = _1161;
    }
    float _1163 = _1125;
    float _1165 = _1115;
    float _1167 = _1119;
    float _1169 = -_967;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1163);
    float _1173 = -_969;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1165);
    float _1177 = -_975;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1167);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1183 = _1171 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = _1175 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = _1179 + _1189;
    float _1193 = _1183 * _1183;
    float _1195 = fma(_1187, _1187, _1193);
    float _1197 = fma(_1191, _1191, _1195);
    float _1199 = rsqrt(_1197);
    float _1201 = sqrt(_1197);
    float _1203 = _1199 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1205 = _1187 * _1203;
    float _1207 = _1191 * _1203;
    float _1209 = _1205 * _1205;
    float _1211 = _1207 * _1207;
    float _1213 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1215 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1213);
    float _1217 = precise::clamp(_1215, 0.0, 1.0);
    float _1219 = _1209 + _1211;
    float _1221 = sqrt(_1219);
    bool _1223 = _1221 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1227 = _1221 + _1225;
    float _1229 = _1191;
    float _1231 = _1219;
    float _1233 = _1227;
    float _1235 = _1203;
    if (_1223)
    {
        float _1237 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1229 = _1237;
    }
    float _1239 = _1229;
    if (_1223)
    {
        float _1241 = rsqrt(_1219);
        _1231 = _1241;
    }
    float _1243 = _1231;
    if (_1223)
    {
        float _1245 = _1227 * _1239;
        _1233 = _1245;
    }
    float _1247 = _1233;
    if (_1223)
    {
        float _1249 = _1247 * 0.15915493667125701904296875;
        _1111 = _1249;
    }
    float _1251 = _1111;
    float _1253 = _1193;
    float _1255 = _1251;
    if (_1223)
    {
        float _1257 = _1251 * 6.283185482025146484375;
        float _1259 = sin(_1257);
        _1253 = _1259;
    }
    float _1261 = _1253;
    float _1263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1265 = precise::max(0.0, _1263);
    float _1267 = _1199;
    float _1269 = _1263;
    float _1271 = _1265;
    if (_1223)
    {
        float _1273 = _1251 * 6.283185482025146484375;
        float _1275 = cos(_1273);
        _1267 = _1275;
    }
    float _1277 = _1267;
    float _1279 = -_1203;
    float _1281 = -_1265;
    float _1283 = fma(_1183, _1279, _1281);
    float _1285 = _1283;
    if (_1223)
    {
        float _1287 = _1283 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1269 = _1287;
    }
    float _1289 = _1269;
    float _1291 = _1261;
    float _1293 = _1289;
    if (_1223)
    {
        float _1295 = fma(_1261, _1289, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1295;
    }
    float _1297 = _1271;
    float _1299 = _1297;
    if (!_1223)
    {
        _1291 = _1205;
    }
    float _1301 = _1291;
    float _1303 = _1301;
    float _1305 = _1277;
    if (_1223)
    {
        float _1307 = _1277 + (-1.0);
        _1293 = _1307;
    }
    float _1309 = _1293;
    float _1311 = _1309;
    if (_1223)
    {
        float _1313 = _1243 * _1297;
        _1235 = _1313;
    }
    float _1315 = _1235;
    if (!_1223)
    {
        _1299 = _1283;
    }
    float _1317 = _1299;
    float _1319 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1321 = _1317;
    if (_1223)
    {
        float _1323 = _1309 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1323;
    }
    float _1325 = _1255;
    if (_1223)
    {
        float _1327 = _1205 * _1315;
        _1303 = _1327;
    }
    float _1329 = _1303;
    if (!_1223)
    {
        _1311 = _1207;
    }
    float _1331 = _1311;
    float _1333 = _1331;
    if (_1223)
    {
        float _1335 = _1207 * _1315;
        _1333 = _1335;
    }
    float _1337 = _1333;
    if (_1223)
    {
        float _1339 = fma(_1283, _1277, _1325);
        _1321 = _1339;
    }
    float _1341 = _1321;
    if (!_1223)
    {
        _1285 = _1209;
    }
    float _1343 = _1285;
    float _1345 = _1343;
    if (_1223)
    {
        float _1347 = _1329 * _1329;
        _1345 = _1347;
    }
    float _1349 = _1345;
    float _1351 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1223)
    {
        _1305 = _1211;
    }
    float _1353 = _1305;
    float _1355 = _1353;
    if (_1223)
    {
        float _1357 = _1337 * _1337;
        _1355 = _1357;
    }
    float _1359 = _1355;
    float _1361 = fma(_1341, _1341, _1349);
    float _1363 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1365 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1351);
    float _1367 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1319);
    float _1369 = _1361 + _1359;
    float _1371 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1363);
    float _1373 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1375 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1365);
    float _1377 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1367);
    float _1379 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1371);
    float _1381 = rsqrt(_1369);
    float _1383 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1373);
    float _1385 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1387 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1389 = -_1217;
    float _1391 = _1389 + 1.0;
    float _1393 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1395 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1397 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1401 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1383);
    float _1403 = abs(_1391);
    float _1405 = log2(_1403);
    float _1407 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1397);
    float _1409 = -_1399;
    float _1411 = fma(_1409, _1395, 1.0);
    float _1413 = _1401 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1415 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1407);
    float _1417 = _1381 * _1329;
    float _1419 = _1381 * _1341;
    float _1421 = _1381 * _1337;
    float _1423 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1415);
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1427 = log2(_1411);
    float _1429 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1431 = -_1425;
    float _1433 = fma(_1419, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1431);
    float _1435 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1437 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1429);
    float _1439 = -_1421;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1433);
    float _1443 = 1.0 / _1423;
    float _1445 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1447 = _1419 + 1.0;
    float _1449 = fma(_1441, -0.5, 0.5);
    float _1451 = fma(_1441, 0.5, 0.5);
    float _1453 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1445);
    float _1455 = exp2(_1435);
    float _1457 = fma(_1451, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1459 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1453);
    float _1461 = _1427 * 0.693147182464599609375;
    float _1463 = fma(_1451, _1457, -0.212114393711090087890625);
    float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1467 = sqrt(_1449);
    float _1469 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1437);
    float _1471 = fma(_1451, _1463, 1.570728778839111328125);
    float _1473 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1469);
    float _1475 = -_1419;
    float _1477 = fma(_1455, _1447, _1475);
    float _1479 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1459);
    float _1481 = _1473 * _1443;
    float _1483 = fma(_1477, 0.5, 0.5);
    float _1485 = _1479 * _1443;
    float _1487 = fma(_1481, -0.5, 0.5);
    float _1489 = _1467 * 0.636619746685028076171875;
    float _1491 = fma(_1485, 0.5, 0.5);
    float _1493 = -_1471;
    float _1495 = fma(_1489, _1493, 1.0);
    float3 _4071 = float3(_1491, _1487, _1465);
    float _1497 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4071, float3(0.0), isnan(_4071)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4071, float3(0.0), isnan(_4071)), level(0.0)).x;
    float3 _4082 = float3(_1491, _1487, _1465);
    float4 _1500 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4082, float3(0.0), isnan(_4082)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4082, float3(0.0), isnan(_4082)), level(0.0)).xyzw;
    float _1502 = _1500.x;
    float _1504 = _1500.y;
    float _1506 = _1500.z;
    float _1508 = _1500.w;
    float2 _4099 = float2(_1495, _1483);
    float3 _1512 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4099, float2(0.0), isnan(_4099)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4099, float2(0.0), isnan(_4099)), level(0.0)).xyz;
    float _1514 = _1512.x;
    float _1516 = _1512.y;
    float _1518 = _1512.z;
    float _1520 = _973 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1522 = _1405 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1524 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1526 = isnan(0.5);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1532 = _1528 || _1530;
    float _1534 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1520);
    float _1536 = _973 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1538 = exp2(_1522);
    float _1540 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1534);
    float _1542 = fma(_979, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1536);
    float _1544 = _1540 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1546 = fma(_991, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1542);
    float _1548 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1550 = 1.0 / _1544;
    float _1552 = _1546 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1554 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1548);
    float _1556 = _1552 + _1544;
    float _1558 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1554);
    float _1560 = _1385;
    if (_1532)
    {
        _1560 = 1.0;
    }
    float _1562 = _1560;
    float _1564 = fma(_1413, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1558);
    float _1566 = _1556 * _1550;
    float _1568 = _1566 * 0.5;
    float _1570 = _1562;
    if (!_1532)
    {
        float _1572 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1574 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1576 = _1572 * 0.15915493667125701904296875;
        float _1578 = _1574 * 0.15915493667125701904296875;
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1582 = fma(_1568, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1580);
        float _1584 = _1576 * 6.283185482025146484375;
        float _1586 = cos(_1584);
        float _1588 = _1576 * 6.283185482025146484375;
        float _1590 = sin(_1588);
        float _1592 = 1.0 / _1586;
        float _1594 = _1578 * 6.283185482025146484375;
        float _1596 = cos(_1594);
        float _1598 = _1590 * _1592;
        float _1600 = _1578 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        float _1604 = _1596 * _1598;
        float _1606 = 1.0 / _1582;
        float _1608 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1610 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1608;
        float _1612 = 1.0 / _1604;
        float _1614 = 1.0 / _1610;
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1618 = _1606 * _1616;
        float _1620 = _1602 * _1612;
        float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1624 = fma(_1620, _1618, _1622);
        float _1626 = _1624 * _1614;
        float _1628 = precise::clamp(_1626, 0.0, 1.0);
        _1570 = _1628;
    }
    float _1630 = _1570;
    float _1632 = _1564 + _1423;
    float _1634 = -_1538;
    float _1636 = _1634 + 1.0;
    bool _1638 = _1630 > 0.0;
    bool _1640 = isnan(_1630);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan(0.0);
    bool _1646 = _1642 || _1644;
    float _1648 = _1630 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1650 = _1632 * 0.5;
    float _1652 = _1636 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1654 = _1648 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1656 = _1652 * _1497;
    float _1658 = -_1652;
    float _1660 = _1658 + 1.0;
    out.gl_Position.x = _1479;
    out.gl_Position.y = _1473;
    out.gl_Position.z = _1564;
    out.gl_Position.w = _1423;
    float _1662 = _1508 * _1656;
    float _1664 = _1518 * _1656;
    float _1666 = _1508 * _1660;
    out.m_62.z = _1650;
    out.m_62.w = _1423;
    float _1668 = fma(_1514, _1662, _1502);
    float _1670 = fma(_1516, _1662, _1504);
    float _1672 = fma(_1508, _1664, _1506);
    out.m_45.x = _1654;
    out.m_64.x = _1668;
    out.m_64.y = _1670;
    out.m_64.z = _1672;
    out.m_64.w = _1666;
    if (_1646)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1674 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1674;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

