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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _939 = false;
    bool _817 = false;
    bool _535 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2788 = as_type<float>(_105);
        out.gl_Position.z = _2788;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2857 = as_type<float>(_141);
        out.gl_Position.z = _2857;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _159 = _147 * _145;
    float _161 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _163 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _165 = _161 * _157;
    int _167 = as_type<int>(_149) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_149) & 2;
    bool _173 = _171 != 0;
    float _175 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].y, _165);
    float _177 = _163 * 6.283185482025146484375;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = floor(_175);
    float _187 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = _177 * 0.15915493667125701904296875;
    float _193 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _199 = _175 * 6.283185482025146484375;
    float _201 = floor(_163);
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _199 * 0.15915493667125701904296875;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    bool _217 = !_181;
    int _219 = _217 ? 0 : 1;
    float _221 = _191 * 6.283185482025146484375;
    float _223 = cos(_221);
    float _225 = -_185;
    float _227 = _175 + _225;
    float _229 = _207 * 6.283185482025146484375;
    float _231 = cos(_229);
    int _233 = abs(_219);
    float _235 = -_201;
    float _237 = _163 + _235;
    bool _239 = !_211;
    int _241 = _239 ? 0 : 1;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = -_237;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _249 = abs(_241);
    float _251 = fma(_223, 0.5, 0.5);
    bool _253 = _237 < 0.5;
    float _255 = float(_253);
    bool _257 = !_215;
    int _259 = _257 ? 0 : 1;
    float _261 = -_251;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = float(_249);
    float _267 = -_255;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_233);
    float _273 = -_227;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _277 = fma(_231, 0.5, 0.5);
    float _279 = abs(_247);
    float _281 = _265 * _279;
    int _283 = abs(_259);
    float _285 = abs(_275);
    float _287 = _265 * _285;
    float _289 = -_277;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _293 = _227 < 0.5;
    float _295 = float(_293);
    float _297 = fma(_271, _263, _281);
    float _299 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _301 = fma(_271, _291, _287);
    float _303 = float(_283);
    float _305 = -_295;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _309 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _311 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _313 = !_169;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = abs(_269);
    float _319 = fma(_303, _317, _297);
    float _321 = abs(_307);
    float _323 = fma(_303, _321, _301);
    bool _325 = !_243;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_89);
        float _347 = 1.0 / _345;
        float _349 = _123 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _351 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _351 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _351 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    bool _377 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _379 = isnan(_351);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _367;
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _393 = 1.0 / _375;
    bool _395 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_351);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _371;
    float _409 = _355 * _389;
    bool _411 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _413 = isnan(_351);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = _359 * _393;
    float _425 = -_405;
    float _427 = _425 + 1.0;
    float _429 = _421 * _427;
    float _431 = -_421;
    float _433 = _431 + 1.0;
    float _435 = _363 * _407;
    float _437 = -_387;
    float _439 = _437 + 1.0;
    bool _441 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_351);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = _405 * _439;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_455, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _451 * _433;
    float _475 = fma(_465, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_459, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = -_451;
    float _483 = _481 + 1.0;
    float _485 = _471 * _473;
    float _487 = _475 * _473;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _489;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _495;
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _501 = fma(_491, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _503 = fma(_477, _429, _493);
    float _505 = fma(_497, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _507 = fma(_479, _429, _499);
    float _509 = fma(_501, _461, _503);
    float _511 = fma(_505, _461, _507);
    float _513 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[146].x, _509);
    float _515 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[146].y, _511);
    bool _517 = !_391;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _521 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_89);
        float _539 = 1.0 / _537;
        float _541 = _123 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _543 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _555 = _543 + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = 1.0 / _559;
    bool _575 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _571;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _589;
    float _593 = _515 * _547;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = _543 + _595;
    float _599 = 1.0 / _563;
    bool _601 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _603 = _513 * _545;
    float _605 = _597 * _573;
    float _607 = 1.0 / _567;
    float _609 = _551 * _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _613 = _543 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _619;
    float _623 = _613 * _587;
    bool _625 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _627 = isnan(_543);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = _555 * _607;
    bool _639 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _641 = isnan(_543);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    bool _651 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _653 = isnan(_543);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = fma(_591, _637, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _669 = fma(_617, _637, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _671 = fma(_621, _637, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _673 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _675 = isnan(_543);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -_649;
    float _687 = _685 + 1.0;
    float _689 = _661 * _665;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _695 = -_661;
    float _697 = _695 + 1.0;
    float _699 = _683 * _687;
    float _701 = -_683;
    float _703 = _701 + 1.0;
    float _705 = fma(_693, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _707 = _649 * _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _717 = _585 * _703;
    float _719 = fma(_711, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _721 = fma(_715, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _723 = _669 * _717;
    float _725 = _667 * _717;
    float _727 = _671 * _717;
    float _729 = -_585;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _741;
    float _745 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].x, _725);
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].y, _723);
    float _749 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].z, _727);
    float _751 = fma(_735, _605, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _753 = fma(_739, _605, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _755 = fma(_719, _699, _745);
    float _757 = fma(_721, _699, _747);
    float _759 = fma(_705, _699, _749);
    float _761 = fma(_743, _605, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _775 = fma(_751, _707, _755);
    float _777 = fma(_765, _609, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _779 = fma(_769, _609, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _781 = fma(_773, _609, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _783 = fma(_753, _707, _757);
    float _785 = fma(_761, _707, _759);
    float _787 = fma(_777, _689, _775);
    float _789 = fma(_779, _689, _783);
    float _791 = fma(_781, _689, _785);
    float _793 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].x, _787);
    float _795 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].y, _789);
    float _797 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].z, _791);
    bool _799 = !_601;
    float _815;
    if (!_799)
    {
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _803 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _815 = _813;
        _817 = true;
    }
    else
    {
        float _819 = float(_89);
        float _821 = 1.0 / _819;
        float _823 = _123 * _821;
        _815 = _823;
    }
    _817 = false;
    float _825 = _815;
    float _827 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _829 = _795 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _831 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _833 = isnan(_825);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _849 = isnan(_825);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _865 = _825 + _863;
    float _867 = -_841;
    float _869 = _867 + 1.0;
    float _871 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _873 = 1.0 / _845;
    float _875 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _857 * _869;
    float _879 = -_857;
    float _881 = _879 + 1.0;
    float _883 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = _861 * _873;
    float _891 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _893 = fma(_889, _865, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _895 = _891 * _143;
    float _897 = _893 * _877;
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[115].x, _897);
    float _901 = trunc(_895);
    int _903 = int(_901);
    float _905 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[116].x, _899);
    float _907 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _875;
    out.m_58.y = _883;
    out.m_58.z = _885;
    out.m_58.w = _907;
    int _909 = _903 << 4;
    int _911 = _909 + 1968;
    bool _913 = !_887;
    float _935;
    float _937;
    if (!_913)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _917 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _919 = float(_89);
        float _921 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _923 = 1.0 / _919;
        float _925 = _921 * _915;
        float _927 = floor(_925);
        float _929 = _123 * _923;
        float _931 = -_927;
        float _933 = _925 + _931;
        _935 = _929;
        _937 = _933;
        _939 = true;
    }
    else
    {
        float _941 = float(_89);
        float _943 = 1.0 / _941;
        float _945 = _123 * _943;
        _935 = _945;
        _937 = _945;
    }
    _939 = false;
    float _947 = _935;
    float _949 = _937;
    float _951 = in.m_49.y;
    float _953 = _319 * _603;
    bool _955 = _143 > 0.5;
    float _957 = in.m_49.w;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _961 = _959 != 0;
    float _963 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _965 = in.m_42.x;
    float _967 = in.m_42.y;
    float _969 = in.m_42.z;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _975 = _973 != 0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _979 = _947 + _977;
    float _981 = -_315;
    int _983 = _955 ? as_type<int>(_981) : as_type<int>(_315);
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _991 = _989 != 0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _995 = _949 + _993;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _999 = _997 != 0;
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1005 = _1003 != 0;
    bool _1007 = !_975;
    float _1009 = _1007 ? _315 : as_type<float>(_983);
    float _1011 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1013 = _951 > 0.5;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1019 = 1.0 / _987;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1027 = _1025 != 0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1033 = -_205;
    int _1035 = _1013 ? as_type<int>(_1033) : as_type<int>(_205);
    float _1037 = _967 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1043 = 1.0 / _1017;
    bool _1045 = !_991;
    float _1047 = _1045 ? _205 : as_type<float>(_1035);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1051 = _957 > 0.5;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1059 = _967 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = -_1049;
    float _1063 = fma(_963, 2.0, _1061);
    float _1065 = 1.0 / _1031;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1071 = fma(_1011, -2.0, _1057);
    float _1073 = _967 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1075 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1081 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1037);
    float _1083 = 1.0 / _1041;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1097 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1073);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1103 = _1091 * _1019;
    float _1105 = 1.0 / _1055;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1111;
    float _1115 = _1101 * _1065;
    float _1117 = _1109 * _1043;
    float _1119 = -_123;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1063);
    bool _1123 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1125 = isnan(_947);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = 1.0 / _1069;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1137;
    float _1141 = fma(_1117, _979, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1145 = _947 + _1143;
    float _1147 = fma(_1115, _995, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1149 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1151 = isnan(_949);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = in.m_49.z;
    float _1163 = 1.0 / _1079;
    float _1165 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1071);
    float _1167 = 0.0;
    if (!_961)
    {
        _1167 = _951;
    }
    float _1169 = _1167;
    float _1171 = -_1159;
    float _1173 = _1171 + 1.0;
    float _1175 = _1169;
    if (_961)
    {
        _1175 = _143;
    }
    float _1177 = _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1187 = 1.0 / _1087;
    float _1189 = _1181 * _1083;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1193 = _1191 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1195 = _1185 * _1105;
    float _1197 = _971 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1199 = _1009 + 0.5;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1203 = _949 + _1201;
    float _1205 = 1.0 / _1095;
    float _1207 = _1113 * _1163;
    float _1209 = fma(_1197, _1199, _1121);
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1213 = _947 + _1211;
    float _1215 = _1193 * _1135;
    float _1217 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1081);
    float _1219 = fma(_1103, _1203, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1221 = _1139 * _1187;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1225 = _947 + _1223;
    bool _1227 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1229 = isnan(_949);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1235 = _1231 || _1233;
    float _1237 = float(_1235);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1241;
    float _1245 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1075);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1249 = _947 + _1247;
    float _1251 = fma(_1189, _1225, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1253 = _1243 * _1205;
    float _1255 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1097);
    float _1257 = fma(_1207, _1249, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1259 = fma(_1195, _1213, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1263 = _947 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1267 = _947 + _1265;
    float _1269 = fma(_1253, _1145, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1271 = fma(_1221, _1263, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1273 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1275 = isnan(_947);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1287 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1289 = isnan(_947);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = fma(_1215, _1267, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1303 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1285);
    bool _1305 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1307 = isnan(_947);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = -_1297;
    float _1319 = _1317 + 1.0;
    bool _1321 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1323 = isnan(_947);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -_1283;
    float _1335 = _1333 + 1.0;
    bool _1337 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1339 = isnan(_947);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    float _1349 = _1315 * _1319;
    float _1351 = -_1315;
    float _1353 = _1351 + 1.0;
    float _1355 = -_1331;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1301);
    bool _1361 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1363 = isnan(_949);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1283 * _1353;
    bool _1375 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1377 = isnan(_947);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = _1331 * _1335;
    bool _1389 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1391 = isnan(_947);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = _1347 * _1357;
    float _1403 = -_1347;
    float _1405 = _1403 + 1.0;
    float _1407 = -_1371;
    float _1409 = _1407 + 1.0;
    float _1411 = -_1237;
    float _1413 = _1411 + 1.0;
    float _1415 = -_1399;
    float _1417 = _1415 + 1.0;
    float _1419 = -_1385;
    float _1421 = _1419 + 1.0;
    float _1423 = _1237 * _1409;
    float _1425 = _1399 * _1405;
    float _1427 = _1133 * _1417;
    float _1429 = -_1133;
    float _1431 = _1429 + 1.0;
    float _1433 = _1399;
    float _1435 = _1209;
    if (_961)
    {
        _1433 = _143;
    }
    float _1437 = _1433;
    float _1439 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1441 = _1047 + (-0.5);
    float _1443 = _1385 * _1431;
    float _1445 = _1437;
    float _1447 = _1441;
    if (!_961)
    {
        _1445 = _1161;
    }
    float _1449 = _1445;
    float _1451 = _1159 * _1413;
    float _1453 = -_1439;
    float _1455 = -_1165;
    float _1457 = fma(_1453, _1441, _1455);
    float _1459 = _1257 * _1443;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1463 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1465 = _1219 * _1451;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1469 = -_1461;
    float _1471 = fma(_1463, 2.0, _1469);
    float _1473 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1465);
    float _1475 = _1463;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_961)
    {
        _1475 = _1161;
    }
    float _1479 = _1475;
    float _1481 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1467);
    float _1483 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1485 = _1479;
    if (_961)
    {
        _1485 = _951;
    }
    float _1487 = _1485;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1491 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1459);
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1495 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1489);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1499 = _911 + 8;
    uint _1502 = uint(int(uint(_1499) >> uint(2)));
    uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
    int _1506 = int(_1502) & 3;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[int(_1504)][_1506];
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1512 = -_315;
    int _1514 = _1013 ? as_type<int>(_1512) : as_type<int>(_315);
    float _1516 = fma(_1141, _1427, _1491);
    if (!_961)
    {
        _1447 = _1161;
    }
    float _1518 = _1447;
    float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1522 = _1161 > 0.5;
    float _1524 = -_1510;
    float _1526 = fma(_1483, 2.0, _1524);
    float _1528 = _1518;
    if (_961)
    {
        _1528 = _951;
    }
    float _1530 = _1528;
    float _1532 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1239);
    if (_961)
    {
        _1477 = _951;
    }
    float _1534 = _1477;
    float _1536 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1497);
    float _1538 = _1534;
    if (!_961)
    {
        _1538 = _143;
    }
    float _1540 = _1538;
    uint _1542 = uint(int(uint(_911) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    float _1558 = fma(_1147, _1423, _1473);
    bool _1560 = !_1023;
    float _1562 = _1560 ? _315 : as_type<float>(_1514);
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1566 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1568 = -_315;
    int _1570 = _1522 ? as_type<int>(_1568) : as_type<int>(_315);
    float _1572 = -_123;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1471);
    float _1576 = _1562 + 0.5;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1580 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1582 = !_999;
    float _1584 = _1582 ? _315 : as_type<float>(_1570);
    float _1586 = fma(_1566, _1576, _1574);
    float _1588 = -_205;
    int _1590 = _1051 ? as_type<int>(_1588) : as_type<int>(_205);
    float _1592 = fma(_1580, -2.0, _1578);
    float _1594 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1596 = _1584 + 0.5;
    float _1598 = -_123;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1526);
    float _1602 = fma(_1251, _1425, _1516);
    bool _1604 = !_1005;
    float _1606 = _1604 ? _205 : as_type<float>(_1590);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1610 = fma(_1594, _1596, _1600);
    float _1612 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1614 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1592);
    float _1616 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = _1606 + (-0.5);
    float _1620 = fma(_1612, -2.0, _1608);
    float _1622 = fma(_1259, _1401, _1602);
    float _1624 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1626 = -_1616;
    float _1628 = -_1614;
    float _1630 = fma(_1626, _1618, _1628);
    float _1632 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1558);
    float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1636 = -_205;
    int _1638 = _1522 ? as_type<int>(_1636) : as_type<int>(_205);
    float _1640 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1624 + _1642;
    float _1646 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1536);
    float _1648 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1495);
    float _1650 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1652 = !_1027;
    float _1654 = _1652 ? _205 : as_type<float>(_1638);
    float _1656 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1660 = _1640 + _1658;
    float _1662 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1664 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    float _1666 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1303);
    float _1668 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1359);
    float _1670 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1481);
    float _1672 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1620);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1676 = _1656 + _1674;
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1662);
    float _1680 = fma(_1271, _1387, _1622);
    float _1682 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1684 = _1654 + (-0.5);
    float _1686 = _1644 * _1644;
    float _1688 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1678);
    float _1690 = fma(_1299, _1373, _1680);
    float _1692 = -_1682;
    float _1694 = -_1672;
    float _1696 = fma(_1692, _1684, _1694);
    float _1698 = fma(_1660, _1660, _1686);
    float _1700 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1702 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1704 = fma(_1269, _1349, _1690);
    bool _1706 = _1688 >= 0.0;
    float _1708 = fma(_1676, _1676, _1698);
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1718 = -_1646;
    float _1720 = _1718 + 1.0;
    float _1722 = rsqrt(_1708);
    float _1724 = -_1668;
    float _1726 = _1724 + 1.0;
    float _1728 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_60.x = _1710;
    out.m_60.y = _1712;
    out.m_60.z = _1714;
    out.m_60.w = _1716;
    float _1730 = -_1720;
    float _1732 = fma(_1562, _1730, _1586);
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1736 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1704);
    if (_1706)
    {
        out.m_45.x = 0.0;
    }
    out.m_62.x = _1736;
    float _1738 = _1734 * _1722;
    float _1740 = -_1664;
    float _1742 = _1740 + 1.0;
    float _1744 = -_1648;
    float _1746 = _1744 + 1.0;
    float _1748 = -_1666;
    float _1750 = _1748 + 1.0;
    float _1752 = -_1670;
    float _1754 = _1752 + 1.0;
    float _1756 = -_1742;
    float _1758 = fma(_1009, _1756, _1209);
    if (_1706)
    {
        _1435 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1760 = _1435;
    float _1762 = fma(_1606, _1746, _1630);
    float _1764 = fma(_1047, _1750, _1457);
    float _1766 = -_1754;
    float _1768 = fma(_1584, _1766, _1610);
    float _1770 = fma(_1654, _1726, _1696);
    int _1772 = as_type<int>(_1760);
    float _1774 = _1768;
    if (_1706)
    {
        float _1776 = _1760 * 5.0;
        _1772 = as_type<int>(_1776);
    }
    int _1778 = _1772;
    float _1780 = _1660 * _1738;
    float _1782 = _1644 * _1738;
    out.m_64.x = _1758;
    out.m_64.y = _1764;
    out.m_64.z = _1768;
    out.m_64.w = _1762;
    float _1784 = _1780;
    if (_1706)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5554 = as_type<float>(_1778);
        out.gl_Position.z = _5554;
    }
    out.m_66.x = _1732;
    out.m_66.y = _1770;
    if (_1706)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1786 = -_1782;
    float _1788 = _1624 + _1786;
    float _1790 = _1676 * _1738;
    float _1792 = -_1780;
    float _1794 = _1640 + _1792;
    float _1796 = -_1782;
    float _1798 = _1644 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1788 + _1800;
    float _1804 = -_1790;
    float _1806 = _1656 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1794 + _1808;
    float _1812 = -_1780;
    float _1814 = _1660 + _1812;
    float _1816 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1820 = _1806 + _1818;
    float _1822 = _1798 * _1798;
    float _1824 = -_1790;
    float _1826 = _1676 + _1824;
    float _1828 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1816);
    float _1830 = _323 * _593;
    float _1832 = fma(_1814, _1814, _1822);
    float _1834 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1828);
    float _1836 = fma(_1826, _1826, _1832);
    bool _1838 = _1834 >= 0.0;
    float _1840 = sqrt(_1836);
    float _1842 = _1794;
    if (_1838)
    {
        _1774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1844 = _1774;
    int _1846 = as_type<int>(_1844);
    if (_1838)
    {
        out.m_45.x = 0.0;
    }
    if (_1838)
    {
        float _1848 = _1844 * 5.0;
        _1846 = as_type<int>(_1848);
    }
    int _1850 = _1846;
    float _1852 = _1722 * _1840;
    if (_1838)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5676 = as_type<float>(_1850);
        out.gl_Position.z = _5676;
    }
    if (_1838)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1854 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _315);
    float _1860 = _1728 * _1852;
    float _1862 = _1852 * _1854;
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1866 = _1864 * 0.5;
    float _1868 = _1858 * _1860;
    float _1870 = _1856 * _1862;
    float _1872 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1872);
    float _1878 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1880 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1878);
    float _1884 = _1880 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1886 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1888 = _1656 + _1884;
    float _1890 = _1640 + _1886;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1894 = _1888 + _1892;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1898 = _1890 + _1896;
    float _1900 = _1894 * _1894;
    float _1902 = fma(_1898, _1898, _1900);
    float _1904 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1906 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1908 = sqrt(_1902);
    float _1910 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1904);
    float _1912 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1906);
    float _1914 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1910);
    float _1916 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1912);
    float _1918 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1920 = _1624 + _1918;
    bool _1922 = _1908 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1904;
    float _1926 = _1918;
    float _1928 = _1912;
    if (!_1922)
    {
        _1924 = _1890;
    }
    float _1930 = _1924;
    float _1932 = _1930;
    if (!_1922)
    {
        _1926 = _1888;
    }
    float _1934 = _1926;
    float _1936 = _1934;
    if (!_1922)
    {
        _1928 = _1920;
    }
    float _1938 = _1928;
    bool _1940 = !_1922;
    float _1942 = _1938;
    if (!_1940)
    {
        float _1944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1948 = _1908 + _1946;
        float _1950 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1952 = rsqrt(_1902);
        float _1954 = _1948 * _1944;
        float _1956 = _1954 * 0.15915493667125701904296875;
        float _1958 = _1956 * 6.283185482025146484375;
        float _1960 = cos(_1958);
        float _1962 = _1956 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1960 + (-1.0);
        float _1968 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = fma(_1964, _1950, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1972 = fma(_1920, _1960, _1968);
        float _1974 = _1952 * _1970;
        float _1976 = fma(_1898, _1974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1978 = fma(_1894, _1974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1942 = _1972;
        _1932 = _1976;
        _1936 = _1978;
    }
    float _1980 = _1942;
    float _1982 = _1932;
    float _1984 = _1936;
    float _1986 = -_1624;
    float _1988 = _1986 + _1980;
    float _1990 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1992 = -_1640;
    float _1994 = _1992 + _1982;
    float _1996 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1998 = _1988 * _1988;
    float _2000 = -_1656;
    float _2002 = _2000 + _1984;
    float _2004 = 1.0 / _1990;
    float _2006 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1996);
    float _2008 = fma(_1994, _1994, _1998);
    bool _2010 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    float _2020 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2006);
    float _2022 = fma(_2002, _2002, _2008);
    float _2024 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2026 = sqrt(_2022);
    bool _2028 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    float _2038 = _2024 + _1990;
    float _2040 = _2038 * _2004;
    float _2042 = _2040 * 0.5;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2046 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2044);
    bool _2048 = _2026 > 0.0;
    float _2050 = 1.0 / _2046;
    float _2052 = _2004;
    float _2054 = _1990;
    float _2056 = _1982;
    float _2058 = _1980;
    if (!_2048)
    {
        _2052 = _1980;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    float _2064 = _2060;
    if (!_2048)
    {
        _2054 = _1984;
    }
    float _2066 = _2054;
    bool _2068 = !_2048;
    float _2070 = _2066;
    if (!_2068)
    {
        float _2072 = _309 * _309;
        float _2074 = fma(_299, _299, _2072);
        float _2076 = rsqrt(_2022);
        float _2078 = fma(_311, _311, _2074);
        float _2080 = sqrt(_2078);
        float _2082 = _1994 * _2076;
        float _2084 = _1988 * _2076;
        float _2086 = _2002 * _2076;
        bool _2088 = _2080 > 0.0;
        float _2090 = _2080;
        if (!_2088)
        {
            _2062 = _1980;
        }
        float _2092 = _2062;
        _2064 = _2092;
        if (!_2088)
        {
            _2090 = _1984;
        }
        float _2094 = _2090;
        bool _2096 = !_2088;
        _2070 = _2094;
        if (!_2096)
        {
            float _2098 = rsqrt(_2078);
            float _2100 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2102 = _309 * _2098;
            float _2104 = _299 * _2098;
            float _2106 = _2084 * _2102;
            float _2108 = _311 * _2098;
            float _2110 = fma(_2082, _2104, _2106);
            float _2112 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2114 = fma(_2086, _2108, _2110);
            float _2116 = _2114 * _2112;
            float _2118 = fma(_299, _2116, _1982);
            float _2120 = fma(_309, _2116, _1980);
            float _2122 = fma(_311, _2116, _1984);
            _2056 = _2118;
            _2064 = _2120;
            _2070 = _2122;
        }
    }
    float _2124 = _2056;
    float _2126 = _2064;
    float _2128 = _2070;
    float _2130 = -_1780;
    float _2132 = _2130 + _2124;
    float _2134 = -_1782;
    float _2136 = _2134 + _2126;
    float _2138 = -_1790;
    float _2140 = _2138 + _2128;
    float _2142 = _2136;
    float _2144 = _2132;
    float _2146 = _2140;
    float _2148 = _2124;
    if (_2036)
    {
        _2058 = 1.0;
    }
    float _2150 = _2058;
    float _2152 = _2150;
    if (!_2018)
    {
        float _2154 = _1802 * _1802;
        float _2156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2158 = -_1656;
        float _2160 = _2158 + _2128;
        float _2162 = -_1624;
        float _2164 = _2162 + _2126;
        float _2166 = fma(_1810, _1810, _2154);
        float _2168 = fma(_1820, _1820, _2166);
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2172 = sqrt(_2168);
        float _2174 = 1.0 / _1852;
        float _2176 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2178 = precise::min(_2172, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2180 = _2178 * _2156;
        float _2182 = -_1640;
        float _2184 = _2182 + _2124;
        float _2186 = _2180 * _2174;
        float _2188 = _2176 * _2186;
        float _2190 = _2160 * _2186;
        float _2192 = fma(_2184, _2188, _1794);
        float _2194 = fma(_2164, _2188, _1788);
        float _2196 = fma(_2176, _2190, _1806);
        _2142 = _2194;
        _2144 = _2192;
        _2146 = _2196;
        _2148 = _2188;
    }
    float _2198 = _2142;
    float _2200 = _2144;
    float _2202 = _2146;
    float _2204 = _2148;
    float _2206 = _2204;
    if (_2036)
    {
        _2206 = 1.0;
    }
    float _2208 = _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2212 = _2050 * _2210;
    float _2214 = _2208;
    float _2216 = _2212;
    if (!_2036)
    {
        float _2218 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2224 = _2220 * 6.283185482025146484375;
        float _2226 = cos(_2224);
        float _2228 = _2222 * 0.15915493667125701904296875;
        float _2230 = _2220 * 6.283185482025146484375;
        float _2232 = sin(_2230);
        float _2234 = 1.0 / _2226;
        float _2236 = _2228 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        float _2240 = _2232 * _2234;
        float _2242 = _2228 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2246;
        float _2250 = _2238 * _2240;
        float _2252 = 1.0 / _2248;
        float _2254 = 1.0 / _2250;
        float _2256 = _2244 * _2254;
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = fma(_2212, _2256, _2258);
        float _2262 = _2260 * _2252;
        float _2264 = precise::clamp(_2262, 0.0, 1.0);
        _1842 = _2252;
        _2152 = _2264;
    }
    float _2266 = _1842;
    float _2268 = _2152;
    float _2270 = _2266;
    if (!_2036)
    {
        float _2272 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2274 = _2272 * 0.15915493667125701904296875;
        float _2276 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2278 = _2274 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = _2276 * 0.15915493667125701904296875;
        float _2284 = _2274 * 6.283185482025146484375;
        float _2286 = sin(_2284);
        float _2288 = 1.0 / _2280;
        float _2290 = _2282 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = _2282 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2292 * _2294;
        float _2302 = 1.0 / _2300;
        float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2306 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2304;
        float _2308 = 1.0 / _2306;
        float _2310 = _2298 * _2302;
        float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2314 = fma(_2212, _2310, _2312);
        float _2316 = _2314 * _2308;
        float _2318 = precise::clamp(_2316, 0.0, 1.0);
        float _2320 = -_2318;
        float _2322 = _2320 + 1.0;
        _2270 = _2300;
        _2214 = _2322;
    }
    float _2324 = _2270;
    float _2326 = _2214;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2330 = _2198 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2334 = _2200 + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2338 = _2202 + _2336;
    float _2340 = _2330 * _2330;
    float _2342 = fma(_2334, _2334, _2340);
    float _2344 = fma(_2338, _2338, _2342);
    float _2346 = rsqrt(_2344);
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2350 = _2334 * _2348;
    float _2352 = _2338 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 * _2352;
    float _2358 = _2354 + _2356;
    float _2360 = sqrt(_2358);
    bool _2362 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2360 + _2364;
    float _2368 = _2338;
    float _2370 = _2324;
    float _2372 = _2366;
    float _2374 = _2330;
    float _2376 = _2350;
    if (_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2378;
    }
    float _2380 = _2368;
    if (_2362)
    {
        float _2382 = rsqrt(_2358);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2384;
    if (_2362)
    {
        float _2388 = _2366 * _2380;
        _2372 = _2388;
    }
    float _2390 = _2372;
    if (_2362)
    {
        float _2392 = _2390 * 0.15915493667125701904296875;
        _2216 = _2392;
    }
    float _2394 = _2216;
    float _2396 = _2340;
    if (_2362)
    {
        float _2398 = _2394 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        _2396 = _2400;
    }
    float _2402 = _2396;
    float _2404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2406 = precise::max(0.0, _2404);
    float _2408 = _2346;
    float _2410 = _2404;
    float _2412 = _2406;
    if (_2362)
    {
        float _2414 = _2394 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        _2408 = _2416;
    }
    float _2418 = _2408;
    float _2420 = -_2348;
    float _2422 = -_2406;
    float _2424 = fma(_2330, _2420, _2422);
    if (_2362)
    {
        float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2410 = _2426;
    }
    float _2428 = _2410;
    float _2430 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2432 = _2428;
    if (_2362)
    {
        float _2434 = fma(_2402, _2428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2374 = _2434;
    }
    float _2436 = _2374;
    float _2438 = sqrt(_2344);
    float _2440 = _2436;
    if (_2362)
    {
        float _2442 = _2418 + (-1.0);
        _2432 = _2442;
    }
    float _2444 = _2432;
    float _2446 = _2444;
    if (_2362)
    {
        float _2448 = _2384 * _2436;
        _1784 = _2448;
    }
    float _2450 = _1784;
    if (!_2362)
    {
        _2386 = _2424;
    }
    float _2452 = _2386;
    float _2454 = _2452;
    if (_2362)
    {
        float _2456 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2412 = _2456;
    }
    float _2458 = _2412;
    float _2460 = _2458;
    if (_2362)
    {
        float _2462 = _2350 * _2450;
        _2376 = _2462;
    }
    float _2464 = _2376;
    if (!_2362)
    {
        _2440 = _2352;
    }
    float _2466 = _2440;
    float _2468 = _2466;
    if (_2362)
    {
        float _2470 = _2352 * _2450;
        _2468 = _2470;
    }
    float _2472 = _2468;
    if (!_2362)
    {
        _2446 = _2354;
    }
    float _2474 = _2446;
    float _2476 = _2474;
    if (_2362)
    {
        float _2478 = fma(_2424, _2418, _2458);
        _2454 = _2478;
    }
    float _2480 = _2454;
    if (_2362)
    {
        float _2482 = _2464 * _2464;
        _2476 = _2482;
    }
    float _2484 = _2476;
    if (!_2362)
    {
        _2460 = _2356;
    }
    float _2486 = _2460;
    float _2488 = _2486;
    if (_2362)
    {
        float _2490 = _2472 * _2472;
        _2488 = _2490;
    }
    float _2492 = _2488;
    float _2494 = fma(_2480, _2480, _2484);
    float _2496 = _2494 + _2492;
    float _2498 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2502 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2500);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2508 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2498);
    float _2510 = rsqrt(_2496);
    float _2512 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2514 = -_2504;
    float _2516 = _2514 + 1.0;
    float _2518 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2508);
    float _2520 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2522 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2512);
    float _2524 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2526 = abs(_2516);
    float _2528 = log2(_2526);
    float _2530 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2520);
    float _2532 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2522);
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2536 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2430);
    float _2538 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2530);
    float _2540 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2542 = -_2534;
    float _2544 = fma(_2542, _2506, 1.0);
    float _2546 = _2510 * _2464;
    float _2548 = _2538 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2552 = _2510 * _2480;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2556 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2536);
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2550);
    float _2560 = _2510 * _2472;
    float _2562 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2564 = -_2554;
    float _2566 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2564);
    float _2568 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2570 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2558);
    float _2572 = log2(_2544);
    float _2574 = -_2560;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2566);
    float _2578 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2570);
    float _2582 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2584 = fma(_2576, -0.5, 0.5);
    float _2586 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2578);
    float _2588 = fma(_2576, 0.5, 0.5);
    float _2590 = exp2(_2562);
    float _2592 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2582);
    float _2594 = _2552 + 1.0;
    float _2596 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2586);
    float _2598 = fma(_2588, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2600 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2592);
    float _2602 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2596);
    float _2604 = 1.0 / _2580;
    float _2606 = fma(_2588, _2598, -0.212114393711090087890625);
    float _2608 = _2572 * 0.693147182464599609375;
    float _2610 = fma(_2588, _2606, 1.570728778839111328125);
    float _2612 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2614 = sqrt(_2584);
    float _2616 = -_2552;
    float _2618 = fma(_2590, _2594, _2616);
    float _2620 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2600);
    float _2622 = fma(_2618, 0.5, 0.5);
    float _2624 = _2602 * _2604;
    float _2626 = _2620 * _2604;
    float _2628 = fma(_2624, 0.5, 0.5);
    float _2630 = fma(_2626, -0.5, 0.5);
    float _2632 = _2614 * 0.636619746685028076171875;
    float3 _6905 = float3(_2628, _2630, _2612);
    float _2634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6905, float3(0.0), isnan(_6905)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6905, float3(0.0), isnan(_6905)), level(0.0)).x;
    float3 _6916 = float3(_2628, _2630, _2612);
    float4 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6916, float3(0.0), isnan(_6916)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6916, float3(0.0), isnan(_6916)), level(0.0)).xyzw;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2637.w;
    float _2647 = -_2610;
    float _2649 = fma(_2632, _2647, 1.0);
    float2 _6938 = float2(_2649, _2622);
    float3 _2653 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6938, float2(0.0), isnan(_6938)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6938, float2(0.0), isnan(_6938)), level(0.0)).xyz;
    float _2655 = _2653.x;
    float _2657 = _2653.y;
    float _2659 = _2653.z;
    float _2661 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2663 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2665 = _2580 * 0.5;
    bool _2667 = _2268 > 0.0;
    bool _2669 = isnan(_2268);
    bool _2671 = _2667 || _2669;
    bool _2673 = isnan(0.0);
    bool _2675 = _2671 || _2673;
    float _2677 = _2268 * _2326;
    float _2679 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2663);
    float _2681 = exp2(_2661);
    bool _2683 = _2326 <= 0.0;
    bool _2685 = !_2675;
    bool _2687 = _2683 || _2685;
    float _2689 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2679);
    float _2691 = _2677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2693 = _2602 + _2580;
    float _2695 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2689);
    float _2697 = fma(_2620, -0.5, _2665);
    float _2699 = _2691 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2701 = _2693 * 0.5;
    float _2703 = _2695 + _2580;
    out.gl_Position.x = _2602;
    out.gl_Position.y = _2620;
    out.gl_Position.z = _2695;
    out.gl_Position.w = _2580;
    float _2705 = _2703 * 0.5;
    float _2707 = -_2681;
    float _2709 = _2707 + 1.0;
    out.m_45.x = _2699;
    float _2711 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2701;
    out.m_68.y = _2697;
    out.m_68.z = _2705;
    out.m_68.w = _2580;
    float _2713 = _2711 * _2634;
    float _2715 = -_2711;
    float _2717 = _2715 + 1.0;
    float _2719 = _2645 * _2713;
    float _2721 = _2645 * _2717;
    float _2723 = _2659 * _2713;
    float _2725 = fma(_2655, _2719, _2639);
    float _2727 = fma(_2657, _2719, _2641);
    float _2729 = fma(_2645, _2723, _2643);
    out.m_70.x = _2725;
    out.m_70.y = _2727;
    out.m_70.z = _2729;
    out.m_70.w = _2721;
    if (!_2687)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2731 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2731;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _939 = false;
    bool _817 = false;
    bool _535 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2788 = as_type<float>(_105);
        out.gl_Position.z = _2788;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2857 = as_type<float>(_141);
        out.gl_Position.z = _2857;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _159 = _147 * _145;
    float _161 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _163 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _165 = _161 * _157;
    int _167 = as_type<int>(_149) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_149) & 2;
    bool _173 = _171 != 0;
    float _175 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].y, _165);
    float _177 = _163 * 6.283185482025146484375;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = floor(_175);
    float _187 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = _177 * 0.15915493667125701904296875;
    float _193 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _199 = _175 * 6.283185482025146484375;
    float _201 = floor(_163);
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _199 * 0.15915493667125701904296875;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    bool _217 = !_181;
    int _219 = _217 ? 0 : 1;
    float _221 = _191 * 6.283185482025146484375;
    float _223 = cos(_221);
    float _225 = -_185;
    float _227 = _175 + _225;
    float _229 = _207 * 6.283185482025146484375;
    float _231 = cos(_229);
    int _233 = abs(_219);
    float _235 = -_201;
    float _237 = _163 + _235;
    bool _239 = !_211;
    int _241 = _239 ? 0 : 1;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = -_237;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _249 = abs(_241);
    float _251 = fma(_223, 0.5, 0.5);
    bool _253 = _237 < 0.5;
    float _255 = float(_253);
    bool _257 = !_215;
    int _259 = _257 ? 0 : 1;
    float _261 = -_251;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = float(_249);
    float _267 = -_255;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_233);
    float _273 = -_227;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _277 = fma(_231, 0.5, 0.5);
    float _279 = abs(_247);
    float _281 = _265 * _279;
    int _283 = abs(_259);
    float _285 = abs(_275);
    float _287 = _265 * _285;
    float _289 = -_277;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _293 = _227 < 0.5;
    float _295 = float(_293);
    float _297 = fma(_271, _263, _281);
    float _299 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _301 = fma(_271, _291, _287);
    float _303 = float(_283);
    float _305 = -_295;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _309 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _311 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _313 = !_169;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = abs(_269);
    float _319 = fma(_303, _317, _297);
    float _321 = abs(_307);
    float _323 = fma(_303, _321, _301);
    bool _325 = !_243;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_89);
        float _347 = 1.0 / _345;
        float _349 = _123 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _351 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _351 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _351 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    bool _377 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _379 = isnan(_351);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _367;
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _393 = 1.0 / _375;
    bool _395 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_351);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _371;
    float _409 = _355 * _389;
    bool _411 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _413 = isnan(_351);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = _359 * _393;
    float _425 = -_405;
    float _427 = _425 + 1.0;
    float _429 = _421 * _427;
    float _431 = -_421;
    float _433 = _431 + 1.0;
    float _435 = _363 * _407;
    float _437 = -_387;
    float _439 = _437 + 1.0;
    bool _441 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_351);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = _405 * _439;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_455, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _451 * _433;
    float _475 = fma(_465, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_459, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = -_451;
    float _483 = _481 + 1.0;
    float _485 = _471 * _473;
    float _487 = _475 * _473;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _489;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _495;
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _501 = fma(_491, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _503 = fma(_477, _429, _493);
    float _505 = fma(_497, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _507 = fma(_479, _429, _499);
    float _509 = fma(_501, _461, _503);
    float _511 = fma(_505, _461, _507);
    float _513 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[146].x, _509);
    float _515 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[146].y, _511);
    bool _517 = !_391;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _521 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_89);
        float _539 = 1.0 / _537;
        float _541 = _123 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _543 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _555 = _543 + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = 1.0 / _559;
    bool _575 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _571;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _589;
    float _593 = _515 * _547;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = _543 + _595;
    float _599 = 1.0 / _563;
    bool _601 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _603 = _513 * _545;
    float _605 = _597 * _573;
    float _607 = 1.0 / _567;
    float _609 = _551 * _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _613 = _543 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _619;
    float _623 = _613 * _587;
    bool _625 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _627 = isnan(_543);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = _555 * _607;
    bool _639 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _641 = isnan(_543);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    bool _651 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _653 = isnan(_543);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = fma(_591, _637, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _669 = fma(_617, _637, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _671 = fma(_621, _637, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _673 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _675 = isnan(_543);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -_649;
    float _687 = _685 + 1.0;
    float _689 = _661 * _665;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _695 = -_661;
    float _697 = _695 + 1.0;
    float _699 = _683 * _687;
    float _701 = -_683;
    float _703 = _701 + 1.0;
    float _705 = fma(_693, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _707 = _649 * _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _717 = _585 * _703;
    float _719 = fma(_711, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _721 = fma(_715, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _723 = _669 * _717;
    float _725 = _667 * _717;
    float _727 = _671 * _717;
    float _729 = -_585;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _741;
    float _745 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].x, _725);
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].y, _723);
    float _749 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].z, _727);
    float _751 = fma(_735, _605, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _753 = fma(_739, _605, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _755 = fma(_719, _699, _745);
    float _757 = fma(_721, _699, _747);
    float _759 = fma(_705, _699, _749);
    float _761 = fma(_743, _605, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _775 = fma(_751, _707, _755);
    float _777 = fma(_765, _609, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _779 = fma(_769, _609, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _781 = fma(_773, _609, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _783 = fma(_753, _707, _757);
    float _785 = fma(_761, _707, _759);
    float _787 = fma(_777, _689, _775);
    float _789 = fma(_779, _689, _783);
    float _791 = fma(_781, _689, _785);
    float _793 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].x, _787);
    float _795 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].y, _789);
    float _797 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].z, _791);
    bool _799 = !_601;
    float _815;
    if (!_799)
    {
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _803 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _815 = _813;
        _817 = true;
    }
    else
    {
        float _819 = float(_89);
        float _821 = 1.0 / _819;
        float _823 = _123 * _821;
        _815 = _823;
    }
    _817 = false;
    float _825 = _815;
    float _827 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _829 = _795 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _831 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _833 = isnan(_825);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _849 = isnan(_825);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _865 = _825 + _863;
    float _867 = -_841;
    float _869 = _867 + 1.0;
    float _871 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _873 = 1.0 / _845;
    float _875 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _857 * _869;
    float _879 = -_857;
    float _881 = _879 + 1.0;
    float _883 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = _861 * _873;
    float _891 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _893 = fma(_889, _865, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _895 = _891 * _143;
    float _897 = _893 * _877;
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[115].x, _897);
    float _901 = trunc(_895);
    int _903 = int(_901);
    float _905 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[116].x, _899);
    float _907 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _875;
    out.m_58.y = _883;
    out.m_58.z = _885;
    out.m_58.w = _907;
    int _909 = _903 << 4;
    int _911 = _909 + 1968;
    bool _913 = !_887;
    float _935;
    float _937;
    if (!_913)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _917 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _919 = float(_89);
        float _921 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _923 = 1.0 / _919;
        float _925 = _921 * _915;
        float _927 = floor(_925);
        float _929 = _123 * _923;
        float _931 = -_927;
        float _933 = _925 + _931;
        _935 = _929;
        _937 = _933;
        _939 = true;
    }
    else
    {
        float _941 = float(_89);
        float _943 = 1.0 / _941;
        float _945 = _123 * _943;
        _935 = _945;
        _937 = _945;
    }
    _939 = false;
    float _947 = _935;
    float _949 = _937;
    float _951 = in.m_49.y;
    float _953 = _319 * _603;
    bool _955 = _143 > 0.5;
    float _957 = in.m_49.w;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _961 = _959 != 0;
    float _963 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _965 = in.m_42.x;
    float _967 = in.m_42.y;
    float _969 = in.m_42.z;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _975 = _973 != 0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _979 = _947 + _977;
    float _981 = -_315;
    int _983 = _955 ? as_type<int>(_981) : as_type<int>(_315);
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _991 = _989 != 0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _995 = _949 + _993;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _999 = _997 != 0;
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1005 = _1003 != 0;
    bool _1007 = !_975;
    float _1009 = _1007 ? _315 : as_type<float>(_983);
    float _1011 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1013 = _951 > 0.5;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1019 = 1.0 / _987;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1027 = _1025 != 0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1033 = -_205;
    int _1035 = _1013 ? as_type<int>(_1033) : as_type<int>(_205);
    float _1037 = _967 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1043 = 1.0 / _1017;
    bool _1045 = !_991;
    float _1047 = _1045 ? _205 : as_type<float>(_1035);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1051 = _957 > 0.5;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1059 = _967 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = -_1049;
    float _1063 = fma(_963, 2.0, _1061);
    float _1065 = 1.0 / _1031;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1071 = fma(_1011, -2.0, _1057);
    float _1073 = _967 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1075 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1081 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1037);
    float _1083 = 1.0 / _1041;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1097 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1073);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1103 = _1091 * _1019;
    float _1105 = 1.0 / _1055;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1111;
    float _1115 = _1101 * _1065;
    float _1117 = _1109 * _1043;
    float _1119 = -_123;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1063);
    bool _1123 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1125 = isnan(_947);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = 1.0 / _1069;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1137;
    float _1141 = fma(_1117, _979, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1145 = _947 + _1143;
    float _1147 = fma(_1115, _995, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1149 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1151 = isnan(_949);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = in.m_49.z;
    float _1163 = 1.0 / _1079;
    float _1165 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1071);
    float _1167 = 0.0;
    if (!_961)
    {
        _1167 = _951;
    }
    float _1169 = _1167;
    float _1171 = -_1159;
    float _1173 = _1171 + 1.0;
    float _1175 = _1169;
    if (_961)
    {
        _1175 = _143;
    }
    float _1177 = _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1187 = 1.0 / _1087;
    float _1189 = _1181 * _1083;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1193 = _1191 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1195 = _1185 * _1105;
    float _1197 = _971 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1199 = _1009 + 0.5;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1203 = _949 + _1201;
    float _1205 = 1.0 / _1095;
    float _1207 = _1113 * _1163;
    float _1209 = fma(_1197, _1199, _1121);
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1213 = _947 + _1211;
    float _1215 = _1193 * _1135;
    float _1217 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1081);
    float _1219 = fma(_1103, _1203, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1221 = _1139 * _1187;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1225 = _947 + _1223;
    bool _1227 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1229 = isnan(_949);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1235 = _1231 || _1233;
    float _1237 = float(_1235);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1241;
    float _1245 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1075);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1249 = _947 + _1247;
    float _1251 = fma(_1189, _1225, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1253 = _1243 * _1205;
    float _1255 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1097);
    float _1257 = fma(_1207, _1249, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1259 = fma(_1195, _1213, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1263 = _947 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1267 = _947 + _1265;
    float _1269 = fma(_1253, _1145, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1271 = fma(_1221, _1263, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1273 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1275 = isnan(_947);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1287 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1289 = isnan(_947);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = fma(_1215, _1267, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1303 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1285);
    bool _1305 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1307 = isnan(_947);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = -_1297;
    float _1319 = _1317 + 1.0;
    bool _1321 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1323 = isnan(_947);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -_1283;
    float _1335 = _1333 + 1.0;
    bool _1337 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1339 = isnan(_947);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    float _1349 = _1315 * _1319;
    float _1351 = -_1315;
    float _1353 = _1351 + 1.0;
    float _1355 = -_1331;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1301);
    bool _1361 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1363 = isnan(_949);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1283 * _1353;
    bool _1375 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1377 = isnan(_947);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = _1331 * _1335;
    bool _1389 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1391 = isnan(_947);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = _1347 * _1357;
    float _1403 = -_1347;
    float _1405 = _1403 + 1.0;
    float _1407 = -_1371;
    float _1409 = _1407 + 1.0;
    float _1411 = -_1237;
    float _1413 = _1411 + 1.0;
    float _1415 = -_1399;
    float _1417 = _1415 + 1.0;
    float _1419 = -_1385;
    float _1421 = _1419 + 1.0;
    float _1423 = _1237 * _1409;
    float _1425 = _1399 * _1405;
    float _1427 = _1133 * _1417;
    float _1429 = -_1133;
    float _1431 = _1429 + 1.0;
    float _1433 = _1399;
    float _1435 = _1209;
    if (_961)
    {
        _1433 = _143;
    }
    float _1437 = _1433;
    float _1439 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1441 = _1047 + (-0.5);
    float _1443 = _1385 * _1431;
    float _1445 = _1437;
    float _1447 = _1441;
    if (!_961)
    {
        _1445 = _1161;
    }
    float _1449 = _1445;
    float _1451 = _1159 * _1413;
    float _1453 = -_1439;
    float _1455 = -_1165;
    float _1457 = fma(_1453, _1441, _1455);
    float _1459 = _1257 * _1443;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1463 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1465 = _1219 * _1451;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1469 = -_1461;
    float _1471 = fma(_1463, 2.0, _1469);
    float _1473 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1465);
    float _1475 = _1463;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_961)
    {
        _1475 = _1161;
    }
    float _1479 = _1475;
    float _1481 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1467);
    float _1483 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1485 = _1479;
    if (_961)
    {
        _1485 = _951;
    }
    float _1487 = _1485;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1491 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1459);
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1495 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1489);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1499 = _911 + 8;
    uint _1502 = uint(int(uint(_1499) >> uint(2)));
    uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
    int _1506 = int(_1502) & 3;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[int(_1504)][_1506];
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1512 = -_315;
    int _1514 = _1013 ? as_type<int>(_1512) : as_type<int>(_315);
    float _1516 = fma(_1141, _1427, _1491);
    if (!_961)
    {
        _1447 = _1161;
    }
    float _1518 = _1447;
    float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1522 = _1161 > 0.5;
    float _1524 = -_1510;
    float _1526 = fma(_1483, 2.0, _1524);
    float _1528 = _1518;
    if (_961)
    {
        _1528 = _951;
    }
    float _1530 = _1528;
    float _1532 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1239);
    if (_961)
    {
        _1477 = _951;
    }
    float _1534 = _1477;
    float _1536 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1497);
    float _1538 = _1534;
    if (!_961)
    {
        _1538 = _143;
    }
    float _1540 = _1538;
    uint _1542 = uint(int(uint(_911) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    float _1558 = fma(_1147, _1423, _1473);
    bool _1560 = !_1023;
    float _1562 = _1560 ? _315 : as_type<float>(_1514);
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1566 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1568 = -_315;
    int _1570 = _1522 ? as_type<int>(_1568) : as_type<int>(_315);
    float _1572 = -_123;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1471);
    float _1576 = _1562 + 0.5;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1580 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1582 = !_999;
    float _1584 = _1582 ? _315 : as_type<float>(_1570);
    float _1586 = fma(_1566, _1576, _1574);
    float _1588 = -_205;
    int _1590 = _1051 ? as_type<int>(_1588) : as_type<int>(_205);
    float _1592 = fma(_1580, -2.0, _1578);
    float _1594 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1596 = _1584 + 0.5;
    float _1598 = -_123;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1526);
    float _1602 = fma(_1251, _1425, _1516);
    bool _1604 = !_1005;
    float _1606 = _1604 ? _205 : as_type<float>(_1590);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1610 = fma(_1594, _1596, _1600);
    float _1612 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1614 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1592);
    float _1616 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = _1606 + (-0.5);
    float _1620 = fma(_1612, -2.0, _1608);
    float _1622 = fma(_1259, _1401, _1602);
    float _1624 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1626 = -_1616;
    float _1628 = -_1614;
    float _1630 = fma(_1626, _1618, _1628);
    float _1632 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1558);
    float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1636 = -_205;
    int _1638 = _1522 ? as_type<int>(_1636) : as_type<int>(_205);
    float _1640 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1624 + _1642;
    float _1646 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1536);
    float _1648 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1495);
    float _1650 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1652 = !_1027;
    float _1654 = _1652 ? _205 : as_type<float>(_1638);
    float _1656 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1660 = _1640 + _1658;
    float _1662 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1664 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    float _1666 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1303);
    float _1668 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1359);
    float _1670 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1481);
    float _1672 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1620);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1676 = _1656 + _1674;
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1662);
    float _1680 = fma(_1271, _1387, _1622);
    float _1682 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1684 = _1654 + (-0.5);
    float _1686 = _1644 * _1644;
    float _1688 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1678);
    float _1690 = fma(_1299, _1373, _1680);
    float _1692 = -_1682;
    float _1694 = -_1672;
    float _1696 = fma(_1692, _1684, _1694);
    float _1698 = fma(_1660, _1660, _1686);
    float _1700 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1702 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1704 = fma(_1269, _1349, _1690);
    bool _1706 = _1688 >= 0.0;
    float _1708 = fma(_1676, _1676, _1698);
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1718 = -_1646;
    float _1720 = _1718 + 1.0;
    float _1722 = rsqrt(_1708);
    float _1724 = -_1668;
    float _1726 = _1724 + 1.0;
    float _1728 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_60.x = _1710;
    out.m_60.y = _1712;
    out.m_60.z = _1714;
    out.m_60.w = _1716;
    float _1730 = -_1720;
    float _1732 = fma(_1562, _1730, _1586);
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1736 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1704);
    if (_1706)
    {
        out.m_45.x = 0.0;
    }
    out.m_62.x = _1736;
    float _1738 = _1734 * _1722;
    float _1740 = -_1664;
    float _1742 = _1740 + 1.0;
    float _1744 = -_1648;
    float _1746 = _1744 + 1.0;
    float _1748 = -_1666;
    float _1750 = _1748 + 1.0;
    float _1752 = -_1670;
    float _1754 = _1752 + 1.0;
    float _1756 = -_1742;
    float _1758 = fma(_1009, _1756, _1209);
    if (_1706)
    {
        _1435 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1760 = _1435;
    float _1762 = fma(_1606, _1746, _1630);
    float _1764 = fma(_1047, _1750, _1457);
    float _1766 = -_1754;
    float _1768 = fma(_1584, _1766, _1610);
    float _1770 = fma(_1654, _1726, _1696);
    int _1772 = as_type<int>(_1760);
    float _1774 = _1768;
    if (_1706)
    {
        float _1776 = _1760 * 5.0;
        _1772 = as_type<int>(_1776);
    }
    int _1778 = _1772;
    float _1780 = _1660 * _1738;
    float _1782 = _1644 * _1738;
    out.m_64.x = _1758;
    out.m_64.y = _1764;
    out.m_64.z = _1768;
    out.m_64.w = _1762;
    float _1784 = _1780;
    if (_1706)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5554 = as_type<float>(_1778);
        out.gl_Position.z = _5554;
    }
    out.m_66.x = _1732;
    out.m_66.y = _1770;
    if (_1706)
    {
        return out;
    }
    float _1786 = -_1782;
    float _1788 = _1624 + _1786;
    float _1790 = _1676 * _1738;
    float _1792 = -_1780;
    float _1794 = _1640 + _1792;
    float _1796 = -_1782;
    float _1798 = _1644 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1788 + _1800;
    float _1804 = -_1790;
    float _1806 = _1656 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1794 + _1808;
    float _1812 = -_1780;
    float _1814 = _1660 + _1812;
    float _1816 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1820 = _1806 + _1818;
    float _1822 = _1798 * _1798;
    float _1824 = -_1790;
    float _1826 = _1676 + _1824;
    float _1828 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1816);
    float _1830 = _323 * _593;
    float _1832 = fma(_1814, _1814, _1822);
    float _1834 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1828);
    float _1836 = fma(_1826, _1826, _1832);
    bool _1838 = _1834 >= 0.0;
    float _1840 = sqrt(_1836);
    float _1842 = _1794;
    if (_1838)
    {
        _1774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1844 = _1774;
    int _1846 = as_type<int>(_1844);
    if (_1838)
    {
        out.m_45.x = 0.0;
    }
    if (_1838)
    {
        float _1848 = _1844 * 5.0;
        _1846 = as_type<int>(_1848);
    }
    int _1850 = _1846;
    float _1852 = _1722 * _1840;
    if (_1838)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5676 = as_type<float>(_1850);
        out.gl_Position.z = _5676;
    }
    if (_1838)
    {
        return out;
    }
    float _1854 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _315);
    float _1860 = _1728 * _1852;
    float _1862 = _1852 * _1854;
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1866 = _1864 * 0.5;
    float _1868 = _1858 * _1860;
    float _1870 = _1856 * _1862;
    float _1872 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1872);
    float _1878 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1880 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1878);
    float _1884 = _1880 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1886 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1888 = _1656 + _1884;
    float _1890 = _1640 + _1886;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1894 = _1888 + _1892;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1898 = _1890 + _1896;
    float _1900 = _1894 * _1894;
    float _1902 = fma(_1898, _1898, _1900);
    float _1904 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1906 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1908 = sqrt(_1902);
    float _1910 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1904);
    float _1912 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1906);
    float _1914 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1910);
    float _1916 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1912);
    float _1918 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1920 = _1624 + _1918;
    bool _1922 = _1908 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1904;
    float _1926 = _1918;
    float _1928 = _1912;
    if (!_1922)
    {
        _1924 = _1890;
    }
    float _1930 = _1924;
    float _1932 = _1930;
    if (!_1922)
    {
        _1926 = _1888;
    }
    float _1934 = _1926;
    float _1936 = _1934;
    if (!_1922)
    {
        _1928 = _1920;
    }
    float _1938 = _1928;
    bool _1940 = !_1922;
    float _1942 = _1938;
    if (!_1940)
    {
        float _1944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1948 = _1908 + _1946;
        float _1950 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1952 = rsqrt(_1902);
        float _1954 = _1948 * _1944;
        float _1956 = _1954 * 0.15915493667125701904296875;
        float _1958 = _1956 * 6.283185482025146484375;
        float _1960 = cos(_1958);
        float _1962 = _1956 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1960 + (-1.0);
        float _1968 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = fma(_1964, _1950, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1972 = fma(_1920, _1960, _1968);
        float _1974 = _1952 * _1970;
        float _1976 = fma(_1898, _1974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1978 = fma(_1894, _1974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1942 = _1972;
        _1932 = _1976;
        _1936 = _1978;
    }
    float _1980 = _1942;
    float _1982 = _1932;
    float _1984 = _1936;
    float _1986 = -_1624;
    float _1988 = _1986 + _1980;
    float _1990 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1992 = -_1640;
    float _1994 = _1992 + _1982;
    float _1996 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1998 = _1988 * _1988;
    float _2000 = -_1656;
    float _2002 = _2000 + _1984;
    float _2004 = 1.0 / _1990;
    float _2006 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1996);
    float _2008 = fma(_1994, _1994, _1998);
    bool _2010 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    float _2020 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2006);
    float _2022 = fma(_2002, _2002, _2008);
    float _2024 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2026 = sqrt(_2022);
    bool _2028 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    float _2038 = _2024 + _1990;
    float _2040 = _2038 * _2004;
    float _2042 = _2040 * 0.5;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2046 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2044);
    bool _2048 = _2026 > 0.0;
    float _2050 = 1.0 / _2046;
    float _2052 = _2004;
    float _2054 = _1990;
    float _2056 = _1982;
    float _2058 = _1980;
    if (!_2048)
    {
        _2052 = _1980;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    float _2064 = _2060;
    if (!_2048)
    {
        _2054 = _1984;
    }
    float _2066 = _2054;
    bool _2068 = !_2048;
    float _2070 = _2066;
    if (!_2068)
    {
        float _2072 = _309 * _309;
        float _2074 = fma(_299, _299, _2072);
        float _2076 = rsqrt(_2022);
        float _2078 = fma(_311, _311, _2074);
        float _2080 = sqrt(_2078);
        float _2082 = _1994 * _2076;
        float _2084 = _1988 * _2076;
        float _2086 = _2002 * _2076;
        bool _2088 = _2080 > 0.0;
        float _2090 = _2080;
        if (!_2088)
        {
            _2062 = _1980;
        }
        float _2092 = _2062;
        _2064 = _2092;
        if (!_2088)
        {
            _2090 = _1984;
        }
        float _2094 = _2090;
        bool _2096 = !_2088;
        _2070 = _2094;
        if (!_2096)
        {
            float _2098 = rsqrt(_2078);
            float _2100 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2102 = _309 * _2098;
            float _2104 = _299 * _2098;
            float _2106 = _2084 * _2102;
            float _2108 = _311 * _2098;
            float _2110 = fma(_2082, _2104, _2106);
            float _2112 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2114 = fma(_2086, _2108, _2110);
            float _2116 = _2114 * _2112;
            float _2118 = fma(_299, _2116, _1982);
            float _2120 = fma(_309, _2116, _1980);
            float _2122 = fma(_311, _2116, _1984);
            _2056 = _2118;
            _2064 = _2120;
            _2070 = _2122;
        }
    }
    float _2124 = _2056;
    float _2126 = _2064;
    float _2128 = _2070;
    float _2130 = -_1780;
    float _2132 = _2130 + _2124;
    float _2134 = -_1782;
    float _2136 = _2134 + _2126;
    float _2138 = -_1790;
    float _2140 = _2138 + _2128;
    float _2142 = _2136;
    float _2144 = _2132;
    float _2146 = _2140;
    float _2148 = _2124;
    if (_2036)
    {
        _2058 = 1.0;
    }
    float _2150 = _2058;
    float _2152 = _2150;
    if (!_2018)
    {
        float _2154 = _1802 * _1802;
        float _2156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2158 = -_1656;
        float _2160 = _2158 + _2128;
        float _2162 = -_1624;
        float _2164 = _2162 + _2126;
        float _2166 = fma(_1810, _1810, _2154);
        float _2168 = fma(_1820, _1820, _2166);
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2172 = sqrt(_2168);
        float _2174 = 1.0 / _1852;
        float _2176 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2178 = precise::min(_2172, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2180 = _2178 * _2156;
        float _2182 = -_1640;
        float _2184 = _2182 + _2124;
        float _2186 = _2180 * _2174;
        float _2188 = _2176 * _2186;
        float _2190 = _2160 * _2186;
        float _2192 = fma(_2184, _2188, _1794);
        float _2194 = fma(_2164, _2188, _1788);
        float _2196 = fma(_2176, _2190, _1806);
        _2142 = _2194;
        _2144 = _2192;
        _2146 = _2196;
        _2148 = _2188;
    }
    float _2198 = _2142;
    float _2200 = _2144;
    float _2202 = _2146;
    float _2204 = _2148;
    float _2206 = _2204;
    if (_2036)
    {
        _2206 = 1.0;
    }
    float _2208 = _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2212 = _2050 * _2210;
    float _2214 = _2208;
    float _2216 = _2212;
    if (!_2036)
    {
        float _2218 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2224 = _2220 * 6.283185482025146484375;
        float _2226 = cos(_2224);
        float _2228 = _2222 * 0.15915493667125701904296875;
        float _2230 = _2220 * 6.283185482025146484375;
        float _2232 = sin(_2230);
        float _2234 = 1.0 / _2226;
        float _2236 = _2228 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        float _2240 = _2232 * _2234;
        float _2242 = _2228 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2246;
        float _2250 = _2238 * _2240;
        float _2252 = 1.0 / _2248;
        float _2254 = 1.0 / _2250;
        float _2256 = _2244 * _2254;
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = fma(_2212, _2256, _2258);
        float _2262 = _2260 * _2252;
        float _2264 = precise::clamp(_2262, 0.0, 1.0);
        _1842 = _2252;
        _2152 = _2264;
    }
    float _2266 = _1842;
    float _2268 = _2152;
    float _2270 = _2266;
    if (!_2036)
    {
        float _2272 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2274 = _2272 * 0.15915493667125701904296875;
        float _2276 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2278 = _2274 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = _2276 * 0.15915493667125701904296875;
        float _2284 = _2274 * 6.283185482025146484375;
        float _2286 = sin(_2284);
        float _2288 = 1.0 / _2280;
        float _2290 = _2282 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = _2282 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2292 * _2294;
        float _2302 = 1.0 / _2300;
        float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2306 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2304;
        float _2308 = 1.0 / _2306;
        float _2310 = _2298 * _2302;
        float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2314 = fma(_2212, _2310, _2312);
        float _2316 = _2314 * _2308;
        float _2318 = precise::clamp(_2316, 0.0, 1.0);
        float _2320 = -_2318;
        float _2322 = _2320 + 1.0;
        _2270 = _2300;
        _2214 = _2322;
    }
    float _2324 = _2270;
    float _2326 = _2214;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2330 = _2198 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2334 = _2200 + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2338 = _2202 + _2336;
    float _2340 = _2330 * _2330;
    float _2342 = fma(_2334, _2334, _2340);
    float _2344 = fma(_2338, _2338, _2342);
    float _2346 = rsqrt(_2344);
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2350 = _2334 * _2348;
    float _2352 = _2338 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 * _2352;
    float _2358 = _2354 + _2356;
    float _2360 = sqrt(_2358);
    bool _2362 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2360 + _2364;
    float _2368 = _2338;
    float _2370 = _2324;
    float _2372 = _2366;
    float _2374 = _2330;
    float _2376 = _2350;
    if (_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2378;
    }
    float _2380 = _2368;
    if (_2362)
    {
        float _2382 = rsqrt(_2358);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2384;
    if (_2362)
    {
        float _2388 = _2366 * _2380;
        _2372 = _2388;
    }
    float _2390 = _2372;
    if (_2362)
    {
        float _2392 = _2390 * 0.15915493667125701904296875;
        _2216 = _2392;
    }
    float _2394 = _2216;
    float _2396 = _2340;
    if (_2362)
    {
        float _2398 = _2394 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        _2396 = _2400;
    }
    float _2402 = _2396;
    float _2404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2406 = precise::max(0.0, _2404);
    float _2408 = _2346;
    float _2410 = _2404;
    float _2412 = _2406;
    if (_2362)
    {
        float _2414 = _2394 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        _2408 = _2416;
    }
    float _2418 = _2408;
    float _2420 = -_2348;
    float _2422 = -_2406;
    float _2424 = fma(_2330, _2420, _2422);
    if (_2362)
    {
        float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2410 = _2426;
    }
    float _2428 = _2410;
    float _2430 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2432 = _2428;
    if (_2362)
    {
        float _2434 = fma(_2402, _2428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2374 = _2434;
    }
    float _2436 = _2374;
    float _2438 = sqrt(_2344);
    float _2440 = _2436;
    if (_2362)
    {
        float _2442 = _2418 + (-1.0);
        _2432 = _2442;
    }
    float _2444 = _2432;
    float _2446 = _2444;
    if (_2362)
    {
        float _2448 = _2384 * _2436;
        _1784 = _2448;
    }
    float _2450 = _1784;
    if (!_2362)
    {
        _2386 = _2424;
    }
    float _2452 = _2386;
    float _2454 = _2452;
    if (_2362)
    {
        float _2456 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2412 = _2456;
    }
    float _2458 = _2412;
    float _2460 = _2458;
    if (_2362)
    {
        float _2462 = _2350 * _2450;
        _2376 = _2462;
    }
    float _2464 = _2376;
    if (!_2362)
    {
        _2440 = _2352;
    }
    float _2466 = _2440;
    float _2468 = _2466;
    if (_2362)
    {
        float _2470 = _2352 * _2450;
        _2468 = _2470;
    }
    float _2472 = _2468;
    if (!_2362)
    {
        _2446 = _2354;
    }
    float _2474 = _2446;
    float _2476 = _2474;
    if (_2362)
    {
        float _2478 = fma(_2424, _2418, _2458);
        _2454 = _2478;
    }
    float _2480 = _2454;
    if (_2362)
    {
        float _2482 = _2464 * _2464;
        _2476 = _2482;
    }
    float _2484 = _2476;
    if (!_2362)
    {
        _2460 = _2356;
    }
    float _2486 = _2460;
    float _2488 = _2486;
    if (_2362)
    {
        float _2490 = _2472 * _2472;
        _2488 = _2490;
    }
    float _2492 = _2488;
    float _2494 = fma(_2480, _2480, _2484);
    float _2496 = _2494 + _2492;
    float _2498 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2502 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2500);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2508 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2498);
    float _2510 = rsqrt(_2496);
    float _2512 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2514 = -_2504;
    float _2516 = _2514 + 1.0;
    float _2518 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2508);
    float _2520 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2522 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2512);
    float _2524 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2526 = abs(_2516);
    float _2528 = log2(_2526);
    float _2530 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2520);
    float _2532 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2522);
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2536 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2430);
    float _2538 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2530);
    float _2540 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2542 = -_2534;
    float _2544 = fma(_2542, _2506, 1.0);
    float _2546 = _2510 * _2464;
    float _2548 = _2538 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2552 = _2510 * _2480;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2556 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2536);
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2550);
    float _2560 = _2510 * _2472;
    float _2562 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2564 = -_2554;
    float _2566 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2564);
    float _2568 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2570 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2558);
    float _2572 = log2(_2544);
    float _2574 = -_2560;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2566);
    float _2578 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2570);
    float _2582 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2584 = fma(_2576, -0.5, 0.5);
    float _2586 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2578);
    float _2588 = fma(_2576, 0.5, 0.5);
    float _2590 = exp2(_2562);
    float _2592 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2582);
    float _2594 = _2552 + 1.0;
    float _2596 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2586);
    float _2598 = fma(_2588, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2600 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2592);
    float _2602 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2596);
    float _2604 = 1.0 / _2580;
    float _2606 = fma(_2588, _2598, -0.212114393711090087890625);
    float _2608 = _2572 * 0.693147182464599609375;
    float _2610 = fma(_2588, _2606, 1.570728778839111328125);
    float _2612 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2614 = sqrt(_2584);
    float _2616 = -_2552;
    float _2618 = fma(_2590, _2594, _2616);
    float _2620 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2600);
    float _2622 = fma(_2618, 0.5, 0.5);
    float _2624 = _2602 * _2604;
    float _2626 = _2620 * _2604;
    float _2628 = fma(_2624, 0.5, 0.5);
    float _2630 = fma(_2626, -0.5, 0.5);
    float _2632 = _2614 * 0.636619746685028076171875;
    float3 _6905 = float3(_2628, _2630, _2612);
    float _2634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6905, float3(0.0), isnan(_6905)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6905, float3(0.0), isnan(_6905)), level(0.0)).x;
    float3 _6916 = float3(_2628, _2630, _2612);
    float4 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6916, float3(0.0), isnan(_6916)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6916, float3(0.0), isnan(_6916)), level(0.0)).xyzw;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2637.w;
    float _2647 = -_2610;
    float _2649 = fma(_2632, _2647, 1.0);
    float2 _6938 = float2(_2649, _2622);
    float3 _2653 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6938, float2(0.0), isnan(_6938)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6938, float2(0.0), isnan(_6938)), level(0.0)).xyz;
    float _2655 = _2653.x;
    float _2657 = _2653.y;
    float _2659 = _2653.z;
    float _2661 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2663 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2665 = _2580 * 0.5;
    bool _2667 = _2268 > 0.0;
    bool _2669 = isnan(_2268);
    bool _2671 = _2667 || _2669;
    bool _2673 = isnan(0.0);
    bool _2675 = _2671 || _2673;
    float _2677 = _2268 * _2326;
    float _2679 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2663);
    float _2681 = exp2(_2661);
    bool _2683 = _2326 <= 0.0;
    bool _2685 = !_2675;
    bool _2687 = _2683 || _2685;
    float _2689 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2679);
    float _2691 = _2677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2693 = _2602 + _2580;
    float _2695 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2689);
    float _2697 = fma(_2620, -0.5, _2665);
    float _2699 = _2691 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2701 = _2693 * 0.5;
    float _2703 = _2695 + _2580;
    out.gl_Position.x = _2602;
    out.gl_Position.y = _2620;
    out.gl_Position.z = _2695;
    out.gl_Position.w = _2580;
    float _2705 = _2703 * 0.5;
    float _2707 = -_2681;
    float _2709 = _2707 + 1.0;
    out.m_45.x = _2699;
    float _2711 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2701;
    out.m_68.y = _2697;
    out.m_68.z = _2705;
    out.m_68.w = _2580;
    float _2713 = _2711 * _2634;
    float _2715 = -_2711;
    float _2717 = _2715 + 1.0;
    float _2719 = _2645 * _2713;
    float _2721 = _2645 * _2717;
    float _2723 = _2659 * _2713;
    float _2725 = fma(_2655, _2719, _2639);
    float _2727 = fma(_2657, _2719, _2641);
    float _2729 = fma(_2645, _2723, _2643);
    out.m_70.x = _2725;
    out.m_70.y = _2727;
    out.m_70.z = _2729;
    out.m_70.w = _2721;
    if (!_2687)
    {
        return out;
    }
    float _2731 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2731;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _939 = false;
    bool _817 = false;
    bool _535 = false;
    bool _343 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2788 = as_type<float>(_105);
        out.gl_Position.z = _2788;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2857 = as_type<float>(_141);
        out.gl_Position.z = _2857;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_54.x;
    float _153 = in.m_54.y;
    float _155 = in.m_54.z;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _159 = _147 * _145;
    float _161 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _163 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _159);
    float _165 = _161 * _157;
    int _167 = as_type<int>(_149) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_149) & 2;
    bool _173 = _171 != 0;
    float _175 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].y, _165);
    float _177 = _163 * 6.283185482025146484375;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = floor(_175);
    float _187 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _191 = _177 * 0.15915493667125701904296875;
    float _193 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _197 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    float _199 = _175 * 6.283185482025146484375;
    float _201 = floor(_163);
    bool _203 = !_173;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = _199 * 0.15915493667125701904296875;
    int _209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _211 = _209 != 0;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _215 = _213 != 0;
    bool _217 = !_181;
    int _219 = _217 ? 0 : 1;
    float _221 = _191 * 6.283185482025146484375;
    float _223 = cos(_221);
    float _225 = -_185;
    float _227 = _175 + _225;
    float _229 = _207 * 6.283185482025146484375;
    float _231 = cos(_229);
    int _233 = abs(_219);
    float _235 = -_201;
    float _237 = _163 + _235;
    bool _239 = !_211;
    int _241 = _239 ? 0 : 1;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = -_237;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _249 = abs(_241);
    float _251 = fma(_223, 0.5, 0.5);
    bool _253 = _237 < 0.5;
    float _255 = float(_253);
    bool _257 = !_215;
    int _259 = _257 ? 0 : 1;
    float _261 = -_251;
    float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _265 = float(_249);
    float _267 = -_255;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_233);
    float _273 = -_227;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _277 = fma(_231, 0.5, 0.5);
    float _279 = abs(_247);
    float _281 = _265 * _279;
    int _283 = abs(_259);
    float _285 = abs(_275);
    float _287 = _265 * _285;
    float _289 = -_277;
    float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _293 = _227 < 0.5;
    float _295 = float(_293);
    float _297 = fma(_271, _263, _281);
    float _299 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _301 = fma(_271, _291, _287);
    float _303 = float(_283);
    float _305 = -_295;
    float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _309 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _311 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _313 = !_169;
    float _315 = _313 ? (-0.5) : 0.5;
    float _317 = abs(_269);
    float _319 = fma(_303, _317, _297);
    float _321 = abs(_307);
    float _323 = fma(_303, _321, _301);
    bool _325 = !_243;
    float _341;
    if (!_325)
    {
        float _327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _329 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _333 = _331 * _327;
        float _335 = floor(_333);
        float _337 = -_335;
        float _339 = _333 + _337;
        _341 = _339;
        _343 = true;
    }
    else
    {
        float _345 = float(_89);
        float _347 = 1.0 / _345;
        float _349 = _123 * _347;
        _341 = _349;
    }
    _343 = false;
    float _351 = _341;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _355 = _351 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _359 = _351 + _357;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _363 = _351 + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    bool _377 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _379 = isnan(_351);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _367;
    bool _391 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _393 = 1.0 / _375;
    bool _395 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _397 = isnan(_351);
    bool _399 = _395 || _397;
    bool _401 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _403 = _399 || _401;
    float _405 = float(_403);
    float _407 = 1.0 / _371;
    float _409 = _355 * _389;
    bool _411 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _413 = isnan(_351);
    bool _415 = _411 || _413;
    bool _417 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _419 = _415 || _417;
    float _421 = float(_419);
    float _423 = _359 * _393;
    float _425 = -_405;
    float _427 = _425 + 1.0;
    float _429 = _421 * _427;
    float _431 = -_421;
    float _433 = _431 + 1.0;
    float _435 = _363 * _407;
    float _437 = -_387;
    float _439 = _437 + 1.0;
    bool _441 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _443 = isnan(_351);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _453;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _461 = _405 * _439;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _471 = fma(_455, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _473 = _451 * _433;
    float _475 = fma(_465, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _477 = fma(_459, _435, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _479 = fma(_469, _435, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _481 = -_451;
    float _483 = _481 + 1.0;
    float _485 = _471 * _473;
    float _487 = _475 * _473;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _489;
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].x, _485);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _495;
    float _499 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[143].y, _487);
    float _501 = fma(_491, _423, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _503 = fma(_477, _429, _493);
    float _505 = fma(_497, _423, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _507 = fma(_479, _429, _499);
    float _509 = fma(_501, _461, _503);
    float _511 = fma(_505, _461, _507);
    float _513 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[146].x, _509);
    float _515 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[146].y, _511);
    bool _517 = !_391;
    float _533;
    if (!_517)
    {
        float _519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _521 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _523 = fma(_521, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _525 = _523 * _519;
        float _527 = floor(_525);
        float _529 = -_527;
        float _531 = _525 + _529;
        _533 = _531;
        _535 = true;
    }
    else
    {
        float _537 = float(_89);
        float _539 = 1.0 / _537;
        float _541 = _123 * _539;
        _533 = _541;
    }
    _535 = false;
    float _543 = _533;
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _551 = _543 + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _555 = _543 + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _557;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _573 = 1.0 / _559;
    bool _575 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _577 = isnan(_543);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _571;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _589;
    float _593 = _515 * _547;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _597 = _543 + _595;
    float _599 = 1.0 / _563;
    bool _601 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _603 = _513 * _545;
    float _605 = _597 * _573;
    float _607 = 1.0 / _567;
    float _609 = _551 * _599;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _613 = _543 + _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _619;
    float _623 = _613 * _587;
    bool _625 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _627 = isnan(_543);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = _555 * _607;
    bool _639 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _641 = isnan(_543);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    bool _651 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _653 = isnan(_543);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = fma(_591, _637, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _669 = fma(_617, _637, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _671 = fma(_621, _637, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _673 = _543 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _675 = isnan(_543);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _681 = _677 || _679;
    float _683 = float(_681);
    float _685 = -_649;
    float _687 = _685 + 1.0;
    float _689 = _661 * _665;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _695 = -_661;
    float _697 = _695 + 1.0;
    float _699 = _683 * _687;
    float _701 = -_683;
    float _703 = _701 + 1.0;
    float _705 = fma(_693, _623, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _707 = _649 * _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _715 = _713 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _717 = _585 * _703;
    float _719 = fma(_711, _623, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _721 = fma(_715, _623, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _723 = _669 * _717;
    float _725 = _667 * _717;
    float _727 = _671 * _717;
    float _729 = -_585;
    float _731 = _729 + 1.0;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _735 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _733;
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _741;
    float _745 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].x, _725);
    float _747 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].y, _723);
    float _749 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[107].z, _727);
    float _751 = fma(_735, _605, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _753 = fma(_739, _605, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _755 = fma(_719, _699, _745);
    float _757 = fma(_721, _699, _747);
    float _759 = fma(_705, _699, _749);
    float _761 = fma(_743, _605, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _773 = _771 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _775 = fma(_751, _707, _755);
    float _777 = fma(_765, _609, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _779 = fma(_769, _609, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _781 = fma(_773, _609, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _783 = fma(_753, _707, _757);
    float _785 = fma(_761, _707, _759);
    float _787 = fma(_777, _689, _775);
    float _789 = fma(_779, _689, _783);
    float _791 = fma(_781, _689, _785);
    float _793 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].x, _787);
    float _795 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].y, _789);
    float _797 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[111].z, _791);
    bool _799 = !_601;
    float _815;
    if (!_799)
    {
        float _801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _803 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _807 = _805 * _801;
        float _809 = floor(_807);
        float _811 = -_809;
        float _813 = _807 + _811;
        _815 = _813;
        _817 = true;
    }
    else
    {
        float _819 = float(_89);
        float _821 = 1.0 / _819;
        float _823 = _123 * _821;
        _815 = _823;
    }
    _817 = false;
    float _825 = _815;
    float _827 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _829 = _795 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _831 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _833 = isnan(_825);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _847 = _825 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _849 = isnan(_825);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _865 = _825 + _863;
    float _867 = -_841;
    float _869 = _867 + 1.0;
    float _871 = _797 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _873 = 1.0 / _845;
    float _875 = _827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _857 * _869;
    float _879 = -_857;
    float _881 = _879 + 1.0;
    float _883 = _829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = _871 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _887 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _889 = _861 * _873;
    float _891 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _893 = fma(_889, _865, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _895 = _891 * _143;
    float _897 = _893 * _877;
    float _899 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[115].x, _897);
    float _901 = trunc(_895);
    int _903 = int(_901);
    float _905 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[116].x, _899);
    float _907 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _875;
    out.m_58.y = _883;
    out.m_58.z = _885;
    out.m_58.w = _907;
    int _909 = _903 << 4;
    int _911 = _909 + 1968;
    bool _913 = !_887;
    float _935;
    float _937;
    if (!_913)
    {
        float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _917 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _919 = float(_89);
        float _921 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _923 = 1.0 / _919;
        float _925 = _921 * _915;
        float _927 = floor(_925);
        float _929 = _123 * _923;
        float _931 = -_927;
        float _933 = _925 + _931;
        _935 = _929;
        _937 = _933;
        _939 = true;
    }
    else
    {
        float _941 = float(_89);
        float _943 = 1.0 / _941;
        float _945 = _123 * _943;
        _935 = _945;
        _937 = _945;
    }
    _939 = false;
    float _947 = _935;
    float _949 = _937;
    float _951 = in.m_49.y;
    float _953 = _319 * _603;
    bool _955 = _143 > 0.5;
    float _957 = in.m_49.w;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _961 = _959 != 0;
    float _963 = _143 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _965 = in.m_42.x;
    float _967 = in.m_42.y;
    float _969 = in.m_42.z;
    float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _975 = _973 != 0;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _979 = _947 + _977;
    float _981 = -_315;
    int _983 = _955 ? as_type<int>(_981) : as_type<int>(_315);
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _987 = _985 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _991 = _989 != 0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _995 = _949 + _993;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _999 = _997 != 0;
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1005 = _1003 != 0;
    bool _1007 = !_975;
    float _1009 = _1007 ? _315 : as_type<float>(_983);
    float _1011 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1013 = _951 > 0.5;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1019 = 1.0 / _987;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1023 = _1021 != 0;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1027 = _1025 != 0;
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1033 = -_205;
    int _1035 = _1013 ? as_type<int>(_1033) : as_type<int>(_205);
    float _1037 = _967 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1041 = _1039 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1043 = 1.0 / _1017;
    bool _1045 = !_991;
    float _1047 = _1045 ? _205 : as_type<float>(_1035);
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1051 = _957 > 0.5;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1055 = _1053 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1059 = _967 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1061 = -_1049;
    float _1063 = fma(_963, 2.0, _1061);
    float _1065 = 1.0 / _1031;
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1071 = fma(_1011, -2.0, _1057);
    float _1073 = _967 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1075 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1059);
    float _1077 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1079 = _1077 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1081 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1037);
    float _1083 = 1.0 / _1041;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1097 = fma(_965, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1073);
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1103 = _1091 * _1019;
    float _1105 = 1.0 / _1055;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1109 = _1107 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1113 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1111;
    float _1115 = _1101 * _1065;
    float _1117 = _1109 * _1043;
    float _1119 = -_123;
    float _1121 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1063);
    bool _1123 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1125 = isnan(_947);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1131 = _1127 || _1129;
    float _1133 = float(_1131);
    float _1135 = 1.0 / _1069;
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1139 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1137;
    float _1141 = fma(_1117, _979, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1143 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1145 = _947 + _1143;
    float _1147 = fma(_1115, _995, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1149 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1151 = isnan(_949);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1157 = _1153 || _1155;
    float _1159 = float(_1157);
    float _1161 = in.m_49.z;
    float _1163 = 1.0 / _1079;
    float _1165 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1071);
    float _1167 = 0.0;
    if (!_961)
    {
        _1167 = _951;
    }
    float _1169 = _1167;
    float _1171 = -_1159;
    float _1173 = _1171 + 1.0;
    float _1175 = _1169;
    if (_961)
    {
        _1175 = _143;
    }
    float _1177 = _1175;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1179;
    float _1183 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1185 = _1183 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1187 = 1.0 / _1087;
    float _1189 = _1181 * _1083;
    float _1191 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1193 = _1191 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1195 = _1185 * _1105;
    float _1197 = _971 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1199 = _1009 + 0.5;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1203 = _949 + _1201;
    float _1205 = 1.0 / _1095;
    float _1207 = _1113 * _1163;
    float _1209 = fma(_1197, _1199, _1121);
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1213 = _947 + _1211;
    float _1215 = _1193 * _1135;
    float _1217 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1081);
    float _1219 = fma(_1103, _1203, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1221 = _1139 * _1187;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1225 = _947 + _1223;
    bool _1227 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1229 = isnan(_949);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1235 = _1231 || _1233;
    float _1237 = float(_1235);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1241 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1243 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1241;
    float _1245 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1075);
    float _1247 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1249 = _947 + _1247;
    float _1251 = fma(_1189, _1225, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1253 = _1243 * _1205;
    float _1255 = fma(_969, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1097);
    float _1257 = fma(_1207, _1249, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1259 = fma(_1195, _1213, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1261 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1263 = _947 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1267 = _947 + _1265;
    float _1269 = fma(_1253, _1145, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1271 = fma(_1221, _1263, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1273 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1275 = isnan(_947);
    bool _1277 = _1273 || _1275;
    bool _1279 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1281 = _1277 || _1279;
    float _1283 = float(_1281);
    float _1285 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1287 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1289 = isnan(_947);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1295 = _1291 || _1293;
    float _1297 = float(_1295);
    float _1299 = fma(_1215, _1267, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1303 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1285);
    bool _1305 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1307 = isnan(_947);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = -_1297;
    float _1319 = _1317 + 1.0;
    bool _1321 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1323 = isnan(_947);
    bool _1325 = _1321 || _1323;
    bool _1327 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1329 = _1325 || _1327;
    float _1331 = float(_1329);
    float _1333 = -_1283;
    float _1335 = _1333 + 1.0;
    bool _1337 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1339 = isnan(_947);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    float _1349 = _1315 * _1319;
    float _1351 = -_1315;
    float _1353 = _1351 + 1.0;
    float _1355 = -_1331;
    float _1357 = _1355 + 1.0;
    float _1359 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1301);
    bool _1361 = _949 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1363 = isnan(_949);
    bool _1365 = _1361 || _1363;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1369 = _1365 || _1367;
    float _1371 = float(_1369);
    float _1373 = _1283 * _1353;
    bool _1375 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1377 = isnan(_947);
    bool _1379 = _1375 || _1377;
    bool _1381 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1383 = _1379 || _1381;
    float _1385 = float(_1383);
    float _1387 = _1331 * _1335;
    bool _1389 = _947 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1391 = isnan(_947);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = _1347 * _1357;
    float _1403 = -_1347;
    float _1405 = _1403 + 1.0;
    float _1407 = -_1371;
    float _1409 = _1407 + 1.0;
    float _1411 = -_1237;
    float _1413 = _1411 + 1.0;
    float _1415 = -_1399;
    float _1417 = _1415 + 1.0;
    float _1419 = -_1385;
    float _1421 = _1419 + 1.0;
    float _1423 = _1237 * _1409;
    float _1425 = _1399 * _1405;
    float _1427 = _1133 * _1417;
    float _1429 = -_1133;
    float _1431 = _1429 + 1.0;
    float _1433 = _1399;
    float _1435 = _1209;
    if (_961)
    {
        _1433 = _143;
    }
    float _1437 = _1433;
    float _1439 = _1001 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1441 = _1047 + (-0.5);
    float _1443 = _1385 * _1431;
    float _1445 = _1437;
    float _1447 = _1441;
    if (!_961)
    {
        _1445 = _1161;
    }
    float _1449 = _1445;
    float _1451 = _1159 * _1413;
    float _1453 = -_1439;
    float _1455 = -_1165;
    float _1457 = fma(_1453, _1441, _1455);
    float _1459 = _1257 * _1443;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1463 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1465 = _1219 * _1451;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1469 = -_1461;
    float _1471 = fma(_1463, 2.0, _1469);
    float _1473 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1465);
    float _1475 = _1463;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (!_961)
    {
        _1475 = _1161;
    }
    float _1479 = _1475;
    float _1481 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1467);
    float _1483 = _1177 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1485 = _1479;
    if (_961)
    {
        _1485 = _951;
    }
    float _1487 = _1485;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1491 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1459);
    float _1493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1495 = fma(_1487, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1489);
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1499 = _911 + 8;
    uint _1502 = uint(int(uint(_1499) >> uint(2)));
    uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
    int _1506 = int(_1502) & 3;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[int(_1504)][_1506];
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1512 = -_315;
    int _1514 = _1013 ? as_type<int>(_1512) : as_type<int>(_315);
    float _1516 = fma(_1141, _1427, _1491);
    if (!_961)
    {
        _1447 = _1161;
    }
    float _1518 = _1447;
    float _1520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1522 = _1161 > 0.5;
    float _1524 = -_1510;
    float _1526 = fma(_1483, 2.0, _1524);
    float _1528 = _1518;
    if (_961)
    {
        _1528 = _951;
    }
    float _1530 = _1528;
    float _1532 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1239);
    if (_961)
    {
        _1477 = _951;
    }
    float _1534 = _1477;
    float _1536 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1497);
    float _1538 = _1534;
    if (!_961)
    {
        _1538 = _143;
    }
    float _1540 = _1538;
    uint _1542 = uint(int(uint(_911) >> uint(2)));
    uint _1544 = uint(int(uint(int(_1542)) >> uint(2)));
    int _1546 = int(_1542) & 3;
    float _1548 = (*spvDescriptorSet0.vp_c9)._m0[int(_1544)][_1546];
    int _1550 = int(_1542) + 1;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    int _1554 = _1550 & 3;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[int(_1552)][_1554];
    float _1558 = fma(_1147, _1423, _1473);
    bool _1560 = !_1023;
    float _1562 = _1560 ? _315 : as_type<float>(_1514);
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1566 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1568 = -_315;
    int _1570 = _1522 ? as_type<int>(_1568) : as_type<int>(_315);
    float _1572 = -_123;
    float _1574 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1471);
    float _1576 = _1562 + 0.5;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1580 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1582 = !_999;
    float _1584 = _1582 ? _315 : as_type<float>(_1570);
    float _1586 = fma(_1566, _1576, _1574);
    float _1588 = -_205;
    int _1590 = _1051 ? as_type<int>(_1588) : as_type<int>(_205);
    float _1592 = fma(_1580, -2.0, _1578);
    float _1594 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1596 = _1584 + 0.5;
    float _1598 = -_123;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1526);
    float _1602 = fma(_1251, _1425, _1516);
    bool _1604 = !_1005;
    float _1606 = _1604 ? _205 : as_type<float>(_1590);
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1610 = fma(_1594, _1596, _1600);
    float _1612 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1614 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1592);
    float _1616 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1618 = _1606 + (-0.5);
    float _1620 = fma(_1612, -2.0, _1608);
    float _1622 = fma(_1259, _1401, _1602);
    float _1624 = _1245 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1626 = -_1616;
    float _1628 = -_1614;
    float _1630 = fma(_1626, _1618, _1628);
    float _1632 = fma(_1371, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1558);
    float _1634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1636 = -_205;
    int _1638 = _1522 ? as_type<int>(_1636) : as_type<int>(_205);
    float _1640 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1624 + _1642;
    float _1646 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1536);
    float _1648 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1495);
    float _1650 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1652 = !_1027;
    float _1654 = _1652 ? _205 : as_type<float>(_1638);
    float _1656 = _1217 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1660 = _1640 + _1658;
    float _1662 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1664 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1532);
    float _1666 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1303);
    float _1668 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1359);
    float _1670 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1481);
    float _1672 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1620);
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1676 = _1656 + _1674;
    float _1678 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1662);
    float _1680 = fma(_1271, _1387, _1622);
    float _1682 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1684 = _1654 + (-0.5);
    float _1686 = _1644 * _1644;
    float _1688 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1678);
    float _1690 = fma(_1299, _1373, _1680);
    float _1692 = -_1682;
    float _1694 = -_1672;
    float _1696 = fma(_1692, _1684, _1694);
    float _1698 = fma(_1660, _1660, _1686);
    float _1700 = _1548 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1702 = _1556 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1704 = fma(_1269, _1349, _1690);
    bool _1706 = _1688 >= 0.0;
    float _1708 = fma(_1676, _1676, _1698);
    float _1710 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1716 = _1632 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1718 = -_1646;
    float _1720 = _1718 + 1.0;
    float _1722 = rsqrt(_1708);
    float _1724 = -_1668;
    float _1726 = _1724 + 1.0;
    float _1728 = _953 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_60.x = _1710;
    out.m_60.y = _1712;
    out.m_60.z = _1714;
    out.m_60.w = _1716;
    float _1730 = -_1720;
    float _1732 = fma(_1562, _1730, _1586);
    float _1734 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1736 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1704);
    if (_1706)
    {
        out.m_45.x = 0.0;
    }
    out.m_62.x = _1736;
    float _1738 = _1734 * _1722;
    float _1740 = -_1664;
    float _1742 = _1740 + 1.0;
    float _1744 = -_1648;
    float _1746 = _1744 + 1.0;
    float _1748 = -_1666;
    float _1750 = _1748 + 1.0;
    float _1752 = -_1670;
    float _1754 = _1752 + 1.0;
    float _1756 = -_1742;
    float _1758 = fma(_1009, _1756, _1209);
    if (_1706)
    {
        _1435 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1760 = _1435;
    float _1762 = fma(_1606, _1746, _1630);
    float _1764 = fma(_1047, _1750, _1457);
    float _1766 = -_1754;
    float _1768 = fma(_1584, _1766, _1610);
    float _1770 = fma(_1654, _1726, _1696);
    int _1772 = as_type<int>(_1760);
    float _1774 = _1768;
    if (_1706)
    {
        float _1776 = _1760 * 5.0;
        _1772 = as_type<int>(_1776);
    }
    int _1778 = _1772;
    float _1780 = _1660 * _1738;
    float _1782 = _1644 * _1738;
    out.m_64.x = _1758;
    out.m_64.y = _1764;
    out.m_64.z = _1768;
    out.m_64.w = _1762;
    float _1784 = _1780;
    if (_1706)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5554 = as_type<float>(_1778);
        out.gl_Position.z = _5554;
    }
    out.m_66.x = _1732;
    out.m_66.y = _1770;
    if (_1706)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1786 = -_1782;
    float _1788 = _1624 + _1786;
    float _1790 = _1676 * _1738;
    float _1792 = -_1780;
    float _1794 = _1640 + _1792;
    float _1796 = -_1782;
    float _1798 = _1644 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1788 + _1800;
    float _1804 = -_1790;
    float _1806 = _1656 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1810 = _1794 + _1808;
    float _1812 = -_1780;
    float _1814 = _1660 + _1812;
    float _1816 = _1802 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1818 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1820 = _1806 + _1818;
    float _1822 = _1798 * _1798;
    float _1824 = -_1790;
    float _1826 = _1676 + _1824;
    float _1828 = fma(_1810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1816);
    float _1830 = _323 * _593;
    float _1832 = fma(_1814, _1814, _1822);
    float _1834 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1828);
    float _1836 = fma(_1826, _1826, _1832);
    bool _1838 = _1834 >= 0.0;
    float _1840 = sqrt(_1836);
    float _1842 = _1794;
    if (_1838)
    {
        _1774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1844 = _1774;
    int _1846 = as_type<int>(_1844);
    if (_1838)
    {
        out.m_45.x = 0.0;
    }
    if (_1838)
    {
        float _1848 = _1844 * 5.0;
        _1846 = as_type<int>(_1848);
    }
    int _1850 = _1846;
    float _1852 = _1722 * _1840;
    if (_1838)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5676 = as_type<float>(_1850);
        out.gl_Position.z = _5676;
    }
    if (_1838)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1854 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1856 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1858 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _315);
    float _1860 = _1728 * _1852;
    float _1862 = _1852 * _1854;
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1866 = _1864 * 0.5;
    float _1868 = _1858 * _1860;
    float _1870 = _1856 * _1862;
    float _1872 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1874 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1876 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1872);
    float _1878 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1874);
    float _1880 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1876);
    float _1882 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1878);
    float _1884 = _1880 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1886 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1888 = _1656 + _1884;
    float _1890 = _1640 + _1886;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1894 = _1888 + _1892;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1898 = _1890 + _1896;
    float _1900 = _1894 * _1894;
    float _1902 = fma(_1898, _1898, _1900);
    float _1904 = _1870 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1906 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1908 = sqrt(_1902);
    float _1910 = fma(_1868, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1904);
    float _1912 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1906);
    float _1914 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1910);
    float _1916 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1912);
    float _1918 = _1914 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1920 = _1624 + _1918;
    bool _1922 = _1908 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1924 = _1904;
    float _1926 = _1918;
    float _1928 = _1912;
    if (!_1922)
    {
        _1924 = _1890;
    }
    float _1930 = _1924;
    float _1932 = _1930;
    if (!_1922)
    {
        _1926 = _1888;
    }
    float _1934 = _1926;
    float _1936 = _1934;
    if (!_1922)
    {
        _1928 = _1920;
    }
    float _1938 = _1928;
    bool _1940 = !_1922;
    float _1942 = _1938;
    if (!_1940)
    {
        float _1944 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1948 = _1908 + _1946;
        float _1950 = _1920 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1952 = rsqrt(_1902);
        float _1954 = _1948 * _1944;
        float _1956 = _1954 * 0.15915493667125701904296875;
        float _1958 = _1956 * 6.283185482025146484375;
        float _1960 = cos(_1958);
        float _1962 = _1956 * 6.283185482025146484375;
        float _1964 = sin(_1962);
        float _1966 = _1960 + (-1.0);
        float _1968 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = fma(_1964, _1950, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1972 = fma(_1920, _1960, _1968);
        float _1974 = _1952 * _1970;
        float _1976 = fma(_1898, _1974, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1978 = fma(_1894, _1974, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1942 = _1972;
        _1932 = _1976;
        _1936 = _1978;
    }
    float _1980 = _1942;
    float _1982 = _1932;
    float _1984 = _1936;
    float _1986 = -_1624;
    float _1988 = _1986 + _1980;
    float _1990 = _1916 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1992 = -_1640;
    float _1994 = _1992 + _1982;
    float _1996 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1998 = _1988 * _1988;
    float _2000 = -_1656;
    float _2002 = _2000 + _1984;
    float _2004 = 1.0 / _1990;
    float _2006 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1996);
    float _2008 = fma(_1994, _1994, _1998);
    bool _2010 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2012 = isnan(0.5);
    bool _2014 = _2010 || _2012;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    float _2020 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2006);
    float _2022 = fma(_2002, _2002, _2008);
    float _2024 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2026 = sqrt(_2022);
    bool _2028 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2030 = isnan(0.5);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    float _2038 = _2024 + _1990;
    float _2040 = _2038 * _2004;
    float _2042 = _2040 * 0.5;
    float _2044 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2046 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2044);
    bool _2048 = _2026 > 0.0;
    float _2050 = 1.0 / _2046;
    float _2052 = _2004;
    float _2054 = _1990;
    float _2056 = _1982;
    float _2058 = _1980;
    if (!_2048)
    {
        _2052 = _1980;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    float _2064 = _2060;
    if (!_2048)
    {
        _2054 = _1984;
    }
    float _2066 = _2054;
    bool _2068 = !_2048;
    float _2070 = _2066;
    if (!_2068)
    {
        float _2072 = _309 * _309;
        float _2074 = fma(_299, _299, _2072);
        float _2076 = rsqrt(_2022);
        float _2078 = fma(_311, _311, _2074);
        float _2080 = sqrt(_2078);
        float _2082 = _1994 * _2076;
        float _2084 = _1988 * _2076;
        float _2086 = _2002 * _2076;
        bool _2088 = _2080 > 0.0;
        float _2090 = _2080;
        if (!_2088)
        {
            _2062 = _1980;
        }
        float _2092 = _2062;
        _2064 = _2092;
        if (!_2088)
        {
            _2090 = _1984;
        }
        float _2094 = _2090;
        bool _2096 = !_2088;
        _2070 = _2094;
        if (!_2096)
        {
            float _2098 = rsqrt(_2078);
            float _2100 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2102 = _309 * _2098;
            float _2104 = _299 * _2098;
            float _2106 = _2084 * _2102;
            float _2108 = _311 * _2098;
            float _2110 = fma(_2082, _2104, _2106);
            float _2112 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2114 = fma(_2086, _2108, _2110);
            float _2116 = _2114 * _2112;
            float _2118 = fma(_299, _2116, _1982);
            float _2120 = fma(_309, _2116, _1980);
            float _2122 = fma(_311, _2116, _1984);
            _2056 = _2118;
            _2064 = _2120;
            _2070 = _2122;
        }
    }
    float _2124 = _2056;
    float _2126 = _2064;
    float _2128 = _2070;
    float _2130 = -_1780;
    float _2132 = _2130 + _2124;
    float _2134 = -_1782;
    float _2136 = _2134 + _2126;
    float _2138 = -_1790;
    float _2140 = _2138 + _2128;
    float _2142 = _2136;
    float _2144 = _2132;
    float _2146 = _2140;
    float _2148 = _2124;
    if (_2036)
    {
        _2058 = 1.0;
    }
    float _2150 = _2058;
    float _2152 = _2150;
    if (!_2018)
    {
        float _2154 = _1802 * _1802;
        float _2156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2158 = -_1656;
        float _2160 = _2158 + _2128;
        float _2162 = -_1624;
        float _2164 = _2162 + _2126;
        float _2166 = fma(_1810, _1810, _2154);
        float _2168 = fma(_1820, _1820, _2166);
        float _2170 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2172 = sqrt(_2168);
        float _2174 = 1.0 / _1852;
        float _2176 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2178 = precise::min(_2172, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2180 = _2178 * _2156;
        float _2182 = -_1640;
        float _2184 = _2182 + _2124;
        float _2186 = _2180 * _2174;
        float _2188 = _2176 * _2186;
        float _2190 = _2160 * _2186;
        float _2192 = fma(_2184, _2188, _1794);
        float _2194 = fma(_2164, _2188, _1788);
        float _2196 = fma(_2176, _2190, _1806);
        _2142 = _2194;
        _2144 = _2192;
        _2146 = _2196;
        _2148 = _2188;
    }
    float _2198 = _2142;
    float _2200 = _2144;
    float _2202 = _2146;
    float _2204 = _2148;
    float _2206 = _2204;
    if (_2036)
    {
        _2206 = 1.0;
    }
    float _2208 = _2206;
    float _2210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2212 = _2050 * _2210;
    float _2214 = _2208;
    float _2216 = _2212;
    if (!_2036)
    {
        float _2218 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2224 = _2220 * 6.283185482025146484375;
        float _2226 = cos(_2224);
        float _2228 = _2222 * 0.15915493667125701904296875;
        float _2230 = _2220 * 6.283185482025146484375;
        float _2232 = sin(_2230);
        float _2234 = 1.0 / _2226;
        float _2236 = _2228 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        float _2240 = _2232 * _2234;
        float _2242 = _2228 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2246;
        float _2250 = _2238 * _2240;
        float _2252 = 1.0 / _2248;
        float _2254 = 1.0 / _2250;
        float _2256 = _2244 * _2254;
        float _2258 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2260 = fma(_2212, _2256, _2258);
        float _2262 = _2260 * _2252;
        float _2264 = precise::clamp(_2262, 0.0, 1.0);
        _1842 = _2252;
        _2152 = _2264;
    }
    float _2266 = _1842;
    float _2268 = _2152;
    float _2270 = _2266;
    if (!_2036)
    {
        float _2272 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2274 = _2272 * 0.15915493667125701904296875;
        float _2276 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2278 = _2274 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = _2276 * 0.15915493667125701904296875;
        float _2284 = _2274 * 6.283185482025146484375;
        float _2286 = sin(_2284);
        float _2288 = 1.0 / _2280;
        float _2290 = _2282 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = _2286 * _2288;
        float _2296 = _2282 * 6.283185482025146484375;
        float _2298 = sin(_2296);
        float _2300 = _2292 * _2294;
        float _2302 = 1.0 / _2300;
        float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2306 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2304;
        float _2308 = 1.0 / _2306;
        float _2310 = _2298 * _2302;
        float _2312 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2314 = fma(_2212, _2310, _2312);
        float _2316 = _2314 * _2308;
        float _2318 = precise::clamp(_2316, 0.0, 1.0);
        float _2320 = -_2318;
        float _2322 = _2320 + 1.0;
        _2270 = _2300;
        _2214 = _2322;
    }
    float _2324 = _2270;
    float _2326 = _2214;
    float _2328 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2330 = _2198 + _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2334 = _2200 + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2338 = _2202 + _2336;
    float _2340 = _2330 * _2330;
    float _2342 = fma(_2334, _2334, _2340);
    float _2344 = fma(_2338, _2338, _2342);
    float _2346 = rsqrt(_2344);
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2350 = _2334 * _2348;
    float _2352 = _2338 * _2348;
    float _2354 = _2350 * _2350;
    float _2356 = _2352 * _2352;
    float _2358 = _2354 + _2356;
    float _2360 = sqrt(_2358);
    bool _2362 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2360 + _2364;
    float _2368 = _2338;
    float _2370 = _2324;
    float _2372 = _2366;
    float _2374 = _2330;
    float _2376 = _2350;
    if (_2362)
    {
        float _2378 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2368 = _2378;
    }
    float _2380 = _2368;
    if (_2362)
    {
        float _2382 = rsqrt(_2358);
        _2370 = _2382;
    }
    float _2384 = _2370;
    float _2386 = _2384;
    if (_2362)
    {
        float _2388 = _2366 * _2380;
        _2372 = _2388;
    }
    float _2390 = _2372;
    if (_2362)
    {
        float _2392 = _2390 * 0.15915493667125701904296875;
        _2216 = _2392;
    }
    float _2394 = _2216;
    float _2396 = _2340;
    if (_2362)
    {
        float _2398 = _2394 * 6.283185482025146484375;
        float _2400 = sin(_2398);
        _2396 = _2400;
    }
    float _2402 = _2396;
    float _2404 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2406 = precise::max(0.0, _2404);
    float _2408 = _2346;
    float _2410 = _2404;
    float _2412 = _2406;
    if (_2362)
    {
        float _2414 = _2394 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        _2408 = _2416;
    }
    float _2418 = _2408;
    float _2420 = -_2348;
    float _2422 = -_2406;
    float _2424 = fma(_2330, _2420, _2422);
    if (_2362)
    {
        float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2410 = _2426;
    }
    float _2428 = _2410;
    float _2430 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2432 = _2428;
    if (_2362)
    {
        float _2434 = fma(_2402, _2428, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2374 = _2434;
    }
    float _2436 = _2374;
    float _2438 = sqrt(_2344);
    float _2440 = _2436;
    if (_2362)
    {
        float _2442 = _2418 + (-1.0);
        _2432 = _2442;
    }
    float _2444 = _2432;
    float _2446 = _2444;
    if (_2362)
    {
        float _2448 = _2384 * _2436;
        _1784 = _2448;
    }
    float _2450 = _1784;
    if (!_2362)
    {
        _2386 = _2424;
    }
    float _2452 = _2386;
    float _2454 = _2452;
    if (_2362)
    {
        float _2456 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2412 = _2456;
    }
    float _2458 = _2412;
    float _2460 = _2458;
    if (_2362)
    {
        float _2462 = _2350 * _2450;
        _2376 = _2462;
    }
    float _2464 = _2376;
    if (!_2362)
    {
        _2440 = _2352;
    }
    float _2466 = _2440;
    float _2468 = _2466;
    if (_2362)
    {
        float _2470 = _2352 * _2450;
        _2468 = _2470;
    }
    float _2472 = _2468;
    if (!_2362)
    {
        _2446 = _2354;
    }
    float _2474 = _2446;
    float _2476 = _2474;
    if (_2362)
    {
        float _2478 = fma(_2424, _2418, _2458);
        _2454 = _2478;
    }
    float _2480 = _2454;
    if (_2362)
    {
        float _2482 = _2464 * _2464;
        _2476 = _2482;
    }
    float _2484 = _2476;
    if (!_2362)
    {
        _2460 = _2356;
    }
    float _2486 = _2460;
    float _2488 = _2486;
    if (_2362)
    {
        float _2490 = _2472 * _2472;
        _2488 = _2490;
    }
    float _2492 = _2488;
    float _2494 = fma(_2480, _2480, _2484);
    float _2496 = _2494 + _2492;
    float _2498 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2502 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2500);
    float _2504 = precise::clamp(_2502, 0.0, 1.0);
    float _2506 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2508 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2498);
    float _2510 = rsqrt(_2496);
    float _2512 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2514 = -_2504;
    float _2516 = _2514 + 1.0;
    float _2518 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2508);
    float _2520 = _2198 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2522 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2512);
    float _2524 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2526 = abs(_2516);
    float _2528 = log2(_2526);
    float _2530 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2520);
    float _2532 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2522);
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2536 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2430);
    float _2538 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2530);
    float _2540 = _2532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2542 = -_2534;
    float _2544 = fma(_2542, _2506, 1.0);
    float _2546 = _2510 * _2464;
    float _2548 = _2538 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2550 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2552 = _2510 * _2480;
    float _2554 = _2546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2556 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2536);
    float _2558 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2550);
    float _2560 = _2510 * _2472;
    float _2562 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2564 = -_2554;
    float _2566 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2564);
    float _2568 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2570 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2558);
    float _2572 = log2(_2544);
    float _2574 = -_2560;
    float _2576 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2566);
    float _2578 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2570);
    float _2582 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2584 = fma(_2576, -0.5, 0.5);
    float _2586 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2578);
    float _2588 = fma(_2576, 0.5, 0.5);
    float _2590 = exp2(_2562);
    float _2592 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2582);
    float _2594 = _2552 + 1.0;
    float _2596 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2586);
    float _2598 = fma(_2588, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2600 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2592);
    float _2602 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2596);
    float _2604 = 1.0 / _2580;
    float _2606 = fma(_2588, _2598, -0.212114393711090087890625);
    float _2608 = _2572 * 0.693147182464599609375;
    float _2610 = fma(_2588, _2606, 1.570728778839111328125);
    float _2612 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2614 = sqrt(_2584);
    float _2616 = -_2552;
    float _2618 = fma(_2590, _2594, _2616);
    float _2620 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2600);
    float _2622 = fma(_2618, 0.5, 0.5);
    float _2624 = _2602 * _2604;
    float _2626 = _2620 * _2604;
    float _2628 = fma(_2624, 0.5, 0.5);
    float _2630 = fma(_2626, -0.5, 0.5);
    float _2632 = _2614 * 0.636619746685028076171875;
    float3 _6905 = float3(_2628, _2630, _2612);
    float _2634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6905, float3(0.0), isnan(_6905)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6905, float3(0.0), isnan(_6905)), level(0.0)).x;
    float3 _6916 = float3(_2628, _2630, _2612);
    float4 _2637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6916, float3(0.0), isnan(_6916)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6916, float3(0.0), isnan(_6916)), level(0.0)).xyzw;
    float _2639 = _2637.x;
    float _2641 = _2637.y;
    float _2643 = _2637.z;
    float _2645 = _2637.w;
    float _2647 = -_2610;
    float _2649 = fma(_2632, _2647, 1.0);
    float2 _6938 = float2(_2649, _2622);
    float3 _2653 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6938, float2(0.0), isnan(_6938)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6938, float2(0.0), isnan(_6938)), level(0.0)).xyz;
    float _2655 = _2653.x;
    float _2657 = _2653.y;
    float _2659 = _2653.z;
    float _2661 = _2528 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2663 = _2540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2665 = _2580 * 0.5;
    bool _2667 = _2268 > 0.0;
    bool _2669 = isnan(_2268);
    bool _2671 = _2667 || _2669;
    bool _2673 = isnan(0.0);
    bool _2675 = _2671 || _2673;
    float _2677 = _2268 * _2326;
    float _2679 = fma(_2548, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2663);
    float _2681 = exp2(_2661);
    bool _2683 = _2326 <= 0.0;
    bool _2685 = !_2675;
    bool _2687 = _2683 || _2685;
    float _2689 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2679);
    float _2691 = _2677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2693 = _2602 + _2580;
    float _2695 = fma(_2568, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2689);
    float _2697 = fma(_2620, -0.5, _2665);
    float _2699 = _2691 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2701 = _2693 * 0.5;
    float _2703 = _2695 + _2580;
    out.gl_Position.x = _2602;
    out.gl_Position.y = _2620;
    out.gl_Position.z = _2695;
    out.gl_Position.w = _2580;
    float _2705 = _2703 * 0.5;
    float _2707 = -_2681;
    float _2709 = _2707 + 1.0;
    out.m_45.x = _2699;
    float _2711 = _2709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _2701;
    out.m_68.y = _2697;
    out.m_68.z = _2705;
    out.m_68.w = _2580;
    float _2713 = _2711 * _2634;
    float _2715 = -_2711;
    float _2717 = _2715 + 1.0;
    float _2719 = _2645 * _2713;
    float _2721 = _2645 * _2717;
    float _2723 = _2659 * _2713;
    float _2725 = fma(_2655, _2719, _2639);
    float _2727 = fma(_2657, _2719, _2641);
    float _2729 = fma(_2645, _2723, _2643);
    out.m_70.x = _2725;
    out.m_70.y = _2727;
    out.m_70.z = _2729;
    out.m_70.w = _2721;
    if (!_2687)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2731 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2731;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

