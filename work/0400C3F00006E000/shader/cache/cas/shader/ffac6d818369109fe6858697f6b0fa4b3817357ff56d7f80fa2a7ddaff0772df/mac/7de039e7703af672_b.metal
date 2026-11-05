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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
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
        float _1655 = as_type<float>(_99);
        out.gl_Position.z = _1655;
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
        out.m_45.x = 0.0;
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
        float _1723 = as_type<float>(_135);
        out.gl_Position.z = _1723;
    }
    if (_129)
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
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_193;
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
    float _337 = fma(_275, _179, _327);
    int _339 = abs(_331);
    float _341 = fma(_275, _181, _333);
    float _343 = float(_321);
    float _345 = float(_325);
    float _347 = abs(_295);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _319, _349);
    float _355 = fma(_341, _277, _301);
    float _357 = fma(_323, _277, _297);
    float _359 = fma(_337, _277, _299);
    float _361 = abs(_315);
    float _363 = fma(_351, _361, _353);
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
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _391 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = 1.0 / _403;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _421 = 1.0 / _407;
    float _423 = 1.0 / _411;
    float _425 = _395 * _417;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _391 + _427;
    bool _431 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _433 = isnan(_391);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _415;
    float _445 = _399 * _421;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _461 = _391 + _459;
    float _463 = _429 * _423;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -_441;
    float _471 = _469 + 1.0;
    bool _473 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _475 = isnan(_391);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_467, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _487 = _457 * _471;
    bool _489 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_391);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = _461 * _443;
    float _503 = -_457;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -_483;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _515;
    float _519 = _483 * _505;
    bool _521 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_391);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _499 * _513;
    float _535 = -_499;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _543 = fma(_517, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _545 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = _531 * _537;
    float _549 = fma(_541, _445, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = -_531;
    float _553 = _551 + 1.0;
    float _555 = in.m_54.x;
    float _557 = in.m_54.y;
    float _559 = _485 * _547;
    float _561 = _543 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _567;
    float _571 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _575 = fma(_565, _463, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = fma(_545, _533, _571);
    float _583 = fma(_569, _463, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _589 = fma(_549, _533, _573);
    float _591 = fma(_579, _501, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _593 = fma(_575, _519, _581);
    float _595 = fma(_587, _501, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _597 = fma(_583, _519, _589);
    float _599 = fma(_591, _487, _593);
    float _601 = fma(_595, _487, _597);
    float _603 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[147].x, _599);
    float _605 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[147].y, _601);
    float _607 = _603 * _555;
    float _609 = _605 * _557;
    bool _611 = !_419;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _629;
    if (!_611)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _617 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_83);
        float _635 = 1.0 / _633;
        float _637 = _117 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_49.y;
    float _643 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _647;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _653 = _651 != 0;
    float _655 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _643);
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _663 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _667 = 1.0 / _649;
    float _669 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _661);
    float _671 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    bool _673 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _675 = isnan(_639);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _687 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _669);
    float _689 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _697 = _639 + _695;
    bool _699 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _701 = isnan(_639);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _711;
    float _715 = _689 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _717 = _641 > 0.5;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _721 = _697 * _667;
    float _723 = -_709;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _729 = _715 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _731;
    float _735 = fma(_713, _721, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _737;
    float _741 = _683 * _725;
    float _743 = fma(_733, _721, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _745 = _137 > 0.5;
    float _747 = fma(_739, _721, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _749 = -_215;
    int _751 = _717 ? as_type<int>(_749) : as_type<int>(_215);
    float _753 = _735 * _741;
    float _755 = -_683;
    float _757 = _755 + 1.0;
    float _759 = _747 * _741;
    bool _761 = !_659;
    float _763 = _761 ? _215 : as_type<float>(_751);
    float _765 = _687 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _767 = _743 * _741;
    float _769 = _693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _771 = -_207;
    int _773 = _745 ? as_type<int>(_771) : as_type<int>(_207);
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _777 = _765 + _775;
    float _779 = -_763;
    float _781 = _779 + 0.5;
    float _783 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    bool _785 = !_653;
    float _787 = _785 ? _207 : as_type<float>(_773);
    float _789 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _769);
    float _791 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _793 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].x, _759);
    float _795 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].z, _767);
    float _797 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _789);
    float _799 = _791 * _645;
    float _801 = _693 * _693;
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].y, _783);
    float _805 = _787 + 0.5;
    bool _807 = _797 >= 0.0;
    float _809 = fma(_777, _777, _801);
    float _811 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].x, _793);
    float _813 = fma(_729, _729, _809);
    float _815 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].z, _795);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _821 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _823 = rsqrt(_813);
    float _825 = _811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _827 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _829 = as_type<int>(_827);
    if (_807)
    {
        _613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _613;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _835 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _837 = _821 * _719;
    float _839 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _845 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _849;
    if (_807)
    {
        float _855 = _831 * 5.0;
        _829 = as_type<int>(_855);
    }
    int _857 = _829;
    out.m_56.x = _837;
    out.m_56.y = _799;
    float _859 = _693 * _823;
    float _861 = _777 * _823;
    out.m_58.x = _845;
    out.m_58.y = _847;
    out.m_58.z = _849;
    out.m_60.x = _839;
    out.m_60.y = _841;
    out.m_60.z = _851;
    out.m_60.w = _843;
    if (_807)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2909 = as_type<float>(_857);
        out.gl_Position.z = _2909;
    }
    if (_807)
    {
        out.m_45.x = 0.0;
    }
    if (_807)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _863 = -_859;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _685);
    float _867 = _729 * _823;
    float _869 = -_861;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _765);
    float _873 = -_859;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _879 = _865 + _877;
    float _881 = -_867;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _887 = _871 + _885;
    float _889 = -_861;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _893 = _879 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _897 = _883 + _895;
    float _899 = _875 * _875;
    float _901 = -_867;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _729);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _893);
    float _907 = fma(_891, _891, _899);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[28].z, _905);
    float _911 = fma(_903, _903, _907);
    bool _913 = _909 >= 0.0;
    float _915 = sqrt(_911);
    float _917 = _867;
    float _919 = _887;
    if (_913)
    {
        _853 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _921 = _853;
    int _923 = as_type<int>(_921);
    if (_913)
    {
        out.m_45.x = 0.0;
    }
    float _925 = _823 * _915;
    if (_913)
    {
        float _927 = _921 * 5.0;
        _923 = as_type<int>(_927);
    }
    int _929 = _923;
    if (_913)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3042 = as_type<float>(_929);
        out.gl_Position.z = _3042;
    }
    if (_913)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _931 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _933 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _939 = _925 * _931;
    float _941 = _925 * _933;
    float _943 = _925 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _945 = _943 * 0.5;
    float _947 = _935 * _939;
    float _949 = _937 * _941;
    bool _951 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _953 = isnan(0.5);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _959 = _955 || _957;
    float _961 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _963 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _973 = _969 || _971;
    float _975 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _961);
    float _977 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _963);
    float _979 = _865 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _981 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _975);
    float _983 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _977);
    float _985 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _979);
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _991 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _985);
    float _993 = _715 + _987;
    float _995 = _765 + _989;
    float _997 = _991 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1001 = _993 + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1005 = _995 + _1003;
    float _1007 = _1001 * _1001;
    float _1009 = fma(_1005, _1005, _1007);
    float _1011 = _865 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1013 = sqrt(_1009);
    float _1015 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1011);
    float _1017 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1019 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1015);
    float _1021 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1017);
    float _1023 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1025 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1027 = 1.0 / _1023;
    float _1029 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1031 = _997 + _1023;
    bool _1033 = _1013 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = _685 + _1029;
    float _1037 = _947;
    float _1039 = _997;
    float _1041 = _995;
    float _1043 = _945;
    if (!_1033)
    {
        _1037 = _993;
    }
    float _1045 = _1037;
    float _1047 = _1045;
    if (!_1033)
    {
        _1039 = _1035;
    }
    float _1049 = _1039;
    bool _1051 = !_1033;
    float _1053 = _1049;
    if (!_1051)
    {
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1059 = _1013 + _1057;
        float _1061 = rsqrt(_1009);
        float _1063 = _1059 * _1055;
        float _1065 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = _1063 * 0.15915493667125701904296875;
        float _1069 = _1067 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        float _1077 = fma(_1071, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = _1061 * _1077;
        float _1081 = _1075 + (-1.0);
        float _1083 = fma(_1005, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_1001, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1087 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1089 = fma(_1035, _1075, _1087);
        _1053 = _1089;
        _1047 = _1085;
        _1041 = _1083;
        _1043 = _1077;
    }
    float _1091 = _1053;
    float _1093 = _1047;
    float _1095 = _1041;
    float _1097 = _1043;
    float _1099 = -_859;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1103 = -_867;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1093);
    float _1107 = -_861;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    float _1111 = _1031 * _1027;
    float _1113 = _1111 * 0.5;
    float _1115 = _1097;
    float _1117 = _1109;
    float _1119 = _1105;
    float _1121 = _1091;
    float _1123 = _1113;
    if (_973)
    {
        _1115 = 1.0;
    }
    float _1125 = _1115;
    float _1127 = _1125;
    if (_959)
    {
        _917 = _1101;
    }
    float _1129 = _917;
    float _1131 = _1129;
    if (!_959)
    {
        float _1133 = _879 * _879;
        float _1135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1137 = -_715;
        float _1139 = _1137 + _1093;
        float _1141 = fma(_887, _887, _1133);
        float _1143 = fma(_897, _897, _1141);
        float _1145 = 1.0 / _925;
        float _1147 = sqrt(_1143);
        float _1149 = precise::min(_1147, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1151 = _1149 * _1135;
        float _1153 = -_765;
        float _1155 = _1153 + _1095;
        float _1157 = _1151 * _1145;
        float _1159 = -_685;
        float _1161 = _1159 + _1091;
        float _1163 = fma(_1155, _1157, _871);
        float _1165 = fma(_1161, _1157, _865);
        float _1167 = fma(_1139, _1157, _883);
        _1131 = _1165;
        _1117 = _1163;
        _1119 = _1167;
        _919 = _1147;
    }
    float _1169 = _1131;
    float _1171 = _1117;
    float _1173 = _1119;
    float _1175 = _919;
    if (!_973)
    {
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1179 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1177);
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1185 = 1.0 / _1179;
        float _1187 = 1.0 / _1183;
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1193 = fma(_1185, _1189, _1191);
        float _1195 = _1193 * _1187;
        float _1197 = precise::clamp(_1195, 0.0, 1.0);
        _1127 = _1197;
    }
    float _1199 = _1127;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1169 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1171 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1173 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1223 = _1207 * _1221;
    float _1225 = _1211 * _1221;
    float _1227 = _1223 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 + _1229;
    float _1233 = sqrt(_1231);
    bool _1235 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = _1233 + _1237;
    float _1241 = _897;
    float _1243 = _1239;
    float _1245 = _1203;
    float _1247 = _1223;
    if (_1235)
    {
        float _1249 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1249;
    }
    float _1251 = _1241;
    float _1253 = _1251;
    if (_1235)
    {
        float _1255 = _1239 * _1251;
        _1243 = _1255;
    }
    float _1257 = _1243;
    if (_1235)
    {
        float _1259 = rsqrt(_1231);
        _1253 = _1259;
    }
    float _1261 = _1253;
    float _1263 = _1261;
    if (_1235)
    {
        float _1265 = _1257 * 0.15915493667125701904296875;
        _1121 = _1265;
    }
    float _1267 = _1121;
    float _1269 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1271 = _1211;
    if (_1235)
    {
        float _1273 = _1267 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = precise::max(0.0, _1269);
    float _1281 = _1175;
    float _1283 = _1279;
    if (_1235)
    {
        float _1285 = _1267 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        _1281 = _1287;
    }
    float _1289 = _1281;
    float _1291 = -_1221;
    float _1293 = -_1279;
    float _1295 = fma(_1203, _1291, _1293);
    if (_1235)
    {
        float _1297 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1297;
    }
    float _1299 = _1245;
    float _1301 = sqrt(_1217);
    float _1303 = _1277;
    float _1305 = _1299;
    if (_1235)
    {
        float _1307 = fma(_1277, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1307;
    }
    float _1309 = _1303;
    float _1311 = _1309;
    if (!_1235)
    {
        _1305 = _1295;
    }
    float _1313 = _1305;
    float _1315 = _1313;
    if (_1235)
    {
        float _1317 = _1261 * _1309;
        _1123 = _1317;
    }
    float _1319 = _1123;
    if (!_1235)
    {
        _1311 = _1227;
    }
    float _1321 = _1311;
    float _1323 = _1321;
    float _1325 = _1289;
    if (_1235)
    {
        float _1327 = _1289 + (-1.0);
        _1283 = _1327;
    }
    float _1329 = _1283;
    float _1331 = _1329;
    if (_1235)
    {
        float _1333 = _1223 * _1319;
        _1247 = _1333;
    }
    float _1335 = _1247;
    if (_1235)
    {
        float _1337 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1337;
    }
    float _1339 = _1263;
    if (!_1235)
    {
        _1331 = _1225;
    }
    float _1341 = _1331;
    float _1343 = _1341;
    if (_1235)
    {
        float _1345 = _1225 * _1319;
        _1343 = _1345;
    }
    float _1347 = _1343;
    if (_1235)
    {
        float _1349 = _1335 * _1335;
        _1323 = _1349;
    }
    float _1351 = _1323;
    if (_1235)
    {
        float _1353 = fma(_1295, _1289, _1339);
        _1315 = _1353;
    }
    float _1355 = _1315;
    if (!_1235)
    {
        _1325 = _1229;
    }
    float _1357 = _1325;
    float _1359 = _1357;
    if (_1235)
    {
        float _1361 = _1347 * _1347;
        _1359 = _1361;
    }
    float _1363 = _1359;
    float _1365 = fma(_1355, _1355, _1351);
    float _1367 = _1365 + _1363;
    float _1369 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1373 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1371);
    float _1375 = precise::clamp(_1373, 0.0, 1.0);
    float _1377 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1379 = rsqrt(_1367);
    float _1381 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1383 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1369);
    float _1385 = -_1375;
    float _1387 = _1385 + 1.0;
    float _1389 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1391 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1377);
    float _1393 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1383);
    float _1395 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1389);
    float _1399 = abs(_1387);
    float _1401 = log2(_1399);
    float _1403 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1405 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1391);
    float _1407 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1397);
    float _1409 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1413 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1415 = _1379 * _1335;
    float _1417 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1419 = -_1411;
    float _1421 = fma(_1419, _1381, 1.0);
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1425 = _1379 * _1355;
    float _1427 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1429 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1409);
    float _1431 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1423);
    float _1433 = _1379 * _1347;
    float _1435 = -_1427;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1435);
    float _1439 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1441 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1443 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1431);
    float _1445 = -_1433;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1437);
    float _1449 = exp2(_1439);
    float _1451 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1453 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1443);
    float _1455 = fma(_1447, -0.5, 0.5);
    float _1457 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1459 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1451);
    float _1461 = fma(_1447, 0.5, 0.5);
    float _1463 = _1425 + 1.0;
    float _1465 = log2(_1421);
    float _1467 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1457);
    float _1469 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1459);
    float _1471 = fma(_1461, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1467);
    float _1475 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1469);
    float _1477 = 1.0 / _1453;
    float _1479 = -_1425;
    float _1481 = fma(_1449, _1463, _1479);
    float _1483 = fma(_1461, _1471, -0.212114393711090087890625);
    float _1485 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1473);
    float _1487 = fma(_1481, 0.5, 0.5);
    float _1489 = fma(_1461, _1483, 1.570728778839111328125);
    float _1491 = sqrt(_1455);
    float _1493 = _1465 * 0.693147182464599609375;
    float _1495 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = _1475 * _1477;
    float _1499 = _1485 * _1477;
    float _1501 = fma(_1497, 0.5, 0.5);
    float _1503 = fma(_1499, -0.5, 0.5);
    float _1505 = _1491 * 0.636619746685028076171875;
    float3 _3991 = float3(_1501, _1503, _1495);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3991, float3(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3991, float3(0.0), isnan(_3991)), level(0.0)).x;
    float3 _4002 = float3(_1501, _1503, _1495);
    float4 _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4002, float3(0.0), isnan(_4002)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4002, float3(0.0), isnan(_4002)), level(0.0)).xyzw;
    float _1512 = _1510.x;
    float _1514 = _1510.y;
    float _1516 = _1510.z;
    float _1518 = _1510.w;
    float _1520 = -_1489;
    float _1522 = fma(_1505, _1520, 1.0);
    float2 _4024 = float2(_1522, _1487);
    float3 _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4024, float2(0.0), isnan(_4024)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4024, float2(0.0), isnan(_4024)), level(0.0)).xyz;
    float _1528 = _1526.x;
    float _1530 = _1526.y;
    float _1532 = _1526.z;
    float _1534 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1536 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1538 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1540 = _1199 > 0.0;
    bool _1542 = isnan(_1199);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan(0.0);
    bool _1548 = _1544 || _1546;
    float _1550 = _1453 * 0.5;
    float _1552 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1536);
    float _1554 = exp2(_1534);
    float _1556 = _363 * _1538;
    float _1558 = _1475 + _1453;
    float _1560 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1552);
    float _1562 = fma(_1485, -0.5, _1550);
    float _1564 = _1558 * 0.5;
    float _1566 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1560);
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1570 = _1566 + _1453;
    out.gl_Position.x = _1475;
    out.gl_Position.y = _1485;
    out.gl_Position.z = _1566;
    out.gl_Position.w = _1453;
    float _1572 = _1570 * 0.5;
    float _1574 = -_1554;
    float _1576 = _1574 + 1.0;
    out.m_45.x = _1568;
    float _1578 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1564;
    out.m_62.y = _1562;
    out.m_62.z = _1572;
    out.m_62.w = _1453;
    float _1580 = -_1578;
    float _1582 = _1580 + 1.0;
    float _1584 = _1578 * _1507;
    float _1586 = _1518 * _1584;
    float _1588 = _1532 * _1584;
    float _1590 = fma(_1528, _1586, _1512);
    float _1592 = fma(_1530, _1586, _1514);
    float _1594 = _1518 * _1582;
    float _1596 = fma(_1518, _1588, _1516);
    out.m_64.x = _1590;
    out.m_64.y = _1592;
    out.m_64.z = _1596;
    out.m_64.w = _1594;
    if (_1548)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1598;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
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
        float _1655 = as_type<float>(_99);
        out.gl_Position.z = _1655;
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
        out.m_45.x = 0.0;
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
        float _1723 = as_type<float>(_135);
        out.gl_Position.z = _1723;
    }
    if (_129)
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
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_193;
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
    float _337 = fma(_275, _179, _327);
    int _339 = abs(_331);
    float _341 = fma(_275, _181, _333);
    float _343 = float(_321);
    float _345 = float(_325);
    float _347 = abs(_295);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _319, _349);
    float _355 = fma(_341, _277, _301);
    float _357 = fma(_323, _277, _297);
    float _359 = fma(_337, _277, _299);
    float _361 = abs(_315);
    float _363 = fma(_351, _361, _353);
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
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _391 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = 1.0 / _403;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _421 = 1.0 / _407;
    float _423 = 1.0 / _411;
    float _425 = _395 * _417;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _391 + _427;
    bool _431 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _433 = isnan(_391);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _415;
    float _445 = _399 * _421;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _461 = _391 + _459;
    float _463 = _429 * _423;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -_441;
    float _471 = _469 + 1.0;
    bool _473 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _475 = isnan(_391);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_467, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _487 = _457 * _471;
    bool _489 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_391);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = _461 * _443;
    float _503 = -_457;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -_483;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _515;
    float _519 = _483 * _505;
    bool _521 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_391);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _499 * _513;
    float _535 = -_499;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _543 = fma(_517, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _545 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = _531 * _537;
    float _549 = fma(_541, _445, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = -_531;
    float _553 = _551 + 1.0;
    float _555 = in.m_54.x;
    float _557 = in.m_54.y;
    float _559 = _485 * _547;
    float _561 = _543 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _567;
    float _571 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _575 = fma(_565, _463, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = fma(_545, _533, _571);
    float _583 = fma(_569, _463, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _589 = fma(_549, _533, _573);
    float _591 = fma(_579, _501, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _593 = fma(_575, _519, _581);
    float _595 = fma(_587, _501, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _597 = fma(_583, _519, _589);
    float _599 = fma(_591, _487, _593);
    float _601 = fma(_595, _487, _597);
    float _603 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[147].x, _599);
    float _605 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[147].y, _601);
    float _607 = _603 * _555;
    float _609 = _605 * _557;
    bool _611 = !_419;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _629;
    if (!_611)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _617 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_83);
        float _635 = 1.0 / _633;
        float _637 = _117 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_49.y;
    float _643 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _647;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _653 = _651 != 0;
    float _655 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _643);
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _663 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _667 = 1.0 / _649;
    float _669 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _661);
    float _671 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    bool _673 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _675 = isnan(_639);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _687 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _669);
    float _689 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _697 = _639 + _695;
    bool _699 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _701 = isnan(_639);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _711;
    float _715 = _689 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _717 = _641 > 0.5;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _721 = _697 * _667;
    float _723 = -_709;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _729 = _715 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _731;
    float _735 = fma(_713, _721, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _737;
    float _741 = _683 * _725;
    float _743 = fma(_733, _721, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _745 = _137 > 0.5;
    float _747 = fma(_739, _721, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _749 = -_215;
    int _751 = _717 ? as_type<int>(_749) : as_type<int>(_215);
    float _753 = _735 * _741;
    float _755 = -_683;
    float _757 = _755 + 1.0;
    float _759 = _747 * _741;
    bool _761 = !_659;
    float _763 = _761 ? _215 : as_type<float>(_751);
    float _765 = _687 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _767 = _743 * _741;
    float _769 = _693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _771 = -_207;
    int _773 = _745 ? as_type<int>(_771) : as_type<int>(_207);
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _777 = _765 + _775;
    float _779 = -_763;
    float _781 = _779 + 0.5;
    float _783 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    bool _785 = !_653;
    float _787 = _785 ? _207 : as_type<float>(_773);
    float _789 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _769);
    float _791 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _793 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].x, _759);
    float _795 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].z, _767);
    float _797 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _789);
    float _799 = _791 * _645;
    float _801 = _693 * _693;
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].y, _783);
    float _805 = _787 + 0.5;
    bool _807 = _797 >= 0.0;
    float _809 = fma(_777, _777, _801);
    float _811 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].x, _793);
    float _813 = fma(_729, _729, _809);
    float _815 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].z, _795);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _821 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _823 = rsqrt(_813);
    float _825 = _811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _827 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _829 = as_type<int>(_827);
    if (_807)
    {
        _613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _613;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _835 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _837 = _821 * _719;
    float _839 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _845 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _849;
    if (_807)
    {
        float _855 = _831 * 5.0;
        _829 = as_type<int>(_855);
    }
    int _857 = _829;
    out.m_56.x = _837;
    out.m_56.y = _799;
    float _859 = _693 * _823;
    float _861 = _777 * _823;
    out.m_58.x = _845;
    out.m_58.y = _847;
    out.m_58.z = _849;
    out.m_60.x = _839;
    out.m_60.y = _841;
    out.m_60.z = _851;
    out.m_60.w = _843;
    if (_807)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2909 = as_type<float>(_857);
        out.gl_Position.z = _2909;
    }
    if (_807)
    {
        out.m_45.x = 0.0;
    }
    if (_807)
    {
        return out;
    }
    float _863 = -_859;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _685);
    float _867 = _729 * _823;
    float _869 = -_861;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _765);
    float _873 = -_859;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _879 = _865 + _877;
    float _881 = -_867;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _887 = _871 + _885;
    float _889 = -_861;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _893 = _879 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _897 = _883 + _895;
    float _899 = _875 * _875;
    float _901 = -_867;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _729);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _893);
    float _907 = fma(_891, _891, _899);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[28].z, _905);
    float _911 = fma(_903, _903, _907);
    bool _913 = _909 >= 0.0;
    float _915 = sqrt(_911);
    float _917 = _867;
    float _919 = _887;
    if (_913)
    {
        _853 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _921 = _853;
    int _923 = as_type<int>(_921);
    if (_913)
    {
        out.m_45.x = 0.0;
    }
    float _925 = _823 * _915;
    if (_913)
    {
        float _927 = _921 * 5.0;
        _923 = as_type<int>(_927);
    }
    int _929 = _923;
    if (_913)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3042 = as_type<float>(_929);
        out.gl_Position.z = _3042;
    }
    if (_913)
    {
        return out;
    }
    float _931 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _933 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _939 = _925 * _931;
    float _941 = _925 * _933;
    float _943 = _925 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _945 = _943 * 0.5;
    float _947 = _935 * _939;
    float _949 = _937 * _941;
    bool _951 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _953 = isnan(0.5);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _959 = _955 || _957;
    float _961 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _963 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _973 = _969 || _971;
    float _975 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _961);
    float _977 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _963);
    float _979 = _865 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _981 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _975);
    float _983 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _977);
    float _985 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _979);
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _991 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _985);
    float _993 = _715 + _987;
    float _995 = _765 + _989;
    float _997 = _991 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1001 = _993 + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1005 = _995 + _1003;
    float _1007 = _1001 * _1001;
    float _1009 = fma(_1005, _1005, _1007);
    float _1011 = _865 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1013 = sqrt(_1009);
    float _1015 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1011);
    float _1017 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1019 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1015);
    float _1021 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1017);
    float _1023 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1025 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1027 = 1.0 / _1023;
    float _1029 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1031 = _997 + _1023;
    bool _1033 = _1013 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = _685 + _1029;
    float _1037 = _947;
    float _1039 = _997;
    float _1041 = _995;
    float _1043 = _945;
    if (!_1033)
    {
        _1037 = _993;
    }
    float _1045 = _1037;
    float _1047 = _1045;
    if (!_1033)
    {
        _1039 = _1035;
    }
    float _1049 = _1039;
    bool _1051 = !_1033;
    float _1053 = _1049;
    if (!_1051)
    {
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1059 = _1013 + _1057;
        float _1061 = rsqrt(_1009);
        float _1063 = _1059 * _1055;
        float _1065 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = _1063 * 0.15915493667125701904296875;
        float _1069 = _1067 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        float _1077 = fma(_1071, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = _1061 * _1077;
        float _1081 = _1075 + (-1.0);
        float _1083 = fma(_1005, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_1001, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1087 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1089 = fma(_1035, _1075, _1087);
        _1053 = _1089;
        _1047 = _1085;
        _1041 = _1083;
        _1043 = _1077;
    }
    float _1091 = _1053;
    float _1093 = _1047;
    float _1095 = _1041;
    float _1097 = _1043;
    float _1099 = -_859;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1103 = -_867;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1093);
    float _1107 = -_861;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    float _1111 = _1031 * _1027;
    float _1113 = _1111 * 0.5;
    float _1115 = _1097;
    float _1117 = _1109;
    float _1119 = _1105;
    float _1121 = _1091;
    float _1123 = _1113;
    if (_973)
    {
        _1115 = 1.0;
    }
    float _1125 = _1115;
    float _1127 = _1125;
    if (_959)
    {
        _917 = _1101;
    }
    float _1129 = _917;
    float _1131 = _1129;
    if (!_959)
    {
        float _1133 = _879 * _879;
        float _1135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1137 = -_715;
        float _1139 = _1137 + _1093;
        float _1141 = fma(_887, _887, _1133);
        float _1143 = fma(_897, _897, _1141);
        float _1145 = 1.0 / _925;
        float _1147 = sqrt(_1143);
        float _1149 = precise::min(_1147, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1151 = _1149 * _1135;
        float _1153 = -_765;
        float _1155 = _1153 + _1095;
        float _1157 = _1151 * _1145;
        float _1159 = -_685;
        float _1161 = _1159 + _1091;
        float _1163 = fma(_1155, _1157, _871);
        float _1165 = fma(_1161, _1157, _865);
        float _1167 = fma(_1139, _1157, _883);
        _1131 = _1165;
        _1117 = _1163;
        _1119 = _1167;
        _919 = _1147;
    }
    float _1169 = _1131;
    float _1171 = _1117;
    float _1173 = _1119;
    float _1175 = _919;
    if (!_973)
    {
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1179 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1177);
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1185 = 1.0 / _1179;
        float _1187 = 1.0 / _1183;
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1193 = fma(_1185, _1189, _1191);
        float _1195 = _1193 * _1187;
        float _1197 = precise::clamp(_1195, 0.0, 1.0);
        _1127 = _1197;
    }
    float _1199 = _1127;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1169 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1171 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1173 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1223 = _1207 * _1221;
    float _1225 = _1211 * _1221;
    float _1227 = _1223 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 + _1229;
    float _1233 = sqrt(_1231);
    bool _1235 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = _1233 + _1237;
    float _1241 = _897;
    float _1243 = _1239;
    float _1245 = _1203;
    float _1247 = _1223;
    if (_1235)
    {
        float _1249 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1249;
    }
    float _1251 = _1241;
    float _1253 = _1251;
    if (_1235)
    {
        float _1255 = _1239 * _1251;
        _1243 = _1255;
    }
    float _1257 = _1243;
    if (_1235)
    {
        float _1259 = rsqrt(_1231);
        _1253 = _1259;
    }
    float _1261 = _1253;
    float _1263 = _1261;
    if (_1235)
    {
        float _1265 = _1257 * 0.15915493667125701904296875;
        _1121 = _1265;
    }
    float _1267 = _1121;
    float _1269 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1271 = _1211;
    if (_1235)
    {
        float _1273 = _1267 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = precise::max(0.0, _1269);
    float _1281 = _1175;
    float _1283 = _1279;
    if (_1235)
    {
        float _1285 = _1267 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        _1281 = _1287;
    }
    float _1289 = _1281;
    float _1291 = -_1221;
    float _1293 = -_1279;
    float _1295 = fma(_1203, _1291, _1293);
    if (_1235)
    {
        float _1297 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1297;
    }
    float _1299 = _1245;
    float _1301 = sqrt(_1217);
    float _1303 = _1277;
    float _1305 = _1299;
    if (_1235)
    {
        float _1307 = fma(_1277, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1307;
    }
    float _1309 = _1303;
    float _1311 = _1309;
    if (!_1235)
    {
        _1305 = _1295;
    }
    float _1313 = _1305;
    float _1315 = _1313;
    if (_1235)
    {
        float _1317 = _1261 * _1309;
        _1123 = _1317;
    }
    float _1319 = _1123;
    if (!_1235)
    {
        _1311 = _1227;
    }
    float _1321 = _1311;
    float _1323 = _1321;
    float _1325 = _1289;
    if (_1235)
    {
        float _1327 = _1289 + (-1.0);
        _1283 = _1327;
    }
    float _1329 = _1283;
    float _1331 = _1329;
    if (_1235)
    {
        float _1333 = _1223 * _1319;
        _1247 = _1333;
    }
    float _1335 = _1247;
    if (_1235)
    {
        float _1337 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1337;
    }
    float _1339 = _1263;
    if (!_1235)
    {
        _1331 = _1225;
    }
    float _1341 = _1331;
    float _1343 = _1341;
    if (_1235)
    {
        float _1345 = _1225 * _1319;
        _1343 = _1345;
    }
    float _1347 = _1343;
    if (_1235)
    {
        float _1349 = _1335 * _1335;
        _1323 = _1349;
    }
    float _1351 = _1323;
    if (_1235)
    {
        float _1353 = fma(_1295, _1289, _1339);
        _1315 = _1353;
    }
    float _1355 = _1315;
    if (!_1235)
    {
        _1325 = _1229;
    }
    float _1357 = _1325;
    float _1359 = _1357;
    if (_1235)
    {
        float _1361 = _1347 * _1347;
        _1359 = _1361;
    }
    float _1363 = _1359;
    float _1365 = fma(_1355, _1355, _1351);
    float _1367 = _1365 + _1363;
    float _1369 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1373 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1371);
    float _1375 = precise::clamp(_1373, 0.0, 1.0);
    float _1377 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1379 = rsqrt(_1367);
    float _1381 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1383 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1369);
    float _1385 = -_1375;
    float _1387 = _1385 + 1.0;
    float _1389 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1391 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1377);
    float _1393 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1383);
    float _1395 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1389);
    float _1399 = abs(_1387);
    float _1401 = log2(_1399);
    float _1403 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1405 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1391);
    float _1407 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1397);
    float _1409 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1413 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1415 = _1379 * _1335;
    float _1417 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1419 = -_1411;
    float _1421 = fma(_1419, _1381, 1.0);
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1425 = _1379 * _1355;
    float _1427 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1429 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1409);
    float _1431 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1423);
    float _1433 = _1379 * _1347;
    float _1435 = -_1427;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1435);
    float _1439 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1441 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1443 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1431);
    float _1445 = -_1433;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1437);
    float _1449 = exp2(_1439);
    float _1451 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1453 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1443);
    float _1455 = fma(_1447, -0.5, 0.5);
    float _1457 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1459 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1451);
    float _1461 = fma(_1447, 0.5, 0.5);
    float _1463 = _1425 + 1.0;
    float _1465 = log2(_1421);
    float _1467 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1457);
    float _1469 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1459);
    float _1471 = fma(_1461, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1467);
    float _1475 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1469);
    float _1477 = 1.0 / _1453;
    float _1479 = -_1425;
    float _1481 = fma(_1449, _1463, _1479);
    float _1483 = fma(_1461, _1471, -0.212114393711090087890625);
    float _1485 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1473);
    float _1487 = fma(_1481, 0.5, 0.5);
    float _1489 = fma(_1461, _1483, 1.570728778839111328125);
    float _1491 = sqrt(_1455);
    float _1493 = _1465 * 0.693147182464599609375;
    float _1495 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = _1475 * _1477;
    float _1499 = _1485 * _1477;
    float _1501 = fma(_1497, 0.5, 0.5);
    float _1503 = fma(_1499, -0.5, 0.5);
    float _1505 = _1491 * 0.636619746685028076171875;
    float3 _3991 = float3(_1501, _1503, _1495);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3991, float3(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3991, float3(0.0), isnan(_3991)), level(0.0)).x;
    float3 _4002 = float3(_1501, _1503, _1495);
    float4 _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4002, float3(0.0), isnan(_4002)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4002, float3(0.0), isnan(_4002)), level(0.0)).xyzw;
    float _1512 = _1510.x;
    float _1514 = _1510.y;
    float _1516 = _1510.z;
    float _1518 = _1510.w;
    float _1520 = -_1489;
    float _1522 = fma(_1505, _1520, 1.0);
    float2 _4024 = float2(_1522, _1487);
    float3 _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4024, float2(0.0), isnan(_4024)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4024, float2(0.0), isnan(_4024)), level(0.0)).xyz;
    float _1528 = _1526.x;
    float _1530 = _1526.y;
    float _1532 = _1526.z;
    float _1534 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1536 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1538 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1540 = _1199 > 0.0;
    bool _1542 = isnan(_1199);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan(0.0);
    bool _1548 = _1544 || _1546;
    float _1550 = _1453 * 0.5;
    float _1552 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1536);
    float _1554 = exp2(_1534);
    float _1556 = _363 * _1538;
    float _1558 = _1475 + _1453;
    float _1560 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1552);
    float _1562 = fma(_1485, -0.5, _1550);
    float _1564 = _1558 * 0.5;
    float _1566 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1560);
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1570 = _1566 + _1453;
    out.gl_Position.x = _1475;
    out.gl_Position.y = _1485;
    out.gl_Position.z = _1566;
    out.gl_Position.w = _1453;
    float _1572 = _1570 * 0.5;
    float _1574 = -_1554;
    float _1576 = _1574 + 1.0;
    out.m_45.x = _1568;
    float _1578 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1564;
    out.m_62.y = _1562;
    out.m_62.z = _1572;
    out.m_62.w = _1453;
    float _1580 = -_1578;
    float _1582 = _1580 + 1.0;
    float _1584 = _1578 * _1507;
    float _1586 = _1518 * _1584;
    float _1588 = _1532 * _1584;
    float _1590 = fma(_1528, _1586, _1512);
    float _1592 = fma(_1530, _1586, _1514);
    float _1594 = _1518 * _1582;
    float _1596 = fma(_1518, _1588, _1516);
    out.m_64.x = _1590;
    out.m_64.y = _1592;
    out.m_64.z = _1596;
    out.m_64.w = _1594;
    if (_1548)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1598;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _631 = false;
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
        float _1655 = as_type<float>(_99);
        out.gl_Position.z = _1655;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1723 = as_type<float>(_135);
        out.gl_Position.z = _1723;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_185;
    float _211 = _169 + _209;
    bool _213 = !_193;
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
    float _337 = fma(_275, _179, _327);
    int _339 = abs(_331);
    float _341 = fma(_275, _181, _333);
    float _343 = float(_321);
    float _345 = float(_325);
    float _347 = abs(_295);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _319, _349);
    float _355 = fma(_341, _277, _301);
    float _357 = fma(_323, _277, _297);
    float _359 = fma(_337, _277, _299);
    float _361 = abs(_315);
    float _363 = fma(_351, _361, _353);
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
    float _395 = _391 + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _399 = _391 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = 1.0 / _403;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _421 = 1.0 / _407;
    float _423 = 1.0 / _411;
    float _425 = _395 * _417;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _429 = _391 + _427;
    bool _431 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _433 = isnan(_391);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = 1.0 / _415;
    float _445 = _399 * _421;
    bool _447 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _449 = isnan(_391);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _461 = _391 + _459;
    float _463 = _429 * _423;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _465;
    float _469 = -_441;
    float _471 = _469 + 1.0;
    bool _473 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _475 = isnan(_391);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = fma(_467, _425, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _487 = _457 * _471;
    bool _489 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_391);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = _461 * _443;
    float _503 = -_457;
    float _505 = _503 + 1.0;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _507 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = -_483;
    float _513 = _511 + 1.0;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _515;
    float _519 = _483 * _505;
    bool _521 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _523 = isnan(_391);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = _499 * _513;
    float _535 = -_499;
    float _537 = _535 + 1.0;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _543 = fma(_517, _425, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _545 = fma(_509, _445, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _547 = _531 * _537;
    float _549 = fma(_541, _445, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _551 = -_531;
    float _553 = _551 + 1.0;
    float _555 = in.m_54.x;
    float _557 = in.m_54.y;
    float _559 = _485 * _547;
    float _561 = _543 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _567;
    float _571 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[143].x, _559);
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[143].y, _561);
    float _575 = fma(_565, _463, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _581 = fma(_545, _533, _571);
    float _583 = fma(_569, _463, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _589 = fma(_549, _533, _573);
    float _591 = fma(_579, _501, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _593 = fma(_575, _519, _581);
    float _595 = fma(_587, _501, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _597 = fma(_583, _519, _589);
    float _599 = fma(_591, _487, _593);
    float _601 = fma(_595, _487, _597);
    float _603 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[147].x, _599);
    float _605 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[147].y, _601);
    float _607 = _603 * _555;
    float _609 = _605 * _557;
    bool _611 = !_419;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _629;
    if (!_611)
    {
        float _615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _617 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _619 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _621 = _619 * _615;
        float _623 = floor(_621);
        float _625 = -_623;
        float _627 = _621 + _625;
        _629 = _627;
        _631 = true;
    }
    else
    {
        float _633 = float(_83);
        float _635 = 1.0 / _633;
        float _637 = _117 * _635;
        _629 = _637;
    }
    _631 = false;
    float _639 = _629;
    float _641 = in.m_49.y;
    float _643 = _359 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _647;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _653 = _651 != 0;
    float _655 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _643);
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = _359 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _663 = _359 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _665 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[5].z, _655);
    float _667 = 1.0 / _649;
    float _669 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _661);
    float _671 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _663);
    bool _673 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _675 = isnan(_639);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = _665 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _687 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[4].z, _669);
    float _689 = fma(_355, (*spvDescriptorSet0.vp_c10)._m0[6].z, _671);
    float _691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _697 = _639 + _695;
    bool _699 = _639 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _701 = isnan(_639);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _711;
    float _715 = _689 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _717 = _641 > 0.5;
    float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _721 = _697 * _667;
    float _723 = -_709;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _729 = _715 + _727;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _733 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _731;
    float _735 = fma(_713, _721, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _737;
    float _741 = _683 * _725;
    float _743 = fma(_733, _721, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _745 = _137 > 0.5;
    float _747 = fma(_739, _721, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _749 = -_215;
    int _751 = _717 ? as_type<int>(_749) : as_type<int>(_215);
    float _753 = _735 * _741;
    float _755 = -_683;
    float _757 = _755 + 1.0;
    float _759 = _747 * _741;
    bool _761 = !_659;
    float _763 = _761 ? _215 : as_type<float>(_751);
    float _765 = _687 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _767 = _743 * _741;
    float _769 = _693 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _771 = -_207;
    int _773 = _745 ? as_type<int>(_771) : as_type<int>(_207);
    float _775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _777 = _765 + _775;
    float _779 = -_763;
    float _781 = _779 + 0.5;
    float _783 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].y, _753);
    bool _785 = !_653;
    float _787 = _785 ? _207 : as_type<float>(_773);
    float _789 = fma(_777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _769);
    float _791 = _781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _793 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].x, _759);
    float _795 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[107].z, _767);
    float _797 = fma(_729, (*spvDescriptorSet0.vp_c8)._m0[28].z, _789);
    float _799 = _791 * _645;
    float _801 = _693 * _693;
    float _803 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].y, _783);
    float _805 = _787 + 0.5;
    bool _807 = _797 >= 0.0;
    float _809 = fma(_777, _777, _801);
    float _811 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].x, _793);
    float _813 = fma(_729, _729, _809);
    float _815 = fma(_709, (*spvDescriptorSet0.vp_c9)._m0[108].z, _795);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _821 = _805 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _823 = rsqrt(_813);
    float _825 = _811 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _827 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _829 = as_type<int>(_827);
    if (_807)
    {
        _613 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _831 = _613;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _835 = _815 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _837 = _821 * _719;
    float _839 = _825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _841 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _845 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _847 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _849;
    if (_807)
    {
        float _855 = _831 * 5.0;
        _829 = as_type<int>(_855);
    }
    int _857 = _829;
    out.m_56.x = _837;
    out.m_56.y = _799;
    float _859 = _693 * _823;
    float _861 = _777 * _823;
    out.m_58.x = _845;
    out.m_58.y = _847;
    out.m_58.z = _849;
    out.m_60.x = _839;
    out.m_60.y = _841;
    out.m_60.z = _851;
    out.m_60.w = _843;
    if (_807)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2909 = as_type<float>(_857);
        out.gl_Position.z = _2909;
    }
    if (_807)
    {
        out.m_45.x = 0.0;
    }
    if (_807)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _863 = -_859;
    float _865 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[18].w, _685);
    float _867 = _729 * _823;
    float _869 = -_861;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _765);
    float _873 = -_859;
    float _875 = fma(_873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _693);
    float _877 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _879 = _865 + _877;
    float _881 = -_867;
    float _883 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[18].w, _715);
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _887 = _871 + _885;
    float _889 = -_861;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _893 = _879 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _897 = _883 + _895;
    float _899 = _875 * _875;
    float _901 = -_867;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _729);
    float _905 = fma(_887, (*spvDescriptorSet0.vp_c8)._m0[28].x, _893);
    float _907 = fma(_891, _891, _899);
    float _909 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[28].z, _905);
    float _911 = fma(_903, _903, _907);
    bool _913 = _909 >= 0.0;
    float _915 = sqrt(_911);
    float _917 = _867;
    float _919 = _887;
    if (_913)
    {
        _853 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _921 = _853;
    int _923 = as_type<int>(_921);
    if (_913)
    {
        out.m_45.x = 0.0;
    }
    float _925 = _823 * _915;
    if (_913)
    {
        float _927 = _921 * 5.0;
        _923 = as_type<int>(_927);
    }
    int _929 = _923;
    if (_913)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3042 = as_type<float>(_929);
        out.gl_Position.z = _3042;
    }
    if (_913)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _931 = _609 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _933 = _607 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _937 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _939 = _925 * _931;
    float _941 = _925 * _933;
    float _943 = _925 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _945 = _943 * 0.5;
    float _947 = _935 * _939;
    float _949 = _937 * _941;
    bool _951 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _953 = isnan(0.5);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _959 = _955 || _957;
    float _961 = _947 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _963 = _947 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _973 = _969 || _971;
    float _975 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[26].x, _961);
    float _977 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[24].x, _963);
    float _979 = _865 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _981 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[26].z, _975);
    float _983 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[24].z, _977);
    float _985 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[10].x, _979);
    float _987 = _981 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _989 = _983 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _991 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _985);
    float _993 = _715 + _987;
    float _995 = _765 + _989;
    float _997 = _991 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _999 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1001 = _993 + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1005 = _995 + _1003;
    float _1007 = _1001 * _1001;
    float _1009 = fma(_1005, _1005, _1007);
    float _1011 = _865 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1013 = sqrt(_1009);
    float _1015 = fma(_871, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1011);
    float _1017 = _947 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1019 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1015);
    float _1021 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1017);
    float _1023 = _1019 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1025 = fma(_945, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1021);
    float _1027 = 1.0 / _1023;
    float _1029 = _1025 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1031 = _997 + _1023;
    bool _1033 = _1013 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1035 = _685 + _1029;
    float _1037 = _947;
    float _1039 = _997;
    float _1041 = _995;
    float _1043 = _945;
    if (!_1033)
    {
        _1037 = _993;
    }
    float _1045 = _1037;
    float _1047 = _1045;
    if (!_1033)
    {
        _1039 = _1035;
    }
    float _1049 = _1039;
    bool _1051 = !_1033;
    float _1053 = _1049;
    if (!_1051)
    {
        float _1055 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1059 = _1013 + _1057;
        float _1061 = rsqrt(_1009);
        float _1063 = _1059 * _1055;
        float _1065 = _1035 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1067 = _1063 * 0.15915493667125701904296875;
        float _1069 = _1067 * 6.283185482025146484375;
        float _1071 = sin(_1069);
        float _1073 = _1067 * 6.283185482025146484375;
        float _1075 = cos(_1073);
        float _1077 = fma(_1071, _1065, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1079 = _1061 * _1077;
        float _1081 = _1075 + (-1.0);
        float _1083 = fma(_1005, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1085 = fma(_1001, _1079, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1087 = _1081 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1089 = fma(_1035, _1075, _1087);
        _1053 = _1089;
        _1047 = _1085;
        _1041 = _1083;
        _1043 = _1077;
    }
    float _1091 = _1053;
    float _1093 = _1047;
    float _1095 = _1041;
    float _1097 = _1043;
    float _1099 = -_859;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    float _1103 = -_867;
    float _1105 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1093);
    float _1107 = -_861;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    float _1111 = _1031 * _1027;
    float _1113 = _1111 * 0.5;
    float _1115 = _1097;
    float _1117 = _1109;
    float _1119 = _1105;
    float _1121 = _1091;
    float _1123 = _1113;
    if (_973)
    {
        _1115 = 1.0;
    }
    float _1125 = _1115;
    float _1127 = _1125;
    if (_959)
    {
        _917 = _1101;
    }
    float _1129 = _917;
    float _1131 = _1129;
    if (!_959)
    {
        float _1133 = _879 * _879;
        float _1135 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1137 = -_715;
        float _1139 = _1137 + _1093;
        float _1141 = fma(_887, _887, _1133);
        float _1143 = fma(_897, _897, _1141);
        float _1145 = 1.0 / _925;
        float _1147 = sqrt(_1143);
        float _1149 = precise::min(_1147, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1151 = _1149 * _1135;
        float _1153 = -_765;
        float _1155 = _1153 + _1095;
        float _1157 = _1151 * _1145;
        float _1159 = -_685;
        float _1161 = _1159 + _1091;
        float _1163 = fma(_1155, _1157, _871);
        float _1165 = fma(_1161, _1157, _865);
        float _1167 = fma(_1139, _1157, _883);
        _1131 = _1165;
        _1117 = _1163;
        _1119 = _1167;
        _919 = _1147;
    }
    float _1169 = _1131;
    float _1171 = _1117;
    float _1173 = _1119;
    float _1175 = _919;
    if (!_973)
    {
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1179 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1177);
        float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        float _1185 = 1.0 / _1179;
        float _1187 = 1.0 / _1183;
        float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1193 = fma(_1185, _1189, _1191);
        float _1195 = _1193 * _1187;
        float _1197 = precise::clamp(_1195, 0.0, 1.0);
        _1127 = _1197;
    }
    float _1199 = _1127;
    float _1201 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1203 = _1169 + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1207 = _1171 + _1205;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1211 = _1173 + _1209;
    float _1213 = _1203 * _1203;
    float _1215 = fma(_1207, _1207, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1223 = _1207 * _1221;
    float _1225 = _1211 * _1221;
    float _1227 = _1223 * _1223;
    float _1229 = _1225 * _1225;
    float _1231 = _1227 + _1229;
    float _1233 = sqrt(_1231);
    bool _1235 = _1233 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1237 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1239 = _1233 + _1237;
    float _1241 = _897;
    float _1243 = _1239;
    float _1245 = _1203;
    float _1247 = _1223;
    if (_1235)
    {
        float _1249 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1241 = _1249;
    }
    float _1251 = _1241;
    float _1253 = _1251;
    if (_1235)
    {
        float _1255 = _1239 * _1251;
        _1243 = _1255;
    }
    float _1257 = _1243;
    if (_1235)
    {
        float _1259 = rsqrt(_1231);
        _1253 = _1259;
    }
    float _1261 = _1253;
    float _1263 = _1261;
    if (_1235)
    {
        float _1265 = _1257 * 0.15915493667125701904296875;
        _1121 = _1265;
    }
    float _1267 = _1121;
    float _1269 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1271 = _1211;
    if (_1235)
    {
        float _1273 = _1267 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = precise::max(0.0, _1269);
    float _1281 = _1175;
    float _1283 = _1279;
    if (_1235)
    {
        float _1285 = _1267 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        _1281 = _1287;
    }
    float _1289 = _1281;
    float _1291 = -_1221;
    float _1293 = -_1279;
    float _1295 = fma(_1203, _1291, _1293);
    if (_1235)
    {
        float _1297 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1245 = _1297;
    }
    float _1299 = _1245;
    float _1301 = sqrt(_1217);
    float _1303 = _1277;
    float _1305 = _1299;
    if (_1235)
    {
        float _1307 = fma(_1277, _1299, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1307;
    }
    float _1309 = _1303;
    float _1311 = _1309;
    if (!_1235)
    {
        _1305 = _1295;
    }
    float _1313 = _1305;
    float _1315 = _1313;
    if (_1235)
    {
        float _1317 = _1261 * _1309;
        _1123 = _1317;
    }
    float _1319 = _1123;
    if (!_1235)
    {
        _1311 = _1227;
    }
    float _1321 = _1311;
    float _1323 = _1321;
    float _1325 = _1289;
    if (_1235)
    {
        float _1327 = _1289 + (-1.0);
        _1283 = _1327;
    }
    float _1329 = _1283;
    float _1331 = _1329;
    if (_1235)
    {
        float _1333 = _1223 * _1319;
        _1247 = _1333;
    }
    float _1335 = _1247;
    if (_1235)
    {
        float _1337 = _1329 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1263 = _1337;
    }
    float _1339 = _1263;
    if (!_1235)
    {
        _1331 = _1225;
    }
    float _1341 = _1331;
    float _1343 = _1341;
    if (_1235)
    {
        float _1345 = _1225 * _1319;
        _1343 = _1345;
    }
    float _1347 = _1343;
    if (_1235)
    {
        float _1349 = _1335 * _1335;
        _1323 = _1349;
    }
    float _1351 = _1323;
    if (_1235)
    {
        float _1353 = fma(_1295, _1289, _1339);
        _1315 = _1353;
    }
    float _1355 = _1315;
    if (!_1235)
    {
        _1325 = _1229;
    }
    float _1357 = _1325;
    float _1359 = _1357;
    if (_1235)
    {
        float _1361 = _1347 * _1347;
        _1359 = _1361;
    }
    float _1363 = _1359;
    float _1365 = fma(_1355, _1355, _1351);
    float _1367 = _1365 + _1363;
    float _1369 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1371 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1373 = fma(_1301, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1371);
    float _1375 = precise::clamp(_1373, 0.0, 1.0);
    float _1377 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1379 = rsqrt(_1367);
    float _1381 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1383 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1369);
    float _1385 = -_1375;
    float _1387 = _1385 + 1.0;
    float _1389 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1391 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1377);
    float _1393 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1383);
    float _1395 = _1169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1397 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1389);
    float _1399 = abs(_1387);
    float _1401 = log2(_1399);
    float _1403 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1405 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1391);
    float _1407 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1397);
    float _1409 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1395);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1413 = _1405 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1415 = _1379 * _1335;
    float _1417 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1419 = -_1411;
    float _1421 = fma(_1419, _1381, 1.0);
    float _1423 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1425 = _1379 * _1355;
    float _1427 = _1415 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1429 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1409);
    float _1431 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1423);
    float _1433 = _1379 * _1347;
    float _1435 = -_1427;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1435);
    float _1439 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1441 = _1429 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1443 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1431);
    float _1445 = -_1433;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1437);
    float _1449 = exp2(_1439);
    float _1451 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1453 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1443);
    float _1455 = fma(_1447, -0.5, 0.5);
    float _1457 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1459 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1451);
    float _1461 = fma(_1447, 0.5, 0.5);
    float _1463 = _1425 + 1.0;
    float _1465 = log2(_1421);
    float _1467 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1457);
    float _1469 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1459);
    float _1471 = fma(_1461, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1473 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1467);
    float _1475 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1469);
    float _1477 = 1.0 / _1453;
    float _1479 = -_1425;
    float _1481 = fma(_1449, _1463, _1479);
    float _1483 = fma(_1461, _1471, -0.212114393711090087890625);
    float _1485 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1473);
    float _1487 = fma(_1481, 0.5, 0.5);
    float _1489 = fma(_1461, _1483, 1.570728778839111328125);
    float _1491 = sqrt(_1455);
    float _1493 = _1465 * 0.693147182464599609375;
    float _1495 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = _1475 * _1477;
    float _1499 = _1485 * _1477;
    float _1501 = fma(_1497, 0.5, 0.5);
    float _1503 = fma(_1499, -0.5, 0.5);
    float _1505 = _1491 * 0.636619746685028076171875;
    float3 _3991 = float3(_1501, _1503, _1495);
    float _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3991, float3(0.0), isnan(_3991)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3991, float3(0.0), isnan(_3991)), level(0.0)).x;
    float3 _4002 = float3(_1501, _1503, _1495);
    float4 _1510 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4002, float3(0.0), isnan(_4002)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4002, float3(0.0), isnan(_4002)), level(0.0)).xyzw;
    float _1512 = _1510.x;
    float _1514 = _1510.y;
    float _1516 = _1510.z;
    float _1518 = _1510.w;
    float _1520 = -_1489;
    float _1522 = fma(_1505, _1520, 1.0);
    float2 _4024 = float2(_1522, _1487);
    float3 _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4024, float2(0.0), isnan(_4024)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4024, float2(0.0), isnan(_4024)), level(0.0)).xyz;
    float _1528 = _1526.x;
    float _1530 = _1526.y;
    float _1532 = _1526.z;
    float _1534 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1536 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1538 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1540 = _1199 > 0.0;
    bool _1542 = isnan(_1199);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan(0.0);
    bool _1548 = _1544 || _1546;
    float _1550 = _1453 * 0.5;
    float _1552 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1536);
    float _1554 = exp2(_1534);
    float _1556 = _363 * _1538;
    float _1558 = _1475 + _1453;
    float _1560 = fma(_1403, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1552);
    float _1562 = fma(_1485, -0.5, _1550);
    float _1564 = _1558 * 0.5;
    float _1566 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1560);
    float _1568 = _1556 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1570 = _1566 + _1453;
    out.gl_Position.x = _1475;
    out.gl_Position.y = _1485;
    out.gl_Position.z = _1566;
    out.gl_Position.w = _1453;
    float _1572 = _1570 * 0.5;
    float _1574 = -_1554;
    float _1576 = _1574 + 1.0;
    out.m_45.x = _1568;
    float _1578 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.x = _1564;
    out.m_62.y = _1562;
    out.m_62.z = _1572;
    out.m_62.w = _1453;
    float _1580 = -_1578;
    float _1582 = _1580 + 1.0;
    float _1584 = _1578 * _1507;
    float _1586 = _1518 * _1584;
    float _1588 = _1532 * _1584;
    float _1590 = fma(_1528, _1586, _1512);
    float _1592 = fma(_1530, _1586, _1514);
    float _1594 = _1518 * _1582;
    float _1596 = fma(_1518, _1588, _1516);
    out.m_64.x = _1590;
    out.m_64.y = _1592;
    out.m_64.z = _1596;
    out.m_64.w = _1594;
    if (_1548)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1598;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

