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
    bool _697 = false;
    bool _455 = false;
    bool _263 = false;
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
        float _1779 = as_type<float>(_99);
        out.gl_Position.z = _1779;
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
        float _1847 = as_type<float>(_135);
        out.gl_Position.z = _1847;
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
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    bool _187 = !_181;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_185);
    float _193 = -_159;
    float _195 = _147 + _193;
    int _197 = abs(_189);
    float _199 = -_195;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    float _207 = float(_191);
    float _209 = fma(_177, 0.5, 0.5);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = abs(_201);
    float _215 = _207 * _213;
    int _217 = abs(_205);
    float _219 = -_209;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_197);
    bool _225 = _195 < 0.5;
    float _227 = float(_225);
    float _229 = fma(_223, _221, _215);
    bool _231 = !_151;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = -_227;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_217);
    float _241 = abs(_237);
    float _243 = fma(_239, _241, _229);
    bool _245 = !_211;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _271 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    bool _297 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_271);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _287;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _291;
    float _317 = _275 * _309;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -_307;
    float _333 = _331 + 1.0;
    float _335 = _329 * _333;
    float _337 = _279 * _313;
    bool _339 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _341 = isnan(_271);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_329;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _353;
    float _361 = -_349;
    float _363 = _361 + 1.0;
    float _365 = _283 * _315;
    bool _367 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _369 = isnan(_271);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = fma(_357, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _393 = fma(_381, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = _377 * _363;
    float _397 = fma(_387, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_377;
    float _403 = _401 + 1.0;
    float _405 = _393 * _395;
    float _407 = _397 * _395;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _415;
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _421 = fma(_411, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_383, _359, _413);
    float _425 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _427 = fma(_399, _359, _419);
    float _429 = fma(_421, _335, _423);
    float _431 = fma(_425, _335, _427);
    float _433 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_311;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _441 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_83);
        float _459 = 1.0 / _457;
        float _461 = _117 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _467 = _463 + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _471 = _463 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _487 = _463 + _485;
    float _489 = 1.0 / _475;
    bool _491 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _493 = isnan(_463);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_463);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _479;
    bool _517 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _519 = 1.0 / _483;
    float _521 = _467 * _489;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = fma(_525, _521, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_529, _521, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _535 = _471 * _515;
    bool _537 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _539 = isnan(_463);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_551, _521, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _555 = -_547;
    float _557 = _555 + 1.0;
    float _559 = _487 * _519;
    float _561 = -_501;
    float _563 = _561 + 1.0;
    bool _565 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _567 = isnan(_463);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _581 = _547 * _563;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _587 = _513 * _557;
    float _589 = -_513;
    float _591 = _589 + 1.0;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _597 = fma(_579, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _599 = fma(_585, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _601 = _575 * _591;
    float _603 = fma(_595, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _605 = -_575;
    float _607 = _605 + 1.0;
    float _609 = _531 * _601;
    float _611 = _533 * _601;
    float _613 = _553 * _601;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _615;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].x, _609);
    float _621 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].y, _611);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _627;
    float _631 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].z, _613);
    float _633 = fma(_617, _559, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _635 = fma(_603, _587, _621);
    float _637 = fma(_625, _559, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _639 = fma(_629, _559, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _641 = fma(_597, _587, _619);
    float _643 = fma(_599, _587, _631);
    float _645 = fma(_633, _581, _635);
    float _647 = fma(_637, _581, _641);
    float _649 = fma(_639, _581, _643);
    float _651 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].y, _645);
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].x, _647);
    float _659 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].z, _649);
    float _661 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _667 = _659 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _669 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _671;
    out.m_56.y = _669;
    out.m_56.z = _673;
    out.m_56.w = _663;
    float _675 = _435 * _655;
    float _677 = _433 * _653;
    bool _679 = !_517;
    float _695;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _683 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _687 = _685 * _681;
        float _689 = floor(_687);
        float _691 = -_689;
        float _693 = _687 + _691;
        _695 = _693;
        _697 = true;
    }
    else
    {
        float _699 = float(_83);
        float _701 = 1.0 / _699;
        float _703 = _117 * _701;
        _695 = _703;
    }
    _697 = false;
    float _705 = _695;
    float _707 = in.m_49.y;
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _711 = in.m_42.x;
    float _713 = in.m_42.y;
    float _715 = in.m_42.z;
    bool _717 = _137 > 0.5;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _729 = _727 != 0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _733 = _705 + _731;
    float _735 = 1.0 / _721;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _739 = _737 != 0;
    float _741 = 1.0 / _725;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _745 = _705 + _743;
    bool _747 = _707 > 0.5;
    float _749 = _733 * _735;
    bool _751 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _753 = isnan(_705);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _713 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _765 = _713 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _767 = _713 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _769;
    float _773 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[5].x, _763);
    float _775 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[4].x, _765);
    float _777 = _745 * _741;
    float _779 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[6].x, _767);
    float _781 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[5].z, _773);
    bool _783 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _785 = isnan(_705);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[4].z, _775);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _801;
    float _805 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[6].z, _779);
    float _807 = -_761;
    float _809 = _807 + 1.0;
    bool _811 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _813 = isnan(_705);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_793;
    float _825 = _823 + 1.0;
    float _827 = fma(_799, _749, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _829 = fma(_771, _749, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _831 = fma(_803, _749, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _833 = _793 * _809;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _843 = _821 * _825;
    float _845 = -_821;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _853 = fma(_841, _777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _855 = _827 * _843;
    float _857 = _829 * _843;
    float _859 = _831 * _843;
    float _861 = _781 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _863 = fma(_837, _777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].x, _855);
    float _867 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].z, _859);
    float _869 = _795 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _873 = _861 + _871;
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].y, _857);
    float _877 = fma(_863, _833, _865);
    float _879 = _805 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _869 + _881;
    float _885 = _873 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = fma(_851, _777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _891 = _879 + _889;
    float _893 = -_233;
    int _895 = _717 ? as_type<int>(_893) : as_type<int>(_233);
    float _897 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[28].x, _885);
    float _899 = -_163;
    int _901 = _747 ? as_type<int>(_899) : as_type<int>(_163);
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _905 = !_729;
    float _907 = _905 ? _233 : as_type<float>(_895);
    float _909 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[28].z, _897);
    float _911 = _873 * _873;
    bool _913 = !_739;
    float _915 = _913 ? _163 : as_type<float>(_901);
    float _917 = fma(_853, _833, _875);
    float _919 = fma(_887, _833, _867);
    bool _921 = _909 >= 0.0;
    float _923 = fma(_883, _883, _911);
    float _925 = _907 + 0.5;
    float _927 = -_915;
    float _929 = _927 + 0.5;
    float _931 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].x, _877);
    float _933 = fma(_891, _891, _923);
    float _935 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].y, _917);
    float _937 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].z, _919);
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _941 = rsqrt(_933);
    float _943 = _929 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _945 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _947 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = _923;
    float _951 = _879;
    if (_921)
    {
        _949 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _953 = _949;
    float _955 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = _939 * _709;
    float _959 = _943 * _903;
    float _961 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _967 = as_type<int>(_953);
    if (_921)
    {
        float _969 = _953 * 5.0;
        _967 = as_type<int>(_969);
    }
    int _971 = _967;
    out.m_58.x = _957;
    out.m_58.y = _959;
    float _973 = _873 * _941;
    out.m_60.x = _961;
    out.m_60.y = _963;
    out.m_60.z = _965;
    float _975 = _883 * _941;
    float _977 = as_type<float>(_971);
    if (_921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3242 = as_type<float>(_971);
        out.gl_Position.z = _3242;
    }
    if (_921)
    {
        out.m_45.x = 0.0;
    }
    if (_921)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _979 = -_973;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _983 = _891 * _941;
    float _985 = -_975;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _869);
    float _989 = -_973;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = _981 + _993;
    float _997 = -_983;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _879);
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1003 = _987 + _1001;
    float _1005 = -_975;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _883);
    float _1009 = _995 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1013 = _999 + _1011;
    float _1015 = -_983;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _1019 = _243 * _677;
    float _1021 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1009);
    float _1023 = _991 * _991;
    float _1025 = _243 * _675;
    float _1027 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1021);
    float _1029 = fma(_1007, _1007, _1023);
    bool _1031 = _1027 >= 0.0;
    float _1033 = fma(_1017, _1017, _1029);
    float _1035 = sqrt(_1033);
    float _1037 = _999;
    if (_1031)
    {
        _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1039 = _977;
    int _1041 = as_type<int>(_1039);
    if (_1031)
    {
        out.m_45.x = 0.0;
    }
    if (_1031)
    {
        float _1043 = _1039 * 5.0;
        _1041 = as_type<int>(_1043);
    }
    int _1045 = _1041;
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_1045);
        out.gl_Position.z = _3377;
    }
    float _1047 = _941 * _1035;
    if (_1031)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1049 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1051 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _1057 = _1047 * _1049;
    float _1059 = _1047 * _1051;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = _1053 * _1057;
    float _1067 = _1055 * _1059;
    bool _1069 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1071 = isnan(0.5);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1077 = _1073 || _1075;
    float _1079 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1083 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1087 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1081);
    float _1089 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1083);
    float _1091 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1085);
    float _1093 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1087);
    float _1095 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1089);
    float _1097 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1101 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1103 = _879 + _1097;
    float _1105 = _869 + _1099;
    float _1107 = _861 + _1101;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1111 = _1103 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1115 = _1105 + _1113;
    float _1117 = _1111 * _1111;
    float _1119 = fma(_1115, _1115, _1117);
    float _1121 = sqrt(_1119);
    bool _1123 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = _1091;
    float _1127 = _1105;
    float _1129 = _1103;
    if (!_1123)
    {
        _1125 = _1107;
    }
    float _1131 = _1125;
    bool _1133 = !_1123;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1121 + _1139;
        float _1143 = rsqrt(_1119);
        float _1145 = _1141 * _1137;
        float _1147 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1145 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = _1153 + (-1.0);
        float _1161 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = fma(_1157, _1147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1165 = fma(_1107, _1153, _1161);
        float _1167 = _1143 * _1163;
        float _1169 = fma(_1115, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1171 = fma(_1111, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1169;
        _1135 = _1165;
        _1129 = _1171;
    }
    float _1173 = _1127;
    float _1175 = _1135;
    float _1177 = _1129;
    float _1179 = -_975;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1173);
    float _1183 = -_973;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _1187 = -_983;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1177);
    float _1191 = _1185;
    float _1193 = _1181;
    float _1195 = _1189;
    float _1197 = _1173;
    if (!_1077)
    {
        float _1199 = _995 * _995;
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1203 = -_861;
        float _1205 = _1203 + _1175;
        float _1207 = -_879;
        float _1209 = _1207 + _1177;
        float _1211 = fma(_1003, _1003, _1199);
        float _1213 = fma(_1013, _1013, _1211);
        float _1215 = 1.0 / _1047;
        float _1217 = sqrt(_1213);
        float _1219 = precise::min(_1217, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1221 = _1219 * _1201;
        float _1223 = -_869;
        float _1225 = _1223 + _1173;
        float _1227 = _1221 * _1215;
        float _1229 = fma(_1225, _1227, _987);
        float _1231 = fma(_1205, _1227, _981);
        float _1233 = fma(_1209, _1227, _999);
        _1191 = _1231;
        _1193 = _1229;
        _1195 = _1233;
        _951 = _1209;
    }
    float _1235 = _1191;
    float _1237 = _1193;
    float _1239 = _1195;
    float _1241 = _951;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1245 = _1235 + _1243;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1249 = _1237 + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1253 = _1239 + _1251;
    float _1255 = _1245 * _1245;
    float _1257 = fma(_1249, _1249, _1255);
    float _1259 = fma(_1253, _1253, _1257);
    float _1261 = rsqrt(_1259);
    float _1263 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1265 = _1249 * _1263;
    float _1267 = _1253 * _1263;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 * _1267;
    float _1273 = _1269 + _1271;
    float _1275 = sqrt(_1273);
    bool _1277 = _1275 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1281 = _1275 + _1279;
    float _1283 = _1253;
    float _1285 = _1273;
    float _1287 = _1281;
    float _1289 = _1241;
    float _1291 = _1245;
    float _1293 = _1265;
    if (_1277)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1295;
    }
    float _1297 = _1283;
    if (_1277)
    {
        float _1299 = rsqrt(_1273);
        _1285 = _1299;
    }
    float _1301 = _1285;
    if (_1277)
    {
        float _1303 = _1281 * _1297;
        _1287 = _1303;
    }
    float _1305 = _1287;
    if (_1277)
    {
        float _1307 = _1305 * 0.15915493667125701904296875;
        _1289 = _1307;
    }
    float _1309 = _1289;
    float _1311 = _1261;
    if (_1277)
    {
        float _1313 = _1309 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1321 = precise::max(0.0, _1319);
    float _1323 = _869;
    float _1325 = _1321;
    float _1327 = _1319;
    if (_1277)
    {
        float _1329 = _1309 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        _1323 = _1331;
    }
    float _1333 = _1323;
    float _1335 = -_1263;
    float _1337 = -_1321;
    float _1339 = fma(_1245, _1335, _1337);
    if (!_1277)
    {
        _1325 = _1267;
    }
    float _1341 = _1325;
    float _1343 = _1341;
    if (_1277)
    {
        float _1345 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1345;
    }
    float _1347 = _1327;
    float _1349 = _1317;
    float _1351 = _1347;
    if (_1277)
    {
        float _1353 = fma(_1317, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = _1355;
    if (_1277)
    {
        float _1359 = _1333 + (-1.0);
        _1351 = _1359;
    }
    float _1361 = _1351;
    float _1363 = _1361;
    if (_1277)
    {
        float _1365 = _1301 * _1355;
        _1197 = _1365;
    }
    float _1367 = _1197;
    if (!_1277)
    {
        _1357 = _1339;
    }
    float _1369 = _1357;
    float _1371 = sqrt(_1259);
    float _1373 = _1369;
    if (_1277)
    {
        float _1375 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1291 = _1375;
    }
    float _1377 = _1291;
    float _1379 = _1377;
    if (_1277)
    {
        float _1381 = _1265 * _1367;
        _1293 = _1381;
    }
    float _1383 = _1293;
    if (!_1277)
    {
        _1363 = _1269;
    }
    float _1385 = _1363;
    float _1387 = _1385;
    if (_1277)
    {
        float _1389 = _1267 * _1367;
        _1343 = _1389;
    }
    float _1391 = _1343;
    if (_1277)
    {
        float _1393 = fma(_1339, _1333, _1377);
        _1373 = _1393;
    }
    float _1395 = _1373;
    if (_1277)
    {
        float _1397 = _1383 * _1383;
        _1387 = _1397;
    }
    float _1399 = _1387;
    if (!_1277)
    {
        _1379 = _1271;
    }
    float _1401 = _1379;
    float _1403 = _1401;
    if (_1277)
    {
        float _1405 = _1391 * _1391;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1411 = fma(_1395, _1395, _1399);
    float _1413 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1415 = _1411 + _1407;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1419 = fma(_1371, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1417);
    float _1421 = precise::clamp(_1419, 0.0, 1.0);
    float _1423 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1413);
    float _1425 = rsqrt(_1415);
    float _1427 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1429 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1431 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1423);
    float _1433 = -_1421;
    float _1435 = _1433 + 1.0;
    float _1437 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1439 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1427);
    float _1441 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1443 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1437);
    float _1445 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1439);
    float _1447 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1409);
    float _1449 = abs(_1435);
    float _1451 = log2(_1449);
    float _1453 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1443);
    float _1455 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1457 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1459 = _1425 * _1383;
    float _1461 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1465 = _1425 * _1395;
    float _1467 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1469 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1447);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1463);
    float _1473 = _1425 * _1391;
    float _1475 = -_1467;
    float _1477 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1475);
    float _1479 = -_1457;
    float _1481 = fma(_1479, _1429, 1.0);
    float _1483 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1471);
    float _1487 = -_1473;
    float _1489 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1477);
    float _1491 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1493 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1495 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1485);
    float _1497 = fma(_1489, -0.5, 0.5);
    float _1499 = log2(_1481);
    float _1501 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1503 = fma(_1489, 0.5, 0.5);
    float _1505 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1493);
    float _1507 = _1465 + 1.0;
    float _1509 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1501);
    float _1511 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1505);
    float _1513 = 1.0 / _1495;
    float _1515 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1509);
    float _1517 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1515);
    float _1519 = exp2(_1491);
    float _1521 = _1499 * 0.693147182464599609375;
    float _1523 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1525 = sqrt(_1497);
    float _1527 = fma(_1503, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = _1517 * _1513;
    float _1531 = fma(_1503, _1527, -0.212114393711090087890625);
    float _1533 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1511);
    float _1535 = fma(_1529, -0.5, 0.5);
    float _1537 = -_1465;
    float _1539 = fma(_1519, _1507, _1537);
    float _1541 = fma(_1503, _1531, 1.570728778839111328125);
    float _1543 = _1533 * _1513;
    float _1545 = fma(_1539, 0.5, 0.5);
    float _1547 = fma(_1543, 0.5, 0.5);
    float _1549 = _1525 * 0.636619746685028076171875;
    float3 _4208 = float3(_1547, _1535, _1523);
    float _1551 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4208, float3(0.0), isnan(_4208)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4208, float3(0.0), isnan(_4208)), level(0.0)).x;
    float3 _4219 = float3(_1547, _1535, _1523);
    float4 _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4219, float3(0.0), isnan(_4219)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4219, float3(0.0), isnan(_4219)), level(0.0)).xyzw;
    float _1556 = _1554.x;
    float _1558 = _1554.y;
    float _1560 = _1554.z;
    float _1562 = _1554.w;
    float _1564 = -_1541;
    float _1566 = fma(_1549, _1564, 1.0);
    float2 _4241 = float2(_1566, _1545);
    float3 _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4241, float2(0.0), isnan(_4241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4241, float2(0.0), isnan(_4241)), level(0.0)).xyz;
    float _1572 = _1570.x;
    float _1574 = _1570.y;
    float _1576 = _1570.z;
    float _1578 = _981 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1580 = _981 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1582 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1584 = isnan(0.5);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1590 = _1586 || _1588;
    float _1592 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1594 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1578);
    float _1596 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1580);
    float _1598 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1594);
    float _1600 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1596);
    float _1602 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1604 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1606 = _1535;
    float _1608 = _1592;
    float _1610 = _1598;
    float _1612 = _1451;
    if (!_1590)
    {
        _1037 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1614 = _1037;
    float _1616 = 1.0 / _1602;
    float _1618 = _1604 + _1602;
    float _1620 = _1614;
    if (!_1590)
    {
        _1606 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1622 = _1606;
    float _1624 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1626 = exp2(_1624);
    float _1628 = _1618 * _1616;
    float _1630 = _1628 * 0.5;
    float _1632 = _1616;
    if (!_1590)
    {
        float _1634 = -_1614;
        float _1636 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1634);
        _1632 = _1636;
    }
    float _1638 = _1632;
    if (!_1590)
    {
        float _1640 = -_1622;
        float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1620 = _1642;
    }
    float _1644 = _1620;
    float _1646 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1592);
    if (_1590)
    {
        _1608 = 1.0;
    }
    float _1648 = _1608;
    float _1650 = _1648;
    if (!_1590)
    {
        float _1652 = 1.0 / _1644;
        _1610 = _1652;
    }
    float _1654 = _1610;
    float _1656 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1646);
    float _1658 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1656);
    float _1660 = _1638;
    if (!_1590)
    {
        float _1662 = 1.0 / _1638;
        _1660 = _1662;
    }
    float _1664 = _1660;
    float _1666 = -_1626;
    float _1668 = _1666 + 1.0;
    float _1670 = _1658 + _1495;
    float _1672 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1590)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1676 = -_1622;
        float _1678 = fma(_1664, _1674, _1676);
        _1612 = _1678;
    }
    float _1680 = _1612;
    float _1682 = _1670 * 0.5;
    if (!_1590)
    {
        float _1684 = _1680 * _1654;
        float _1686 = precise::clamp(_1684, 0.0, 1.0);
        _1650 = _1686;
    }
    float _1688 = _1650;
    out.m_62.z = _1682;
    out.m_62.w = _1495;
    float _1690 = _1688 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1692 = _1688 > 0.0;
    bool _1694 = isnan(_1688);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan(0.0);
    bool _1700 = _1696 || _1698;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1517;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1495;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1702;
    float _1704 = _1672 * _1551;
    float _1706 = -_1672;
    float _1708 = _1706 + 1.0;
    float _1710 = _1562 * _1704;
    float _1712 = _1562 * _1708;
    float _1714 = _1576 * _1704;
    float _1716 = fma(_1572, _1710, _1556);
    float _1718 = fma(_1574, _1710, _1558);
    float _1720 = fma(_1562, _1714, _1560);
    out.m_64.x = _1716;
    out.m_64.y = _1718;
    out.m_64.z = _1720;
    out.m_64.w = _1712;
    if (_1700)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1722 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1722;
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
    bool _697 = false;
    bool _455 = false;
    bool _263 = false;
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
        float _1779 = as_type<float>(_99);
        out.gl_Position.z = _1779;
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
        float _1847 = as_type<float>(_135);
        out.gl_Position.z = _1847;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    bool _187 = !_181;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_185);
    float _193 = -_159;
    float _195 = _147 + _193;
    int _197 = abs(_189);
    float _199 = -_195;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    float _207 = float(_191);
    float _209 = fma(_177, 0.5, 0.5);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = abs(_201);
    float _215 = _207 * _213;
    int _217 = abs(_205);
    float _219 = -_209;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_197);
    bool _225 = _195 < 0.5;
    float _227 = float(_225);
    float _229 = fma(_223, _221, _215);
    bool _231 = !_151;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = -_227;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_217);
    float _241 = abs(_237);
    float _243 = fma(_239, _241, _229);
    bool _245 = !_211;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _271 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    bool _297 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_271);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _287;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _291;
    float _317 = _275 * _309;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -_307;
    float _333 = _331 + 1.0;
    float _335 = _329 * _333;
    float _337 = _279 * _313;
    bool _339 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _341 = isnan(_271);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_329;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _353;
    float _361 = -_349;
    float _363 = _361 + 1.0;
    float _365 = _283 * _315;
    bool _367 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _369 = isnan(_271);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = fma(_357, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _393 = fma(_381, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = _377 * _363;
    float _397 = fma(_387, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_377;
    float _403 = _401 + 1.0;
    float _405 = _393 * _395;
    float _407 = _397 * _395;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _415;
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _421 = fma(_411, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_383, _359, _413);
    float _425 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _427 = fma(_399, _359, _419);
    float _429 = fma(_421, _335, _423);
    float _431 = fma(_425, _335, _427);
    float _433 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_311;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _441 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_83);
        float _459 = 1.0 / _457;
        float _461 = _117 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _467 = _463 + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _471 = _463 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _487 = _463 + _485;
    float _489 = 1.0 / _475;
    bool _491 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _493 = isnan(_463);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_463);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _479;
    bool _517 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _519 = 1.0 / _483;
    float _521 = _467 * _489;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = fma(_525, _521, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_529, _521, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _535 = _471 * _515;
    bool _537 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _539 = isnan(_463);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_551, _521, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _555 = -_547;
    float _557 = _555 + 1.0;
    float _559 = _487 * _519;
    float _561 = -_501;
    float _563 = _561 + 1.0;
    bool _565 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _567 = isnan(_463);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _581 = _547 * _563;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _587 = _513 * _557;
    float _589 = -_513;
    float _591 = _589 + 1.0;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _597 = fma(_579, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _599 = fma(_585, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _601 = _575 * _591;
    float _603 = fma(_595, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _605 = -_575;
    float _607 = _605 + 1.0;
    float _609 = _531 * _601;
    float _611 = _533 * _601;
    float _613 = _553 * _601;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _615;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].x, _609);
    float _621 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].y, _611);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _627;
    float _631 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].z, _613);
    float _633 = fma(_617, _559, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _635 = fma(_603, _587, _621);
    float _637 = fma(_625, _559, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _639 = fma(_629, _559, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _641 = fma(_597, _587, _619);
    float _643 = fma(_599, _587, _631);
    float _645 = fma(_633, _581, _635);
    float _647 = fma(_637, _581, _641);
    float _649 = fma(_639, _581, _643);
    float _651 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].y, _645);
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].x, _647);
    float _659 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].z, _649);
    float _661 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _667 = _659 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _669 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _671;
    out.m_56.y = _669;
    out.m_56.z = _673;
    out.m_56.w = _663;
    float _675 = _435 * _655;
    float _677 = _433 * _653;
    bool _679 = !_517;
    float _695;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _683 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _687 = _685 * _681;
        float _689 = floor(_687);
        float _691 = -_689;
        float _693 = _687 + _691;
        _695 = _693;
        _697 = true;
    }
    else
    {
        float _699 = float(_83);
        float _701 = 1.0 / _699;
        float _703 = _117 * _701;
        _695 = _703;
    }
    _697 = false;
    float _705 = _695;
    float _707 = in.m_49.y;
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _711 = in.m_42.x;
    float _713 = in.m_42.y;
    float _715 = in.m_42.z;
    bool _717 = _137 > 0.5;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _729 = _727 != 0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _733 = _705 + _731;
    float _735 = 1.0 / _721;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _739 = _737 != 0;
    float _741 = 1.0 / _725;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _745 = _705 + _743;
    bool _747 = _707 > 0.5;
    float _749 = _733 * _735;
    bool _751 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _753 = isnan(_705);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _713 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _765 = _713 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _767 = _713 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _769;
    float _773 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[5].x, _763);
    float _775 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[4].x, _765);
    float _777 = _745 * _741;
    float _779 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[6].x, _767);
    float _781 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[5].z, _773);
    bool _783 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _785 = isnan(_705);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[4].z, _775);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _801;
    float _805 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[6].z, _779);
    float _807 = -_761;
    float _809 = _807 + 1.0;
    bool _811 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _813 = isnan(_705);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_793;
    float _825 = _823 + 1.0;
    float _827 = fma(_799, _749, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _829 = fma(_771, _749, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _831 = fma(_803, _749, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _833 = _793 * _809;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _843 = _821 * _825;
    float _845 = -_821;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _853 = fma(_841, _777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _855 = _827 * _843;
    float _857 = _829 * _843;
    float _859 = _831 * _843;
    float _861 = _781 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _863 = fma(_837, _777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].x, _855);
    float _867 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].z, _859);
    float _869 = _795 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _873 = _861 + _871;
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].y, _857);
    float _877 = fma(_863, _833, _865);
    float _879 = _805 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _869 + _881;
    float _885 = _873 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = fma(_851, _777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _891 = _879 + _889;
    float _893 = -_233;
    int _895 = _717 ? as_type<int>(_893) : as_type<int>(_233);
    float _897 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[28].x, _885);
    float _899 = -_163;
    int _901 = _747 ? as_type<int>(_899) : as_type<int>(_163);
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _905 = !_729;
    float _907 = _905 ? _233 : as_type<float>(_895);
    float _909 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[28].z, _897);
    float _911 = _873 * _873;
    bool _913 = !_739;
    float _915 = _913 ? _163 : as_type<float>(_901);
    float _917 = fma(_853, _833, _875);
    float _919 = fma(_887, _833, _867);
    bool _921 = _909 >= 0.0;
    float _923 = fma(_883, _883, _911);
    float _925 = _907 + 0.5;
    float _927 = -_915;
    float _929 = _927 + 0.5;
    float _931 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].x, _877);
    float _933 = fma(_891, _891, _923);
    float _935 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].y, _917);
    float _937 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].z, _919);
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _941 = rsqrt(_933);
    float _943 = _929 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _945 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _947 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = _923;
    float _951 = _879;
    if (_921)
    {
        _949 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _953 = _949;
    float _955 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = _939 * _709;
    float _959 = _943 * _903;
    float _961 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _967 = as_type<int>(_953);
    if (_921)
    {
        float _969 = _953 * 5.0;
        _967 = as_type<int>(_969);
    }
    int _971 = _967;
    out.m_58.x = _957;
    out.m_58.y = _959;
    float _973 = _873 * _941;
    out.m_60.x = _961;
    out.m_60.y = _963;
    out.m_60.z = _965;
    float _975 = _883 * _941;
    float _977 = as_type<float>(_971);
    if (_921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3242 = as_type<float>(_971);
        out.gl_Position.z = _3242;
    }
    if (_921)
    {
        out.m_45.x = 0.0;
    }
    if (_921)
    {
        return out;
    }
    float _979 = -_973;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _983 = _891 * _941;
    float _985 = -_975;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _869);
    float _989 = -_973;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = _981 + _993;
    float _997 = -_983;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _879);
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1003 = _987 + _1001;
    float _1005 = -_975;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _883);
    float _1009 = _995 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1013 = _999 + _1011;
    float _1015 = -_983;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _1019 = _243 * _677;
    float _1021 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1009);
    float _1023 = _991 * _991;
    float _1025 = _243 * _675;
    float _1027 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1021);
    float _1029 = fma(_1007, _1007, _1023);
    bool _1031 = _1027 >= 0.0;
    float _1033 = fma(_1017, _1017, _1029);
    float _1035 = sqrt(_1033);
    float _1037 = _999;
    if (_1031)
    {
        _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1039 = _977;
    int _1041 = as_type<int>(_1039);
    if (_1031)
    {
        out.m_45.x = 0.0;
    }
    if (_1031)
    {
        float _1043 = _1039 * 5.0;
        _1041 = as_type<int>(_1043);
    }
    int _1045 = _1041;
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_1045);
        out.gl_Position.z = _3377;
    }
    float _1047 = _941 * _1035;
    if (_1031)
    {
        return out;
    }
    float _1049 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1051 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _1057 = _1047 * _1049;
    float _1059 = _1047 * _1051;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = _1053 * _1057;
    float _1067 = _1055 * _1059;
    bool _1069 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1071 = isnan(0.5);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1077 = _1073 || _1075;
    float _1079 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1083 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1087 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1081);
    float _1089 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1083);
    float _1091 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1085);
    float _1093 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1087);
    float _1095 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1089);
    float _1097 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1101 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1103 = _879 + _1097;
    float _1105 = _869 + _1099;
    float _1107 = _861 + _1101;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1111 = _1103 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1115 = _1105 + _1113;
    float _1117 = _1111 * _1111;
    float _1119 = fma(_1115, _1115, _1117);
    float _1121 = sqrt(_1119);
    bool _1123 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = _1091;
    float _1127 = _1105;
    float _1129 = _1103;
    if (!_1123)
    {
        _1125 = _1107;
    }
    float _1131 = _1125;
    bool _1133 = !_1123;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1121 + _1139;
        float _1143 = rsqrt(_1119);
        float _1145 = _1141 * _1137;
        float _1147 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1145 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = _1153 + (-1.0);
        float _1161 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = fma(_1157, _1147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1165 = fma(_1107, _1153, _1161);
        float _1167 = _1143 * _1163;
        float _1169 = fma(_1115, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1171 = fma(_1111, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1169;
        _1135 = _1165;
        _1129 = _1171;
    }
    float _1173 = _1127;
    float _1175 = _1135;
    float _1177 = _1129;
    float _1179 = -_975;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1173);
    float _1183 = -_973;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _1187 = -_983;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1177);
    float _1191 = _1185;
    float _1193 = _1181;
    float _1195 = _1189;
    float _1197 = _1173;
    if (!_1077)
    {
        float _1199 = _995 * _995;
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1203 = -_861;
        float _1205 = _1203 + _1175;
        float _1207 = -_879;
        float _1209 = _1207 + _1177;
        float _1211 = fma(_1003, _1003, _1199);
        float _1213 = fma(_1013, _1013, _1211);
        float _1215 = 1.0 / _1047;
        float _1217 = sqrt(_1213);
        float _1219 = precise::min(_1217, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1221 = _1219 * _1201;
        float _1223 = -_869;
        float _1225 = _1223 + _1173;
        float _1227 = _1221 * _1215;
        float _1229 = fma(_1225, _1227, _987);
        float _1231 = fma(_1205, _1227, _981);
        float _1233 = fma(_1209, _1227, _999);
        _1191 = _1231;
        _1193 = _1229;
        _1195 = _1233;
        _951 = _1209;
    }
    float _1235 = _1191;
    float _1237 = _1193;
    float _1239 = _1195;
    float _1241 = _951;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1245 = _1235 + _1243;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1249 = _1237 + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1253 = _1239 + _1251;
    float _1255 = _1245 * _1245;
    float _1257 = fma(_1249, _1249, _1255);
    float _1259 = fma(_1253, _1253, _1257);
    float _1261 = rsqrt(_1259);
    float _1263 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1265 = _1249 * _1263;
    float _1267 = _1253 * _1263;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 * _1267;
    float _1273 = _1269 + _1271;
    float _1275 = sqrt(_1273);
    bool _1277 = _1275 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1281 = _1275 + _1279;
    float _1283 = _1253;
    float _1285 = _1273;
    float _1287 = _1281;
    float _1289 = _1241;
    float _1291 = _1245;
    float _1293 = _1265;
    if (_1277)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1295;
    }
    float _1297 = _1283;
    if (_1277)
    {
        float _1299 = rsqrt(_1273);
        _1285 = _1299;
    }
    float _1301 = _1285;
    if (_1277)
    {
        float _1303 = _1281 * _1297;
        _1287 = _1303;
    }
    float _1305 = _1287;
    if (_1277)
    {
        float _1307 = _1305 * 0.15915493667125701904296875;
        _1289 = _1307;
    }
    float _1309 = _1289;
    float _1311 = _1261;
    if (_1277)
    {
        float _1313 = _1309 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1321 = precise::max(0.0, _1319);
    float _1323 = _869;
    float _1325 = _1321;
    float _1327 = _1319;
    if (_1277)
    {
        float _1329 = _1309 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        _1323 = _1331;
    }
    float _1333 = _1323;
    float _1335 = -_1263;
    float _1337 = -_1321;
    float _1339 = fma(_1245, _1335, _1337);
    if (!_1277)
    {
        _1325 = _1267;
    }
    float _1341 = _1325;
    float _1343 = _1341;
    if (_1277)
    {
        float _1345 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1345;
    }
    float _1347 = _1327;
    float _1349 = _1317;
    float _1351 = _1347;
    if (_1277)
    {
        float _1353 = fma(_1317, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = _1355;
    if (_1277)
    {
        float _1359 = _1333 + (-1.0);
        _1351 = _1359;
    }
    float _1361 = _1351;
    float _1363 = _1361;
    if (_1277)
    {
        float _1365 = _1301 * _1355;
        _1197 = _1365;
    }
    float _1367 = _1197;
    if (!_1277)
    {
        _1357 = _1339;
    }
    float _1369 = _1357;
    float _1371 = sqrt(_1259);
    float _1373 = _1369;
    if (_1277)
    {
        float _1375 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1291 = _1375;
    }
    float _1377 = _1291;
    float _1379 = _1377;
    if (_1277)
    {
        float _1381 = _1265 * _1367;
        _1293 = _1381;
    }
    float _1383 = _1293;
    if (!_1277)
    {
        _1363 = _1269;
    }
    float _1385 = _1363;
    float _1387 = _1385;
    if (_1277)
    {
        float _1389 = _1267 * _1367;
        _1343 = _1389;
    }
    float _1391 = _1343;
    if (_1277)
    {
        float _1393 = fma(_1339, _1333, _1377);
        _1373 = _1393;
    }
    float _1395 = _1373;
    if (_1277)
    {
        float _1397 = _1383 * _1383;
        _1387 = _1397;
    }
    float _1399 = _1387;
    if (!_1277)
    {
        _1379 = _1271;
    }
    float _1401 = _1379;
    float _1403 = _1401;
    if (_1277)
    {
        float _1405 = _1391 * _1391;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1411 = fma(_1395, _1395, _1399);
    float _1413 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1415 = _1411 + _1407;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1419 = fma(_1371, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1417);
    float _1421 = precise::clamp(_1419, 0.0, 1.0);
    float _1423 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1413);
    float _1425 = rsqrt(_1415);
    float _1427 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1429 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1431 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1423);
    float _1433 = -_1421;
    float _1435 = _1433 + 1.0;
    float _1437 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1439 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1427);
    float _1441 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1443 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1437);
    float _1445 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1439);
    float _1447 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1409);
    float _1449 = abs(_1435);
    float _1451 = log2(_1449);
    float _1453 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1443);
    float _1455 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1457 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1459 = _1425 * _1383;
    float _1461 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1465 = _1425 * _1395;
    float _1467 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1469 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1447);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1463);
    float _1473 = _1425 * _1391;
    float _1475 = -_1467;
    float _1477 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1475);
    float _1479 = -_1457;
    float _1481 = fma(_1479, _1429, 1.0);
    float _1483 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1471);
    float _1487 = -_1473;
    float _1489 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1477);
    float _1491 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1493 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1495 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1485);
    float _1497 = fma(_1489, -0.5, 0.5);
    float _1499 = log2(_1481);
    float _1501 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1503 = fma(_1489, 0.5, 0.5);
    float _1505 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1493);
    float _1507 = _1465 + 1.0;
    float _1509 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1501);
    float _1511 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1505);
    float _1513 = 1.0 / _1495;
    float _1515 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1509);
    float _1517 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1515);
    float _1519 = exp2(_1491);
    float _1521 = _1499 * 0.693147182464599609375;
    float _1523 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1525 = sqrt(_1497);
    float _1527 = fma(_1503, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = _1517 * _1513;
    float _1531 = fma(_1503, _1527, -0.212114393711090087890625);
    float _1533 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1511);
    float _1535 = fma(_1529, -0.5, 0.5);
    float _1537 = -_1465;
    float _1539 = fma(_1519, _1507, _1537);
    float _1541 = fma(_1503, _1531, 1.570728778839111328125);
    float _1543 = _1533 * _1513;
    float _1545 = fma(_1539, 0.5, 0.5);
    float _1547 = fma(_1543, 0.5, 0.5);
    float _1549 = _1525 * 0.636619746685028076171875;
    float3 _4208 = float3(_1547, _1535, _1523);
    float _1551 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4208, float3(0.0), isnan(_4208)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4208, float3(0.0), isnan(_4208)), level(0.0)).x;
    float3 _4219 = float3(_1547, _1535, _1523);
    float4 _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4219, float3(0.0), isnan(_4219)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4219, float3(0.0), isnan(_4219)), level(0.0)).xyzw;
    float _1556 = _1554.x;
    float _1558 = _1554.y;
    float _1560 = _1554.z;
    float _1562 = _1554.w;
    float _1564 = -_1541;
    float _1566 = fma(_1549, _1564, 1.0);
    float2 _4241 = float2(_1566, _1545);
    float3 _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4241, float2(0.0), isnan(_4241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4241, float2(0.0), isnan(_4241)), level(0.0)).xyz;
    float _1572 = _1570.x;
    float _1574 = _1570.y;
    float _1576 = _1570.z;
    float _1578 = _981 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1580 = _981 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1582 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1584 = isnan(0.5);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1590 = _1586 || _1588;
    float _1592 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1594 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1578);
    float _1596 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1580);
    float _1598 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1594);
    float _1600 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1596);
    float _1602 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1604 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1606 = _1535;
    float _1608 = _1592;
    float _1610 = _1598;
    float _1612 = _1451;
    if (!_1590)
    {
        _1037 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1614 = _1037;
    float _1616 = 1.0 / _1602;
    float _1618 = _1604 + _1602;
    float _1620 = _1614;
    if (!_1590)
    {
        _1606 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1622 = _1606;
    float _1624 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1626 = exp2(_1624);
    float _1628 = _1618 * _1616;
    float _1630 = _1628 * 0.5;
    float _1632 = _1616;
    if (!_1590)
    {
        float _1634 = -_1614;
        float _1636 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1634);
        _1632 = _1636;
    }
    float _1638 = _1632;
    if (!_1590)
    {
        float _1640 = -_1622;
        float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1620 = _1642;
    }
    float _1644 = _1620;
    float _1646 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1592);
    if (_1590)
    {
        _1608 = 1.0;
    }
    float _1648 = _1608;
    float _1650 = _1648;
    if (!_1590)
    {
        float _1652 = 1.0 / _1644;
        _1610 = _1652;
    }
    float _1654 = _1610;
    float _1656 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1646);
    float _1658 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1656);
    float _1660 = _1638;
    if (!_1590)
    {
        float _1662 = 1.0 / _1638;
        _1660 = _1662;
    }
    float _1664 = _1660;
    float _1666 = -_1626;
    float _1668 = _1666 + 1.0;
    float _1670 = _1658 + _1495;
    float _1672 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1590)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1676 = -_1622;
        float _1678 = fma(_1664, _1674, _1676);
        _1612 = _1678;
    }
    float _1680 = _1612;
    float _1682 = _1670 * 0.5;
    if (!_1590)
    {
        float _1684 = _1680 * _1654;
        float _1686 = precise::clamp(_1684, 0.0, 1.0);
        _1650 = _1686;
    }
    float _1688 = _1650;
    out.m_62.z = _1682;
    out.m_62.w = _1495;
    float _1690 = _1688 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1692 = _1688 > 0.0;
    bool _1694 = isnan(_1688);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan(0.0);
    bool _1700 = _1696 || _1698;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1517;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1495;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1702;
    float _1704 = _1672 * _1551;
    float _1706 = -_1672;
    float _1708 = _1706 + 1.0;
    float _1710 = _1562 * _1704;
    float _1712 = _1562 * _1708;
    float _1714 = _1576 * _1704;
    float _1716 = fma(_1572, _1710, _1556);
    float _1718 = fma(_1574, _1710, _1558);
    float _1720 = fma(_1562, _1714, _1560);
    out.m_64.x = _1716;
    out.m_64.y = _1718;
    out.m_64.z = _1720;
    out.m_64.w = _1712;
    if (_1700)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1722 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1722;
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
    bool _697 = false;
    bool _455 = false;
    bool _263 = false;
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
        float _1779 = as_type<float>(_99);
        out.gl_Position.z = _1779;
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
        float _1847 = as_type<float>(_135);
        out.gl_Position.z = _1847;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _141 * _139;
    float _147 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    int _149 = as_type<int>(_143) & 1;
    bool _151 = _149 != 0;
    int _153 = as_type<int>(_143) & 2;
    bool _155 = _153 != 0;
    float _157 = _147 * 6.283185482025146484375;
    float _159 = floor(_147);
    bool _161 = !_155;
    float _163 = _161 ? (-0.5) : 0.5;
    float _165 = _157 * 0.15915493667125701904296875;
    int _167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _169 = _167 != 0;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _173 = _171 != 0;
    float _175 = _165 * 6.283185482025146484375;
    float _177 = cos(_175);
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    bool _183 = !_169;
    int _185 = _183 ? 0 : 1;
    bool _187 = !_181;
    int _189 = _187 ? 0 : 1;
    int _191 = abs(_185);
    float _193 = -_159;
    float _195 = _147 + _193;
    int _197 = abs(_189);
    float _199 = -_195;
    float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _203 = !_173;
    int _205 = _203 ? 0 : 1;
    float _207 = float(_191);
    float _209 = fma(_177, 0.5, 0.5);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = abs(_201);
    float _215 = _207 * _213;
    int _217 = abs(_205);
    float _219 = -_209;
    float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _223 = float(_197);
    bool _225 = _195 < 0.5;
    float _227 = float(_225);
    float _229 = fma(_223, _221, _215);
    bool _231 = !_151;
    float _233 = _231 ? (-0.5) : 0.5;
    float _235 = -_227;
    float _237 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _239 = float(_217);
    float _241 = abs(_237);
    float _243 = fma(_239, _241, _229);
    bool _245 = !_211;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_83);
        float _267 = 1.0 / _265;
        float _269 = _117 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _271 + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _271 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _293;
    bool _297 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _299 = isnan(_271);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _287;
    bool _311 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _313 = 1.0 / _295;
    float _315 = 1.0 / _291;
    float _317 = _275 * _309;
    bool _319 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _321 = isnan(_271);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -_307;
    float _333 = _331 + 1.0;
    float _335 = _329 * _333;
    float _337 = _279 * _313;
    bool _339 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _341 = isnan(_271);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -_329;
    float _353 = _351 + 1.0;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _357 = _355 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _359 = _349 * _353;
    float _361 = -_349;
    float _363 = _361 + 1.0;
    float _365 = _283 * _315;
    bool _367 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _369 = isnan(_271);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = fma(_357, _365, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _393 = fma(_381, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _395 = _377 * _363;
    float _397 = fma(_387, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _399 = fma(_391, _365, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _401 = -_377;
    float _403 = _401 + 1.0;
    float _405 = _393 * _395;
    float _407 = _397 * _395;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _409;
    float _413 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].x, _405);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _415;
    float _419 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    float _421 = fma(_411, _337, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _423 = fma(_383, _359, _413);
    float _425 = fma(_417, _337, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _427 = fma(_399, _359, _419);
    float _429 = fma(_421, _335, _423);
    float _431 = fma(_425, _335, _427);
    float _433 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[146].x, _429);
    float _435 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[146].y, _431);
    bool _437 = !_311;
    float _453;
    if (!_437)
    {
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _441 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        float _457 = float(_83);
        float _459 = 1.0 / _457;
        float _461 = _117 * _459;
        _453 = _461;
    }
    _455 = false;
    float _463 = _453;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _467 = _463 + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _471 = _463 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _473;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _487 = _463 + _485;
    float _489 = 1.0 / _475;
    bool _491 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _493 = isnan(_463);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _505 = isnan(_463);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = 1.0 / _479;
    bool _517 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _519 = 1.0 / _483;
    float _521 = _467 * _489;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _527;
    float _531 = fma(_525, _521, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _533 = fma(_529, _521, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _535 = _471 * _515;
    bool _537 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _539 = isnan(_463);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _549;
    float _553 = fma(_551, _521, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _555 = -_547;
    float _557 = _555 + 1.0;
    float _559 = _487 * _519;
    float _561 = -_501;
    float _563 = _561 + 1.0;
    bool _565 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _567 = isnan(_463);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _581 = _547 * _563;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _587 = _513 * _557;
    float _589 = -_513;
    float _591 = _589 + 1.0;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _597 = fma(_579, _535, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _599 = fma(_585, _535, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _601 = _575 * _591;
    float _603 = fma(_595, _535, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _605 = -_575;
    float _607 = _605 + 1.0;
    float _609 = _531 * _601;
    float _611 = _533 * _601;
    float _613 = _553 * _601;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _615;
    float _619 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].x, _609);
    float _621 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].y, _611);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _623;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _629 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _627;
    float _631 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[107].z, _613);
    float _633 = fma(_617, _559, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _635 = fma(_603, _587, _621);
    float _637 = fma(_625, _559, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _639 = fma(_629, _559, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _641 = fma(_597, _587, _619);
    float _643 = fma(_599, _587, _631);
    float _645 = fma(_633, _581, _635);
    float _647 = fma(_637, _581, _641);
    float _649 = fma(_639, _581, _643);
    float _651 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].y, _645);
    float _653 = in.m_54.x;
    float _655 = in.m_54.y;
    float _657 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].x, _647);
    float _659 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[110].z, _649);
    float _661 = _651 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _665 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _667 = _659 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _669 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _671 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _671;
    out.m_56.y = _669;
    out.m_56.z = _673;
    out.m_56.w = _663;
    float _675 = _435 * _655;
    float _677 = _433 * _653;
    bool _679 = !_517;
    float _695;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _683 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _687 = _685 * _681;
        float _689 = floor(_687);
        float _691 = -_689;
        float _693 = _687 + _691;
        _695 = _693;
        _697 = true;
    }
    else
    {
        float _699 = float(_83);
        float _701 = 1.0 / _699;
        float _703 = _117 * _701;
        _695 = _703;
    }
    _697 = false;
    float _705 = _695;
    float _707 = in.m_49.y;
    float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _711 = in.m_42.x;
    float _713 = in.m_42.y;
    float _715 = in.m_42.z;
    bool _717 = _137 > 0.5;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _719;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _725 = _723 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _729 = _727 != 0;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _733 = _705 + _731;
    float _735 = 1.0 / _721;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _739 = _737 != 0;
    float _741 = 1.0 / _725;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _745 = _705 + _743;
    bool _747 = _707 > 0.5;
    float _749 = _733 * _735;
    bool _751 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _753 = isnan(_705);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _713 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _765 = _713 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _767 = _713 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _769;
    float _773 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[5].x, _763);
    float _775 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[4].x, _765);
    float _777 = _745 * _741;
    float _779 = fma(_711, (*spvDescriptorSet0.vp_c10)._m0[6].x, _767);
    float _781 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[5].z, _773);
    bool _783 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _785 = isnan(_705);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[4].z, _775);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _797;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _801;
    float _805 = fma(_715, (*spvDescriptorSet0.vp_c10)._m0[6].z, _779);
    float _807 = -_761;
    float _809 = _807 + 1.0;
    bool _811 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _813 = isnan(_705);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_793;
    float _825 = _823 + 1.0;
    float _827 = fma(_799, _749, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _829 = fma(_771, _749, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _831 = fma(_803, _749, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _833 = _793 * _809;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _841 = _839 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _843 = _821 * _825;
    float _845 = -_821;
    float _847 = _845 + 1.0;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _853 = fma(_841, _777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _855 = _827 * _843;
    float _857 = _829 * _843;
    float _859 = _831 * _843;
    float _861 = _781 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _863 = fma(_837, _777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _865 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].x, _855);
    float _867 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].z, _859);
    float _869 = _795 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _871 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _873 = _861 + _871;
    float _875 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[123].y, _857);
    float _877 = fma(_863, _833, _865);
    float _879 = _805 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _883 = _869 + _881;
    float _885 = _873 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _887 = fma(_851, _777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _889 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _891 = _879 + _889;
    float _893 = -_233;
    int _895 = _717 ? as_type<int>(_893) : as_type<int>(_233);
    float _897 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[28].x, _885);
    float _899 = -_163;
    int _901 = _747 ? as_type<int>(_899) : as_type<int>(_163);
    float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _905 = !_729;
    float _907 = _905 ? _233 : as_type<float>(_895);
    float _909 = fma(_891, (*spvDescriptorSet0.vp_c8)._m0[28].z, _897);
    float _911 = _873 * _873;
    bool _913 = !_739;
    float _915 = _913 ? _163 : as_type<float>(_901);
    float _917 = fma(_853, _833, _875);
    float _919 = fma(_887, _833, _867);
    bool _921 = _909 >= 0.0;
    float _923 = fma(_883, _883, _911);
    float _925 = _907 + 0.5;
    float _927 = -_915;
    float _929 = _927 + 0.5;
    float _931 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].x, _877);
    float _933 = fma(_891, _891, _923);
    float _935 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].y, _917);
    float _937 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[125].z, _919);
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _941 = rsqrt(_933);
    float _943 = _929 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _945 = _931 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _947 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _949 = _923;
    float _951 = _879;
    if (_921)
    {
        _949 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _953 = _949;
    float _955 = _937 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _957 = _939 * _709;
    float _959 = _943 * _903;
    float _961 = _945 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _963 = _947 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _965 = _955 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _967 = as_type<int>(_953);
    if (_921)
    {
        float _969 = _953 * 5.0;
        _967 = as_type<int>(_969);
    }
    int _971 = _967;
    out.m_58.x = _957;
    out.m_58.y = _959;
    float _973 = _873 * _941;
    out.m_60.x = _961;
    out.m_60.y = _963;
    out.m_60.z = _965;
    float _975 = _883 * _941;
    float _977 = as_type<float>(_971);
    if (_921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3242 = as_type<float>(_971);
        out.gl_Position.z = _3242;
    }
    if (_921)
    {
        out.m_45.x = 0.0;
    }
    if (_921)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _979 = -_973;
    float _981 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _861);
    float _983 = _891 * _941;
    float _985 = -_975;
    float _987 = fma(_985, (*spvDescriptorSet0.vp_c9)._m0[18].w, _869);
    float _989 = -_973;
    float _991 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _873);
    float _993 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _995 = _981 + _993;
    float _997 = -_983;
    float _999 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _879);
    float _1001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1003 = _987 + _1001;
    float _1005 = -_975;
    float _1007 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[18].w, _883);
    float _1009 = _995 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1011 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1013 = _999 + _1011;
    float _1015 = -_983;
    float _1017 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _891);
    float _1019 = _243 * _677;
    float _1021 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1009);
    float _1023 = _991 * _991;
    float _1025 = _243 * _675;
    float _1027 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1021);
    float _1029 = fma(_1007, _1007, _1023);
    bool _1031 = _1027 >= 0.0;
    float _1033 = fma(_1017, _1017, _1029);
    float _1035 = sqrt(_1033);
    float _1037 = _999;
    if (_1031)
    {
        _977 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1039 = _977;
    int _1041 = as_type<int>(_1039);
    if (_1031)
    {
        out.m_45.x = 0.0;
    }
    if (_1031)
    {
        float _1043 = _1039 * 5.0;
        _1041 = as_type<int>(_1043);
    }
    int _1045 = _1041;
    if (_1031)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3377 = as_type<float>(_1045);
        out.gl_Position.z = _3377;
    }
    float _1047 = _941 * _1035;
    if (_1031)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1049 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1051 = _1019 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1053 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _163);
    float _1055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _233);
    float _1057 = _1047 * _1049;
    float _1059 = _1047 * _1051;
    float _1061 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1063 = _1061 * 0.5;
    float _1065 = _1053 * _1057;
    float _1067 = _1055 * _1059;
    bool _1069 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1071 = isnan(0.5);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1077 = _1073 || _1075;
    float _1079 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1081 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1083 = _1065 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1085 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1079);
    float _1087 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1081);
    float _1089 = fma(_1067, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1083);
    float _1091 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1085);
    float _1093 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1087);
    float _1095 = fma(_1063, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1089);
    float _1097 = _1091 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1099 = _1093 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1101 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1103 = _879 + _1097;
    float _1105 = _869 + _1099;
    float _1107 = _861 + _1101;
    float _1109 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1111 = _1103 + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1115 = _1105 + _1113;
    float _1117 = _1111 * _1111;
    float _1119 = fma(_1115, _1115, _1117);
    float _1121 = sqrt(_1119);
    bool _1123 = _1121 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1125 = _1091;
    float _1127 = _1105;
    float _1129 = _1103;
    if (!_1123)
    {
        _1125 = _1107;
    }
    float _1131 = _1125;
    bool _1133 = !_1123;
    float _1135 = _1131;
    if (!_1133)
    {
        float _1137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1139 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1141 = _1121 + _1139;
        float _1143 = rsqrt(_1119);
        float _1145 = _1141 * _1137;
        float _1147 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = _1145 * 0.15915493667125701904296875;
        float _1151 = _1149 * 6.283185482025146484375;
        float _1153 = cos(_1151);
        float _1155 = _1149 * 6.283185482025146484375;
        float _1157 = sin(_1155);
        float _1159 = _1153 + (-1.0);
        float _1161 = _1159 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1163 = fma(_1157, _1147, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1165 = fma(_1107, _1153, _1161);
        float _1167 = _1143 * _1163;
        float _1169 = fma(_1115, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1171 = fma(_1111, _1167, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1127 = _1169;
        _1135 = _1165;
        _1129 = _1171;
    }
    float _1173 = _1127;
    float _1175 = _1135;
    float _1177 = _1129;
    float _1179 = -_975;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1173);
    float _1183 = -_973;
    float _1185 = fma(_1183, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1175);
    float _1187 = -_983;
    float _1189 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1177);
    float _1191 = _1185;
    float _1193 = _1181;
    float _1195 = _1189;
    float _1197 = _1173;
    if (!_1077)
    {
        float _1199 = _995 * _995;
        float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1203 = -_861;
        float _1205 = _1203 + _1175;
        float _1207 = -_879;
        float _1209 = _1207 + _1177;
        float _1211 = fma(_1003, _1003, _1199);
        float _1213 = fma(_1013, _1013, _1211);
        float _1215 = 1.0 / _1047;
        float _1217 = sqrt(_1213);
        float _1219 = precise::min(_1217, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1221 = _1219 * _1201;
        float _1223 = -_869;
        float _1225 = _1223 + _1173;
        float _1227 = _1221 * _1215;
        float _1229 = fma(_1225, _1227, _987);
        float _1231 = fma(_1205, _1227, _981);
        float _1233 = fma(_1209, _1227, _999);
        _1191 = _1231;
        _1193 = _1229;
        _1195 = _1233;
        _951 = _1209;
    }
    float _1235 = _1191;
    float _1237 = _1193;
    float _1239 = _1195;
    float _1241 = _951;
    float _1243 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1245 = _1235 + _1243;
    float _1247 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1249 = _1237 + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1253 = _1239 + _1251;
    float _1255 = _1245 * _1245;
    float _1257 = fma(_1249, _1249, _1255);
    float _1259 = fma(_1253, _1253, _1257);
    float _1261 = rsqrt(_1259);
    float _1263 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1265 = _1249 * _1263;
    float _1267 = _1253 * _1263;
    float _1269 = _1265 * _1265;
    float _1271 = _1267 * _1267;
    float _1273 = _1269 + _1271;
    float _1275 = sqrt(_1273);
    bool _1277 = _1275 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1281 = _1275 + _1279;
    float _1283 = _1253;
    float _1285 = _1273;
    float _1287 = _1281;
    float _1289 = _1241;
    float _1291 = _1245;
    float _1293 = _1265;
    if (_1277)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1295;
    }
    float _1297 = _1283;
    if (_1277)
    {
        float _1299 = rsqrt(_1273);
        _1285 = _1299;
    }
    float _1301 = _1285;
    if (_1277)
    {
        float _1303 = _1281 * _1297;
        _1287 = _1303;
    }
    float _1305 = _1287;
    if (_1277)
    {
        float _1307 = _1305 * 0.15915493667125701904296875;
        _1289 = _1307;
    }
    float _1309 = _1289;
    float _1311 = _1261;
    if (_1277)
    {
        float _1313 = _1309 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1321 = precise::max(0.0, _1319);
    float _1323 = _869;
    float _1325 = _1321;
    float _1327 = _1319;
    if (_1277)
    {
        float _1329 = _1309 * 6.283185482025146484375;
        float _1331 = cos(_1329);
        _1323 = _1331;
    }
    float _1333 = _1323;
    float _1335 = -_1263;
    float _1337 = -_1321;
    float _1339 = fma(_1245, _1335, _1337);
    if (!_1277)
    {
        _1325 = _1267;
    }
    float _1341 = _1325;
    float _1343 = _1341;
    if (_1277)
    {
        float _1345 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1327 = _1345;
    }
    float _1347 = _1327;
    float _1349 = _1317;
    float _1351 = _1347;
    if (_1277)
    {
        float _1353 = fma(_1317, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1349 = _1353;
    }
    float _1355 = _1349;
    float _1357 = _1355;
    if (_1277)
    {
        float _1359 = _1333 + (-1.0);
        _1351 = _1359;
    }
    float _1361 = _1351;
    float _1363 = _1361;
    if (_1277)
    {
        float _1365 = _1301 * _1355;
        _1197 = _1365;
    }
    float _1367 = _1197;
    if (!_1277)
    {
        _1357 = _1339;
    }
    float _1369 = _1357;
    float _1371 = sqrt(_1259);
    float _1373 = _1369;
    if (_1277)
    {
        float _1375 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1291 = _1375;
    }
    float _1377 = _1291;
    float _1379 = _1377;
    if (_1277)
    {
        float _1381 = _1265 * _1367;
        _1293 = _1381;
    }
    float _1383 = _1293;
    if (!_1277)
    {
        _1363 = _1269;
    }
    float _1385 = _1363;
    float _1387 = _1385;
    if (_1277)
    {
        float _1389 = _1267 * _1367;
        _1343 = _1389;
    }
    float _1391 = _1343;
    if (_1277)
    {
        float _1393 = fma(_1339, _1333, _1377);
        _1373 = _1393;
    }
    float _1395 = _1373;
    if (_1277)
    {
        float _1397 = _1383 * _1383;
        _1387 = _1397;
    }
    float _1399 = _1387;
    if (!_1277)
    {
        _1379 = _1271;
    }
    float _1401 = _1379;
    float _1403 = _1401;
    if (_1277)
    {
        float _1405 = _1391 * _1391;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1411 = fma(_1395, _1395, _1399);
    float _1413 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1415 = _1411 + _1407;
    float _1417 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1419 = fma(_1371, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1417);
    float _1421 = precise::clamp(_1419, 0.0, 1.0);
    float _1423 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1413);
    float _1425 = rsqrt(_1415);
    float _1427 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1429 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1431 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1423);
    float _1433 = -_1421;
    float _1435 = _1433 + 1.0;
    float _1437 = _1235 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1439 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1427);
    float _1441 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1443 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1437);
    float _1445 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1439);
    float _1447 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1409);
    float _1449 = abs(_1435);
    float _1451 = log2(_1449);
    float _1453 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1443);
    float _1455 = _1445 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1457 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1459 = _1425 * _1383;
    float _1461 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1463 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1465 = _1425 * _1395;
    float _1467 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1469 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1447);
    float _1471 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1463);
    float _1473 = _1425 * _1391;
    float _1475 = -_1467;
    float _1477 = fma(_1465, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1475);
    float _1479 = -_1457;
    float _1481 = fma(_1479, _1429, 1.0);
    float _1483 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1485 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1471);
    float _1487 = -_1473;
    float _1489 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1477);
    float _1491 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1493 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1495 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1485);
    float _1497 = fma(_1489, -0.5, 0.5);
    float _1499 = log2(_1481);
    float _1501 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1503 = fma(_1489, 0.5, 0.5);
    float _1505 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1493);
    float _1507 = _1465 + 1.0;
    float _1509 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1501);
    float _1511 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1505);
    float _1513 = 1.0 / _1495;
    float _1515 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1509);
    float _1517 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1515);
    float _1519 = exp2(_1491);
    float _1521 = _1499 * 0.693147182464599609375;
    float _1523 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1525 = sqrt(_1497);
    float _1527 = fma(_1503, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = _1517 * _1513;
    float _1531 = fma(_1503, _1527, -0.212114393711090087890625);
    float _1533 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1511);
    float _1535 = fma(_1529, -0.5, 0.5);
    float _1537 = -_1465;
    float _1539 = fma(_1519, _1507, _1537);
    float _1541 = fma(_1503, _1531, 1.570728778839111328125);
    float _1543 = _1533 * _1513;
    float _1545 = fma(_1539, 0.5, 0.5);
    float _1547 = fma(_1543, 0.5, 0.5);
    float _1549 = _1525 * 0.636619746685028076171875;
    float3 _4208 = float3(_1547, _1535, _1523);
    float _1551 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4208, float3(0.0), isnan(_4208)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4208, float3(0.0), isnan(_4208)), level(0.0)).x;
    float3 _4219 = float3(_1547, _1535, _1523);
    float4 _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4219, float3(0.0), isnan(_4219)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4219, float3(0.0), isnan(_4219)), level(0.0)).xyzw;
    float _1556 = _1554.x;
    float _1558 = _1554.y;
    float _1560 = _1554.z;
    float _1562 = _1554.w;
    float _1564 = -_1541;
    float _1566 = fma(_1549, _1564, 1.0);
    float2 _4241 = float2(_1566, _1545);
    float3 _1570 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4241, float2(0.0), isnan(_4241)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4241, float2(0.0), isnan(_4241)), level(0.0)).xyz;
    float _1572 = _1570.x;
    float _1574 = _1570.y;
    float _1576 = _1570.z;
    float _1578 = _981 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1580 = _981 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1582 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1584 = isnan(0.5);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1590 = _1586 || _1588;
    float _1592 = _1455 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1594 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1578);
    float _1596 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1580);
    float _1598 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1594);
    float _1600 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1596);
    float _1602 = _1598 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1604 = _1600 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1606 = _1535;
    float _1608 = _1592;
    float _1610 = _1598;
    float _1612 = _1451;
    if (!_1590)
    {
        _1037 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1614 = _1037;
    float _1616 = 1.0 / _1602;
    float _1618 = _1604 + _1602;
    float _1620 = _1614;
    if (!_1590)
    {
        _1606 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1622 = _1606;
    float _1624 = _1451 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1626 = exp2(_1624);
    float _1628 = _1618 * _1616;
    float _1630 = _1628 * 0.5;
    float _1632 = _1616;
    if (!_1590)
    {
        float _1634 = -_1614;
        float _1636 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1634);
        _1632 = _1636;
    }
    float _1638 = _1632;
    if (!_1590)
    {
        float _1640 = -_1622;
        float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1620 = _1642;
    }
    float _1644 = _1620;
    float _1646 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1592);
    if (_1590)
    {
        _1608 = 1.0;
    }
    float _1648 = _1608;
    float _1650 = _1648;
    if (!_1590)
    {
        float _1652 = 1.0 / _1644;
        _1610 = _1652;
    }
    float _1654 = _1610;
    float _1656 = fma(_1441, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1646);
    float _1658 = fma(_1483, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1656);
    float _1660 = _1638;
    if (!_1590)
    {
        float _1662 = 1.0 / _1638;
        _1660 = _1662;
    }
    float _1664 = _1660;
    float _1666 = -_1626;
    float _1668 = _1666 + 1.0;
    float _1670 = _1658 + _1495;
    float _1672 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1590)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1676 = -_1622;
        float _1678 = fma(_1664, _1674, _1676);
        _1612 = _1678;
    }
    float _1680 = _1612;
    float _1682 = _1670 * 0.5;
    if (!_1590)
    {
        float _1684 = _1680 * _1654;
        float _1686 = precise::clamp(_1684, 0.0, 1.0);
        _1650 = _1686;
    }
    float _1688 = _1650;
    out.m_62.z = _1682;
    out.m_62.w = _1495;
    float _1690 = _1688 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1692 = _1688 > 0.0;
    bool _1694 = isnan(_1688);
    bool _1696 = _1692 || _1694;
    bool _1698 = isnan(0.0);
    bool _1700 = _1696 || _1698;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1517;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1495;
    float _1702 = _1690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1702;
    float _1704 = _1672 * _1551;
    float _1706 = -_1672;
    float _1708 = _1706 + 1.0;
    float _1710 = _1562 * _1704;
    float _1712 = _1562 * _1708;
    float _1714 = _1576 * _1704;
    float _1716 = fma(_1572, _1710, _1556);
    float _1718 = fma(_1574, _1710, _1558);
    float _1720 = fma(_1562, _1714, _1560);
    out.m_64.x = _1716;
    out.m_64.y = _1718;
    out.m_64.z = _1720;
    out.m_64.w = _1712;
    if (_1700)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1722 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1722;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

