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
    float4 m_56 [[user(locn1)]];
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _705 = false;
    bool _537 = false;
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
        float _1711 = as_type<float>(_99);
        out.gl_Position.z = _1711;
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
        float _1780 = as_type<float>(_135);
        out.gl_Position.z = _1780;
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
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    if (!_161)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _167 * 0.15915493667125701904296875;
    float _191 = _187;
    if (!_161)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_169;
    float _211 = _165 + _209;
    bool _213 = !_177;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_161;
    float _219 = _195;
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
    bool _253 = !_161;
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
        _181 = _273;
    }
    float _275 = _181;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    bool _287 = _211 < 0.5;
    float _289 = float(_287);
    float _291 = -_211;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = fma(_203, 0.5, 0.5);
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_199;
    int _311 = _309 ? 0 : 1;
    float _313 = -_289;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_295;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_305);
    float _323 = fma(_275, _147, _307);
    int _325 = abs(_311);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_275, _149, _327);
    int _339 = abs(_331);
    float _341 = fma(_275, _151, _333);
    float _343 = float(_321);
    float _345 = float(_325);
    float _347 = abs(_293);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _319, _349);
    float _355 = fma(_337, _277, _299);
    float _357 = fma(_323, _277, _297);
    float _359 = fma(_341, _277, _301);
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
    bool _397 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _399 = isnan(_391);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _391 + _409;
    bool _413 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_391);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    float _437 = 1.0 / _427;
    float _439 = _423 * _435;
    float _441 = -_423;
    float _443 = _441 + 1.0;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _447 = 1.0 / _431;
    float _449 = _395 * _437;
    bool _451 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _453 = isnan(_391);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _463;
    float _467 = in.m_54.x;
    float _469 = in.m_54.y;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _471;
    float _475 = fma(_465, _449, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = _461 * _443;
    float _479 = fma(_473, _449, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _481 = _411 * _447;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = _475 * _477;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _479 * _477;
    float _499 = fma(_485, _481, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_495, _481, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _507 = fma(_499, _439, _501);
    float _509 = fma(_503, _439, _505);
    float _511 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[145].x, _507);
    float _513 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[145].y, _509);
    float _515 = _511 * _467;
    float _517 = _513 * _469;
    bool _519 = !_445;
    float _535;
    if (!_519)
    {
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _523 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_83);
        float _541 = 1.0 / _539;
        float _543 = _117 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _549 = _545 + _547;
    bool _551 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _553 = isnan(_545);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _565 = isnan(_545);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _583 = 1.0 / _577;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _587 = 1.0 / _581;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _589;
    float _593 = _549 * _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _597 = _545 + _595;
    bool _599 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _601 = isnan(_545);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_561;
    float _613 = _611 + 1.0;
    float _615 = fma(_591, _593, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = _609 * _613;
    float _619 = -_609;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _627;
    float _631 = _573 * _621;
    float _633 = fma(_625, _593, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _635 = fma(_629, _593, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = _597 * _587;
    float _639 = _615 * _631;
    float _641 = _633 * _631;
    float _643 = _635 * _631;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _653 = -_573;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = fma(_647, _637, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _663 = fma(_651, _637, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _665 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].x, _641);
    float _667 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].y, _639);
    float _669 = fma(_659, _637, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].z, _643);
    float _673 = fma(_661, _617, _665);
    float _675 = fma(_663, _617, _667);
    float _677 = fma(_669, _617, _671);
    float _679 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].x, _673);
    float _681 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].y, _675);
    float _683 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].z, _677);
    bool _685 = !_585;
    float _687 = _637;
    float _703;
    if (!_685)
    {
        float _689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _691 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _695 = _693 * _689;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _701;
        _705 = true;
    }
    else
    {
        float _707 = float(_83);
        float _709 = 1.0 / _707;
        float _711 = _117 * _709;
        _703 = _711;
    }
    _705 = false;
    float _713 = _703;
    float _715 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _717 = _363 * _515;
    float _719 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _721 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].y, _715);
    float _723 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _719);
    float _725 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _727 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _723);
    float _729 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _731 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _733 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _735 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].y, _721);
    float _737 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _725);
    float _739 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _729);
    float _741 = sqrt(_727);
    float _743 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _737);
    float _745 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _747 = _363 * _517;
    float _749 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _739);
    float _751 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].z, _731);
    float _753 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].x, _745);
    float _755 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].w, _733);
    float _757 = sqrt(_743);
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _761 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _763 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].x, _753);
    float _765 = _735 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _767 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].z, _751);
    float _769 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].w, _755);
    float _771 = _761 * _759;
    float _773 = sqrt(_749);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _777 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = _763 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _781 = _767 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _783 = _769 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _785 = _777 * _775;
    float _787 = _741 * _779;
    float _789 = _757 * _765;
    float _791 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _793 = _785 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _795 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _799 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _801 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _797);
    float _807 = _773 * _781;
    float _809 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _799);
    float _811 = _785 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _813 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[26].z, _801);
    float _815 = _785 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _809);
    float _819 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _811);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _823 = _813 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].w, _817);
    float _827 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[24].z, _819);
    float _829 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].w, _821);
    float _831 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _805);
    float _833 = _825 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _835 = _827 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _837 = _829 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _839 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].w, _831);
    float _841 = _833 + _823;
    float _843 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _815);
    float _845 = _837 + _835;
    float _847 = _839 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _851 = _841 + _849;
    float _853 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[25].z, _843);
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _857 = _845 + _855;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _861 = _851 * _851;
    float _863 = _853 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _865 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _867 = isnan(0.5);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _873 = _869 || _871;
    float _875 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[11].x, _859);
    float _877 = fma(_857, _857, _861);
    float _879 = _847 + _863;
    bool _881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _883 = isnan(0.5);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _889 = _885 || _887;
    float _891 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[11].z, _875);
    float _893 = sqrt(_877);
    float _895 = _847 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _897 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _899 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[10].x, _895);
    float _901 = 1.0 / _897;
    float _903 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[10].z, _899);
    float _905 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _907 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = _905 + _897;
    float _911 = _909 * _901;
    float _913 = _911 * 0.5;
    float _915 = _909;
    float _917 = _863;
    float _919 = _897;
    float _921 = _893;
    float _923 = _901;
    float _925 = _853;
    if (!_907)
    {
        _915 = _845;
    }
    float _927 = _915;
    float _929 = _927;
    if (!_907)
    {
        _917 = _841;
    }
    float _931 = _917;
    float _933 = _931;
    if (!_907)
    {
        _919 = _879;
    }
    float _935 = _919;
    bool _937 = !_907;
    float _939 = _935;
    if (!_937)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _943 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _945 = _893 + _943;
        float _947 = rsqrt(_877);
        float _949 = _945 * _941;
        float _951 = _879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _949 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _953 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _957 + (-1.0);
        float _965 = _963 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _967 = fma(_961, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _969 = fma(_879, _957, _965);
        float _971 = _947 * _967;
        float _973 = fma(_857, _971, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _975 = fma(_851, _971, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _929 = _973;
        _939 = _969;
        _933 = _975;
        _921 = _951;
        _923 = _953;
    }
    float _977 = _929;
    float _979 = _939;
    float _981 = _933;
    float _983 = _921;
    float _985 = _923;
    float _987 = _983;
    float _989 = _985;
    float _991 = _979;
    float _993 = _977;
    float _995 = _981;
    if (_889)
    {
        _987 = 1.0;
    }
    float _997 = _987;
    float _999 = _997;
    if (!_873)
    {
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1003 = _847 + _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1007 = _837 + _1005;
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1011 = -_837;
        float _1013 = _1011 + _977;
        float _1015 = _1003 * _1003;
        float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1019 = _833 + _1017;
        float _1021 = -_847;
        float _1023 = _1021 + _979;
        float _1025 = fma(_1007, _1007, _1015);
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1029 = fma(_1019, _1019, _1025);
        float _1031 = sqrt(_1029);
        float _1033 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1035 = precise::min(_1031, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1037 = _1035 * _1027;
        float _1039 = _1033 * _1037;
        float _1041 = -_833;
        float _1043 = _1041 + _981;
        float _1045 = fma(_1013, _1039, _837);
        float _1047 = fma(_1023, _1039, _847);
        float _1049 = fma(_1043, _1039, _833);
        _989 = _1039;
        _991 = _1047;
        _993 = _1045;
        _995 = _1049;
        _925 = _1043;
    }
    float _1051 = _989;
    float _1053 = _991;
    float _1055 = _993;
    float _1057 = _995;
    float _1059 = _925;
    float _1061 = _1059;
    float _1063 = _1051;
    if (!_889)
    {
        float _1065 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = _1065 * 0.15915493667125701904296875;
        float _1069 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1073 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1071);
        float _1075 = _1067 * 6.283185482025146484375;
        float _1077 = cos(_1075);
        float _1079 = _1069 * 0.15915493667125701904296875;
        float _1081 = _1067 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = 1.0 / _1077;
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1083 * _1085;
        float _1093 = _1079 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1089 * _1091;
        float _1099 = 1.0 / _1073;
        float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1103 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1101;
        float _1105 = 1.0 / _1097;
        float _1107 = 1.0 / _1103;
        float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1111 = _1099 * _1109;
        float _1113 = _1095 * _1105;
        float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1117 = fma(_1113, _1111, _1115);
        float _1119 = _1117 * _1107;
        float _1121 = precise::clamp(_1119, 0.0, 1.0);
        _1061 = _1079;
        _1063 = _1107;
        _999 = _1121;
    }
    float _1123 = _1061;
    float _1125 = _1063;
    float _1127 = _999;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1131 = _1053 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1055 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1139 = _1057 + _1137;
    float _1141 = _1131 * _1131;
    float _1143 = fma(_1135, _1135, _1141);
    float _1145 = fma(_1139, _1139, _1143);
    float _1147 = rsqrt(_1145);
    float _1149 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1151 = _1135 * _1149;
    float _1153 = _1139 * _1149;
    float _1155 = _1151 * _1151;
    float _1157 = _1153 * _1153;
    float _1159 = _1155 + _1157;
    float _1161 = sqrt(_1159);
    bool _1163 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = _1161 + _1165;
    float _1169 = _1139;
    float _1171 = _1125;
    float _1173 = _1167;
    float _1175 = _1123;
    float _1177 = _1131;
    if (_1163)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1169 = _1179;
    }
    float _1181 = _1169;
    if (_1163)
    {
        float _1183 = rsqrt(_1159);
        _1171 = _1183;
    }
    float _1185 = _1171;
    float _1187 = _1185;
    if (_1163)
    {
        float _1189 = _1167 * _1181;
        _1173 = _1189;
    }
    float _1191 = _1173;
    if (_1163)
    {
        float _1193 = _1191 * 0.15915493667125701904296875;
        _1175 = _1193;
    }
    float _1195 = _1175;
    float _1197 = _1147;
    if (_1163)
    {
        float _1199 = _1195 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        _1197 = _1201;
    }
    float _1203 = _1197;
    float _1205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1207 = precise::max(0.0, _1205);
    float _1209 = _1141;
    float _1211 = _1207;
    float _1213 = _1205;
    if (_1163)
    {
        float _1215 = _1195 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        _1209 = _1217;
    }
    float _1219 = _1209;
    float _1221 = -_1149;
    float _1223 = -_1207;
    float _1225 = fma(_1131, _1221, _1223);
    if (!_1163)
    {
        _1177 = _1155;
    }
    float _1227 = _1177;
    float _1229 = _1227;
    if (_1163)
    {
        float _1231 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1231;
    }
    float _1233 = _1211;
    float _1235 = sqrt(_1145);
    float _1237 = _1233;
    float _1239 = _1203;
    if (_1163)
    {
        float _1241 = fma(_1203, _1233, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1237 = _1241;
    }
    float _1243 = _1237;
    float _1245 = _1243;
    if (!_1163)
    {
        _1239 = _1151;
    }
    float _1247 = _1239;
    float _1249 = _1247;
    float _1251 = _1219;
    if (_1163)
    {
        float _1253 = _1219 + (-1.0);
        _1213 = _1253;
    }
    float _1255 = _1213;
    float _1257 = _1255;
    if (_1163)
    {
        float _1259 = _1185 * _1243;
        _687 = _1259;
    }
    float _1261 = _687;
    if (!_1163)
    {
        _1245 = _1225;
    }
    float _1263 = _1245;
    float _1265 = _1263;
    if (_1163)
    {
        float _1267 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1267;
    }
    float _1269 = _1187;
    if (_1163)
    {
        float _1271 = _1151 * _1261;
        _1249 = _1271;
    }
    float _1273 = _1249;
    if (!_1163)
    {
        _1257 = _1153;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    if (_1163)
    {
        float _1279 = _1153 * _1261;
        _1277 = _1279;
    }
    float _1281 = _1277;
    if (_1163)
    {
        float _1283 = fma(_1225, _1219, _1269);
        _1265 = _1283;
    }
    float _1285 = _1265;
    if (_1163)
    {
        float _1287 = _1273 * _1273;
        _1229 = _1287;
    }
    float _1289 = _1229;
    if (!_1163)
    {
        _1251 = _1157;
    }
    float _1291 = _1251;
    float _1293 = _1291;
    if (_1163)
    {
        float _1295 = _1281 * _1281;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = fma(_1285, _1285, _1289);
    float _1301 = _1299 + _1297;
    float _1303 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1307 = fma(_1235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1305);
    float _1309 = precise::clamp(_1307, 0.0, 1.0);
    float _1311 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1313 = rsqrt(_1301);
    float _1315 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1317 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1319 = -_1309;
    float _1321 = _1319 + 1.0;
    float _1323 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1325 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1315);
    float _1327 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1317);
    float _1329 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1331 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1333 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1311);
    float _1335 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1327);
    float _1337 = abs(_1321);
    float _1339 = log2(_1337);
    float _1341 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1323);
    float _1343 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1345 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1347 = _1313 * _1273;
    float _1349 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1341);
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1353 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1355 = _1331 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1359 = _1313 * _1285;
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1353);
    float _1363 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1365 = -_1355;
    float _1367 = fma(_1365, _1329, 1.0);
    float _1369 = _1313 * _1281;
    float _1371 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1373 = -_1363;
    float _1375 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1373);
    float _1377 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1381 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1371);
    float _1383 = -_1369;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1375);
    float _1387 = log2(_1367);
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1391 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1379);
    float _1393 = fma(_1385, -0.5, 0.5);
    float _1395 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1389);
    float _1397 = fma(_1385, 0.5, 0.5);
    float _1399 = _1359 + 1.0;
    float _1401 = exp2(_1377);
    float _1403 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1405 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1391);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1411 = 1.0 / _1381;
    float _1413 = _1387 * 0.693147182464599609375;
    float _1415 = fma(_1397, _1409, 1.570728778839111328125);
    float _1417 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1419 = sqrt(_1393);
    float _1421 = -_1359;
    float _1423 = fma(_1401, _1399, _1421);
    float _1425 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1403);
    float _1427 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1429 = fma(_1423, 0.5, 0.5);
    float _1431 = _1425 * _1411;
    float _1433 = _1427 * _1411;
    float _1435 = fma(_1431, 0.5, 0.5);
    float _1437 = fma(_1433, -0.5, 0.5);
    float _1439 = _1419 * 0.636619746685028076171875;
    float _1441 = -_1415;
    float _1443 = fma(_1439, _1441, 1.0);
    float3 _3887 = float3(_1435, _1437, _1417);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).x;
    float3 _3898 = float3(_1435, _1437, _1417);
    float4 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3898, float3(0.0), isnan(_3898)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3898, float3(0.0), isnan(_3898)), level(0.0)).xyzw;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = _1448.w;
    float2 _3915 = float2(_1443, _1429);
    float3 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3915, float2(0.0), isnan(_3915)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3915, float2(0.0), isnan(_3915)), level(0.0)).xyz;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = in.m_49.y;
    bool _1470 = _137 > 0.5;
    float _1472 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1478 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1480 = -_207;
    int _1482 = _1470 ? as_type<int>(_1480) : as_type<int>(_207);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1484;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1490 = _1488 != 0;
    float _1492 = 1.0 / _1476;
    float _1494 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1496 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1478);
    float _1498 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1500 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1506 = _1468 > 0.5;
    float _1508 = _1486 * _1492;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1512 = _713 + _1510;
    bool _1514 = !_1490;
    float _1516 = _1514 ? _207 : as_type<float>(_1482);
    float _1518 = exp2(_1472);
    bool _1520 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1522 = isnan(_713);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = fma(_1508, _1512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1536 = _1534 != 0;
    float _1538 = _1516 + 0.5;
    float _1540 = -_215;
    int _1542 = _1506 ? as_type<int>(_1540) : as_type<int>(_215);
    float _1544 = -_1530;
    float _1546 = _1544 + 1.0;
    bool _1548 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1550 = isnan(_713);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1562 = !_1536;
    float _1564 = _1562 ? _215 : as_type<float>(_1542);
    float _1566 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1568 = _1558 * _1546;
    float _1570 = -_1558;
    float _1572 = _1570 + 1.0;
    float _1574 = -_1564;
    float _1576 = _1574 + 0.5;
    float _1578 = _1566 * _1502;
    float _1580 = _1532 * _1568;
    float _1582 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1580);
    float _1586 = -_1518;
    float _1588 = _1586 + 1.0;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1596 = _1582 * _1560;
    float _1598 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1584);
    float _1600 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1496);
    float _1604 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1606 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1608 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1612 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1602);
    bool _1614 = _1127 > 0.0;
    bool _1616 = isnan(_1127);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan(0.0);
    bool _1622 = _1618 || _1620;
    float _1624 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1606;
    out.m_56.y = _1608;
    out.m_56.z = _1610;
    float _1626 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1628 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1427;
    out.gl_Position.z = _1612;
    out.gl_Position.w = _1381;
    float _1630 = _1626 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1578;
    out.m_58.y = _1596;
    float _1632 = _1612 + _1381;
    float _1634 = -_1604;
    float _1636 = _1634 + 1.0;
    out.m_60.x = _1600;
    out.m_60.y = _1624;
    out.m_60.z = _1504;
    out.m_60.w = _1628;
    float _1638 = _1632 * 0.5;
    out.m_45.x = _1630;
    out.m_62.z = _1638;
    out.m_62.w = _1381;
    float _1640 = _1604 * _1445;
    float _1642 = _1456 * _1636;
    float _1644 = _1456 * _1640;
    float _1646 = _1466 * _1640;
    float _1648 = fma(_1462, _1644, _1450);
    float _1650 = fma(_1464, _1644, _1452);
    float _1652 = fma(_1456, _1646, _1454);
    out.m_64.x = _1648;
    out.m_64.y = _1650;
    out.m_64.z = _1652;
    out.m_64.w = _1642;
    if (_1622)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1654 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1654;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _705 = false;
    bool _537 = false;
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
        float _1711 = as_type<float>(_99);
        out.gl_Position.z = _1711;
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
        float _1780 = as_type<float>(_135);
        out.gl_Position.z = _1780;
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
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    if (!_161)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _167 * 0.15915493667125701904296875;
    float _191 = _187;
    if (!_161)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_169;
    float _211 = _165 + _209;
    bool _213 = !_177;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_161;
    float _219 = _195;
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
    bool _253 = !_161;
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
        _181 = _273;
    }
    float _275 = _181;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    bool _287 = _211 < 0.5;
    float _289 = float(_287);
    float _291 = -_211;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = fma(_203, 0.5, 0.5);
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_199;
    int _311 = _309 ? 0 : 1;
    float _313 = -_289;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_295;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_305);
    float _323 = fma(_275, _147, _307);
    int _325 = abs(_311);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_275, _149, _327);
    int _339 = abs(_331);
    float _341 = fma(_275, _151, _333);
    float _343 = float(_321);
    float _345 = float(_325);
    float _347 = abs(_293);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _319, _349);
    float _355 = fma(_337, _277, _299);
    float _357 = fma(_323, _277, _297);
    float _359 = fma(_341, _277, _301);
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
    bool _397 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _399 = isnan(_391);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _391 + _409;
    bool _413 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_391);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    float _437 = 1.0 / _427;
    float _439 = _423 * _435;
    float _441 = -_423;
    float _443 = _441 + 1.0;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _447 = 1.0 / _431;
    float _449 = _395 * _437;
    bool _451 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _453 = isnan(_391);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _463;
    float _467 = in.m_54.x;
    float _469 = in.m_54.y;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _471;
    float _475 = fma(_465, _449, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = _461 * _443;
    float _479 = fma(_473, _449, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _481 = _411 * _447;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = _475 * _477;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _479 * _477;
    float _499 = fma(_485, _481, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_495, _481, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _507 = fma(_499, _439, _501);
    float _509 = fma(_503, _439, _505);
    float _511 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[145].x, _507);
    float _513 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[145].y, _509);
    float _515 = _511 * _467;
    float _517 = _513 * _469;
    bool _519 = !_445;
    float _535;
    if (!_519)
    {
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _523 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_83);
        float _541 = 1.0 / _539;
        float _543 = _117 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _549 = _545 + _547;
    bool _551 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _553 = isnan(_545);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _565 = isnan(_545);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _583 = 1.0 / _577;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _587 = 1.0 / _581;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _589;
    float _593 = _549 * _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _597 = _545 + _595;
    bool _599 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _601 = isnan(_545);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_561;
    float _613 = _611 + 1.0;
    float _615 = fma(_591, _593, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = _609 * _613;
    float _619 = -_609;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _627;
    float _631 = _573 * _621;
    float _633 = fma(_625, _593, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _635 = fma(_629, _593, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = _597 * _587;
    float _639 = _615 * _631;
    float _641 = _633 * _631;
    float _643 = _635 * _631;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _653 = -_573;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = fma(_647, _637, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _663 = fma(_651, _637, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _665 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].x, _641);
    float _667 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].y, _639);
    float _669 = fma(_659, _637, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].z, _643);
    float _673 = fma(_661, _617, _665);
    float _675 = fma(_663, _617, _667);
    float _677 = fma(_669, _617, _671);
    float _679 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].x, _673);
    float _681 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].y, _675);
    float _683 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].z, _677);
    bool _685 = !_585;
    float _687 = _637;
    float _703;
    if (!_685)
    {
        float _689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _691 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _695 = _693 * _689;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _701;
        _705 = true;
    }
    else
    {
        float _707 = float(_83);
        float _709 = 1.0 / _707;
        float _711 = _117 * _709;
        _703 = _711;
    }
    _705 = false;
    float _713 = _703;
    float _715 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _717 = _363 * _515;
    float _719 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _721 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].y, _715);
    float _723 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _719);
    float _725 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _727 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _723);
    float _729 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _731 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _733 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _735 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].y, _721);
    float _737 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _725);
    float _739 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _729);
    float _741 = sqrt(_727);
    float _743 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _737);
    float _745 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _747 = _363 * _517;
    float _749 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _739);
    float _751 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].z, _731);
    float _753 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].x, _745);
    float _755 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].w, _733);
    float _757 = sqrt(_743);
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _761 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _763 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].x, _753);
    float _765 = _735 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _767 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].z, _751);
    float _769 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].w, _755);
    float _771 = _761 * _759;
    float _773 = sqrt(_749);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _777 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = _763 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _781 = _767 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _783 = _769 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _785 = _777 * _775;
    float _787 = _741 * _779;
    float _789 = _757 * _765;
    float _791 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _793 = _785 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _795 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _799 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _801 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _797);
    float _807 = _773 * _781;
    float _809 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _799);
    float _811 = _785 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _813 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[26].z, _801);
    float _815 = _785 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _809);
    float _819 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _811);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _823 = _813 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].w, _817);
    float _827 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[24].z, _819);
    float _829 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].w, _821);
    float _831 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _805);
    float _833 = _825 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _835 = _827 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _837 = _829 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _839 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].w, _831);
    float _841 = _833 + _823;
    float _843 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _815);
    float _845 = _837 + _835;
    float _847 = _839 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _851 = _841 + _849;
    float _853 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[25].z, _843);
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _857 = _845 + _855;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _861 = _851 * _851;
    float _863 = _853 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _865 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _867 = isnan(0.5);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _873 = _869 || _871;
    float _875 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[11].x, _859);
    float _877 = fma(_857, _857, _861);
    float _879 = _847 + _863;
    bool _881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _883 = isnan(0.5);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _889 = _885 || _887;
    float _891 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[11].z, _875);
    float _893 = sqrt(_877);
    float _895 = _847 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _897 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _899 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[10].x, _895);
    float _901 = 1.0 / _897;
    float _903 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[10].z, _899);
    float _905 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _907 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = _905 + _897;
    float _911 = _909 * _901;
    float _913 = _911 * 0.5;
    float _915 = _909;
    float _917 = _863;
    float _919 = _897;
    float _921 = _893;
    float _923 = _901;
    float _925 = _853;
    if (!_907)
    {
        _915 = _845;
    }
    float _927 = _915;
    float _929 = _927;
    if (!_907)
    {
        _917 = _841;
    }
    float _931 = _917;
    float _933 = _931;
    if (!_907)
    {
        _919 = _879;
    }
    float _935 = _919;
    bool _937 = !_907;
    float _939 = _935;
    if (!_937)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _943 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _945 = _893 + _943;
        float _947 = rsqrt(_877);
        float _949 = _945 * _941;
        float _951 = _879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _949 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _953 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _957 + (-1.0);
        float _965 = _963 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _967 = fma(_961, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _969 = fma(_879, _957, _965);
        float _971 = _947 * _967;
        float _973 = fma(_857, _971, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _975 = fma(_851, _971, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _929 = _973;
        _939 = _969;
        _933 = _975;
        _921 = _951;
        _923 = _953;
    }
    float _977 = _929;
    float _979 = _939;
    float _981 = _933;
    float _983 = _921;
    float _985 = _923;
    float _987 = _983;
    float _989 = _985;
    float _991 = _979;
    float _993 = _977;
    float _995 = _981;
    if (_889)
    {
        _987 = 1.0;
    }
    float _997 = _987;
    float _999 = _997;
    if (!_873)
    {
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1003 = _847 + _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1007 = _837 + _1005;
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1011 = -_837;
        float _1013 = _1011 + _977;
        float _1015 = _1003 * _1003;
        float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1019 = _833 + _1017;
        float _1021 = -_847;
        float _1023 = _1021 + _979;
        float _1025 = fma(_1007, _1007, _1015);
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1029 = fma(_1019, _1019, _1025);
        float _1031 = sqrt(_1029);
        float _1033 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1035 = precise::min(_1031, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1037 = _1035 * _1027;
        float _1039 = _1033 * _1037;
        float _1041 = -_833;
        float _1043 = _1041 + _981;
        float _1045 = fma(_1013, _1039, _837);
        float _1047 = fma(_1023, _1039, _847);
        float _1049 = fma(_1043, _1039, _833);
        _989 = _1039;
        _991 = _1047;
        _993 = _1045;
        _995 = _1049;
        _925 = _1043;
    }
    float _1051 = _989;
    float _1053 = _991;
    float _1055 = _993;
    float _1057 = _995;
    float _1059 = _925;
    float _1061 = _1059;
    float _1063 = _1051;
    if (!_889)
    {
        float _1065 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = _1065 * 0.15915493667125701904296875;
        float _1069 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1073 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1071);
        float _1075 = _1067 * 6.283185482025146484375;
        float _1077 = cos(_1075);
        float _1079 = _1069 * 0.15915493667125701904296875;
        float _1081 = _1067 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = 1.0 / _1077;
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1083 * _1085;
        float _1093 = _1079 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1089 * _1091;
        float _1099 = 1.0 / _1073;
        float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1103 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1101;
        float _1105 = 1.0 / _1097;
        float _1107 = 1.0 / _1103;
        float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1111 = _1099 * _1109;
        float _1113 = _1095 * _1105;
        float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1117 = fma(_1113, _1111, _1115);
        float _1119 = _1117 * _1107;
        float _1121 = precise::clamp(_1119, 0.0, 1.0);
        _1061 = _1079;
        _1063 = _1107;
        _999 = _1121;
    }
    float _1123 = _1061;
    float _1125 = _1063;
    float _1127 = _999;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1131 = _1053 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1055 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1139 = _1057 + _1137;
    float _1141 = _1131 * _1131;
    float _1143 = fma(_1135, _1135, _1141);
    float _1145 = fma(_1139, _1139, _1143);
    float _1147 = rsqrt(_1145);
    float _1149 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1151 = _1135 * _1149;
    float _1153 = _1139 * _1149;
    float _1155 = _1151 * _1151;
    float _1157 = _1153 * _1153;
    float _1159 = _1155 + _1157;
    float _1161 = sqrt(_1159);
    bool _1163 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = _1161 + _1165;
    float _1169 = _1139;
    float _1171 = _1125;
    float _1173 = _1167;
    float _1175 = _1123;
    float _1177 = _1131;
    if (_1163)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1169 = _1179;
    }
    float _1181 = _1169;
    if (_1163)
    {
        float _1183 = rsqrt(_1159);
        _1171 = _1183;
    }
    float _1185 = _1171;
    float _1187 = _1185;
    if (_1163)
    {
        float _1189 = _1167 * _1181;
        _1173 = _1189;
    }
    float _1191 = _1173;
    if (_1163)
    {
        float _1193 = _1191 * 0.15915493667125701904296875;
        _1175 = _1193;
    }
    float _1195 = _1175;
    float _1197 = _1147;
    if (_1163)
    {
        float _1199 = _1195 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        _1197 = _1201;
    }
    float _1203 = _1197;
    float _1205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1207 = precise::max(0.0, _1205);
    float _1209 = _1141;
    float _1211 = _1207;
    float _1213 = _1205;
    if (_1163)
    {
        float _1215 = _1195 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        _1209 = _1217;
    }
    float _1219 = _1209;
    float _1221 = -_1149;
    float _1223 = -_1207;
    float _1225 = fma(_1131, _1221, _1223);
    if (!_1163)
    {
        _1177 = _1155;
    }
    float _1227 = _1177;
    float _1229 = _1227;
    if (_1163)
    {
        float _1231 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1231;
    }
    float _1233 = _1211;
    float _1235 = sqrt(_1145);
    float _1237 = _1233;
    float _1239 = _1203;
    if (_1163)
    {
        float _1241 = fma(_1203, _1233, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1237 = _1241;
    }
    float _1243 = _1237;
    float _1245 = _1243;
    if (!_1163)
    {
        _1239 = _1151;
    }
    float _1247 = _1239;
    float _1249 = _1247;
    float _1251 = _1219;
    if (_1163)
    {
        float _1253 = _1219 + (-1.0);
        _1213 = _1253;
    }
    float _1255 = _1213;
    float _1257 = _1255;
    if (_1163)
    {
        float _1259 = _1185 * _1243;
        _687 = _1259;
    }
    float _1261 = _687;
    if (!_1163)
    {
        _1245 = _1225;
    }
    float _1263 = _1245;
    float _1265 = _1263;
    if (_1163)
    {
        float _1267 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1267;
    }
    float _1269 = _1187;
    if (_1163)
    {
        float _1271 = _1151 * _1261;
        _1249 = _1271;
    }
    float _1273 = _1249;
    if (!_1163)
    {
        _1257 = _1153;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    if (_1163)
    {
        float _1279 = _1153 * _1261;
        _1277 = _1279;
    }
    float _1281 = _1277;
    if (_1163)
    {
        float _1283 = fma(_1225, _1219, _1269);
        _1265 = _1283;
    }
    float _1285 = _1265;
    if (_1163)
    {
        float _1287 = _1273 * _1273;
        _1229 = _1287;
    }
    float _1289 = _1229;
    if (!_1163)
    {
        _1251 = _1157;
    }
    float _1291 = _1251;
    float _1293 = _1291;
    if (_1163)
    {
        float _1295 = _1281 * _1281;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = fma(_1285, _1285, _1289);
    float _1301 = _1299 + _1297;
    float _1303 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1307 = fma(_1235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1305);
    float _1309 = precise::clamp(_1307, 0.0, 1.0);
    float _1311 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1313 = rsqrt(_1301);
    float _1315 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1317 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1319 = -_1309;
    float _1321 = _1319 + 1.0;
    float _1323 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1325 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1315);
    float _1327 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1317);
    float _1329 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1331 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1333 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1311);
    float _1335 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1327);
    float _1337 = abs(_1321);
    float _1339 = log2(_1337);
    float _1341 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1323);
    float _1343 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1345 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1347 = _1313 * _1273;
    float _1349 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1341);
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1353 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1355 = _1331 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1359 = _1313 * _1285;
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1353);
    float _1363 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1365 = -_1355;
    float _1367 = fma(_1365, _1329, 1.0);
    float _1369 = _1313 * _1281;
    float _1371 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1373 = -_1363;
    float _1375 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1373);
    float _1377 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1381 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1371);
    float _1383 = -_1369;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1375);
    float _1387 = log2(_1367);
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1391 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1379);
    float _1393 = fma(_1385, -0.5, 0.5);
    float _1395 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1389);
    float _1397 = fma(_1385, 0.5, 0.5);
    float _1399 = _1359 + 1.0;
    float _1401 = exp2(_1377);
    float _1403 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1405 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1391);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1411 = 1.0 / _1381;
    float _1413 = _1387 * 0.693147182464599609375;
    float _1415 = fma(_1397, _1409, 1.570728778839111328125);
    float _1417 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1419 = sqrt(_1393);
    float _1421 = -_1359;
    float _1423 = fma(_1401, _1399, _1421);
    float _1425 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1403);
    float _1427 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1429 = fma(_1423, 0.5, 0.5);
    float _1431 = _1425 * _1411;
    float _1433 = _1427 * _1411;
    float _1435 = fma(_1431, 0.5, 0.5);
    float _1437 = fma(_1433, -0.5, 0.5);
    float _1439 = _1419 * 0.636619746685028076171875;
    float _1441 = -_1415;
    float _1443 = fma(_1439, _1441, 1.0);
    float3 _3887 = float3(_1435, _1437, _1417);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).x;
    float3 _3898 = float3(_1435, _1437, _1417);
    float4 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3898, float3(0.0), isnan(_3898)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3898, float3(0.0), isnan(_3898)), level(0.0)).xyzw;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = _1448.w;
    float2 _3915 = float2(_1443, _1429);
    float3 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3915, float2(0.0), isnan(_3915)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3915, float2(0.0), isnan(_3915)), level(0.0)).xyz;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = in.m_49.y;
    bool _1470 = _137 > 0.5;
    float _1472 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1478 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1480 = -_207;
    int _1482 = _1470 ? as_type<int>(_1480) : as_type<int>(_207);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1484;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1490 = _1488 != 0;
    float _1492 = 1.0 / _1476;
    float _1494 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1496 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1478);
    float _1498 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1500 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1506 = _1468 > 0.5;
    float _1508 = _1486 * _1492;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1512 = _713 + _1510;
    bool _1514 = !_1490;
    float _1516 = _1514 ? _207 : as_type<float>(_1482);
    float _1518 = exp2(_1472);
    bool _1520 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1522 = isnan(_713);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = fma(_1508, _1512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1536 = _1534 != 0;
    float _1538 = _1516 + 0.5;
    float _1540 = -_215;
    int _1542 = _1506 ? as_type<int>(_1540) : as_type<int>(_215);
    float _1544 = -_1530;
    float _1546 = _1544 + 1.0;
    bool _1548 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1550 = isnan(_713);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1562 = !_1536;
    float _1564 = _1562 ? _215 : as_type<float>(_1542);
    float _1566 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1568 = _1558 * _1546;
    float _1570 = -_1558;
    float _1572 = _1570 + 1.0;
    float _1574 = -_1564;
    float _1576 = _1574 + 0.5;
    float _1578 = _1566 * _1502;
    float _1580 = _1532 * _1568;
    float _1582 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1580);
    float _1586 = -_1518;
    float _1588 = _1586 + 1.0;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1596 = _1582 * _1560;
    float _1598 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1584);
    float _1600 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1496);
    float _1604 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1606 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1608 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1612 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1602);
    bool _1614 = _1127 > 0.0;
    bool _1616 = isnan(_1127);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan(0.0);
    bool _1622 = _1618 || _1620;
    float _1624 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1606;
    out.m_56.y = _1608;
    out.m_56.z = _1610;
    float _1626 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1628 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1427;
    out.gl_Position.z = _1612;
    out.gl_Position.w = _1381;
    float _1630 = _1626 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1578;
    out.m_58.y = _1596;
    float _1632 = _1612 + _1381;
    float _1634 = -_1604;
    float _1636 = _1634 + 1.0;
    out.m_60.x = _1600;
    out.m_60.y = _1624;
    out.m_60.z = _1504;
    out.m_60.w = _1628;
    float _1638 = _1632 * 0.5;
    out.m_45.x = _1630;
    out.m_62.z = _1638;
    out.m_62.w = _1381;
    float _1640 = _1604 * _1445;
    float _1642 = _1456 * _1636;
    float _1644 = _1456 * _1640;
    float _1646 = _1466 * _1640;
    float _1648 = fma(_1462, _1644, _1450);
    float _1650 = fma(_1464, _1644, _1452);
    float _1652 = fma(_1456, _1646, _1454);
    out.m_64.x = _1648;
    out.m_64.y = _1650;
    out.m_64.z = _1652;
    out.m_64.w = _1642;
    if (_1622)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1654 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1654;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _705 = false;
    bool _537 = false;
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
        float _1711 = as_type<float>(_99);
        out.gl_Position.z = _1711;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1780 = as_type<float>(_135);
        out.gl_Position.z = _1780;
    }
    if (_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_47.x;
    float _149 = in.m_47.y;
    float _151 = in.m_47.z;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = _165 * 6.283185482025146484375;
    float _169 = floor(_165);
    int _171 = as_type<int>(_143) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_143) & 2;
    bool _177 = _175 != 0;
    float _179 = _143;
    float _181 = _145;
    if (!_161)
    {
        float _183 = _145 * _145;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    float _189 = _167 * 0.15915493667125701904296875;
    float _191 = _187;
    if (!_161)
    {
        float _193 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _193;
    }
    float _195 = _191;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    float _201 = _189 * 6.283185482025146484375;
    float _203 = cos(_201);
    bool _205 = !_173;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = -_169;
    float _211 = _165 + _209;
    bool _213 = !_177;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_161;
    float _219 = _195;
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
    bool _253 = !_161;
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
        _181 = _273;
    }
    float _275 = _181;
    float _277 = in.m_54.w;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _281 = _279 != 0;
    int _283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _285 = _283 != 0;
    bool _287 = _211 < 0.5;
    float _289 = float(_287);
    float _291 = -_211;
    float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _295 = fma(_203, 0.5, 0.5);
    float _297 = in.m_42.x;
    float _299 = in.m_42.y;
    float _301 = in.m_42.z;
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _309 = !_199;
    int _311 = _309 ? 0 : 1;
    float _313 = -_289;
    float _315 = fma(_313, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _317 = -_295;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _321 = abs(_305);
    float _323 = fma(_275, _147, _307);
    int _325 = abs(_311);
    float _327 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _329 = !_285;
    int _331 = _329 ? 0 : 1;
    float _333 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _335 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _337 = fma(_275, _149, _327);
    int _339 = abs(_331);
    float _341 = fma(_275, _151, _333);
    float _343 = float(_321);
    float _345 = float(_325);
    float _347 = abs(_293);
    float _349 = _343 * _347;
    float _351 = float(_339);
    float _353 = fma(_345, _319, _349);
    float _355 = fma(_337, _277, _299);
    float _357 = fma(_323, _277, _297);
    float _359 = fma(_341, _277, _301);
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
    bool _397 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _399 = isnan(_391);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _411 = _391 + _409;
    bool _413 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _415 = isnan(_391);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _425;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    float _437 = 1.0 / _427;
    float _439 = _423 * _435;
    float _441 = -_423;
    float _443 = _441 + 1.0;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _447 = 1.0 / _431;
    float _449 = _395 * _437;
    bool _451 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _453 = isnan(_391);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _463;
    float _467 = in.m_54.x;
    float _469 = in.m_54.y;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _471;
    float _475 = fma(_465, _449, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _477 = _461 * _443;
    float _479 = fma(_473, _449, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _481 = _411 * _447;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = -_461;
    float _489 = _487 + 1.0;
    float _491 = _475 * _477;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = _479 * _477;
    float _499 = fma(_485, _481, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].x, _491);
    float _503 = fma(_495, _481, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[143].y, _497);
    float _507 = fma(_499, _439, _501);
    float _509 = fma(_503, _439, _505);
    float _511 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[145].x, _507);
    float _513 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[145].y, _509);
    float _515 = _511 * _467;
    float _517 = _513 * _469;
    bool _519 = !_445;
    float _535;
    if (!_519)
    {
        float _521 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _523 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _525 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _527 = _525 * _521;
        float _529 = floor(_527);
        float _531 = -_529;
        float _533 = _527 + _531;
        _535 = _533;
        _537 = true;
    }
    else
    {
        float _539 = float(_83);
        float _541 = 1.0 / _539;
        float _543 = _117 * _541;
        _535 = _543;
    }
    _537 = false;
    float _545 = _535;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _549 = _545 + _547;
    bool _551 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _553 = isnan(_545);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    bool _563 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _565 = isnan(_545);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _575;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _583 = 1.0 / _577;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _587 = 1.0 / _581;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _589;
    float _593 = _549 * _583;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _597 = _545 + _595;
    bool _599 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _601 = isnan(_545);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = -_561;
    float _613 = _611 + 1.0;
    float _615 = fma(_591, _593, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _617 = _609 * _613;
    float _619 = -_609;
    float _621 = _619 + 1.0;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _627;
    float _631 = _573 * _621;
    float _633 = fma(_625, _593, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _635 = fma(_629, _593, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _637 = _597 * _587;
    float _639 = _615 * _631;
    float _641 = _633 * _631;
    float _643 = _635 * _631;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _653 = -_573;
    float _655 = _653 + 1.0;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _661 = fma(_647, _637, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _663 = fma(_651, _637, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _665 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].x, _641);
    float _667 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].y, _639);
    float _669 = fma(_659, _637, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[107].z, _643);
    float _673 = fma(_661, _617, _665);
    float _675 = fma(_663, _617, _667);
    float _677 = fma(_669, _617, _671);
    float _679 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].x, _673);
    float _681 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].y, _675);
    float _683 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[109].z, _677);
    bool _685 = !_585;
    float _687 = _637;
    float _703;
    if (!_685)
    {
        float _689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _691 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _693 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _695 = _693 * _689;
        float _697 = floor(_695);
        float _699 = -_697;
        float _701 = _695 + _699;
        _703 = _701;
        _705 = true;
    }
    else
    {
        float _707 = float(_83);
        float _709 = 1.0 / _707;
        float _711 = _117 * _709;
        _703 = _711;
    }
    _705 = false;
    float _713 = _703;
    float _715 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _717 = _363 * _515;
    float _719 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _721 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].y, _715);
    float _723 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _719);
    float _725 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _727 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _723);
    float _729 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _731 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _733 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _735 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].y, _721);
    float _737 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _725);
    float _739 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _729);
    float _741 = sqrt(_727);
    float _743 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _737);
    float _745 = _355 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _747 = _363 * _517;
    float _749 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _739);
    float _751 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].z, _731);
    float _753 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].x, _745);
    float _755 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[14].w, _733);
    float _757 = sqrt(_743);
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _761 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _763 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].x, _753);
    float _765 = _735 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _767 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].z, _751);
    float _769 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[16].w, _755);
    float _771 = _761 * _759;
    float _773 = sqrt(_749);
    float _775 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    float _777 = _747 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _779 = _763 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _781 = _767 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _783 = _769 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _785 = _777 * _775;
    float _787 = _741 * _779;
    float _789 = _757 * _765;
    float _791 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _793 = _785 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _795 = _789 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _797 = _789 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _799 = _789 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _801 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[26].x, _793);
    float _803 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[24].x, _795);
    float _805 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[25].x, _797);
    float _807 = _773 * _781;
    float _809 = fma(_787, (*spvDescriptorSet0.vp_c8)._m0[26].x, _799);
    float _811 = _785 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _813 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[26].z, _801);
    float _815 = _785 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _809);
    float _819 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[24].x, _811);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _803);
    float _823 = _813 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _825 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[26].w, _817);
    float _827 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[24].z, _819);
    float _829 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[24].w, _821);
    float _831 = fma(_807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _805);
    float _833 = _825 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _835 = _827 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _837 = _829 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _839 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[25].w, _831);
    float _841 = _833 + _823;
    float _843 = fma(_771, (*spvDescriptorSet0.vp_c8)._m0[25].x, _815);
    float _845 = _837 + _835;
    float _847 = _839 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _849 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _851 = _841 + _849;
    float _853 = fma(_791, (*spvDescriptorSet0.vp_c8)._m0[25].z, _843);
    float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _857 = _845 + _855;
    float _859 = _847 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _861 = _851 * _851;
    float _863 = _853 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _865 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _867 = isnan(0.5);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _873 = _869 || _871;
    float _875 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[11].x, _859);
    float _877 = fma(_857, _857, _861);
    float _879 = _847 + _863;
    bool _881 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _883 = isnan(0.5);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _889 = _885 || _887;
    float _891 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[11].z, _875);
    float _893 = sqrt(_877);
    float _895 = _847 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _897 = _891 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _899 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[10].x, _895);
    float _901 = 1.0 / _897;
    float _903 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[10].z, _899);
    float _905 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _907 = _893 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _909 = _905 + _897;
    float _911 = _909 * _901;
    float _913 = _911 * 0.5;
    float _915 = _909;
    float _917 = _863;
    float _919 = _897;
    float _921 = _893;
    float _923 = _901;
    float _925 = _853;
    if (!_907)
    {
        _915 = _845;
    }
    float _927 = _915;
    float _929 = _927;
    if (!_907)
    {
        _917 = _841;
    }
    float _931 = _917;
    float _933 = _931;
    if (!_907)
    {
        _919 = _879;
    }
    float _935 = _919;
    bool _937 = !_907;
    float _939 = _935;
    if (!_937)
    {
        float _941 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _943 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _945 = _893 + _943;
        float _947 = rsqrt(_877);
        float _949 = _945 * _941;
        float _951 = _879 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _953 = _949 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = _953 * 6.283185482025146484375;
        float _961 = sin(_959);
        float _963 = _957 + (-1.0);
        float _965 = _963 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _967 = fma(_961, _951, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _969 = fma(_879, _957, _965);
        float _971 = _947 * _967;
        float _973 = fma(_857, _971, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _975 = fma(_851, _971, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _929 = _973;
        _939 = _969;
        _933 = _975;
        _921 = _951;
        _923 = _953;
    }
    float _977 = _929;
    float _979 = _939;
    float _981 = _933;
    float _983 = _921;
    float _985 = _923;
    float _987 = _983;
    float _989 = _985;
    float _991 = _979;
    float _993 = _977;
    float _995 = _981;
    if (_889)
    {
        _987 = 1.0;
    }
    float _997 = _987;
    float _999 = _997;
    if (!_873)
    {
        float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1003 = _847 + _1001;
        float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1007 = _837 + _1005;
        float _1009 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1011 = -_837;
        float _1013 = _1011 + _977;
        float _1015 = _1003 * _1003;
        float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1019 = _833 + _1017;
        float _1021 = -_847;
        float _1023 = _1021 + _979;
        float _1025 = fma(_1007, _1007, _1015);
        float _1027 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1029 = fma(_1019, _1019, _1025);
        float _1031 = sqrt(_1029);
        float _1033 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1035 = precise::min(_1031, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1037 = _1035 * _1027;
        float _1039 = _1033 * _1037;
        float _1041 = -_833;
        float _1043 = _1041 + _981;
        float _1045 = fma(_1013, _1039, _837);
        float _1047 = fma(_1023, _1039, _847);
        float _1049 = fma(_1043, _1039, _833);
        _989 = _1039;
        _991 = _1047;
        _993 = _1045;
        _995 = _1049;
        _925 = _1043;
    }
    float _1051 = _989;
    float _1053 = _991;
    float _1055 = _993;
    float _1057 = _995;
    float _1059 = _925;
    float _1061 = _1059;
    float _1063 = _1051;
    if (!_889)
    {
        float _1065 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1067 = _1065 * 0.15915493667125701904296875;
        float _1069 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1071 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1073 = fma(_913, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1071);
        float _1075 = _1067 * 6.283185482025146484375;
        float _1077 = cos(_1075);
        float _1079 = _1069 * 0.15915493667125701904296875;
        float _1081 = _1067 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = 1.0 / _1077;
        float _1087 = _1079 * 6.283185482025146484375;
        float _1089 = cos(_1087);
        float _1091 = _1083 * _1085;
        float _1093 = _1079 * 6.283185482025146484375;
        float _1095 = sin(_1093);
        float _1097 = _1089 * _1091;
        float _1099 = 1.0 / _1073;
        float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1103 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1101;
        float _1105 = 1.0 / _1097;
        float _1107 = 1.0 / _1103;
        float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1111 = _1099 * _1109;
        float _1113 = _1095 * _1105;
        float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1117 = fma(_1113, _1111, _1115);
        float _1119 = _1117 * _1107;
        float _1121 = precise::clamp(_1119, 0.0, 1.0);
        _1061 = _1079;
        _1063 = _1107;
        _999 = _1121;
    }
    float _1123 = _1061;
    float _1125 = _1063;
    float _1127 = _999;
    float _1129 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1131 = _1053 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1135 = _1055 + _1133;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1139 = _1057 + _1137;
    float _1141 = _1131 * _1131;
    float _1143 = fma(_1135, _1135, _1141);
    float _1145 = fma(_1139, _1139, _1143);
    float _1147 = rsqrt(_1145);
    float _1149 = _1147 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1151 = _1135 * _1149;
    float _1153 = _1139 * _1149;
    float _1155 = _1151 * _1151;
    float _1157 = _1153 * _1153;
    float _1159 = _1155 + _1157;
    float _1161 = sqrt(_1159);
    bool _1163 = _1161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1167 = _1161 + _1165;
    float _1169 = _1139;
    float _1171 = _1125;
    float _1173 = _1167;
    float _1175 = _1123;
    float _1177 = _1131;
    if (_1163)
    {
        float _1179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1169 = _1179;
    }
    float _1181 = _1169;
    if (_1163)
    {
        float _1183 = rsqrt(_1159);
        _1171 = _1183;
    }
    float _1185 = _1171;
    float _1187 = _1185;
    if (_1163)
    {
        float _1189 = _1167 * _1181;
        _1173 = _1189;
    }
    float _1191 = _1173;
    if (_1163)
    {
        float _1193 = _1191 * 0.15915493667125701904296875;
        _1175 = _1193;
    }
    float _1195 = _1175;
    float _1197 = _1147;
    if (_1163)
    {
        float _1199 = _1195 * 6.283185482025146484375;
        float _1201 = sin(_1199);
        _1197 = _1201;
    }
    float _1203 = _1197;
    float _1205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1207 = precise::max(0.0, _1205);
    float _1209 = _1141;
    float _1211 = _1207;
    float _1213 = _1205;
    if (_1163)
    {
        float _1215 = _1195 * 6.283185482025146484375;
        float _1217 = cos(_1215);
        _1209 = _1217;
    }
    float _1219 = _1209;
    float _1221 = -_1149;
    float _1223 = -_1207;
    float _1225 = fma(_1131, _1221, _1223);
    if (!_1163)
    {
        _1177 = _1155;
    }
    float _1227 = _1177;
    float _1229 = _1227;
    if (_1163)
    {
        float _1231 = _1225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1231;
    }
    float _1233 = _1211;
    float _1235 = sqrt(_1145);
    float _1237 = _1233;
    float _1239 = _1203;
    if (_1163)
    {
        float _1241 = fma(_1203, _1233, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1237 = _1241;
    }
    float _1243 = _1237;
    float _1245 = _1243;
    if (!_1163)
    {
        _1239 = _1151;
    }
    float _1247 = _1239;
    float _1249 = _1247;
    float _1251 = _1219;
    if (_1163)
    {
        float _1253 = _1219 + (-1.0);
        _1213 = _1253;
    }
    float _1255 = _1213;
    float _1257 = _1255;
    if (_1163)
    {
        float _1259 = _1185 * _1243;
        _687 = _1259;
    }
    float _1261 = _687;
    if (!_1163)
    {
        _1245 = _1225;
    }
    float _1263 = _1245;
    float _1265 = _1263;
    if (_1163)
    {
        float _1267 = _1255 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1187 = _1267;
    }
    float _1269 = _1187;
    if (_1163)
    {
        float _1271 = _1151 * _1261;
        _1249 = _1271;
    }
    float _1273 = _1249;
    if (!_1163)
    {
        _1257 = _1153;
    }
    float _1275 = _1257;
    float _1277 = _1275;
    if (_1163)
    {
        float _1279 = _1153 * _1261;
        _1277 = _1279;
    }
    float _1281 = _1277;
    if (_1163)
    {
        float _1283 = fma(_1225, _1219, _1269);
        _1265 = _1283;
    }
    float _1285 = _1265;
    if (_1163)
    {
        float _1287 = _1273 * _1273;
        _1229 = _1287;
    }
    float _1289 = _1229;
    if (!_1163)
    {
        _1251 = _1157;
    }
    float _1291 = _1251;
    float _1293 = _1291;
    if (_1163)
    {
        float _1295 = _1281 * _1281;
        _1293 = _1295;
    }
    float _1297 = _1293;
    float _1299 = fma(_1285, _1285, _1289);
    float _1301 = _1299 + _1297;
    float _1303 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1307 = fma(_1235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1305);
    float _1309 = precise::clamp(_1307, 0.0, 1.0);
    float _1311 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1313 = rsqrt(_1301);
    float _1315 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1303);
    float _1317 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1319 = -_1309;
    float _1321 = _1319 + 1.0;
    float _1323 = _1053 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1325 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1315);
    float _1327 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1317);
    float _1329 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1331 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1333 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1311);
    float _1335 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1327);
    float _1337 = abs(_1321);
    float _1339 = log2(_1337);
    float _1341 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1323);
    float _1343 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1345 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1347 = _1313 * _1273;
    float _1349 = fma(_1057, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1341);
    float _1351 = _1343 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1353 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1355 = _1331 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1357 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1359 = _1313 * _1285;
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1353);
    float _1363 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1365 = -_1355;
    float _1367 = fma(_1365, _1329, 1.0);
    float _1369 = _1313 * _1281;
    float _1371 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1361);
    float _1373 = -_1363;
    float _1375 = fma(_1359, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1373);
    float _1377 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1381 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1371);
    float _1383 = -_1369;
    float _1385 = fma(_1383, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1375);
    float _1387 = log2(_1367);
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1391 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1379);
    float _1393 = fma(_1385, -0.5, 0.5);
    float _1395 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1389);
    float _1397 = fma(_1385, 0.5, 0.5);
    float _1399 = _1359 + 1.0;
    float _1401 = exp2(_1377);
    float _1403 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1395);
    float _1405 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1391);
    float _1407 = fma(_1397, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1409 = fma(_1397, _1407, -0.212114393711090087890625);
    float _1411 = 1.0 / _1381;
    float _1413 = _1387 * 0.693147182464599609375;
    float _1415 = fma(_1397, _1409, 1.570728778839111328125);
    float _1417 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1419 = sqrt(_1393);
    float _1421 = -_1359;
    float _1423 = fma(_1401, _1399, _1421);
    float _1425 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1403);
    float _1427 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1405);
    float _1429 = fma(_1423, 0.5, 0.5);
    float _1431 = _1425 * _1411;
    float _1433 = _1427 * _1411;
    float _1435 = fma(_1431, 0.5, 0.5);
    float _1437 = fma(_1433, -0.5, 0.5);
    float _1439 = _1419 * 0.636619746685028076171875;
    float _1441 = -_1415;
    float _1443 = fma(_1439, _1441, 1.0);
    float3 _3887 = float3(_1435, _1437, _1417);
    float _1445 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).x;
    float3 _3898 = float3(_1435, _1437, _1417);
    float4 _1448 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3898, float3(0.0), isnan(_3898)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3898, float3(0.0), isnan(_3898)), level(0.0)).xyzw;
    float _1450 = _1448.x;
    float _1452 = _1448.y;
    float _1454 = _1448.z;
    float _1456 = _1448.w;
    float2 _3915 = float2(_1443, _1429);
    float3 _1460 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3915, float2(0.0), isnan(_3915)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3915, float2(0.0), isnan(_3915)), level(0.0)).xyz;
    float _1462 = _1460.x;
    float _1464 = _1460.y;
    float _1466 = _1460.z;
    float _1468 = in.m_49.y;
    bool _1470 = _137 > 0.5;
    float _1472 = _1339 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1476 = _1474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1478 = _1345 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1480 = -_207;
    int _1482 = _1470 ? as_type<int>(_1480) : as_type<int>(_207);
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1486 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1484;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1490 = _1488 != 0;
    float _1492 = 1.0 / _1476;
    float _1494 = _679 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1496 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1478);
    float _1498 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1500 = _683 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1506 = _1468 > 0.5;
    float _1508 = _1486 * _1492;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1512 = _713 + _1510;
    bool _1514 = !_1490;
    float _1516 = _1514 ? _207 : as_type<float>(_1482);
    float _1518 = exp2(_1472);
    bool _1520 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1522 = isnan(_713);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = fma(_1508, _1512, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1536 = _1534 != 0;
    float _1538 = _1516 + 0.5;
    float _1540 = -_215;
    int _1542 = _1506 ? as_type<int>(_1540) : as_type<int>(_215);
    float _1544 = -_1530;
    float _1546 = _1544 + 1.0;
    bool _1548 = _713 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1550 = isnan(_713);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1556 = _1552 || _1554;
    float _1558 = float(_1556);
    float _1560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1562 = !_1536;
    float _1564 = _1562 ? _215 : as_type<float>(_1542);
    float _1566 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1568 = _1558 * _1546;
    float _1570 = -_1558;
    float _1572 = _1570 + 1.0;
    float _1574 = -_1564;
    float _1576 = _1574 + 0.5;
    float _1578 = _1566 * _1502;
    float _1580 = _1532 * _1568;
    float _1582 = _1576 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1584 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1580);
    float _1586 = -_1518;
    float _1588 = _1586 + 1.0;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1594 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1596 = _1582 * _1560;
    float _1598 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1584);
    float _1600 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1602 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1496);
    float _1604 = _1588 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1606 = _1590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1608 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1610 = _1594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1612 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1602);
    bool _1614 = _1127 > 0.0;
    bool _1616 = isnan(_1127);
    bool _1618 = _1614 || _1616;
    bool _1620 = isnan(0.0);
    bool _1622 = _1618 || _1620;
    float _1624 = _1498 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1606;
    out.m_56.y = _1608;
    out.m_56.z = _1610;
    float _1626 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1628 = _1598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1425;
    out.gl_Position.y = _1427;
    out.gl_Position.z = _1612;
    out.gl_Position.w = _1381;
    float _1630 = _1626 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_58.x = _1578;
    out.m_58.y = _1596;
    float _1632 = _1612 + _1381;
    float _1634 = -_1604;
    float _1636 = _1634 + 1.0;
    out.m_60.x = _1600;
    out.m_60.y = _1624;
    out.m_60.z = _1504;
    out.m_60.w = _1628;
    float _1638 = _1632 * 0.5;
    out.m_45.x = _1630;
    out.m_62.z = _1638;
    out.m_62.w = _1381;
    float _1640 = _1604 * _1445;
    float _1642 = _1456 * _1636;
    float _1644 = _1456 * _1640;
    float _1646 = _1466 * _1640;
    float _1648 = fma(_1462, _1644, _1450);
    float _1650 = fma(_1464, _1644, _1452);
    float _1652 = fma(_1456, _1646, _1454);
    out.m_64.x = _1648;
    out.m_64.y = _1650;
    out.m_64.z = _1652;
    out.m_64.w = _1642;
    if (_1622)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1654 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1654;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

