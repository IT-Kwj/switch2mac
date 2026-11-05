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
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _723 = false;
    bool _607 = false;
    bool _497 = false;
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
        float _3480 = as_type<float>(_105);
        out.gl_Position.z = _3480;
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
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3550 = as_type<float>(_143);
        out.gl_Position.z = _3550;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _307 = _123 * _123;
        float _309 = _307 * 0.5;
        _273 = _309;
    }
    float _311 = _273;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _319 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _321 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _321;
    }
    float _323 = _275;
    bool _325 = !_159;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _123 * _331;
        float _341 = exp2(_339);
        float _343 = _337 * 0.693147182464599609375;
        float _345 = 1.0 / _343;
        float _347 = 1.0 / _335;
        float _349 = _341 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _345, _123);
        float _355 = _353 * _347;
        float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _357;
    }
    float _359 = _327;
    float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    float _367 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _371 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _375 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].z, _373);
    float _383 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _385 = fma(_297, _161, _363);
    float _387 = fma(_297, _163, _365);
    float _389 = fma(_297, _165, _375);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _377);
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].z, _381);
    float _397 = _383;
    if (!_159)
    {
        _397 = _123;
    }
    float _399 = _397;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    float _429 = fma(_425, _161, _391);
    float _431 = fma(_425, _165, _395);
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_429;
    float _445 = _385 + _443;
    float _447 = -_431;
    float _449 = _389 + _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = fma(_389, _149, _171);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _463 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _463);
    bool _471 = !_433;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = in.m_52.x;
    float _513 = in.m_52.y;
    bool _515 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_505);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _533 = 1.0 / _529;
    float _535 = -_525;
    float _537 = _535 + 1.0;
    float _539 = _509 * _533;
    bool _541 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _543 = isnan(_505);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    float _561 = _551 * _537;
    float _563 = fma(_555, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _565 = fma(_559, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _567 = -_551;
    float _569 = _567 + 1.0;
    float _571 = _563 * _561;
    float _573 = _565 * _561;
    float _575 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _571);
    float _577 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _579 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].x, _575);
    float _581 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].y, _577);
    float _583 = _579 * _511;
    float _585 = _581 * _513;
    bool _587 = !_531;
    float _605;
    if (!_587)
    {
        float _589 = in.m_54.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_89);
        float _611 = 1.0 / _609;
        float _613 = _123 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    bool _617 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = isnan(_615);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _635 = isnan(_615);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _615 + _649;
    float _653 = -_627;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = 1.0 / _631;
    float _661 = _643 * _655;
    float _663 = -_643;
    float _665 = _663 + 1.0;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _669 = _647 * _659;
    float _671 = fma(_669, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _675 = _671 * _661;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _679 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _681 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[116].x, _679);
    float _683 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _683;
    out.m_56.y = _685;
    out.m_56.z = _687;
    out.m_56.w = _689;
    bool _691 = !_657;
    float _693 = _689;
    float _717;
    float _719;
    float _721;
    if (!_691)
    {
        float _695 = in.m_54.x;
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _699 = float(_89);
        float _701 = 1.0 / _699;
        float _703 = _695 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _705 = _123 * _701;
        float _707 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _709 = _707 * _697;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _717 = _705;
        _719 = _699;
        _693 = _697;
        _721 = _715;
        _723 = true;
    }
    else
    {
        float _725 = float(_89);
        float _727 = 1.0 / _725;
        float _729 = _123 * _727;
        _717 = _729;
        _719 = _725;
        _721 = _729;
    }
    _723 = false;
    float _731 = _717;
    float _733 = _719;
    float _735 = _693;
    float _737 = _721;
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _741 = int(_739);
    float _743 = in.m_54.x;
    float _745 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _749 = _731 + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _755 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _757 = int(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _771 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    float _773 = 1.0 / _733;
    float _775 = float(_741);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _785 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _789 = _787 != 0;
    float _791 = 1.0 / _775;
    float _793 = float(uint(_757));
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _799 = ~_757;
    int _801 = _799 + 1;
    float _803 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _805 = float(_757);
    float _807 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _809 = _757 == 0;
    float _811 = 1.0 / _793;
    bool _813 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _815 = isnan(_731);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = _735;
    float _827 = as_type<float>(_757);
    if (!_789)
    {
        float _829 = in.m_54.y;
        _825 = _829;
    }
    float _831 = _825;
    bool _833 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _835 = isnan(_737);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _853 = _123 * _791;
    int _855 = ~_757;
    int _857 = _855 + 1;
    float _859 = 1.0 / _753;
    bool _861 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _863 = isnan(_731);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -_823;
    float _875 = _873 + 1.0;
    bool _877 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _879 = isnan(_731);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    bool _889 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _891 = isnan(_731);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    int _901 = as_type<int>(_811) + (-2);
    float _903 = trunc(_853);
    int _905 = int(_903);
    float _907 = 1.0 / _761;
    float _909 = _791;
    if (!_789)
    {
        _909 = _831;
    }
    float _911 = _909;
    float _913 = float(uint(_905));
    float _915 = _911;
    int _917 = as_type<int>(_831);
    if (_789)
    {
        float _919 = in.m_54.x;
        float _921 = in.m_54.y;
        _915 = _919;
        _917 = as_type<int>(_921);
    }
    float _923 = _915;
    int _925 = _917;
    float _927 = 1.0 / _765;
    float _929 = as_type<float>(_901) * _913;
    float _931 = trunc(_929);
    float _933 = precise::max(_931, 0.0);
    uint _936 = uint(_933);
    float _938 = 1.0 / _769;
    bool _940 = !_789;
    float _942 = _940 ? as_type<float>(_925) : _743;
    int _944 = _857 * int(_936);
    int _946 = _944 + _905;
    float _948 = 1.0 / _779;
    float _950 = float(uint(_946));
    float _952 = 1.0 / _783;
    float _954 = as_type<float>(_901) * _950;
    bool _956 = !_789;
    float _958 = _956 ? 1.2345600128173828125 : 1.0;
    float _960 = float(_905);
    float _962 = _958 * _942;
    float _964 = trunc(_954);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    bool _970 = _960 >= _805;
    bool _972 = isnan(_960);
    bool _974 = _970 || _972;
    bool _976 = isnan(_805);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = floor(_962);
    int _984 = int(_936) + int(_968);
    float _986 = trunc(_980);
    int _988 = int(_986);
    float _990 = _123 * _805;
    int _992 = _801 * _984;
    int _994 = _992 + _905;
    float _996 = _990 * _773;
    int _998 = _757 + (-1);
    float _1000 = 1.0 / _797;
    bool _1002 = uint(_994) >= uint(_757);
    bool _1004 = !_1002;
    int _1006 = _1004 ? 0 : (-1);
    float _1008 = trunc(_996);
    int _1010 = int(_1008);
    int _1012 = ~_984;
    int _1014 = _1012 + _1006;
    int _1016 = _1014 + 1;
    float _1018 = -_982;
    float _1020 = _962 + _1018;
    int _1022 = ~_988;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _757 * _1016;
    int _1030 = _1028 + _905;
    float _1032 = _805 * _1020;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1036 = _1034 != 0;
    float _1038 = trunc(_1032);
    int _1040 = int(_1038);
    bool _1042 = !_809;
    int _1044 = _1042 ? _1030 : (-1);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1048 = _1046 != 0;
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1052 = _1050 != 0;
    int _1054 = _1026 * _1044;
    bool _1056 = !_1036;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1066 = _1064 != 0;
    int _1068 = _988 * _998;
    int _1070 = _1068 + _1054;
    bool _1072 = !_1052;
    int _1074 = _1072 ? 0 : 1;
    bool _1076 = !_1048;
    int _1078 = _1076 ? 0 : 1;
    int _1080 = abs(_1058);
    int _1082 = abs(_1074);
    bool _1084 = !_1062;
    int _1086 = _1084 ? 0 : 1;
    int _1088 = abs(_1078);
    int _1090 = _1070 * _1082;
    bool _1092 = !_1066;
    int _1094 = _1092 ? 0 : 1;
    int _1096 = abs(_1086);
    int _1098 = _1040 * _1080;
    int _1100 = _1098 + _905;
    int _1102 = abs(_1094);
    int _1104 = _1010 * _1088;
    int _1106 = _1104 + _1090;
    int _1108 = ~_757;
    int _1110 = _1108 + 1;
    int _1112 = _1100 * _1096;
    int _1114 = _1112 + _1106;
    int _1116 = ~_757;
    int _1118 = _1116 + 1;
    float _1120 = in.m_54.z;
    int _1122 = _1040 * _1102;
    int _1124 = _1122 + _1114;
    float _1126 = float(uint(_1124));
    float _1128 = as_type<float>(_901) * _1126;
    float _1130 = trunc(_1128);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    int _1136 = _1118 * int(_1134);
    int _1138 = _1136 + _1124;
    float _1140 = float(uint(_1138));
    float _1142 = as_type<float>(_901) * _1140;
    float _1144 = trunc(_1142);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    float _1150 = _743 * 2.0;
    float _1152 = floor(_1150);
    int _1154 = int(_1134) + int(_1148);
    float _1156 = in.m_54.w;
    int _1158 = _1110 * _1154;
    int _1160 = _1158 + _1124;
    float _1162 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1164 = log2(_1162);
    bool _1166 = uint(_1160) >= uint(_757);
    bool _1168 = !_1166;
    int _1170 = _1168 ? 0 : (-1);
    bool _1172 = _1152 >= 0.0;
    bool _1174 = isnan(_1152);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(0.0);
    bool _1180 = _1176 || _1178;
    int _1182 = ~_1154;
    int _1184 = _1182 + _1170;
    int _1186 = _1184 + 1;
    int _1188 = _1180 ? 0 : 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1192 = _1190 != 0;
    int _1194 = _757 * _1186;
    int _1196 = _1194 + _1124;
    float _1198 = _123 * _1164;
    bool _1200 = _1156 > 0.5;
    bool _1202 = !_809;
    int _1204 = _1202 ? _1196 : (-1);
    float _1206 = -_225;
    int _1208 = _1200 ? as_type<int>(_1206) : as_type<int>(_225);
    float _1210 = exp2(_1198);
    int _1212 = _1204 & 3;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1218 = _1216 != 0;
    bool _1220 = uint(_1212) > 1u;
    int _1222 = _1214 ? 0 : 1;
    bool _1224 = _1120 > 0.5;
    int _1226 = ~_1222;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = -_221;
    int _1234 = _1224 ? as_type<int>(_1232) : as_type<int>(_221);
    bool _1236 = _1152 > 0.0;
    float _1238 = -_1210;
    float _1240 = _1238 + 1.0;
    int _1242 = ~_1188;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = _1230;
    int _1250 = _1246;
    if (!_1220)
    {
        int _1252 = ~_1222;
        int _1254 = _1252 + 1;
        _1248 = _1254;
    }
    int _1256 = _1248;
    bool _1258 = _743 > 0.5;
    bool _1260 = !_1218;
    float _1262 = _1260 ? _221 : as_type<float>(_1234);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1278 = _1276 != 0;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1284 = !_1192;
    float _1286 = _1284 ? _225 : as_type<float>(_1208);
    float _1288 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1236)
    {
        int _1290 = ~_1188;
        int _1292 = _1290 + 1;
        _1250 = _1292;
    }
    int _1294 = _1250;
    float _1296 = 1.0 / _1266;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1300 = _1298 != 0;
    float _1302 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1288);
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    float _1314 = _1120 * 2.0;
    float _1316 = 1.0 / _1282;
    float _1318 = -_221;
    int _1320 = _1258 ? as_type<int>(_1318) : as_type<int>(_221);
    float _1322 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1302);
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1326 = _1324 != 0;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1328;
    float _1332 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1308);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1336 = _737 + _1334;
    float _1338 = floor(_1314);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1342 = _737 + _1340;
    float _1344 = _1330 * _859;
    float _1346 = _1336 * _907;
    float _1348 = _1342 * _927;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1366 = _1352 * _938;
    float _1368 = _1356 * _1296;
    float _1370 = 0.0;
    if (!_1326)
    {
        _1370 = _1120;
    }
    float _1372 = _1370;
    float _1374 = _1360 * _1316;
    float _1376 = 0.0;
    float _1378 = _1372;
    if (!_1326)
    {
        _1376 = _1120;
    }
    float _1380 = _1376;
    float _1382 = _1364 * _948;
    float _1384 = _1380;
    if (_1326)
    {
        _1378 = as_type<float>(_925);
    }
    float _1386 = _1378;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1326)
    {
        _1384 = as_type<float>(_925);
    }
    float _1392 = _1384;
    float _1394 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1322);
    float _1396 = _1390 * _952;
    bool _1398 = _1338 >= 0.0;
    bool _1400 = isnan(_1338);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1410 = _731 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1412;
    int _1416 = _1406 ? 0 : 1;
    float _1418 = fma(_1344, _1410, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1420 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1422 = isnan(0.0);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1428 = _1424 || _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1430;
    float _1434 = fma(_1414, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1436 = _1428 ? _1240 : 0.0;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1440 = _731 + _1438;
    bool _1442 = _1338 > 0.0;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1446 = _1444 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1452 = fma(_1366, _1440, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1454 = _1432 * _1000;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1458 = _731 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1460;
    float _1464 = fma(_1446, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1466 = fma(_851, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1468 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1470 = isnan(_731);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = fma(_1450, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1482 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1484 = isnan(_731);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = fma(_847, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1498 = _731 + _1496;
    float _1500 = fma(_1374, _1458, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1502 = fma(_1462, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1504 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1506 = isnan(_731);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = -_1478;
    float _1518 = _1516 + 1.0;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1522 = _731 + _1520;
    float _1524 = fma(_1368, _1498, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1526 = -_1492;
    float _1528 = _1526 + 1.0;
    bool _1530 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1532 = isnan(_731);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = _1492 * _1518;
    float _1544 = -_1514;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1382, _1522, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1550 = _1514 * _1528;
    bool _1552 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1554 = isnan(_737);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = fma(_1396, _749, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1566 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1568 = isnan(_737);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = _1540 * _1546;
    float _1580 = -_1540;
    float _1582 = _1580 + 1.0;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1586 = 1.0 + _1584;
    float _1588 = _923 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1590 = -_1576;
    float _1592 = _1590 + 1.0;
    float _1594 = _823 * _1582;
    float _1596 = _871 * _875;
    float _1598 = -_871;
    float _1600 = _1598 + 1.0;
    float _1602 = 1.0 / _1586;
    float _1604 = _843 * _1592;
    float _1606 = -_843;
    float _1608 = _1606 + 1.0;
    float _1610 = _887 * _1600;
    float _1612 = -_887;
    float _1614 = _1612 + 1.0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1618 = _731 + _1616;
    float _1620 = _1562 * _1608;
    float _1622 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1624 = _899 * _1614;
    float _1626 = fma(_1454, _1618, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1628 = _1434 * _1620;
    float _1630 = _1494 * _1620;
    float _1632 = _1502 * _1620;
    float _1634 = _1418 * _1624;
    float _1636 = -_1562;
    float _1638 = _1636 + 1.0;
    float _1640 = _1436 * _1602;
    float _1642 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1628);
    float _1644 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1630);
    float _1646 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1632);
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1650 = -_899;
    float _1652 = _1650 + 1.0;
    float _1654 = fma(_1466, _1604, _1644);
    float _1656 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1648);
    int _1658 = ~_1416;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1634);
    int _1666 = _1662;
    if (!_1442)
    {
        int _1668 = ~_1416;
        int _1670 = _1668 + 1;
        _1666 = _1670;
    }
    int _1672 = _1666;
    float _1674 = fma(_1464, _1604, _1642);
    float _1676 = fma(_1480, _1604, _1646);
    float _1678 = as_type<float>(_925) * 2.0;
    float _1680 = fma(_1548, _1610, _1664);
    float _1682 = _743 + as_type<float>(_925);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1688 = floor(_1678);
    float _1690 = _1682 + (-1.0);
    float _1692 = fma(_1622, -2.0, _1686);
    float _1694 = float(uint(_1100));
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1698 = -_1684;
    float _1700 = fma(_1588, 2.0, _1698);
    float _1702 = _1120 + as_type<float>(_925);
    float _1704 = fma(_1452, _1596, _1680);
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1708 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1696);
    float _1710 = _1262 + 0.5;
    float _1712 = -_123;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1700);
    float _1716 = as_type<float>(_901) * _1694;
    bool _1718 = !_1306;
    float _1720 = _1718 ? _221 : as_type<float>(_1320);
    float _1722 = _1702 + (-1.0);
    bool _1724 = as_type<float>(_925) > 0.5;
    float _1726 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1676);
    bool _1728 = !_1270;
    int _1730 = _1728 ? 0 : 1;
    float _1732 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1714);
    float _1734 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1736 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _803 + _1738;
    float _1742 = -_225;
    int _1744 = _1724 ? as_type<int>(_1742) : as_type<int>(_225);
    float _1746 = trunc(_1716);
    float _1748 = precise::max(_1746, 0.0);
    uint _1750 = uint(_1748);
    bool _1752 = _1688 > 0.0;
    float _1754 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1654);
    bool _1756 = _1688 >= 0.0;
    bool _1758 = isnan(_1688);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.0);
    bool _1764 = _1760 || _1762;
    float _1766 = _1394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1768 = !_1274;
    int _1770 = _1768 ? 0 : 1;
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1774 = _1736 + _1772;
    int _1776 = abs(_1730);
    float _1778 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1780 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1674);
    int _1782 = abs(_1770);
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1786 = _1766 + _1784;
    int _1788 = ~_757;
    int _1790 = _1788 + 1;
    float _1792 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1778);
    float _1794 = float(_1782);
    float _1796 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1692);
    float _1798 = float(_1294);
    float _1800 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1792);
    float _1802 = float(_1672);
    float _1804 = fma(_1524, _1594, _1704);
    float _1806 = in.m_58.x;
    float _1808 = in.m_58.y;
    float _1810 = in.m_58.z;
    float _1812 = _1794 * _1798;
    int _1814 = _1764 ? 0 : 1;
    float _1816 = _1720 + 0.5;
    int _1818 = _1790 * int(_1750);
    int _1820 = _1818 + _1100;
    bool _1822 = _1800 >= 0.0;
    float _1824 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1656);
    int _1826 = _1204 >> 31;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1830 = float(uint(_1820));
    float _1832 = -_1824;
    float _1834 = _1832 + 1.0;
    int _1836 = _1826 & 3;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1840 = float(_1776);
    float _1842 = as_type<float>(_901) * _1830;
    int _1844 = _1204 + _1836;
    float _1846 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1708);
    float _1848 = -_1834;
    float _1850 = fma(_1262, _1848, _1732);
    float _1852 = _1840 * _1802;
    float _1854 = _1286 + (-0.5);
    int _1856 = _1844 >> 2;
    float _1858 = trunc(_1842);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    float _1864 = _1852 * (-2.0);
    float _1866 = -_1854;
    float _1868 = -_1796;
    float _1870 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1868);
    int _1872 = ~_1814;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    float _1878 = -_1846;
    float _1880 = _1878 + 1.0;
    int _1882 = _1856 << 4;
    int _1884 = _1882 + 512;
    float _1886 = fma(_1706, _1864, _1706);
    int _1888 = _1876;
    if (!_1752)
    {
        int _1890 = ~_1814;
        int _1892 = _1890 + 1;
        _1888 = _1892;
    }
    int _1894 = _1888;
    float _1896 = fma(_1864, _1806, _1806);
    float _1898 = _1812 * (-2.0);
    float _1900 = _1828 * _1838;
    uint _1902 = uint(int(uint(_1884) >> uint(2)));
    uint _1904 = uint(int(uint(int(_1902)) >> uint(2)));
    int _1906 = int(_1902) & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    int _1910 = int(_1902) + 1;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    int _1914 = _1910 & 3;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[int(_1912)][_1914];
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1920 = fma(_1734, _1898, _1734);
    float _1922 = fma(_1898, _1808, _1808);
    float _1924 = fma(_1500, _1578, _1804);
    int _1926 = int(_1750) + int(_1862);
    float _1928 = fma(_1286, _1880, _1870);
    bool _1930 = !_1312;
    float _1932 = _1930 ? _225 : as_type<float>(_1744);
    int _1934 = _1884 + 8;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    uint _1938 = uint(int(uint(int(_1936)) >> uint(2)));
    int _1940 = int(_1936) & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    int _1944 = int(_1936) + 1;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    int _1948 = _1944 & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    bool _1952 = uint(_1212) >= 2u;
    float _1954 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1956 = ~_757;
    int _1958 = _1956 + 1;
    float _1960 = -_1932;
    float _1962 = _1960 + 0.5;
    int _1964 = _1952 ? 0 : 1;
    float _1966 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1968 = _1212 != 3;
    float _1970 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1972 = ~_1964;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1980 = _1970 * _1918;
    int _1982 = _1958 * _1926;
    int _1984 = _1982 + _1100;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1992 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1994 = abs(_1256);
    float _1996 = fma(_1564, _1550, _1924);
    int _1998 = _1976;
    if (_1968)
    {
        int _2000 = ~_1964;
        int _2002 = _2000 + 1;
        _1998 = _2002;
    }
    int _2004 = _1998;
    out.m_60.x = _1900;
    out.m_60.y = _1980;
    out.m_60.z = _1850;
    out.m_60.w = _1928;
    int _2006 = _1204 & 3;
    bool _2008 = _2006 != 0;
    float _2010 = fma(_1626, _1542, _1996);
    int _2012 = abs(_2004);
    out.m_62.x = _1986;
    out.m_62.y = _1988;
    out.m_62.z = _1992;
    out.m_62.w = _1990;
    bool _2014 = !_2008;
    int _2016 = _2014 ? 0 : 1;
    float _2018 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2010);
    bool _2020 = uint(_1984) >= uint(_757);
    if (_1822)
    {
        out.m_45.x = 0.0;
    }
    int _2022 = abs(_2016);
    float _2024 = as_type<float>(_925) + (-0.5);
    bool _2026 = !_2020;
    int _2028 = _2026 ? 0 : (-1);
    out.m_64.x = _2018;
    bool _2030 = _1212 != 3;
    float _2032 = _743 + (-0.5);
    int _2034 = ~_1926;
    int _2036 = _2034 + _2028;
    int _2038 = _2036 + 1;
    float _2040 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1896);
    int _2042 = ~_1994;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    bool _2048 = !_2030;
    int _2050 = _2048 ? 0 : (-1);
    int _2052 = _757 * _2038;
    int _2054 = _2052 + _1100;
    int _2056 = ~_2022;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = _2046 * as_type<int>(_1916);
    bool _2064 = !_1300;
    int _2066 = _2064 ? 0 : 1;
    int _2068 = abs(_2050);
    int _2070 = _2060 * as_type<int>(_1908);
    int _2072 = _2070 + _2062;
    int _2074 = abs(_2066);
    float _2076 = _1740 * _1740;
    int _2078 = ~_2012;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = ~_2068;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_1774, _1774, _2076);
    bool _2092 = _757 == 0;
    int _2094 = _2082 * as_type<int>(_1942);
    int _2096 = _2094 + _2072;
    int _2098 = ~_2074;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = fma(_1786, _1786, _2090);
    float _2106 = as_type<float>(_2072);
    if (_1822)
    {
        _2106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2108 = _2106;
    int _2110 = _2088 * as_type<int>(_1950);
    int _2112 = _2110 + _2096;
    bool _2114 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2116 = isnan(1.0);
    bool _2118 = _2114 || _2116;
    bool _2120 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2122 = _2118 || _2120;
    float _2124 = rsqrt(_2104);
    int _2126 = _2102 * _2112;
    bool _2128 = !_2092;
    int _2130 = _2128 ? _2054 : (-1);
    int _2132 = as_type<int>(_2108);
    if (_1822)
    {
        float _2134 = _2108 * 5.0;
        _2132 = as_type<int>(_2134);
    }
    int _2136 = _2132;
    bool _2138 = !_2122;
    float _2140 = _2138 ? _123 : _1640;
    int _2142 = _2130 * _2074;
    int _2144 = _2142 + _2126;
    float _2146 = _807 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2148 = !_1278;
    int _2150 = _2148 ? 0 : 1;
    if (_1822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6598 = as_type<float>(_2136);
        out.gl_Position.z = _6598;
    }
    float _2152 = fma(_2140, _1886, _2040);
    float _2154 = float(_2144);
    float _2156 = _2146 * _2124;
    out.m_66.y = _2154;
    float _2158 = _1774 * _2156;
    float _2160 = _1740 * _2156;
    int _2162 = abs(_2150);
    if (_1822)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2164 = -_2160;
    float _2166 = _803 + _2164;
    float _2168 = _1786 * _2156;
    float _2170 = -_2158;
    float _2172 = _1736 + _2170;
    float _2174 = -_2160;
    float _2176 = _1740 + _2174;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2180 = _2166 + _2178;
    float _2182 = -_2168;
    float _2184 = _1766 + _2182;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2188 = _2172 + _2186;
    float _2190 = float(_2162);
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2196 = _2184 + _2194;
    float _2198 = float(_1894);
    float _2200 = -_2158;
    float _2202 = _1774 + _2200;
    float _2204 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2192);
    float _2206 = _2176 * _2176;
    float _2208 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1922);
    float _2210 = -_2168;
    float _2212 = _1786 + _2210;
    float _2214 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2204);
    float _2216 = fma(_2202, _2202, _2206);
    float _2218 = _2190 * _2198;
    float _2220 = _743 + _1120;
    float _2222 = fma(_2140, _1920, _2208);
    bool _2224 = _2214 >= 0.0;
    float _2226 = fma(_2212, _2212, _2216);
    float _2228 = _2220 + (-1.0);
    float _2230 = _2218 * (-2.0);
    float _2232 = _2152 * 0.15915493667125701904296875;
    float _2234 = _2222 * 0.15915493667125701904296875;
    float _2236 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2238 = fma(_2230, _1810, _1810);
    float _2240 = _1120 + (-0.5);
    float _2242 = _2232 * 6.283185482025146484375;
    float _2244 = sin(_2242);
    float _2246 = fma(_2236, _2230, _2236);
    int _2248 = as_type<int>(_2238);
    float _2250 = _2188;
    float _2252 = _2184;
    if (_2224)
    {
        _827 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2254 = _827;
    float _2256 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2238);
    if (_2224)
    {
        out.m_45.x = 0.0;
    }
    float _2258 = _2232 * 6.283185482025146484375;
    float _2260 = cos(_2258);
    if (_2224)
    {
        float _2262 = _2254 * 5.0;
        _2248 = as_type<int>(_2262);
    }
    int _2264 = _2248;
    float _2266 = fma(_2140, _2246, _2256);
    if (_2224)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6790 = as_type<float>(_2264);
        out.gl_Position.z = _6790;
    }
    float _2268 = _2266 * 0.15915493667125701904296875;
    float _2270 = _2234 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = sqrt(_2226);
    float _2276 = _2234 * 6.283185482025146484375;
    float _2278 = cos(_2276);
    if (_2224)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2280 = _2268 * 6.283185482025146484375;
    float _2282 = cos(_2280);
    float _2284 = _2124 * _2274;
    float _2286 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2292 = _807 * _2284;
    float _2294 = _2284 * _2286;
    float _2296 = _2260 * _2278;
    float _2298 = _2268 * 6.283185482025146484375;
    float _2300 = sin(_2298);
    float _2302 = _2290 * _2292;
    float _2304 = _2288 * _2294;
    float _2306 = _2244 * _2272;
    float _2308 = _2260 * _2272;
    float _2310 = _2244 * _2278;
    float _2312 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2314 = _2312 * 0.5;
    float _2316 = _2282 * _2304;
    float _2318 = _2272 * _2282;
    float _2320 = _2278 * _2282;
    float _2322 = _2260 * _2316;
    float _2324 = _2244 * _2316;
    float _2326 = fma(_2300, _2296, _2306);
    float _2328 = -_2304;
    float _2330 = _2300 * _2328;
    float _2332 = fma(_2300, _2306, _2296);
    float _2334 = fma(_2326, _2302, _2322);
    float _2336 = -_2310;
    float _2338 = fma(_2300, _2308, _2336);
    float _2340 = fma(_2320, _2302, _2330);
    float _2342 = -_2308;
    float _2344 = fma(_2300, _2310, _2342);
    float _2346 = fma(_2338, _2314, _2334);
    float _2348 = fma(_2318, _2314, _2340);
    float _2350 = fma(_2344, _2302, _2324);
    float _2352 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2356 = fma(_2332, _2314, _2350);
    float _2358 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2352);
    float _2360 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2354);
    float _2362 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    float _2364 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2360);
    float _2366 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2368 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2370 = _1766 + _2366;
    float _2372 = _1736 + _2368;
    float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2376 = _2370 + _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2380 = _2372 + _2378;
    float _2382 = _2376 * _2376;
    float _2384 = fma(_2380, _2380, _2382);
    float _2386 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2388 = sqrt(_2384);
    float _2390 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2386);
    float _2392 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2390);
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2396 = _803 + _2394;
    bool _2398 = _2388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2400 = _2386;
    float _2402 = _2356;
    float _2404 = _2372;
    float _2406 = _2316;
    float _2408 = _2334;
    if (!_2398)
    {
        _2400 = _2372;
    }
    float _2410 = _2400;
    float _2412 = _2410;
    if (!_2398)
    {
        _2402 = _2370;
    }
    float _2414 = _2402;
    float _2416 = _2414;
    if (!_2398)
    {
        _2404 = _2396;
    }
    float _2418 = _2404;
    bool _2420 = !_2398;
    float _2422 = _2418;
    if (!_2420)
    {
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2428 = _2388 + _2426;
        float _2430 = rsqrt(_2384);
        float _2432 = _2428 * _2424;
        float _2434 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2436 = _2432 * 0.15915493667125701904296875;
        float _2438 = _2436 * 6.283185482025146484375;
        float _2440 = cos(_2438);
        float _2442 = _2436 * 6.283185482025146484375;
        float _2444 = sin(_2442);
        float _2446 = _2440 + (-1.0);
        float _2448 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2450 = fma(_2444, _2434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2452 = fma(_2396, _2440, _2448);
        float _2454 = _2430 * _2450;
        float _2456 = fma(_2380, _2454, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2458 = fma(_2376, _2454, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2422 = _2452;
        _2412 = _2456;
        _2416 = _2458;
    }
    float _2460 = _2422;
    float _2462 = _2412;
    float _2464 = _2416;
    float _2466 = -_803;
    float _2468 = _2466 + _2460;
    float _2470 = -_1736;
    float _2472 = _2470 + _2462;
    float _2474 = -_1766;
    float _2476 = _2474 + _2464;
    float _2478 = _2468 * _2468;
    float _2480 = fma(_2472, _2472, _2478);
    float _2482 = fma(_2476, _2476, _2480);
    float _2484 = sqrt(_2482);
    bool _2486 = _2484 > 0.0;
    float _2488 = _2480;
    float _2490 = _2484;
    float _2492 = _2464;
    if (!_2486)
    {
        _2488 = _2462;
    }
    float _2494 = _2488;
    float _2496 = _2494;
    float _2498 = _2494;
    if (!_2486)
    {
        _2490 = _2460;
    }
    float _2500 = _2490;
    bool _2502 = !_2486;
    float _2504 = _2500;
    float _2506 = _2500;
    if (!_2502)
    {
        bool _2508 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2510 = _2376;
        if (_2508)
        {
            float _2512 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2510 = _2512;
        }
        float _2514 = _2510;
        float _2516 = _2514;
        if (_2508)
        {
            float _2518 = _465 * _2514;
            _2406 = _2518;
        }
        float _2520 = _2406;
        float _2522 = _2520;
        if (_2508)
        {
            float _2524 = _467 * _2514;
            _2408 = _2524;
        }
        float _2526 = _2408;
        float _2528 = _2526;
        if (_2508)
        {
            float _2530 = _469 * _2514;
            _2516 = _2530;
        }
        float _2532 = _2516;
        float _2534 = _2532;
        if (!_2508)
        {
            bool _2536 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2540 = _2536 || _2538;
            bool _2542 = isnan(1.0);
            bool _2544 = _2540 || _2542;
            float _2546 = _123 + 1.0;
            if (!_2544)
            {
                float _2548 = _2546 * _2546;
                float _2550 = _2548 * 0.5;
                _125 = _2550;
            }
            float _2552 = _125;
            float _2554 = _2552;
            if (!_2544)
            {
                float _2556 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2554 = _2556;
            }
            float _2558 = _2554;
            bool _2560 = !_2544;
            float _2562 = _2558;
            if (!_2560)
            {
                float _2564 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2566 = log2(_2564);
                float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2570 = 1.0 + _2568;
                float _2572 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2574 = _2566 * _2546;
                float _2576 = 1.0 / _2570;
                float _2578 = _2572 * 0.693147182464599609375;
                float _2580 = exp2(_2574);
                float _2582 = 1.0 / _2578;
                float _2584 = _2580 + (-1.0);
                float _2586 = -_2584;
                float _2588 = fma(_2586, _2582, _2546);
                float _2590 = _2588 * _2576;
                float _2592 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2562 = _2592;
            }
            float _2594 = _2562;
            float _2596 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2598 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2600 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2602 = _2594;
            if (!_2544)
            {
                _2602 = _2546;
            }
            float _2604 = _2602;
            float _2606 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2608 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2610 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2612 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2606);
            float _2614 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2608);
            float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2612);
            bool _2618 = !_2544;
            float _2620 = _2604;
            _2496 = _2614;
            if (!_2618)
            {
                float _2622 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2624 = log2(_2622);
                float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2628 = 1.0 + _2626;
                float _2630 = 1.0 / _2628;
                float _2632 = _2624 * _2546;
                float _2634 = exp2(_2632);
                float _2636 = -_2634;
                float _2638 = _2636 + 1.0;
                float _2640 = _2638 * _2630;
                _2620 = _2640;
            }
            float _2642 = _2620;
            float _2644 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2610);
            float _2646 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2614);
            float _2648 = fma(_2642, _163, _2616);
            float _2650 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2644);
            float _2652 = fma(_2642, _161, _2646);
            float _2654 = -_427;
            float _2656 = _2654 + _2648;
            float _2658 = fma(_2642, _165, _2650);
            float _2660 = -_429;
            float _2662 = _2660 + _2652;
            float _2664 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2666 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2668 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2670 = -_431;
            float _2672 = _2670 + _2658;
            float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2664);
            float _2676 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2666);
            float _2678 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2668);
            float _2680 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2674);
            float _2682 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2676);
            float _2684 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2678);
            _473 = _2682;
            _475 = _2680;
            _477 = _2684;
            _2522 = _2680;
            _2528 = _2682;
            _2534 = _2684;
            _2504 = _2650;
        }
        float _2686 = _473;
        float _2688 = _475;
        float _2690 = _477;
        float _2692 = _2522;
        float _2694 = _2528;
        float _2696 = _2534;
        float _2698 = _2504;
        float _2700 = _2496;
        float _2702 = _2686 * _2686;
        float _2704 = rsqrt(_2482);
        float _2706 = fma(_2688, _2688, _2702);
        float _2708 = fma(_2690, _2690, _2706);
        float _2710 = sqrt(_2708);
        float _2712 = _2472 * _2704;
        float _2714 = _2468 * _2704;
        float _2716 = _2476 * _2704;
        bool _2718 = _2710 > 0.0;
        float _2720 = _2700;
        float _2722 = _2698;
        if (!_2718)
        {
            _2720 = _2462;
        }
        float _2724 = _2720;
        _2498 = _2724;
        if (!_2718)
        {
            _2722 = _2460;
        }
        float _2726 = _2722;
        bool _2728 = !_2718;
        _2506 = _2726;
        if (!_2728)
        {
            float _2730 = rsqrt(_2708);
            float _2732 = _2730 * _2686;
            float _2734 = _2730 * _2688;
            float _2736 = _2730 * _2690;
            float _2738 = _2714 * _2732;
            float _2740 = fma(_2712, _2734, _2738);
            float _2742 = fma(_2716, _2736, _2740);
            float _2744 = _2742 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2746 = fma(_2692, _2744, _2462);
            float _2748 = fma(_2694, _2744, _2460);
            float _2750 = fma(_2696, _2744, _2464);
            _2506 = _2748;
            _2492 = _2750;
            _2498 = _2746;
        }
    }
    float _2752 = _2506;
    float _2754 = _2492;
    float _2756 = _2498;
    float _2758 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2762 = isnan(0.5);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2768 = _2764 || _2766;
    float _2770 = -_2160;
    float _2772 = _2770 + _2752;
    bool _2774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2776 = isnan(0.5);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2782 = _2778 || _2780;
    float _2784 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2758);
    float _2786 = -_2168;
    float _2788 = _2786 + _2754;
    float _2790 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2792 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2794 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2796 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2792);
    float _2798 = 1.0 / _2794;
    float _2800 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2796);
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2804 = _2802 + _2794;
    float _2806 = _2804 * _2798;
    float _2808 = _2806 * 0.5;
    float _2810 = -_2158;
    float _2812 = _2810 + _2756;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2816 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2814);
    float _2818 = _2808;
    float _2820 = _2772;
    float _2822 = _2812;
    float _2824 = _2788;
    float _2826 = _2794;
    if (_2782)
    {
        _2818 = 1.0;
    }
    float _2828 = _2818;
    float _2830 = 1.0 / _2816;
    float _2832 = _2828;
    if (!_2768)
    {
        float _2834 = _2180 * _2180;
        float _2836 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2838 = -_1766;
        float _2840 = _2838 + _2754;
        float _2842 = -_1736;
        float _2844 = _2842 + _2756;
        float _2846 = fma(_2188, _2188, _2834);
        float _2848 = -_803;
        float _2850 = _2848 + _2752;
        float _2852 = fma(_2196, _2196, _2846);
        float _2854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2856 = sqrt(_2852);
        float _2858 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2860 = 1.0 / _2284;
        float _2862 = precise::min(_2856, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2864 = _2862 * _2854;
        float _2866 = _2864 * _2860;
        float _2868 = _2858 * _2866;
        float _2870 = _2840 * _2866;
        float _2872 = fma(_2844, _2868, _2172);
        float _2874 = fma(_2850, _2868, _2166);
        float _2876 = fma(_2858, _2870, _2184);
        _2820 = _2874;
        _2822 = _2872;
        _2824 = _2876;
        _2250 = _2856;
        _2826 = _2866;
    }
    float _2878 = _2820;
    float _2880 = _2822;
    float _2882 = _2824;
    float _2884 = _2250;
    float _2886 = _2826;
    float _2888 = _2886;
    float _2890 = _2884;
    if (_2782)
    {
        _2888 = 1.0;
    }
    float _2892 = _2888;
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2896 = _2830 * _2894;
    float _2898 = _2892;
    if (!_2782)
    {
        float _2900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2902 = _2900 * 0.15915493667125701904296875;
        float _2904 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2906 = _2902 * 6.283185482025146484375;
        float _2908 = cos(_2906);
        float _2910 = _2904 * 0.15915493667125701904296875;
        float _2912 = _2902 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        float _2916 = 1.0 / _2908;
        float _2918 = _2910 * 6.283185482025146484375;
        float _2920 = cos(_2918);
        float _2922 = _2914 * _2916;
        float _2924 = _2910 * 6.283185482025146484375;
        float _2926 = sin(_2924);
        float _2928 = _2920 * _2922;
        float _2930 = 1.0 / _2928;
        float _2932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2932;
        float _2936 = 1.0 / _2934;
        float _2938 = _2926 * _2930;
        float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2942 = fma(_2896, _2938, _2940);
        float _2944 = _2942 * _2936;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        _2252 = _2936;
        _2832 = _2946;
    }
    float _2948 = _2252;
    float _2950 = _2832;
    float _2952 = _2948;
    if (!_2782)
    {
        float _2954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2956 = _2954 * 0.15915493667125701904296875;
        float _2958 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2960 = _2956 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 0.15915493667125701904296875;
        float _2966 = _2956 * 6.283185482025146484375;
        float _2968 = sin(_2966);
        float _2970 = 1.0 / _2962;
        float _2972 = _2964 * 6.283185482025146484375;
        float _2974 = cos(_2972);
        float _2976 = _2968 * _2970;
        float _2978 = _2964 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        float _2982 = _2974 * _2976;
        float _2984 = 1.0 / _2982;
        float _2986 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2988 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2986;
        float _2990 = 1.0 / _2988;
        float _2992 = _2980 * _2984;
        float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2996 = fma(_2896, _2992, _2994);
        float _2998 = _2996 * _2990;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -_3000;
        float _3004 = _3002 + 1.0;
        _2890 = _2992;
        _2952 = _2970;
        _2898 = _3004;
    }
    float _3006 = _2890;
    float _3008 = _2952;
    float _3010 = _2898;
    float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3014 = _2878 + _3012;
    float _3016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3018 = _2880 + _3016;
    float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3022 = _2882 + _3020;
    float _3024 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3026 = _3014 * _3014;
    float _3028 = fma(_3018, _3018, _3026);
    float _3030 = fma(_3022, _3022, _3028);
    float _3032 = rsqrt(_3030);
    float _3034 = sqrt(_3030);
    float _3036 = _3032 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3038 = _3018 * _3036;
    float _3040 = _3022 * _3036;
    float _3042 = _3038 * _3038;
    float _3044 = _3040 * _3040;
    float _3046 = _3042 + _3044;
    float _3048 = sqrt(_3046);
    bool _3050 = _3048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3054 = _3048 + _3052;
    float _3056 = _3032;
    float _3058 = _3008;
    float _3060 = _3054;
    float _3062 = _3006;
    float _3064 = _3014;
    float _3066 = _3036;
    if (_3050)
    {
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3056 = _3068;
    }
    float _3070 = _3056;
    if (_3050)
    {
        float _3072 = rsqrt(_3046);
        _3058 = _3072;
    }
    float _3074 = _3058;
    float _3076 = _3074;
    if (_3050)
    {
        float _3078 = _3054 * _3070;
        _3060 = _3078;
    }
    float _3080 = _3060;
    if (_3050)
    {
        float _3082 = _3080 * 0.15915493667125701904296875;
        _3062 = _3082;
    }
    float _3084 = _3062;
    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3088 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3086);
    float _3090 = precise::clamp(_3088, 0.0, 1.0);
    float _3092 = _3070;
    float _3094 = _3084;
    if (_3050)
    {
        float _3096 = _3084 * 6.283185482025146484375;
        float _3098 = sin(_3096);
        _3092 = _3098;
    }
    float _3100 = _3092;
    float _3102 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3104 = precise::max(0.0, _3102);
    float _3106 = _3022;
    float _3108 = _3104;
    if (_3050)
    {
        float _3110 = _3084 * 6.283185482025146484375;
        float _3112 = cos(_3110);
        _3106 = _3112;
    }
    float _3114 = _3106;
    float _3116 = -_3036;
    float _3118 = -_3104;
    float _3120 = fma(_3014, _3116, _3118);
    if (!_3050)
    {
        _3064 = _3040;
    }
    float _3122 = _3064;
    float _3124 = _3122;
    if (_3050)
    {
        float _3126 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3108 = _3126;
    }
    float _3128 = _3108;
    float _3130 = _3100;
    float _3132 = _3128;
    if (_3050)
    {
        float _3134 = fma(_3100, _3128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3130 = _3134;
    }
    float _3136 = _3130;
    float _3138 = _3136;
    float _3140 = _3114;
    if (_3050)
    {
        float _3142 = _3114 + (-1.0);
        _3132 = _3142;
    }
    float _3144 = _3132;
    float _3146 = _3144;
    if (_3050)
    {
        float _3148 = _3074 * _3136;
        _3066 = _3148;
    }
    float _3150 = _3066;
    if (!_3050)
    {
        _3076 = _3038;
    }
    float _3152 = _3076;
    float _3154 = _3152;
    if (_3050)
    {
        float _3156 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3156;
    }
    float _3158 = _3094;
    if (_3050)
    {
        float _3160 = _3038 * _3150;
        _3154 = _3160;
    }
    float _3162 = _3154;
    if (!_3050)
    {
        _3138 = _3120;
    }
    float _3164 = _3138;
    float _3166 = _3164;
    if (_3050)
    {
        float _3168 = _3040 * _3150;
        _3124 = _3168;
    }
    float _3170 = _3124;
    if (!_3050)
    {
        _3146 = _3042;
    }
    float _3172 = _3146;
    float _3174 = _3172;
    if (_3050)
    {
        float _3176 = fma(_3120, _3114, _3158);
        _3166 = _3176;
    }
    float _3178 = _3166;
    if (_3050)
    {
        float _3180 = _3162 * _3162;
        _3174 = _3180;
    }
    float _3182 = _3174;
    if (!_3050)
    {
        _3140 = _3044;
    }
    float _3184 = _3140;
    float _3186 = _3184;
    if (_3050)
    {
        float _3188 = _3170 * _3170;
        _3186 = _3188;
    }
    float _3190 = _3186;
    float _3192 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3194 = fma(_3178, _3178, _3182);
    float _3196 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3192);
    float _3198 = _3194 + _3190;
    float _3200 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3202 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3204 = -_3090;
    float _3206 = _3204 + 1.0;
    float _3208 = rsqrt(_3198);
    float _3210 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3200);
    float _3212 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3214 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3202);
    float _3216 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3196);
    float _3218 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3210);
    float _3220 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3212);
    float _3222 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3214);
    float _3224 = abs(_3206);
    float _3226 = log2(_3224);
    float _3228 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3230 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3220);
    float _3232 = _3222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3234 = _3216 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3236 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3238 = _3230 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3240 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3242 = _3208 * _3162;
    float _3244 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3236);
    float _3246 = _3208 * _3178;
    float _3248 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3250 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3252 = _3208 * _3170;
    float _3254 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3244);
    float _3256 = -_3248;
    float _3258 = fma(_3256, _3024, 1.0);
    float _3260 = -_3250;
    float _3262 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3260);
    float _3264 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3266 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3254);
    float _3268 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3270 = -_3252;
    float _3272 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3262);
    float _3274 = exp2(_3264);
    float _3276 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3240);
    float _3278 = _3246 + 1.0;
    float _3280 = fma(_3272, -0.5, 0.5);
    float _3282 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3276);
    float _3284 = log2(_3258);
    float _3286 = fma(_3272, 0.5, 0.5);
    float _3288 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3268);
    float _3290 = fma(_3286, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3292 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3288);
    float _3294 = 1.0 / _3266;
    float _3296 = -_3246;
    float _3298 = fma(_3274, _3278, _3296);
    float _3300 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3282);
    float _3302 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3292);
    float _3304 = fma(_3286, _3290, -0.212114393711090087890625);
    float _3306 = sqrt(_3280);
    float _3308 = _3284 * 0.693147182464599609375;
    float _3310 = fma(_3286, _3304, 1.570728778839111328125);
    float _3312 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3314 = _3300 * _3294;
    float _3316 = _3302 * _3294;
    float _3318 = fma(_3314, 0.5, 0.5);
    float _3320 = fma(_3316, -0.5, 0.5);
    float _3322 = fma(_3298, 0.5, 0.5);
    float _3324 = _3306 * 0.636619746685028076171875;
    float3 _8435 = float3(_3318, _3320, _3312);
    float _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8435, float3(0.0), isnan(_8435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8435, float3(0.0), isnan(_8435)), level(0.0)).x;
    float _3328 = -_3310;
    float _3330 = fma(_3324, _3328, 1.0);
    float3 _8451 = float3(_3318, _3320, _3312);
    float4 _3333 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).xyzw;
    float _3335 = _3333.x;
    float _3337 = _3333.y;
    float _3339 = _3333.z;
    float _3341 = _3333.w;
    float2 _8468 = float2(_3330, _3322);
    float3 _3345 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8468, float2(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8468, float2(0.0), isnan(_8468)), level(0.0)).xyz;
    float _3347 = _3345.x;
    float _3349 = _3345.y;
    float _3351 = _3345.z;
    float _3353 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3355 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3357 = _2950 > 0.0;
    bool _3359 = isnan(_2950);
    bool _3361 = _3357 || _3359;
    bool _3363 = isnan(0.0);
    bool _3365 = _3361 || _3363;
    float _3367 = _3300 + _3266;
    float _3369 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3355);
    float _3371 = exp2(_3353);
    bool _3373 = _3010 <= 0.0;
    bool _3375 = !_3365;
    bool _3377 = _3373 || _3375;
    float _3379 = _3367 * 0.5;
    float _3381 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3369);
    float _3383 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3381);
    float _3385 = _2950 * _3010;
    float _3387 = _3266 * 0.5;
    float _3389 = _3383 + _3266;
    float _3391 = _3385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3300;
    out.gl_Position.y = _3302;
    out.gl_Position.z = _3383;
    out.gl_Position.w = _3266;
    float _3393 = _3389 * 0.5;
    float _3395 = -_3371;
    float _3397 = _3395 + 1.0;
    float _3399 = fma(_3302, -0.5, _3387);
    float _3401 = _3391 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3403 = _3397 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3379;
    out.m_68.y = _3399;
    out.m_68.z = _3393;
    out.m_68.w = _3266;
    float _3405 = -_3403;
    float _3407 = _3405 + 1.0;
    out.m_45.x = _3401;
    float _3409 = _3403 * _3326;
    float _3411 = _3341 * _3409;
    float _3413 = _3341 * _3407;
    float _3415 = _3351 * _3409;
    float _3417 = fma(_3347, _3411, _3335);
    float _3419 = fma(_3349, _3411, _3337);
    float _3421 = fma(_3341, _3415, _3339);
    out.m_70.x = _3417;
    out.m_70.y = _3419;
    out.m_70.z = _3421;
    out.m_70.w = _3413;
    if (!_3377)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3423 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3423;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _723 = false;
    bool _607 = false;
    bool _497 = false;
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
        float _3480 = as_type<float>(_105);
        out.gl_Position.z = _3480;
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
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3550 = as_type<float>(_143);
        out.gl_Position.z = _3550;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _307 = _123 * _123;
        float _309 = _307 * 0.5;
        _273 = _309;
    }
    float _311 = _273;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _319 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _321 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _321;
    }
    float _323 = _275;
    bool _325 = !_159;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _123 * _331;
        float _341 = exp2(_339);
        float _343 = _337 * 0.693147182464599609375;
        float _345 = 1.0 / _343;
        float _347 = 1.0 / _335;
        float _349 = _341 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _345, _123);
        float _355 = _353 * _347;
        float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _357;
    }
    float _359 = _327;
    float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    float _367 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _371 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _375 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].z, _373);
    float _383 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _385 = fma(_297, _161, _363);
    float _387 = fma(_297, _163, _365);
    float _389 = fma(_297, _165, _375);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _377);
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].z, _381);
    float _397 = _383;
    if (!_159)
    {
        _397 = _123;
    }
    float _399 = _397;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    float _429 = fma(_425, _161, _391);
    float _431 = fma(_425, _165, _395);
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_429;
    float _445 = _385 + _443;
    float _447 = -_431;
    float _449 = _389 + _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = fma(_389, _149, _171);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _463 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _463);
    bool _471 = !_433;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = in.m_52.x;
    float _513 = in.m_52.y;
    bool _515 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_505);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _533 = 1.0 / _529;
    float _535 = -_525;
    float _537 = _535 + 1.0;
    float _539 = _509 * _533;
    bool _541 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _543 = isnan(_505);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    float _561 = _551 * _537;
    float _563 = fma(_555, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _565 = fma(_559, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _567 = -_551;
    float _569 = _567 + 1.0;
    float _571 = _563 * _561;
    float _573 = _565 * _561;
    float _575 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _571);
    float _577 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _579 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].x, _575);
    float _581 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].y, _577);
    float _583 = _579 * _511;
    float _585 = _581 * _513;
    bool _587 = !_531;
    float _605;
    if (!_587)
    {
        float _589 = in.m_54.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_89);
        float _611 = 1.0 / _609;
        float _613 = _123 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    bool _617 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = isnan(_615);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _635 = isnan(_615);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _615 + _649;
    float _653 = -_627;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = 1.0 / _631;
    float _661 = _643 * _655;
    float _663 = -_643;
    float _665 = _663 + 1.0;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _669 = _647 * _659;
    float _671 = fma(_669, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _675 = _671 * _661;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _679 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _681 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[116].x, _679);
    float _683 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _683;
    out.m_56.y = _685;
    out.m_56.z = _687;
    out.m_56.w = _689;
    bool _691 = !_657;
    float _693 = _689;
    float _717;
    float _719;
    float _721;
    if (!_691)
    {
        float _695 = in.m_54.x;
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _699 = float(_89);
        float _701 = 1.0 / _699;
        float _703 = _695 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _705 = _123 * _701;
        float _707 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _709 = _707 * _697;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _717 = _705;
        _719 = _699;
        _693 = _697;
        _721 = _715;
        _723 = true;
    }
    else
    {
        float _725 = float(_89);
        float _727 = 1.0 / _725;
        float _729 = _123 * _727;
        _717 = _729;
        _719 = _725;
        _721 = _729;
    }
    _723 = false;
    float _731 = _717;
    float _733 = _719;
    float _735 = _693;
    float _737 = _721;
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _741 = int(_739);
    float _743 = in.m_54.x;
    float _745 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _749 = _731 + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _755 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _757 = int(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _771 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    float _773 = 1.0 / _733;
    float _775 = float(_741);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _785 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _789 = _787 != 0;
    float _791 = 1.0 / _775;
    float _793 = float(uint(_757));
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _799 = ~_757;
    int _801 = _799 + 1;
    float _803 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _805 = float(_757);
    float _807 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _809 = _757 == 0;
    float _811 = 1.0 / _793;
    bool _813 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _815 = isnan(_731);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = _735;
    float _827 = as_type<float>(_757);
    if (!_789)
    {
        float _829 = in.m_54.y;
        _825 = _829;
    }
    float _831 = _825;
    bool _833 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _835 = isnan(_737);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _853 = _123 * _791;
    int _855 = ~_757;
    int _857 = _855 + 1;
    float _859 = 1.0 / _753;
    bool _861 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _863 = isnan(_731);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -_823;
    float _875 = _873 + 1.0;
    bool _877 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _879 = isnan(_731);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    bool _889 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _891 = isnan(_731);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    int _901 = as_type<int>(_811) + (-2);
    float _903 = trunc(_853);
    int _905 = int(_903);
    float _907 = 1.0 / _761;
    float _909 = _791;
    if (!_789)
    {
        _909 = _831;
    }
    float _911 = _909;
    float _913 = float(uint(_905));
    float _915 = _911;
    int _917 = as_type<int>(_831);
    if (_789)
    {
        float _919 = in.m_54.x;
        float _921 = in.m_54.y;
        _915 = _919;
        _917 = as_type<int>(_921);
    }
    float _923 = _915;
    int _925 = _917;
    float _927 = 1.0 / _765;
    float _929 = as_type<float>(_901) * _913;
    float _931 = trunc(_929);
    float _933 = precise::max(_931, 0.0);
    uint _936 = uint(_933);
    float _938 = 1.0 / _769;
    bool _940 = !_789;
    float _942 = _940 ? as_type<float>(_925) : _743;
    int _944 = _857 * int(_936);
    int _946 = _944 + _905;
    float _948 = 1.0 / _779;
    float _950 = float(uint(_946));
    float _952 = 1.0 / _783;
    float _954 = as_type<float>(_901) * _950;
    bool _956 = !_789;
    float _958 = _956 ? 1.2345600128173828125 : 1.0;
    float _960 = float(_905);
    float _962 = _958 * _942;
    float _964 = trunc(_954);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    bool _970 = _960 >= _805;
    bool _972 = isnan(_960);
    bool _974 = _970 || _972;
    bool _976 = isnan(_805);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = floor(_962);
    int _984 = int(_936) + int(_968);
    float _986 = trunc(_980);
    int _988 = int(_986);
    float _990 = _123 * _805;
    int _992 = _801 * _984;
    int _994 = _992 + _905;
    float _996 = _990 * _773;
    int _998 = _757 + (-1);
    float _1000 = 1.0 / _797;
    bool _1002 = uint(_994) >= uint(_757);
    bool _1004 = !_1002;
    int _1006 = _1004 ? 0 : (-1);
    float _1008 = trunc(_996);
    int _1010 = int(_1008);
    int _1012 = ~_984;
    int _1014 = _1012 + _1006;
    int _1016 = _1014 + 1;
    float _1018 = -_982;
    float _1020 = _962 + _1018;
    int _1022 = ~_988;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _757 * _1016;
    int _1030 = _1028 + _905;
    float _1032 = _805 * _1020;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1036 = _1034 != 0;
    float _1038 = trunc(_1032);
    int _1040 = int(_1038);
    bool _1042 = !_809;
    int _1044 = _1042 ? _1030 : (-1);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1048 = _1046 != 0;
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1052 = _1050 != 0;
    int _1054 = _1026 * _1044;
    bool _1056 = !_1036;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1066 = _1064 != 0;
    int _1068 = _988 * _998;
    int _1070 = _1068 + _1054;
    bool _1072 = !_1052;
    int _1074 = _1072 ? 0 : 1;
    bool _1076 = !_1048;
    int _1078 = _1076 ? 0 : 1;
    int _1080 = abs(_1058);
    int _1082 = abs(_1074);
    bool _1084 = !_1062;
    int _1086 = _1084 ? 0 : 1;
    int _1088 = abs(_1078);
    int _1090 = _1070 * _1082;
    bool _1092 = !_1066;
    int _1094 = _1092 ? 0 : 1;
    int _1096 = abs(_1086);
    int _1098 = _1040 * _1080;
    int _1100 = _1098 + _905;
    int _1102 = abs(_1094);
    int _1104 = _1010 * _1088;
    int _1106 = _1104 + _1090;
    int _1108 = ~_757;
    int _1110 = _1108 + 1;
    int _1112 = _1100 * _1096;
    int _1114 = _1112 + _1106;
    int _1116 = ~_757;
    int _1118 = _1116 + 1;
    float _1120 = in.m_54.z;
    int _1122 = _1040 * _1102;
    int _1124 = _1122 + _1114;
    float _1126 = float(uint(_1124));
    float _1128 = as_type<float>(_901) * _1126;
    float _1130 = trunc(_1128);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    int _1136 = _1118 * int(_1134);
    int _1138 = _1136 + _1124;
    float _1140 = float(uint(_1138));
    float _1142 = as_type<float>(_901) * _1140;
    float _1144 = trunc(_1142);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    float _1150 = _743 * 2.0;
    float _1152 = floor(_1150);
    int _1154 = int(_1134) + int(_1148);
    float _1156 = in.m_54.w;
    int _1158 = _1110 * _1154;
    int _1160 = _1158 + _1124;
    float _1162 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1164 = log2(_1162);
    bool _1166 = uint(_1160) >= uint(_757);
    bool _1168 = !_1166;
    int _1170 = _1168 ? 0 : (-1);
    bool _1172 = _1152 >= 0.0;
    bool _1174 = isnan(_1152);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(0.0);
    bool _1180 = _1176 || _1178;
    int _1182 = ~_1154;
    int _1184 = _1182 + _1170;
    int _1186 = _1184 + 1;
    int _1188 = _1180 ? 0 : 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1192 = _1190 != 0;
    int _1194 = _757 * _1186;
    int _1196 = _1194 + _1124;
    float _1198 = _123 * _1164;
    bool _1200 = _1156 > 0.5;
    bool _1202 = !_809;
    int _1204 = _1202 ? _1196 : (-1);
    float _1206 = -_225;
    int _1208 = _1200 ? as_type<int>(_1206) : as_type<int>(_225);
    float _1210 = exp2(_1198);
    int _1212 = _1204 & 3;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1218 = _1216 != 0;
    bool _1220 = uint(_1212) > 1u;
    int _1222 = _1214 ? 0 : 1;
    bool _1224 = _1120 > 0.5;
    int _1226 = ~_1222;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = -_221;
    int _1234 = _1224 ? as_type<int>(_1232) : as_type<int>(_221);
    bool _1236 = _1152 > 0.0;
    float _1238 = -_1210;
    float _1240 = _1238 + 1.0;
    int _1242 = ~_1188;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = _1230;
    int _1250 = _1246;
    if (!_1220)
    {
        int _1252 = ~_1222;
        int _1254 = _1252 + 1;
        _1248 = _1254;
    }
    int _1256 = _1248;
    bool _1258 = _743 > 0.5;
    bool _1260 = !_1218;
    float _1262 = _1260 ? _221 : as_type<float>(_1234);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1278 = _1276 != 0;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1284 = !_1192;
    float _1286 = _1284 ? _225 : as_type<float>(_1208);
    float _1288 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1236)
    {
        int _1290 = ~_1188;
        int _1292 = _1290 + 1;
        _1250 = _1292;
    }
    int _1294 = _1250;
    float _1296 = 1.0 / _1266;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1300 = _1298 != 0;
    float _1302 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1288);
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    float _1314 = _1120 * 2.0;
    float _1316 = 1.0 / _1282;
    float _1318 = -_221;
    int _1320 = _1258 ? as_type<int>(_1318) : as_type<int>(_221);
    float _1322 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1302);
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1326 = _1324 != 0;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1328;
    float _1332 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1308);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1336 = _737 + _1334;
    float _1338 = floor(_1314);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1342 = _737 + _1340;
    float _1344 = _1330 * _859;
    float _1346 = _1336 * _907;
    float _1348 = _1342 * _927;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1366 = _1352 * _938;
    float _1368 = _1356 * _1296;
    float _1370 = 0.0;
    if (!_1326)
    {
        _1370 = _1120;
    }
    float _1372 = _1370;
    float _1374 = _1360 * _1316;
    float _1376 = 0.0;
    float _1378 = _1372;
    if (!_1326)
    {
        _1376 = _1120;
    }
    float _1380 = _1376;
    float _1382 = _1364 * _948;
    float _1384 = _1380;
    if (_1326)
    {
        _1378 = as_type<float>(_925);
    }
    float _1386 = _1378;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1326)
    {
        _1384 = as_type<float>(_925);
    }
    float _1392 = _1384;
    float _1394 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1322);
    float _1396 = _1390 * _952;
    bool _1398 = _1338 >= 0.0;
    bool _1400 = isnan(_1338);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1410 = _731 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1412;
    int _1416 = _1406 ? 0 : 1;
    float _1418 = fma(_1344, _1410, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1420 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1422 = isnan(0.0);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1428 = _1424 || _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1430;
    float _1434 = fma(_1414, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1436 = _1428 ? _1240 : 0.0;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1440 = _731 + _1438;
    bool _1442 = _1338 > 0.0;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1446 = _1444 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1452 = fma(_1366, _1440, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1454 = _1432 * _1000;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1458 = _731 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1460;
    float _1464 = fma(_1446, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1466 = fma(_851, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1468 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1470 = isnan(_731);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = fma(_1450, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1482 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1484 = isnan(_731);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = fma(_847, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1498 = _731 + _1496;
    float _1500 = fma(_1374, _1458, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1502 = fma(_1462, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1504 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1506 = isnan(_731);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = -_1478;
    float _1518 = _1516 + 1.0;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1522 = _731 + _1520;
    float _1524 = fma(_1368, _1498, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1526 = -_1492;
    float _1528 = _1526 + 1.0;
    bool _1530 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1532 = isnan(_731);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = _1492 * _1518;
    float _1544 = -_1514;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1382, _1522, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1550 = _1514 * _1528;
    bool _1552 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1554 = isnan(_737);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = fma(_1396, _749, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1566 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1568 = isnan(_737);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = _1540 * _1546;
    float _1580 = -_1540;
    float _1582 = _1580 + 1.0;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1586 = 1.0 + _1584;
    float _1588 = _923 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1590 = -_1576;
    float _1592 = _1590 + 1.0;
    float _1594 = _823 * _1582;
    float _1596 = _871 * _875;
    float _1598 = -_871;
    float _1600 = _1598 + 1.0;
    float _1602 = 1.0 / _1586;
    float _1604 = _843 * _1592;
    float _1606 = -_843;
    float _1608 = _1606 + 1.0;
    float _1610 = _887 * _1600;
    float _1612 = -_887;
    float _1614 = _1612 + 1.0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1618 = _731 + _1616;
    float _1620 = _1562 * _1608;
    float _1622 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1624 = _899 * _1614;
    float _1626 = fma(_1454, _1618, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1628 = _1434 * _1620;
    float _1630 = _1494 * _1620;
    float _1632 = _1502 * _1620;
    float _1634 = _1418 * _1624;
    float _1636 = -_1562;
    float _1638 = _1636 + 1.0;
    float _1640 = _1436 * _1602;
    float _1642 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1628);
    float _1644 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1630);
    float _1646 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1632);
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1650 = -_899;
    float _1652 = _1650 + 1.0;
    float _1654 = fma(_1466, _1604, _1644);
    float _1656 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1648);
    int _1658 = ~_1416;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1634);
    int _1666 = _1662;
    if (!_1442)
    {
        int _1668 = ~_1416;
        int _1670 = _1668 + 1;
        _1666 = _1670;
    }
    int _1672 = _1666;
    float _1674 = fma(_1464, _1604, _1642);
    float _1676 = fma(_1480, _1604, _1646);
    float _1678 = as_type<float>(_925) * 2.0;
    float _1680 = fma(_1548, _1610, _1664);
    float _1682 = _743 + as_type<float>(_925);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1688 = floor(_1678);
    float _1690 = _1682 + (-1.0);
    float _1692 = fma(_1622, -2.0, _1686);
    float _1694 = float(uint(_1100));
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1698 = -_1684;
    float _1700 = fma(_1588, 2.0, _1698);
    float _1702 = _1120 + as_type<float>(_925);
    float _1704 = fma(_1452, _1596, _1680);
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1708 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1696);
    float _1710 = _1262 + 0.5;
    float _1712 = -_123;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1700);
    float _1716 = as_type<float>(_901) * _1694;
    bool _1718 = !_1306;
    float _1720 = _1718 ? _221 : as_type<float>(_1320);
    float _1722 = _1702 + (-1.0);
    bool _1724 = as_type<float>(_925) > 0.5;
    float _1726 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1676);
    bool _1728 = !_1270;
    int _1730 = _1728 ? 0 : 1;
    float _1732 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1714);
    float _1734 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1736 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _803 + _1738;
    float _1742 = -_225;
    int _1744 = _1724 ? as_type<int>(_1742) : as_type<int>(_225);
    float _1746 = trunc(_1716);
    float _1748 = precise::max(_1746, 0.0);
    uint _1750 = uint(_1748);
    bool _1752 = _1688 > 0.0;
    float _1754 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1654);
    bool _1756 = _1688 >= 0.0;
    bool _1758 = isnan(_1688);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.0);
    bool _1764 = _1760 || _1762;
    float _1766 = _1394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1768 = !_1274;
    int _1770 = _1768 ? 0 : 1;
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1774 = _1736 + _1772;
    int _1776 = abs(_1730);
    float _1778 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1780 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1674);
    int _1782 = abs(_1770);
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1786 = _1766 + _1784;
    int _1788 = ~_757;
    int _1790 = _1788 + 1;
    float _1792 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1778);
    float _1794 = float(_1782);
    float _1796 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1692);
    float _1798 = float(_1294);
    float _1800 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1792);
    float _1802 = float(_1672);
    float _1804 = fma(_1524, _1594, _1704);
    float _1806 = in.m_58.x;
    float _1808 = in.m_58.y;
    float _1810 = in.m_58.z;
    float _1812 = _1794 * _1798;
    int _1814 = _1764 ? 0 : 1;
    float _1816 = _1720 + 0.5;
    int _1818 = _1790 * int(_1750);
    int _1820 = _1818 + _1100;
    bool _1822 = _1800 >= 0.0;
    float _1824 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1656);
    int _1826 = _1204 >> 31;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1830 = float(uint(_1820));
    float _1832 = -_1824;
    float _1834 = _1832 + 1.0;
    int _1836 = _1826 & 3;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1840 = float(_1776);
    float _1842 = as_type<float>(_901) * _1830;
    int _1844 = _1204 + _1836;
    float _1846 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1708);
    float _1848 = -_1834;
    float _1850 = fma(_1262, _1848, _1732);
    float _1852 = _1840 * _1802;
    float _1854 = _1286 + (-0.5);
    int _1856 = _1844 >> 2;
    float _1858 = trunc(_1842);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    float _1864 = _1852 * (-2.0);
    float _1866 = -_1854;
    float _1868 = -_1796;
    float _1870 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1868);
    int _1872 = ~_1814;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    float _1878 = -_1846;
    float _1880 = _1878 + 1.0;
    int _1882 = _1856 << 4;
    int _1884 = _1882 + 512;
    float _1886 = fma(_1706, _1864, _1706);
    int _1888 = _1876;
    if (!_1752)
    {
        int _1890 = ~_1814;
        int _1892 = _1890 + 1;
        _1888 = _1892;
    }
    int _1894 = _1888;
    float _1896 = fma(_1864, _1806, _1806);
    float _1898 = _1812 * (-2.0);
    float _1900 = _1828 * _1838;
    uint _1902 = uint(int(uint(_1884) >> uint(2)));
    uint _1904 = uint(int(uint(int(_1902)) >> uint(2)));
    int _1906 = int(_1902) & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    int _1910 = int(_1902) + 1;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    int _1914 = _1910 & 3;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[int(_1912)][_1914];
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1920 = fma(_1734, _1898, _1734);
    float _1922 = fma(_1898, _1808, _1808);
    float _1924 = fma(_1500, _1578, _1804);
    int _1926 = int(_1750) + int(_1862);
    float _1928 = fma(_1286, _1880, _1870);
    bool _1930 = !_1312;
    float _1932 = _1930 ? _225 : as_type<float>(_1744);
    int _1934 = _1884 + 8;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    uint _1938 = uint(int(uint(int(_1936)) >> uint(2)));
    int _1940 = int(_1936) & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    int _1944 = int(_1936) + 1;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    int _1948 = _1944 & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    bool _1952 = uint(_1212) >= 2u;
    float _1954 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1956 = ~_757;
    int _1958 = _1956 + 1;
    float _1960 = -_1932;
    float _1962 = _1960 + 0.5;
    int _1964 = _1952 ? 0 : 1;
    float _1966 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1968 = _1212 != 3;
    float _1970 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1972 = ~_1964;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1980 = _1970 * _1918;
    int _1982 = _1958 * _1926;
    int _1984 = _1982 + _1100;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1992 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1994 = abs(_1256);
    float _1996 = fma(_1564, _1550, _1924);
    int _1998 = _1976;
    if (_1968)
    {
        int _2000 = ~_1964;
        int _2002 = _2000 + 1;
        _1998 = _2002;
    }
    int _2004 = _1998;
    out.m_60.x = _1900;
    out.m_60.y = _1980;
    out.m_60.z = _1850;
    out.m_60.w = _1928;
    int _2006 = _1204 & 3;
    bool _2008 = _2006 != 0;
    float _2010 = fma(_1626, _1542, _1996);
    int _2012 = abs(_2004);
    out.m_62.x = _1986;
    out.m_62.y = _1988;
    out.m_62.z = _1992;
    out.m_62.w = _1990;
    bool _2014 = !_2008;
    int _2016 = _2014 ? 0 : 1;
    float _2018 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2010);
    bool _2020 = uint(_1984) >= uint(_757);
    if (_1822)
    {
        out.m_45.x = 0.0;
    }
    int _2022 = abs(_2016);
    float _2024 = as_type<float>(_925) + (-0.5);
    bool _2026 = !_2020;
    int _2028 = _2026 ? 0 : (-1);
    out.m_64.x = _2018;
    bool _2030 = _1212 != 3;
    float _2032 = _743 + (-0.5);
    int _2034 = ~_1926;
    int _2036 = _2034 + _2028;
    int _2038 = _2036 + 1;
    float _2040 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1896);
    int _2042 = ~_1994;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    bool _2048 = !_2030;
    int _2050 = _2048 ? 0 : (-1);
    int _2052 = _757 * _2038;
    int _2054 = _2052 + _1100;
    int _2056 = ~_2022;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = _2046 * as_type<int>(_1916);
    bool _2064 = !_1300;
    int _2066 = _2064 ? 0 : 1;
    int _2068 = abs(_2050);
    int _2070 = _2060 * as_type<int>(_1908);
    int _2072 = _2070 + _2062;
    int _2074 = abs(_2066);
    float _2076 = _1740 * _1740;
    int _2078 = ~_2012;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = ~_2068;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_1774, _1774, _2076);
    bool _2092 = _757 == 0;
    int _2094 = _2082 * as_type<int>(_1942);
    int _2096 = _2094 + _2072;
    int _2098 = ~_2074;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = fma(_1786, _1786, _2090);
    float _2106 = as_type<float>(_2072);
    if (_1822)
    {
        _2106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2108 = _2106;
    int _2110 = _2088 * as_type<int>(_1950);
    int _2112 = _2110 + _2096;
    bool _2114 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2116 = isnan(1.0);
    bool _2118 = _2114 || _2116;
    bool _2120 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2122 = _2118 || _2120;
    float _2124 = rsqrt(_2104);
    int _2126 = _2102 * _2112;
    bool _2128 = !_2092;
    int _2130 = _2128 ? _2054 : (-1);
    int _2132 = as_type<int>(_2108);
    if (_1822)
    {
        float _2134 = _2108 * 5.0;
        _2132 = as_type<int>(_2134);
    }
    int _2136 = _2132;
    bool _2138 = !_2122;
    float _2140 = _2138 ? _123 : _1640;
    int _2142 = _2130 * _2074;
    int _2144 = _2142 + _2126;
    float _2146 = _807 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2148 = !_1278;
    int _2150 = _2148 ? 0 : 1;
    if (_1822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6598 = as_type<float>(_2136);
        out.gl_Position.z = _6598;
    }
    float _2152 = fma(_2140, _1886, _2040);
    float _2154 = float(_2144);
    float _2156 = _2146 * _2124;
    out.m_66.y = _2154;
    float _2158 = _1774 * _2156;
    float _2160 = _1740 * _2156;
    int _2162 = abs(_2150);
    if (_1822)
    {
        return out;
    }
    float _2164 = -_2160;
    float _2166 = _803 + _2164;
    float _2168 = _1786 * _2156;
    float _2170 = -_2158;
    float _2172 = _1736 + _2170;
    float _2174 = -_2160;
    float _2176 = _1740 + _2174;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2180 = _2166 + _2178;
    float _2182 = -_2168;
    float _2184 = _1766 + _2182;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2188 = _2172 + _2186;
    float _2190 = float(_2162);
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2196 = _2184 + _2194;
    float _2198 = float(_1894);
    float _2200 = -_2158;
    float _2202 = _1774 + _2200;
    float _2204 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2192);
    float _2206 = _2176 * _2176;
    float _2208 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1922);
    float _2210 = -_2168;
    float _2212 = _1786 + _2210;
    float _2214 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2204);
    float _2216 = fma(_2202, _2202, _2206);
    float _2218 = _2190 * _2198;
    float _2220 = _743 + _1120;
    float _2222 = fma(_2140, _1920, _2208);
    bool _2224 = _2214 >= 0.0;
    float _2226 = fma(_2212, _2212, _2216);
    float _2228 = _2220 + (-1.0);
    float _2230 = _2218 * (-2.0);
    float _2232 = _2152 * 0.15915493667125701904296875;
    float _2234 = _2222 * 0.15915493667125701904296875;
    float _2236 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2238 = fma(_2230, _1810, _1810);
    float _2240 = _1120 + (-0.5);
    float _2242 = _2232 * 6.283185482025146484375;
    float _2244 = sin(_2242);
    float _2246 = fma(_2236, _2230, _2236);
    int _2248 = as_type<int>(_2238);
    float _2250 = _2188;
    float _2252 = _2184;
    if (_2224)
    {
        _827 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2254 = _827;
    float _2256 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2238);
    if (_2224)
    {
        out.m_45.x = 0.0;
    }
    float _2258 = _2232 * 6.283185482025146484375;
    float _2260 = cos(_2258);
    if (_2224)
    {
        float _2262 = _2254 * 5.0;
        _2248 = as_type<int>(_2262);
    }
    int _2264 = _2248;
    float _2266 = fma(_2140, _2246, _2256);
    if (_2224)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6790 = as_type<float>(_2264);
        out.gl_Position.z = _6790;
    }
    float _2268 = _2266 * 0.15915493667125701904296875;
    float _2270 = _2234 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = sqrt(_2226);
    float _2276 = _2234 * 6.283185482025146484375;
    float _2278 = cos(_2276);
    if (_2224)
    {
        return out;
    }
    float _2280 = _2268 * 6.283185482025146484375;
    float _2282 = cos(_2280);
    float _2284 = _2124 * _2274;
    float _2286 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2292 = _807 * _2284;
    float _2294 = _2284 * _2286;
    float _2296 = _2260 * _2278;
    float _2298 = _2268 * 6.283185482025146484375;
    float _2300 = sin(_2298);
    float _2302 = _2290 * _2292;
    float _2304 = _2288 * _2294;
    float _2306 = _2244 * _2272;
    float _2308 = _2260 * _2272;
    float _2310 = _2244 * _2278;
    float _2312 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2314 = _2312 * 0.5;
    float _2316 = _2282 * _2304;
    float _2318 = _2272 * _2282;
    float _2320 = _2278 * _2282;
    float _2322 = _2260 * _2316;
    float _2324 = _2244 * _2316;
    float _2326 = fma(_2300, _2296, _2306);
    float _2328 = -_2304;
    float _2330 = _2300 * _2328;
    float _2332 = fma(_2300, _2306, _2296);
    float _2334 = fma(_2326, _2302, _2322);
    float _2336 = -_2310;
    float _2338 = fma(_2300, _2308, _2336);
    float _2340 = fma(_2320, _2302, _2330);
    float _2342 = -_2308;
    float _2344 = fma(_2300, _2310, _2342);
    float _2346 = fma(_2338, _2314, _2334);
    float _2348 = fma(_2318, _2314, _2340);
    float _2350 = fma(_2344, _2302, _2324);
    float _2352 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2356 = fma(_2332, _2314, _2350);
    float _2358 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2352);
    float _2360 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2354);
    float _2362 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    float _2364 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2360);
    float _2366 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2368 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2370 = _1766 + _2366;
    float _2372 = _1736 + _2368;
    float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2376 = _2370 + _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2380 = _2372 + _2378;
    float _2382 = _2376 * _2376;
    float _2384 = fma(_2380, _2380, _2382);
    float _2386 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2388 = sqrt(_2384);
    float _2390 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2386);
    float _2392 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2390);
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2396 = _803 + _2394;
    bool _2398 = _2388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2400 = _2386;
    float _2402 = _2356;
    float _2404 = _2372;
    float _2406 = _2316;
    float _2408 = _2334;
    if (!_2398)
    {
        _2400 = _2372;
    }
    float _2410 = _2400;
    float _2412 = _2410;
    if (!_2398)
    {
        _2402 = _2370;
    }
    float _2414 = _2402;
    float _2416 = _2414;
    if (!_2398)
    {
        _2404 = _2396;
    }
    float _2418 = _2404;
    bool _2420 = !_2398;
    float _2422 = _2418;
    if (!_2420)
    {
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2428 = _2388 + _2426;
        float _2430 = rsqrt(_2384);
        float _2432 = _2428 * _2424;
        float _2434 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2436 = _2432 * 0.15915493667125701904296875;
        float _2438 = _2436 * 6.283185482025146484375;
        float _2440 = cos(_2438);
        float _2442 = _2436 * 6.283185482025146484375;
        float _2444 = sin(_2442);
        float _2446 = _2440 + (-1.0);
        float _2448 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2450 = fma(_2444, _2434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2452 = fma(_2396, _2440, _2448);
        float _2454 = _2430 * _2450;
        float _2456 = fma(_2380, _2454, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2458 = fma(_2376, _2454, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2422 = _2452;
        _2412 = _2456;
        _2416 = _2458;
    }
    float _2460 = _2422;
    float _2462 = _2412;
    float _2464 = _2416;
    float _2466 = -_803;
    float _2468 = _2466 + _2460;
    float _2470 = -_1736;
    float _2472 = _2470 + _2462;
    float _2474 = -_1766;
    float _2476 = _2474 + _2464;
    float _2478 = _2468 * _2468;
    float _2480 = fma(_2472, _2472, _2478);
    float _2482 = fma(_2476, _2476, _2480);
    float _2484 = sqrt(_2482);
    bool _2486 = _2484 > 0.0;
    float _2488 = _2480;
    float _2490 = _2484;
    float _2492 = _2464;
    if (!_2486)
    {
        _2488 = _2462;
    }
    float _2494 = _2488;
    float _2496 = _2494;
    float _2498 = _2494;
    if (!_2486)
    {
        _2490 = _2460;
    }
    float _2500 = _2490;
    bool _2502 = !_2486;
    float _2504 = _2500;
    float _2506 = _2500;
    if (!_2502)
    {
        bool _2508 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2510 = _2376;
        if (_2508)
        {
            float _2512 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2510 = _2512;
        }
        float _2514 = _2510;
        float _2516 = _2514;
        if (_2508)
        {
            float _2518 = _465 * _2514;
            _2406 = _2518;
        }
        float _2520 = _2406;
        float _2522 = _2520;
        if (_2508)
        {
            float _2524 = _467 * _2514;
            _2408 = _2524;
        }
        float _2526 = _2408;
        float _2528 = _2526;
        if (_2508)
        {
            float _2530 = _469 * _2514;
            _2516 = _2530;
        }
        float _2532 = _2516;
        float _2534 = _2532;
        if (!_2508)
        {
            bool _2536 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2540 = _2536 || _2538;
            bool _2542 = isnan(1.0);
            bool _2544 = _2540 || _2542;
            float _2546 = _123 + 1.0;
            if (!_2544)
            {
                float _2548 = _2546 * _2546;
                float _2550 = _2548 * 0.5;
                _125 = _2550;
            }
            float _2552 = _125;
            float _2554 = _2552;
            if (!_2544)
            {
                float _2556 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2554 = _2556;
            }
            float _2558 = _2554;
            bool _2560 = !_2544;
            float _2562 = _2558;
            if (!_2560)
            {
                float _2564 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2566 = log2(_2564);
                float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2570 = 1.0 + _2568;
                float _2572 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2574 = _2566 * _2546;
                float _2576 = 1.0 / _2570;
                float _2578 = _2572 * 0.693147182464599609375;
                float _2580 = exp2(_2574);
                float _2582 = 1.0 / _2578;
                float _2584 = _2580 + (-1.0);
                float _2586 = -_2584;
                float _2588 = fma(_2586, _2582, _2546);
                float _2590 = _2588 * _2576;
                float _2592 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2562 = _2592;
            }
            float _2594 = _2562;
            float _2596 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2598 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2600 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2602 = _2594;
            if (!_2544)
            {
                _2602 = _2546;
            }
            float _2604 = _2602;
            float _2606 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2608 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2610 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2612 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2606);
            float _2614 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2608);
            float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2612);
            bool _2618 = !_2544;
            float _2620 = _2604;
            _2496 = _2614;
            if (!_2618)
            {
                float _2622 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2624 = log2(_2622);
                float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2628 = 1.0 + _2626;
                float _2630 = 1.0 / _2628;
                float _2632 = _2624 * _2546;
                float _2634 = exp2(_2632);
                float _2636 = -_2634;
                float _2638 = _2636 + 1.0;
                float _2640 = _2638 * _2630;
                _2620 = _2640;
            }
            float _2642 = _2620;
            float _2644 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2610);
            float _2646 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2614);
            float _2648 = fma(_2642, _163, _2616);
            float _2650 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2644);
            float _2652 = fma(_2642, _161, _2646);
            float _2654 = -_427;
            float _2656 = _2654 + _2648;
            float _2658 = fma(_2642, _165, _2650);
            float _2660 = -_429;
            float _2662 = _2660 + _2652;
            float _2664 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2666 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2668 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2670 = -_431;
            float _2672 = _2670 + _2658;
            float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2664);
            float _2676 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2666);
            float _2678 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2668);
            float _2680 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2674);
            float _2682 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2676);
            float _2684 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2678);
            _473 = _2682;
            _475 = _2680;
            _477 = _2684;
            _2522 = _2680;
            _2528 = _2682;
            _2534 = _2684;
            _2504 = _2650;
        }
        float _2686 = _473;
        float _2688 = _475;
        float _2690 = _477;
        float _2692 = _2522;
        float _2694 = _2528;
        float _2696 = _2534;
        float _2698 = _2504;
        float _2700 = _2496;
        float _2702 = _2686 * _2686;
        float _2704 = rsqrt(_2482);
        float _2706 = fma(_2688, _2688, _2702);
        float _2708 = fma(_2690, _2690, _2706);
        float _2710 = sqrt(_2708);
        float _2712 = _2472 * _2704;
        float _2714 = _2468 * _2704;
        float _2716 = _2476 * _2704;
        bool _2718 = _2710 > 0.0;
        float _2720 = _2700;
        float _2722 = _2698;
        if (!_2718)
        {
            _2720 = _2462;
        }
        float _2724 = _2720;
        _2498 = _2724;
        if (!_2718)
        {
            _2722 = _2460;
        }
        float _2726 = _2722;
        bool _2728 = !_2718;
        _2506 = _2726;
        if (!_2728)
        {
            float _2730 = rsqrt(_2708);
            float _2732 = _2730 * _2686;
            float _2734 = _2730 * _2688;
            float _2736 = _2730 * _2690;
            float _2738 = _2714 * _2732;
            float _2740 = fma(_2712, _2734, _2738);
            float _2742 = fma(_2716, _2736, _2740);
            float _2744 = _2742 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2746 = fma(_2692, _2744, _2462);
            float _2748 = fma(_2694, _2744, _2460);
            float _2750 = fma(_2696, _2744, _2464);
            _2506 = _2748;
            _2492 = _2750;
            _2498 = _2746;
        }
    }
    float _2752 = _2506;
    float _2754 = _2492;
    float _2756 = _2498;
    float _2758 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2762 = isnan(0.5);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2768 = _2764 || _2766;
    float _2770 = -_2160;
    float _2772 = _2770 + _2752;
    bool _2774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2776 = isnan(0.5);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2782 = _2778 || _2780;
    float _2784 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2758);
    float _2786 = -_2168;
    float _2788 = _2786 + _2754;
    float _2790 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2792 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2794 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2796 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2792);
    float _2798 = 1.0 / _2794;
    float _2800 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2796);
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2804 = _2802 + _2794;
    float _2806 = _2804 * _2798;
    float _2808 = _2806 * 0.5;
    float _2810 = -_2158;
    float _2812 = _2810 + _2756;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2816 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2814);
    float _2818 = _2808;
    float _2820 = _2772;
    float _2822 = _2812;
    float _2824 = _2788;
    float _2826 = _2794;
    if (_2782)
    {
        _2818 = 1.0;
    }
    float _2828 = _2818;
    float _2830 = 1.0 / _2816;
    float _2832 = _2828;
    if (!_2768)
    {
        float _2834 = _2180 * _2180;
        float _2836 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2838 = -_1766;
        float _2840 = _2838 + _2754;
        float _2842 = -_1736;
        float _2844 = _2842 + _2756;
        float _2846 = fma(_2188, _2188, _2834);
        float _2848 = -_803;
        float _2850 = _2848 + _2752;
        float _2852 = fma(_2196, _2196, _2846);
        float _2854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2856 = sqrt(_2852);
        float _2858 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2860 = 1.0 / _2284;
        float _2862 = precise::min(_2856, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2864 = _2862 * _2854;
        float _2866 = _2864 * _2860;
        float _2868 = _2858 * _2866;
        float _2870 = _2840 * _2866;
        float _2872 = fma(_2844, _2868, _2172);
        float _2874 = fma(_2850, _2868, _2166);
        float _2876 = fma(_2858, _2870, _2184);
        _2820 = _2874;
        _2822 = _2872;
        _2824 = _2876;
        _2250 = _2856;
        _2826 = _2866;
    }
    float _2878 = _2820;
    float _2880 = _2822;
    float _2882 = _2824;
    float _2884 = _2250;
    float _2886 = _2826;
    float _2888 = _2886;
    float _2890 = _2884;
    if (_2782)
    {
        _2888 = 1.0;
    }
    float _2892 = _2888;
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2896 = _2830 * _2894;
    float _2898 = _2892;
    if (!_2782)
    {
        float _2900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2902 = _2900 * 0.15915493667125701904296875;
        float _2904 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2906 = _2902 * 6.283185482025146484375;
        float _2908 = cos(_2906);
        float _2910 = _2904 * 0.15915493667125701904296875;
        float _2912 = _2902 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        float _2916 = 1.0 / _2908;
        float _2918 = _2910 * 6.283185482025146484375;
        float _2920 = cos(_2918);
        float _2922 = _2914 * _2916;
        float _2924 = _2910 * 6.283185482025146484375;
        float _2926 = sin(_2924);
        float _2928 = _2920 * _2922;
        float _2930 = 1.0 / _2928;
        float _2932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2932;
        float _2936 = 1.0 / _2934;
        float _2938 = _2926 * _2930;
        float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2942 = fma(_2896, _2938, _2940);
        float _2944 = _2942 * _2936;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        _2252 = _2936;
        _2832 = _2946;
    }
    float _2948 = _2252;
    float _2950 = _2832;
    float _2952 = _2948;
    if (!_2782)
    {
        float _2954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2956 = _2954 * 0.15915493667125701904296875;
        float _2958 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2960 = _2956 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 0.15915493667125701904296875;
        float _2966 = _2956 * 6.283185482025146484375;
        float _2968 = sin(_2966);
        float _2970 = 1.0 / _2962;
        float _2972 = _2964 * 6.283185482025146484375;
        float _2974 = cos(_2972);
        float _2976 = _2968 * _2970;
        float _2978 = _2964 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        float _2982 = _2974 * _2976;
        float _2984 = 1.0 / _2982;
        float _2986 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2988 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2986;
        float _2990 = 1.0 / _2988;
        float _2992 = _2980 * _2984;
        float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2996 = fma(_2896, _2992, _2994);
        float _2998 = _2996 * _2990;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -_3000;
        float _3004 = _3002 + 1.0;
        _2890 = _2992;
        _2952 = _2970;
        _2898 = _3004;
    }
    float _3006 = _2890;
    float _3008 = _2952;
    float _3010 = _2898;
    float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3014 = _2878 + _3012;
    float _3016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3018 = _2880 + _3016;
    float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3022 = _2882 + _3020;
    float _3024 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3026 = _3014 * _3014;
    float _3028 = fma(_3018, _3018, _3026);
    float _3030 = fma(_3022, _3022, _3028);
    float _3032 = rsqrt(_3030);
    float _3034 = sqrt(_3030);
    float _3036 = _3032 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3038 = _3018 * _3036;
    float _3040 = _3022 * _3036;
    float _3042 = _3038 * _3038;
    float _3044 = _3040 * _3040;
    float _3046 = _3042 + _3044;
    float _3048 = sqrt(_3046);
    bool _3050 = _3048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3054 = _3048 + _3052;
    float _3056 = _3032;
    float _3058 = _3008;
    float _3060 = _3054;
    float _3062 = _3006;
    float _3064 = _3014;
    float _3066 = _3036;
    if (_3050)
    {
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3056 = _3068;
    }
    float _3070 = _3056;
    if (_3050)
    {
        float _3072 = rsqrt(_3046);
        _3058 = _3072;
    }
    float _3074 = _3058;
    float _3076 = _3074;
    if (_3050)
    {
        float _3078 = _3054 * _3070;
        _3060 = _3078;
    }
    float _3080 = _3060;
    if (_3050)
    {
        float _3082 = _3080 * 0.15915493667125701904296875;
        _3062 = _3082;
    }
    float _3084 = _3062;
    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3088 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3086);
    float _3090 = precise::clamp(_3088, 0.0, 1.0);
    float _3092 = _3070;
    float _3094 = _3084;
    if (_3050)
    {
        float _3096 = _3084 * 6.283185482025146484375;
        float _3098 = sin(_3096);
        _3092 = _3098;
    }
    float _3100 = _3092;
    float _3102 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3104 = precise::max(0.0, _3102);
    float _3106 = _3022;
    float _3108 = _3104;
    if (_3050)
    {
        float _3110 = _3084 * 6.283185482025146484375;
        float _3112 = cos(_3110);
        _3106 = _3112;
    }
    float _3114 = _3106;
    float _3116 = -_3036;
    float _3118 = -_3104;
    float _3120 = fma(_3014, _3116, _3118);
    if (!_3050)
    {
        _3064 = _3040;
    }
    float _3122 = _3064;
    float _3124 = _3122;
    if (_3050)
    {
        float _3126 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3108 = _3126;
    }
    float _3128 = _3108;
    float _3130 = _3100;
    float _3132 = _3128;
    if (_3050)
    {
        float _3134 = fma(_3100, _3128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3130 = _3134;
    }
    float _3136 = _3130;
    float _3138 = _3136;
    float _3140 = _3114;
    if (_3050)
    {
        float _3142 = _3114 + (-1.0);
        _3132 = _3142;
    }
    float _3144 = _3132;
    float _3146 = _3144;
    if (_3050)
    {
        float _3148 = _3074 * _3136;
        _3066 = _3148;
    }
    float _3150 = _3066;
    if (!_3050)
    {
        _3076 = _3038;
    }
    float _3152 = _3076;
    float _3154 = _3152;
    if (_3050)
    {
        float _3156 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3156;
    }
    float _3158 = _3094;
    if (_3050)
    {
        float _3160 = _3038 * _3150;
        _3154 = _3160;
    }
    float _3162 = _3154;
    if (!_3050)
    {
        _3138 = _3120;
    }
    float _3164 = _3138;
    float _3166 = _3164;
    if (_3050)
    {
        float _3168 = _3040 * _3150;
        _3124 = _3168;
    }
    float _3170 = _3124;
    if (!_3050)
    {
        _3146 = _3042;
    }
    float _3172 = _3146;
    float _3174 = _3172;
    if (_3050)
    {
        float _3176 = fma(_3120, _3114, _3158);
        _3166 = _3176;
    }
    float _3178 = _3166;
    if (_3050)
    {
        float _3180 = _3162 * _3162;
        _3174 = _3180;
    }
    float _3182 = _3174;
    if (!_3050)
    {
        _3140 = _3044;
    }
    float _3184 = _3140;
    float _3186 = _3184;
    if (_3050)
    {
        float _3188 = _3170 * _3170;
        _3186 = _3188;
    }
    float _3190 = _3186;
    float _3192 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3194 = fma(_3178, _3178, _3182);
    float _3196 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3192);
    float _3198 = _3194 + _3190;
    float _3200 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3202 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3204 = -_3090;
    float _3206 = _3204 + 1.0;
    float _3208 = rsqrt(_3198);
    float _3210 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3200);
    float _3212 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3214 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3202);
    float _3216 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3196);
    float _3218 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3210);
    float _3220 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3212);
    float _3222 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3214);
    float _3224 = abs(_3206);
    float _3226 = log2(_3224);
    float _3228 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3230 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3220);
    float _3232 = _3222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3234 = _3216 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3236 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3238 = _3230 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3240 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3242 = _3208 * _3162;
    float _3244 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3236);
    float _3246 = _3208 * _3178;
    float _3248 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3250 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3252 = _3208 * _3170;
    float _3254 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3244);
    float _3256 = -_3248;
    float _3258 = fma(_3256, _3024, 1.0);
    float _3260 = -_3250;
    float _3262 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3260);
    float _3264 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3266 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3254);
    float _3268 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3270 = -_3252;
    float _3272 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3262);
    float _3274 = exp2(_3264);
    float _3276 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3240);
    float _3278 = _3246 + 1.0;
    float _3280 = fma(_3272, -0.5, 0.5);
    float _3282 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3276);
    float _3284 = log2(_3258);
    float _3286 = fma(_3272, 0.5, 0.5);
    float _3288 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3268);
    float _3290 = fma(_3286, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3292 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3288);
    float _3294 = 1.0 / _3266;
    float _3296 = -_3246;
    float _3298 = fma(_3274, _3278, _3296);
    float _3300 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3282);
    float _3302 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3292);
    float _3304 = fma(_3286, _3290, -0.212114393711090087890625);
    float _3306 = sqrt(_3280);
    float _3308 = _3284 * 0.693147182464599609375;
    float _3310 = fma(_3286, _3304, 1.570728778839111328125);
    float _3312 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3314 = _3300 * _3294;
    float _3316 = _3302 * _3294;
    float _3318 = fma(_3314, 0.5, 0.5);
    float _3320 = fma(_3316, -0.5, 0.5);
    float _3322 = fma(_3298, 0.5, 0.5);
    float _3324 = _3306 * 0.636619746685028076171875;
    float3 _8435 = float3(_3318, _3320, _3312);
    float _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8435, float3(0.0), isnan(_8435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8435, float3(0.0), isnan(_8435)), level(0.0)).x;
    float _3328 = -_3310;
    float _3330 = fma(_3324, _3328, 1.0);
    float3 _8451 = float3(_3318, _3320, _3312);
    float4 _3333 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).xyzw;
    float _3335 = _3333.x;
    float _3337 = _3333.y;
    float _3339 = _3333.z;
    float _3341 = _3333.w;
    float2 _8468 = float2(_3330, _3322);
    float3 _3345 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8468, float2(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8468, float2(0.0), isnan(_8468)), level(0.0)).xyz;
    float _3347 = _3345.x;
    float _3349 = _3345.y;
    float _3351 = _3345.z;
    float _3353 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3355 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3357 = _2950 > 0.0;
    bool _3359 = isnan(_2950);
    bool _3361 = _3357 || _3359;
    bool _3363 = isnan(0.0);
    bool _3365 = _3361 || _3363;
    float _3367 = _3300 + _3266;
    float _3369 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3355);
    float _3371 = exp2(_3353);
    bool _3373 = _3010 <= 0.0;
    bool _3375 = !_3365;
    bool _3377 = _3373 || _3375;
    float _3379 = _3367 * 0.5;
    float _3381 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3369);
    float _3383 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3381);
    float _3385 = _2950 * _3010;
    float _3387 = _3266 * 0.5;
    float _3389 = _3383 + _3266;
    float _3391 = _3385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3300;
    out.gl_Position.y = _3302;
    out.gl_Position.z = _3383;
    out.gl_Position.w = _3266;
    float _3393 = _3389 * 0.5;
    float _3395 = -_3371;
    float _3397 = _3395 + 1.0;
    float _3399 = fma(_3302, -0.5, _3387);
    float _3401 = _3391 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3403 = _3397 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3379;
    out.m_68.y = _3399;
    out.m_68.z = _3393;
    out.m_68.w = _3266;
    float _3405 = -_3403;
    float _3407 = _3405 + 1.0;
    out.m_45.x = _3401;
    float _3409 = _3403 * _3326;
    float _3411 = _3341 * _3409;
    float _3413 = _3341 * _3407;
    float _3415 = _3351 * _3409;
    float _3417 = fma(_3347, _3411, _3335);
    float _3419 = fma(_3349, _3411, _3337);
    float _3421 = fma(_3341, _3415, _3339);
    out.m_70.x = _3417;
    out.m_70.y = _3419;
    out.m_70.z = _3421;
    out.m_70.w = _3413;
    if (!_3377)
    {
        return out;
    }
    float _3423 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3423;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _723 = false;
    bool _607 = false;
    bool _497 = false;
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
        float _3480 = as_type<float>(_105);
        out.gl_Position.z = _3480;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3550 = as_type<float>(_143);
        out.gl_Position.z = _3550;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _307 = _123 * _123;
        float _309 = _307 * 0.5;
        _273 = _309;
    }
    float _311 = _273;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _319 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _321 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _321;
    }
    float _323 = _275;
    bool _325 = !_159;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _123 * _331;
        float _341 = exp2(_339);
        float _343 = _337 * 0.693147182464599609375;
        float _345 = 1.0 / _343;
        float _347 = 1.0 / _335;
        float _349 = _341 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _345, _123);
        float _355 = _353 * _347;
        float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _357;
    }
    float _359 = _327;
    float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    float _367 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _371 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _375 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].z, _373);
    float _383 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _385 = fma(_297, _161, _363);
    float _387 = fma(_297, _163, _365);
    float _389 = fma(_297, _165, _375);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _377);
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].z, _381);
    float _397 = _383;
    if (!_159)
    {
        _397 = _123;
    }
    float _399 = _397;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    float _429 = fma(_425, _161, _391);
    float _431 = fma(_425, _165, _395);
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_429;
    float _445 = _385 + _443;
    float _447 = -_431;
    float _449 = _389 + _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = fma(_389, _149, _171);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _463 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _463);
    bool _471 = !_433;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = in.m_52.x;
    float _513 = in.m_52.y;
    bool _515 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_505);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    bool _531 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _533 = 1.0 / _529;
    float _535 = -_525;
    float _537 = _535 + 1.0;
    float _539 = _509 * _533;
    bool _541 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _543 = isnan(_505);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    float _561 = _551 * _537;
    float _563 = fma(_555, _539, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _565 = fma(_559, _539, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _567 = -_551;
    float _569 = _567 + 1.0;
    float _571 = _563 * _561;
    float _573 = _565 * _561;
    float _575 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].x, _571);
    float _577 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _579 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].x, _575);
    float _581 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].y, _577);
    float _583 = _579 * _511;
    float _585 = _581 * _513;
    bool _587 = !_531;
    float _605;
    if (!_587)
    {
        float _589 = in.m_54.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_89);
        float _611 = 1.0 / _609;
        float _613 = _123 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    bool _617 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _619 = isnan(_615);
    bool _621 = _617 || _619;
    bool _623 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _625 = _621 || _623;
    float _627 = float(_625);
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _633 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _635 = isnan(_615);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _651 = _615 + _649;
    float _653 = -_627;
    float _655 = _653 + 1.0;
    bool _657 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _659 = 1.0 / _631;
    float _661 = _643 * _655;
    float _663 = -_643;
    float _665 = _663 + 1.0;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _669 = _647 * _659;
    float _671 = fma(_669, _651, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _675 = _671 * _661;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _679 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[115].x, _675);
    float _681 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[116].x, _679);
    float _683 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _681 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _683;
    out.m_56.y = _685;
    out.m_56.z = _687;
    out.m_56.w = _689;
    bool _691 = !_657;
    float _693 = _689;
    float _717;
    float _719;
    float _721;
    if (!_691)
    {
        float _695 = in.m_54.x;
        float _697 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _699 = float(_89);
        float _701 = 1.0 / _699;
        float _703 = _695 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _705 = _123 * _701;
        float _707 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _709 = _707 * _697;
        float _711 = floor(_709);
        float _713 = -_711;
        float _715 = _709 + _713;
        _717 = _705;
        _719 = _699;
        _693 = _697;
        _721 = _715;
        _723 = true;
    }
    else
    {
        float _725 = float(_89);
        float _727 = 1.0 / _725;
        float _729 = _123 * _727;
        _717 = _729;
        _719 = _725;
        _721 = _729;
    }
    _723 = false;
    float _731 = _717;
    float _733 = _719;
    float _735 = _693;
    float _737 = _721;
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _741 = int(_739);
    float _743 = in.m_54.x;
    float _745 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _749 = _731 + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _755 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _757 = int(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _771 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _745);
    float _773 = 1.0 / _733;
    float _775 = float(_741);
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _779 = _777 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _783 = _781 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _785 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _789 = _787 != 0;
    float _791 = 1.0 / _775;
    float _793 = float(uint(_757));
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _797 = _795 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _799 = ~_757;
    int _801 = _799 + 1;
    float _803 = _785 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _805 = float(_757);
    float _807 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _809 = _757 == 0;
    float _811 = 1.0 / _793;
    bool _813 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _815 = isnan(_731);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = _735;
    float _827 = as_type<float>(_757);
    if (!_789)
    {
        float _829 = in.m_54.y;
        _825 = _829;
    }
    float _831 = _825;
    bool _833 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _835 = isnan(_737);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _853 = _123 * _791;
    int _855 = ~_757;
    int _857 = _855 + 1;
    float _859 = 1.0 / _753;
    bool _861 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _863 = isnan(_731);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -_823;
    float _875 = _873 + 1.0;
    bool _877 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _879 = isnan(_731);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    bool _889 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _891 = isnan(_731);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    int _901 = as_type<int>(_811) + (-2);
    float _903 = trunc(_853);
    int _905 = int(_903);
    float _907 = 1.0 / _761;
    float _909 = _791;
    if (!_789)
    {
        _909 = _831;
    }
    float _911 = _909;
    float _913 = float(uint(_905));
    float _915 = _911;
    int _917 = as_type<int>(_831);
    if (_789)
    {
        float _919 = in.m_54.x;
        float _921 = in.m_54.y;
        _915 = _919;
        _917 = as_type<int>(_921);
    }
    float _923 = _915;
    int _925 = _917;
    float _927 = 1.0 / _765;
    float _929 = as_type<float>(_901) * _913;
    float _931 = trunc(_929);
    float _933 = precise::max(_931, 0.0);
    uint _936 = uint(_933);
    float _938 = 1.0 / _769;
    bool _940 = !_789;
    float _942 = _940 ? as_type<float>(_925) : _743;
    int _944 = _857 * int(_936);
    int _946 = _944 + _905;
    float _948 = 1.0 / _779;
    float _950 = float(uint(_946));
    float _952 = 1.0 / _783;
    float _954 = as_type<float>(_901) * _950;
    bool _956 = !_789;
    float _958 = _956 ? 1.2345600128173828125 : 1.0;
    float _960 = float(_905);
    float _962 = _958 * _942;
    float _964 = trunc(_954);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    bool _970 = _960 >= _805;
    bool _972 = isnan(_960);
    bool _974 = _970 || _972;
    bool _976 = isnan(_805);
    bool _978 = _974 || _976;
    float _980 = float(_978);
    float _982 = floor(_962);
    int _984 = int(_936) + int(_968);
    float _986 = trunc(_980);
    int _988 = int(_986);
    float _990 = _123 * _805;
    int _992 = _801 * _984;
    int _994 = _992 + _905;
    float _996 = _990 * _773;
    int _998 = _757 + (-1);
    float _1000 = 1.0 / _797;
    bool _1002 = uint(_994) >= uint(_757);
    bool _1004 = !_1002;
    int _1006 = _1004 ? 0 : (-1);
    float _1008 = trunc(_996);
    int _1010 = int(_1008);
    int _1012 = ~_984;
    int _1014 = _1012 + _1006;
    int _1016 = _1014 + 1;
    float _1018 = -_982;
    float _1020 = _962 + _1018;
    int _1022 = ~_988;
    int _1024 = _1022 + 1;
    int _1026 = _1024 + 1;
    int _1028 = _757 * _1016;
    int _1030 = _1028 + _905;
    float _1032 = _805 * _1020;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1036 = _1034 != 0;
    float _1038 = trunc(_1032);
    int _1040 = int(_1038);
    bool _1042 = !_809;
    int _1044 = _1042 ? _1030 : (-1);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1048 = _1046 != 0;
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1052 = _1050 != 0;
    int _1054 = _1026 * _1044;
    bool _1056 = !_1036;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1062 = _1060 != 0;
    int _1064 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1066 = _1064 != 0;
    int _1068 = _988 * _998;
    int _1070 = _1068 + _1054;
    bool _1072 = !_1052;
    int _1074 = _1072 ? 0 : 1;
    bool _1076 = !_1048;
    int _1078 = _1076 ? 0 : 1;
    int _1080 = abs(_1058);
    int _1082 = abs(_1074);
    bool _1084 = !_1062;
    int _1086 = _1084 ? 0 : 1;
    int _1088 = abs(_1078);
    int _1090 = _1070 * _1082;
    bool _1092 = !_1066;
    int _1094 = _1092 ? 0 : 1;
    int _1096 = abs(_1086);
    int _1098 = _1040 * _1080;
    int _1100 = _1098 + _905;
    int _1102 = abs(_1094);
    int _1104 = _1010 * _1088;
    int _1106 = _1104 + _1090;
    int _1108 = ~_757;
    int _1110 = _1108 + 1;
    int _1112 = _1100 * _1096;
    int _1114 = _1112 + _1106;
    int _1116 = ~_757;
    int _1118 = _1116 + 1;
    float _1120 = in.m_54.z;
    int _1122 = _1040 * _1102;
    int _1124 = _1122 + _1114;
    float _1126 = float(uint(_1124));
    float _1128 = as_type<float>(_901) * _1126;
    float _1130 = trunc(_1128);
    float _1132 = precise::max(_1130, 0.0);
    uint _1134 = uint(_1132);
    int _1136 = _1118 * int(_1134);
    int _1138 = _1136 + _1124;
    float _1140 = float(uint(_1138));
    float _1142 = as_type<float>(_901) * _1140;
    float _1144 = trunc(_1142);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    float _1150 = _743 * 2.0;
    float _1152 = floor(_1150);
    int _1154 = int(_1134) + int(_1148);
    float _1156 = in.m_54.w;
    int _1158 = _1110 * _1154;
    int _1160 = _1158 + _1124;
    float _1162 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1164 = log2(_1162);
    bool _1166 = uint(_1160) >= uint(_757);
    bool _1168 = !_1166;
    int _1170 = _1168 ? 0 : (-1);
    bool _1172 = _1152 >= 0.0;
    bool _1174 = isnan(_1152);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan(0.0);
    bool _1180 = _1176 || _1178;
    int _1182 = ~_1154;
    int _1184 = _1182 + _1170;
    int _1186 = _1184 + 1;
    int _1188 = _1180 ? 0 : 1;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1192 = _1190 != 0;
    int _1194 = _757 * _1186;
    int _1196 = _1194 + _1124;
    float _1198 = _123 * _1164;
    bool _1200 = _1156 > 0.5;
    bool _1202 = !_809;
    int _1204 = _1202 ? _1196 : (-1);
    float _1206 = -_225;
    int _1208 = _1200 ? as_type<int>(_1206) : as_type<int>(_225);
    float _1210 = exp2(_1198);
    int _1212 = _1204 & 3;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1218 = _1216 != 0;
    bool _1220 = uint(_1212) > 1u;
    int _1222 = _1214 ? 0 : 1;
    bool _1224 = _1120 > 0.5;
    int _1226 = ~_1222;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    float _1232 = -_221;
    int _1234 = _1224 ? as_type<int>(_1232) : as_type<int>(_221);
    bool _1236 = _1152 > 0.0;
    float _1238 = -_1210;
    float _1240 = _1238 + 1.0;
    int _1242 = ~_1188;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    int _1248 = _1230;
    int _1250 = _1246;
    if (!_1220)
    {
        int _1252 = ~_1222;
        int _1254 = _1252 + 1;
        _1248 = _1254;
    }
    int _1256 = _1248;
    bool _1258 = _743 > 0.5;
    bool _1260 = !_1218;
    float _1262 = _1260 ? _221 : as_type<float>(_1234);
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1270 = _1268 != 0;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1274 = _1272 != 0;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1278 = _1276 != 0;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1284 = !_1192;
    float _1286 = _1284 ? _225 : as_type<float>(_1208);
    float _1288 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1236)
    {
        int _1290 = ~_1188;
        int _1292 = _1290 + 1;
        _1250 = _1292;
    }
    int _1294 = _1250;
    float _1296 = 1.0 / _1266;
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1300 = _1298 != 0;
    float _1302 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1306 = _1304 != 0;
    float _1308 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1288);
    int _1310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1312 = _1310 != 0;
    float _1314 = _1120 * 2.0;
    float _1316 = 1.0 / _1282;
    float _1318 = -_221;
    int _1320 = _1258 ? as_type<int>(_1318) : as_type<int>(_221);
    float _1322 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1302);
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1326 = _1324 != 0;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1328;
    float _1332 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1308);
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1336 = _737 + _1334;
    float _1338 = floor(_1314);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1342 = _737 + _1340;
    float _1344 = _1330 * _859;
    float _1346 = _1336 * _907;
    float _1348 = _1342 * _927;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1366 = _1352 * _938;
    float _1368 = _1356 * _1296;
    float _1370 = 0.0;
    if (!_1326)
    {
        _1370 = _1120;
    }
    float _1372 = _1370;
    float _1374 = _1360 * _1316;
    float _1376 = 0.0;
    float _1378 = _1372;
    if (!_1326)
    {
        _1376 = _1120;
    }
    float _1380 = _1376;
    float _1382 = _1364 * _948;
    float _1384 = _1380;
    if (_1326)
    {
        _1378 = as_type<float>(_925);
    }
    float _1386 = _1378;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1390 = _1388 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1326)
    {
        _1384 = as_type<float>(_925);
    }
    float _1392 = _1384;
    float _1394 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1322);
    float _1396 = _1390 * _952;
    bool _1398 = _1338 >= 0.0;
    bool _1400 = isnan(_1338);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1410 = _731 + _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1414 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1412;
    int _1416 = _1406 ? 0 : 1;
    float _1418 = fma(_1344, _1410, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1420 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1422 = isnan(0.0);
    bool _1424 = _1420 || _1422;
    bool _1426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1428 = _1424 || _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1430;
    float _1434 = fma(_1414, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1436 = _1428 ? _1240 : 0.0;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1440 = _731 + _1438;
    bool _1442 = _1338 > 0.0;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1446 = _1444 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1448 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1450 = _1448 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1452 = fma(_1366, _1440, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1454 = _1432 * _1000;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1458 = _731 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1460;
    float _1464 = fma(_1446, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1466 = fma(_851, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1468 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1470 = isnan(_731);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1476 = _1472 || _1474;
    float _1478 = float(_1476);
    float _1480 = fma(_1450, _1348, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1482 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1484 = isnan(_731);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1490 = _1486 || _1488;
    float _1492 = float(_1490);
    float _1494 = fma(_847, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1498 = _731 + _1496;
    float _1500 = fma(_1374, _1458, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1502 = fma(_1462, _1346, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1504 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1506 = isnan(_731);
    bool _1508 = _1504 || _1506;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1512 = _1508 || _1510;
    float _1514 = float(_1512);
    float _1516 = -_1478;
    float _1518 = _1516 + 1.0;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1522 = _731 + _1520;
    float _1524 = fma(_1368, _1498, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1526 = -_1492;
    float _1528 = _1526 + 1.0;
    bool _1530 = _731 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1532 = isnan(_731);
    bool _1534 = _1530 || _1532;
    bool _1536 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1538 = _1534 || _1536;
    float _1540 = float(_1538);
    float _1542 = _1492 * _1518;
    float _1544 = -_1514;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1382, _1522, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1550 = _1514 * _1528;
    bool _1552 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1554 = isnan(_737);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = fma(_1396, _749, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1566 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1568 = isnan(_737);
    bool _1570 = _1566 || _1568;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1574 = _1570 || _1572;
    float _1576 = float(_1574);
    float _1578 = _1540 * _1546;
    float _1580 = -_1540;
    float _1582 = _1580 + 1.0;
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1586 = 1.0 + _1584;
    float _1588 = _923 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1590 = -_1576;
    float _1592 = _1590 + 1.0;
    float _1594 = _823 * _1582;
    float _1596 = _871 * _875;
    float _1598 = -_871;
    float _1600 = _1598 + 1.0;
    float _1602 = 1.0 / _1586;
    float _1604 = _843 * _1592;
    float _1606 = -_843;
    float _1608 = _1606 + 1.0;
    float _1610 = _887 * _1600;
    float _1612 = -_887;
    float _1614 = _1612 + 1.0;
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1618 = _731 + _1616;
    float _1620 = _1562 * _1608;
    float _1622 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1624 = _899 * _1614;
    float _1626 = fma(_1454, _1618, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1628 = _1434 * _1620;
    float _1630 = _1494 * _1620;
    float _1632 = _1502 * _1620;
    float _1634 = _1418 * _1624;
    float _1636 = -_1562;
    float _1638 = _1636 + 1.0;
    float _1640 = _1436 * _1602;
    float _1642 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1628);
    float _1644 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1630);
    float _1646 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1632);
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1650 = -_899;
    float _1652 = _1650 + 1.0;
    float _1654 = fma(_1466, _1604, _1644);
    float _1656 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1648);
    int _1658 = ~_1416;
    int _1660 = _1658 + 1;
    int _1662 = _1660 + 1;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1634);
    int _1666 = _1662;
    if (!_1442)
    {
        int _1668 = ~_1416;
        int _1670 = _1668 + 1;
        _1666 = _1670;
    }
    int _1672 = _1666;
    float _1674 = fma(_1464, _1604, _1642);
    float _1676 = fma(_1480, _1604, _1646);
    float _1678 = as_type<float>(_925) * 2.0;
    float _1680 = fma(_1548, _1610, _1664);
    float _1682 = _743 + as_type<float>(_925);
    float _1684 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1688 = floor(_1678);
    float _1690 = _1682 + (-1.0);
    float _1692 = fma(_1622, -2.0, _1686);
    float _1694 = float(uint(_1100));
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1698 = -_1684;
    float _1700 = fma(_1588, 2.0, _1698);
    float _1702 = _1120 + as_type<float>(_925);
    float _1704 = fma(_1452, _1596, _1680);
    float _1706 = fma(_1690, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1708 = fma(_1392, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1696);
    float _1710 = _1262 + 0.5;
    float _1712 = -_123;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1700);
    float _1716 = as_type<float>(_901) * _1694;
    bool _1718 = !_1306;
    float _1720 = _1718 ? _221 : as_type<float>(_1320);
    float _1722 = _1702 + (-1.0);
    bool _1724 = as_type<float>(_925) > 0.5;
    float _1726 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1676);
    bool _1728 = !_1270;
    int _1730 = _1728 ? 0 : 1;
    float _1732 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1714);
    float _1734 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1736 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1738 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1740 = _803 + _1738;
    float _1742 = -_225;
    int _1744 = _1724 ? as_type<int>(_1742) : as_type<int>(_225);
    float _1746 = trunc(_1716);
    float _1748 = precise::max(_1746, 0.0);
    uint _1750 = uint(_1748);
    bool _1752 = _1688 > 0.0;
    float _1754 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1654);
    bool _1756 = _1688 >= 0.0;
    bool _1758 = isnan(_1688);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan(0.0);
    bool _1764 = _1760 || _1762;
    float _1766 = _1394 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1768 = !_1274;
    int _1770 = _1768 ? 0 : 1;
    float _1772 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1774 = _1736 + _1772;
    int _1776 = abs(_1730);
    float _1778 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1780 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1674);
    int _1782 = abs(_1770);
    float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1786 = _1766 + _1784;
    int _1788 = ~_757;
    int _1790 = _1788 + 1;
    float _1792 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1778);
    float _1794 = float(_1782);
    float _1796 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1692);
    float _1798 = float(_1294);
    float _1800 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1792);
    float _1802 = float(_1672);
    float _1804 = fma(_1524, _1594, _1704);
    float _1806 = in.m_58.x;
    float _1808 = in.m_58.y;
    float _1810 = in.m_58.z;
    float _1812 = _1794 * _1798;
    int _1814 = _1764 ? 0 : 1;
    float _1816 = _1720 + 0.5;
    int _1818 = _1790 * int(_1750);
    int _1820 = _1818 + _1100;
    bool _1822 = _1800 >= 0.0;
    float _1824 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1656);
    int _1826 = _1204 >> 31;
    float _1828 = _1816 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1830 = float(uint(_1820));
    float _1832 = -_1824;
    float _1834 = _1832 + 1.0;
    int _1836 = _1826 & 3;
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1840 = float(_1776);
    float _1842 = as_type<float>(_901) * _1830;
    int _1844 = _1204 + _1836;
    float _1846 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1708);
    float _1848 = -_1834;
    float _1850 = fma(_1262, _1848, _1732);
    float _1852 = _1840 * _1802;
    float _1854 = _1286 + (-0.5);
    int _1856 = _1844 >> 2;
    float _1858 = trunc(_1842);
    float _1860 = precise::max(_1858, 0.0);
    uint _1862 = uint(_1860);
    float _1864 = _1852 * (-2.0);
    float _1866 = -_1854;
    float _1868 = -_1796;
    float _1870 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1868);
    int _1872 = ~_1814;
    int _1874 = _1872 + 1;
    int _1876 = _1874 + 1;
    float _1878 = -_1846;
    float _1880 = _1878 + 1.0;
    int _1882 = _1856 << 4;
    int _1884 = _1882 + 512;
    float _1886 = fma(_1706, _1864, _1706);
    int _1888 = _1876;
    if (!_1752)
    {
        int _1890 = ~_1814;
        int _1892 = _1890 + 1;
        _1888 = _1892;
    }
    int _1894 = _1888;
    float _1896 = fma(_1864, _1806, _1806);
    float _1898 = _1812 * (-2.0);
    float _1900 = _1828 * _1838;
    uint _1902 = uint(int(uint(_1884) >> uint(2)));
    uint _1904 = uint(int(uint(int(_1902)) >> uint(2)));
    int _1906 = int(_1902) & 3;
    float _1908 = (*spvDescriptorSet0.vp_c9)._m0[int(_1904)][_1906];
    int _1910 = int(_1902) + 1;
    uint _1912 = uint(int(uint(_1910) >> uint(2)));
    int _1914 = _1910 & 3;
    float _1916 = (*spvDescriptorSet0.vp_c9)._m0[int(_1912)][_1914];
    float _1918 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1920 = fma(_1734, _1898, _1734);
    float _1922 = fma(_1898, _1808, _1808);
    float _1924 = fma(_1500, _1578, _1804);
    int _1926 = int(_1750) + int(_1862);
    float _1928 = fma(_1286, _1880, _1870);
    bool _1930 = !_1312;
    float _1932 = _1930 ? _225 : as_type<float>(_1744);
    int _1934 = _1884 + 8;
    uint _1936 = uint(int(uint(_1934) >> uint(2)));
    uint _1938 = uint(int(uint(int(_1936)) >> uint(2)));
    int _1940 = int(_1936) & 3;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[int(_1938)][_1940];
    int _1944 = int(_1936) + 1;
    uint _1946 = uint(int(uint(_1944) >> uint(2)));
    int _1948 = _1944 & 3;
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[int(_1946)][_1948];
    bool _1952 = uint(_1212) >= 2u;
    float _1954 = _1726 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1956 = ~_757;
    int _1958 = _1956 + 1;
    float _1960 = -_1932;
    float _1962 = _1960 + 0.5;
    int _1964 = _1952 ? 0 : 1;
    float _1966 = _1754 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1968 = _1212 != 3;
    float _1970 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1972 = ~_1964;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    float _1978 = _1780 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1980 = _1970 * _1918;
    int _1982 = _1958 * _1926;
    int _1984 = _1982 + _1100;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1990 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1992 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1994 = abs(_1256);
    float _1996 = fma(_1564, _1550, _1924);
    int _1998 = _1976;
    if (_1968)
    {
        int _2000 = ~_1964;
        int _2002 = _2000 + 1;
        _1998 = _2002;
    }
    int _2004 = _1998;
    out.m_60.x = _1900;
    out.m_60.y = _1980;
    out.m_60.z = _1850;
    out.m_60.w = _1928;
    int _2006 = _1204 & 3;
    bool _2008 = _2006 != 0;
    float _2010 = fma(_1626, _1542, _1996);
    int _2012 = abs(_2004);
    out.m_62.x = _1986;
    out.m_62.y = _1988;
    out.m_62.z = _1992;
    out.m_62.w = _1990;
    bool _2014 = !_2008;
    int _2016 = _2014 ? 0 : 1;
    float _2018 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2010);
    bool _2020 = uint(_1984) >= uint(_757);
    if (_1822)
    {
        out.m_45.x = 0.0;
    }
    int _2022 = abs(_2016);
    float _2024 = as_type<float>(_925) + (-0.5);
    bool _2026 = !_2020;
    int _2028 = _2026 ? 0 : (-1);
    out.m_64.x = _2018;
    bool _2030 = _1212 != 3;
    float _2032 = _743 + (-0.5);
    int _2034 = ~_1926;
    int _2036 = _2034 + _2028;
    int _2038 = _2036 + 1;
    float _2040 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1896);
    int _2042 = ~_1994;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    bool _2048 = !_2030;
    int _2050 = _2048 ? 0 : (-1);
    int _2052 = _757 * _2038;
    int _2054 = _2052 + _1100;
    int _2056 = ~_2022;
    int _2058 = _2056 + 1;
    int _2060 = _2058 + 1;
    int _2062 = _2046 * as_type<int>(_1916);
    bool _2064 = !_1300;
    int _2066 = _2064 ? 0 : 1;
    int _2068 = abs(_2050);
    int _2070 = _2060 * as_type<int>(_1908);
    int _2072 = _2070 + _2062;
    int _2074 = abs(_2066);
    float _2076 = _1740 * _1740;
    int _2078 = ~_2012;
    int _2080 = _2078 + 1;
    int _2082 = _2080 + 1;
    int _2084 = ~_2068;
    int _2086 = _2084 + 1;
    int _2088 = _2086 + 1;
    float _2090 = fma(_1774, _1774, _2076);
    bool _2092 = _757 == 0;
    int _2094 = _2082 * as_type<int>(_1942);
    int _2096 = _2094 + _2072;
    int _2098 = ~_2074;
    int _2100 = _2098 + 1;
    int _2102 = _2100 + 1;
    float _2104 = fma(_1786, _1786, _2090);
    float _2106 = as_type<float>(_2072);
    if (_1822)
    {
        _2106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2108 = _2106;
    int _2110 = _2088 * as_type<int>(_1950);
    int _2112 = _2110 + _2096;
    bool _2114 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2116 = isnan(1.0);
    bool _2118 = _2114 || _2116;
    bool _2120 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2122 = _2118 || _2120;
    float _2124 = rsqrt(_2104);
    int _2126 = _2102 * _2112;
    bool _2128 = !_2092;
    int _2130 = _2128 ? _2054 : (-1);
    int _2132 = as_type<int>(_2108);
    if (_1822)
    {
        float _2134 = _2108 * 5.0;
        _2132 = as_type<int>(_2134);
    }
    int _2136 = _2132;
    bool _2138 = !_2122;
    float _2140 = _2138 ? _123 : _1640;
    int _2142 = _2130 * _2074;
    int _2144 = _2142 + _2126;
    float _2146 = _807 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2148 = !_1278;
    int _2150 = _2148 ? 0 : 1;
    if (_1822)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6598 = as_type<float>(_2136);
        out.gl_Position.z = _6598;
    }
    float _2152 = fma(_2140, _1886, _2040);
    float _2154 = float(_2144);
    float _2156 = _2146 * _2124;
    out.m_66.y = _2154;
    float _2158 = _1774 * _2156;
    float _2160 = _1740 * _2156;
    int _2162 = abs(_2150);
    if (_1822)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2164 = -_2160;
    float _2166 = _803 + _2164;
    float _2168 = _1786 * _2156;
    float _2170 = -_2158;
    float _2172 = _1736 + _2170;
    float _2174 = -_2160;
    float _2176 = _1740 + _2174;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2180 = _2166 + _2178;
    float _2182 = -_2168;
    float _2184 = _1766 + _2182;
    float _2186 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2188 = _2172 + _2186;
    float _2190 = float(_2162);
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2196 = _2184 + _2194;
    float _2198 = float(_1894);
    float _2200 = -_2158;
    float _2202 = _1774 + _2200;
    float _2204 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2192);
    float _2206 = _2176 * _2176;
    float _2208 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1922);
    float _2210 = -_2168;
    float _2212 = _1786 + _2210;
    float _2214 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2204);
    float _2216 = fma(_2202, _2202, _2206);
    float _2218 = _2190 * _2198;
    float _2220 = _743 + _1120;
    float _2222 = fma(_2140, _1920, _2208);
    bool _2224 = _2214 >= 0.0;
    float _2226 = fma(_2212, _2212, _2216);
    float _2228 = _2220 + (-1.0);
    float _2230 = _2218 * (-2.0);
    float _2232 = _2152 * 0.15915493667125701904296875;
    float _2234 = _2222 * 0.15915493667125701904296875;
    float _2236 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2238 = fma(_2230, _1810, _1810);
    float _2240 = _1120 + (-0.5);
    float _2242 = _2232 * 6.283185482025146484375;
    float _2244 = sin(_2242);
    float _2246 = fma(_2236, _2230, _2236);
    int _2248 = as_type<int>(_2238);
    float _2250 = _2188;
    float _2252 = _2184;
    if (_2224)
    {
        _827 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2254 = _827;
    float _2256 = fma(_2240, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2238);
    if (_2224)
    {
        out.m_45.x = 0.0;
    }
    float _2258 = _2232 * 6.283185482025146484375;
    float _2260 = cos(_2258);
    if (_2224)
    {
        float _2262 = _2254 * 5.0;
        _2248 = as_type<int>(_2262);
    }
    int _2264 = _2248;
    float _2266 = fma(_2140, _2246, _2256);
    if (_2224)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6790 = as_type<float>(_2264);
        out.gl_Position.z = _6790;
    }
    float _2268 = _2266 * 0.15915493667125701904296875;
    float _2270 = _2234 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = sqrt(_2226);
    float _2276 = _2234 * 6.283185482025146484375;
    float _2278 = cos(_2276);
    if (_2224)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2280 = _2268 * 6.283185482025146484375;
    float _2282 = cos(_2280);
    float _2284 = _2124 * _2274;
    float _2286 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2288 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2292 = _807 * _2284;
    float _2294 = _2284 * _2286;
    float _2296 = _2260 * _2278;
    float _2298 = _2268 * 6.283185482025146484375;
    float _2300 = sin(_2298);
    float _2302 = _2290 * _2292;
    float _2304 = _2288 * _2294;
    float _2306 = _2244 * _2272;
    float _2308 = _2260 * _2272;
    float _2310 = _2244 * _2278;
    float _2312 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2314 = _2312 * 0.5;
    float _2316 = _2282 * _2304;
    float _2318 = _2272 * _2282;
    float _2320 = _2278 * _2282;
    float _2322 = _2260 * _2316;
    float _2324 = _2244 * _2316;
    float _2326 = fma(_2300, _2296, _2306);
    float _2328 = -_2304;
    float _2330 = _2300 * _2328;
    float _2332 = fma(_2300, _2306, _2296);
    float _2334 = fma(_2326, _2302, _2322);
    float _2336 = -_2310;
    float _2338 = fma(_2300, _2308, _2336);
    float _2340 = fma(_2320, _2302, _2330);
    float _2342 = -_2308;
    float _2344 = fma(_2300, _2310, _2342);
    float _2346 = fma(_2338, _2314, _2334);
    float _2348 = fma(_2318, _2314, _2340);
    float _2350 = fma(_2344, _2302, _2324);
    float _2352 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2354 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2356 = fma(_2332, _2314, _2350);
    float _2358 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2352);
    float _2360 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2354);
    float _2362 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2358);
    float _2364 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2360);
    float _2366 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2368 = _2364 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2370 = _1766 + _2366;
    float _2372 = _1736 + _2368;
    float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2376 = _2370 + _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2380 = _2372 + _2378;
    float _2382 = _2376 * _2376;
    float _2384 = fma(_2380, _2380, _2382);
    float _2386 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2388 = sqrt(_2384);
    float _2390 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2386);
    float _2392 = fma(_2356, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2390);
    float _2394 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2396 = _803 + _2394;
    bool _2398 = _2388 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2400 = _2386;
    float _2402 = _2356;
    float _2404 = _2372;
    float _2406 = _2316;
    float _2408 = _2334;
    if (!_2398)
    {
        _2400 = _2372;
    }
    float _2410 = _2400;
    float _2412 = _2410;
    if (!_2398)
    {
        _2402 = _2370;
    }
    float _2414 = _2402;
    float _2416 = _2414;
    if (!_2398)
    {
        _2404 = _2396;
    }
    float _2418 = _2404;
    bool _2420 = !_2398;
    float _2422 = _2418;
    if (!_2420)
    {
        float _2424 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2428 = _2388 + _2426;
        float _2430 = rsqrt(_2384);
        float _2432 = _2428 * _2424;
        float _2434 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2436 = _2432 * 0.15915493667125701904296875;
        float _2438 = _2436 * 6.283185482025146484375;
        float _2440 = cos(_2438);
        float _2442 = _2436 * 6.283185482025146484375;
        float _2444 = sin(_2442);
        float _2446 = _2440 + (-1.0);
        float _2448 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2450 = fma(_2444, _2434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2452 = fma(_2396, _2440, _2448);
        float _2454 = _2430 * _2450;
        float _2456 = fma(_2380, _2454, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2458 = fma(_2376, _2454, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2422 = _2452;
        _2412 = _2456;
        _2416 = _2458;
    }
    float _2460 = _2422;
    float _2462 = _2412;
    float _2464 = _2416;
    float _2466 = -_803;
    float _2468 = _2466 + _2460;
    float _2470 = -_1736;
    float _2472 = _2470 + _2462;
    float _2474 = -_1766;
    float _2476 = _2474 + _2464;
    float _2478 = _2468 * _2468;
    float _2480 = fma(_2472, _2472, _2478);
    float _2482 = fma(_2476, _2476, _2480);
    float _2484 = sqrt(_2482);
    bool _2486 = _2484 > 0.0;
    float _2488 = _2480;
    float _2490 = _2484;
    float _2492 = _2464;
    if (!_2486)
    {
        _2488 = _2462;
    }
    float _2494 = _2488;
    float _2496 = _2494;
    float _2498 = _2494;
    if (!_2486)
    {
        _2490 = _2460;
    }
    float _2500 = _2490;
    bool _2502 = !_2486;
    float _2504 = _2500;
    float _2506 = _2500;
    if (!_2502)
    {
        bool _2508 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2510 = _2376;
        if (_2508)
        {
            float _2512 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2510 = _2512;
        }
        float _2514 = _2510;
        float _2516 = _2514;
        if (_2508)
        {
            float _2518 = _465 * _2514;
            _2406 = _2518;
        }
        float _2520 = _2406;
        float _2522 = _2520;
        if (_2508)
        {
            float _2524 = _467 * _2514;
            _2408 = _2524;
        }
        float _2526 = _2408;
        float _2528 = _2526;
        if (_2508)
        {
            float _2530 = _469 * _2514;
            _2516 = _2530;
        }
        float _2532 = _2516;
        float _2534 = _2532;
        if (!_2508)
        {
            bool _2536 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2540 = _2536 || _2538;
            bool _2542 = isnan(1.0);
            bool _2544 = _2540 || _2542;
            float _2546 = _123 + 1.0;
            if (!_2544)
            {
                float _2548 = _2546 * _2546;
                float _2550 = _2548 * 0.5;
                _125 = _2550;
            }
            float _2552 = _125;
            float _2554 = _2552;
            if (!_2544)
            {
                float _2556 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2554 = _2556;
            }
            float _2558 = _2554;
            bool _2560 = !_2544;
            float _2562 = _2558;
            if (!_2560)
            {
                float _2564 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2566 = log2(_2564);
                float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2570 = 1.0 + _2568;
                float _2572 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2574 = _2566 * _2546;
                float _2576 = 1.0 / _2570;
                float _2578 = _2572 * 0.693147182464599609375;
                float _2580 = exp2(_2574);
                float _2582 = 1.0 / _2578;
                float _2584 = _2580 + (-1.0);
                float _2586 = -_2584;
                float _2588 = fma(_2586, _2582, _2546);
                float _2590 = _2588 * _2576;
                float _2592 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2562 = _2592;
            }
            float _2594 = _2562;
            float _2596 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2598 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2600 = _2594 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2602 = _2594;
            if (!_2544)
            {
                _2602 = _2546;
            }
            float _2604 = _2602;
            float _2606 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2608 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2610 = _2596 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2612 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2606);
            float _2614 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2608);
            float _2616 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2612);
            bool _2618 = !_2544;
            float _2620 = _2604;
            _2496 = _2614;
            if (!_2618)
            {
                float _2622 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2624 = log2(_2622);
                float _2626 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2628 = 1.0 + _2626;
                float _2630 = 1.0 / _2628;
                float _2632 = _2624 * _2546;
                float _2634 = exp2(_2632);
                float _2636 = -_2634;
                float _2638 = _2636 + 1.0;
                float _2640 = _2638 * _2630;
                _2620 = _2640;
            }
            float _2642 = _2620;
            float _2644 = fma(_2598, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2610);
            float _2646 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2614);
            float _2648 = fma(_2642, _163, _2616);
            float _2650 = fma(_2600, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2644);
            float _2652 = fma(_2642, _161, _2646);
            float _2654 = -_427;
            float _2656 = _2654 + _2648;
            float _2658 = fma(_2642, _165, _2650);
            float _2660 = -_429;
            float _2662 = _2660 + _2652;
            float _2664 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2666 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2668 = _2656 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2670 = -_431;
            float _2672 = _2670 + _2658;
            float _2674 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2664);
            float _2676 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2666);
            float _2678 = fma(_2662, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2668);
            float _2680 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2674);
            float _2682 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2676);
            float _2684 = fma(_2672, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2678);
            _473 = _2682;
            _475 = _2680;
            _477 = _2684;
            _2522 = _2680;
            _2528 = _2682;
            _2534 = _2684;
            _2504 = _2650;
        }
        float _2686 = _473;
        float _2688 = _475;
        float _2690 = _477;
        float _2692 = _2522;
        float _2694 = _2528;
        float _2696 = _2534;
        float _2698 = _2504;
        float _2700 = _2496;
        float _2702 = _2686 * _2686;
        float _2704 = rsqrt(_2482);
        float _2706 = fma(_2688, _2688, _2702);
        float _2708 = fma(_2690, _2690, _2706);
        float _2710 = sqrt(_2708);
        float _2712 = _2472 * _2704;
        float _2714 = _2468 * _2704;
        float _2716 = _2476 * _2704;
        bool _2718 = _2710 > 0.0;
        float _2720 = _2700;
        float _2722 = _2698;
        if (!_2718)
        {
            _2720 = _2462;
        }
        float _2724 = _2720;
        _2498 = _2724;
        if (!_2718)
        {
            _2722 = _2460;
        }
        float _2726 = _2722;
        bool _2728 = !_2718;
        _2506 = _2726;
        if (!_2728)
        {
            float _2730 = rsqrt(_2708);
            float _2732 = _2730 * _2686;
            float _2734 = _2730 * _2688;
            float _2736 = _2730 * _2690;
            float _2738 = _2714 * _2732;
            float _2740 = fma(_2712, _2734, _2738);
            float _2742 = fma(_2716, _2736, _2740);
            float _2744 = _2742 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2746 = fma(_2692, _2744, _2462);
            float _2748 = fma(_2694, _2744, _2460);
            float _2750 = fma(_2696, _2744, _2464);
            _2506 = _2748;
            _2492 = _2750;
            _2498 = _2746;
        }
    }
    float _2752 = _2506;
    float _2754 = _2492;
    float _2756 = _2498;
    float _2758 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2760 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2762 = isnan(0.5);
    bool _2764 = _2760 || _2762;
    bool _2766 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2768 = _2764 || _2766;
    float _2770 = -_2160;
    float _2772 = _2770 + _2752;
    bool _2774 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2776 = isnan(0.5);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2782 = _2778 || _2780;
    float _2784 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2758);
    float _2786 = -_2168;
    float _2788 = _2786 + _2754;
    float _2790 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2784);
    float _2792 = _2166 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2794 = _2790 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2796 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2792);
    float _2798 = 1.0 / _2794;
    float _2800 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2796);
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2804 = _2802 + _2794;
    float _2806 = _2804 * _2798;
    float _2808 = _2806 * 0.5;
    float _2810 = -_2158;
    float _2812 = _2810 + _2756;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2816 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2814);
    float _2818 = _2808;
    float _2820 = _2772;
    float _2822 = _2812;
    float _2824 = _2788;
    float _2826 = _2794;
    if (_2782)
    {
        _2818 = 1.0;
    }
    float _2828 = _2818;
    float _2830 = 1.0 / _2816;
    float _2832 = _2828;
    if (!_2768)
    {
        float _2834 = _2180 * _2180;
        float _2836 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2838 = -_1766;
        float _2840 = _2838 + _2754;
        float _2842 = -_1736;
        float _2844 = _2842 + _2756;
        float _2846 = fma(_2188, _2188, _2834);
        float _2848 = -_803;
        float _2850 = _2848 + _2752;
        float _2852 = fma(_2196, _2196, _2846);
        float _2854 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2856 = sqrt(_2852);
        float _2858 = _2836 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2860 = 1.0 / _2284;
        float _2862 = precise::min(_2856, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2864 = _2862 * _2854;
        float _2866 = _2864 * _2860;
        float _2868 = _2858 * _2866;
        float _2870 = _2840 * _2866;
        float _2872 = fma(_2844, _2868, _2172);
        float _2874 = fma(_2850, _2868, _2166);
        float _2876 = fma(_2858, _2870, _2184);
        _2820 = _2874;
        _2822 = _2872;
        _2824 = _2876;
        _2250 = _2856;
        _2826 = _2866;
    }
    float _2878 = _2820;
    float _2880 = _2822;
    float _2882 = _2824;
    float _2884 = _2250;
    float _2886 = _2826;
    float _2888 = _2886;
    float _2890 = _2884;
    if (_2782)
    {
        _2888 = 1.0;
    }
    float _2892 = _2888;
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2896 = _2830 * _2894;
    float _2898 = _2892;
    if (!_2782)
    {
        float _2900 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2902 = _2900 * 0.15915493667125701904296875;
        float _2904 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2906 = _2902 * 6.283185482025146484375;
        float _2908 = cos(_2906);
        float _2910 = _2904 * 0.15915493667125701904296875;
        float _2912 = _2902 * 6.283185482025146484375;
        float _2914 = sin(_2912);
        float _2916 = 1.0 / _2908;
        float _2918 = _2910 * 6.283185482025146484375;
        float _2920 = cos(_2918);
        float _2922 = _2914 * _2916;
        float _2924 = _2910 * 6.283185482025146484375;
        float _2926 = sin(_2924);
        float _2928 = _2920 * _2922;
        float _2930 = 1.0 / _2928;
        float _2932 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2934 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2932;
        float _2936 = 1.0 / _2934;
        float _2938 = _2926 * _2930;
        float _2940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2942 = fma(_2896, _2938, _2940);
        float _2944 = _2942 * _2936;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        _2252 = _2936;
        _2832 = _2946;
    }
    float _2948 = _2252;
    float _2950 = _2832;
    float _2952 = _2948;
    if (!_2782)
    {
        float _2954 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2956 = _2954 * 0.15915493667125701904296875;
        float _2958 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2960 = _2956 * 6.283185482025146484375;
        float _2962 = cos(_2960);
        float _2964 = _2958 * 0.15915493667125701904296875;
        float _2966 = _2956 * 6.283185482025146484375;
        float _2968 = sin(_2966);
        float _2970 = 1.0 / _2962;
        float _2972 = _2964 * 6.283185482025146484375;
        float _2974 = cos(_2972);
        float _2976 = _2968 * _2970;
        float _2978 = _2964 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        float _2982 = _2974 * _2976;
        float _2984 = 1.0 / _2982;
        float _2986 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2988 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2986;
        float _2990 = 1.0 / _2988;
        float _2992 = _2980 * _2984;
        float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2996 = fma(_2896, _2992, _2994);
        float _2998 = _2996 * _2990;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -_3000;
        float _3004 = _3002 + 1.0;
        _2890 = _2992;
        _2952 = _2970;
        _2898 = _3004;
    }
    float _3006 = _2890;
    float _3008 = _2952;
    float _3010 = _2898;
    float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3014 = _2878 + _3012;
    float _3016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3018 = _2880 + _3016;
    float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3022 = _2882 + _3020;
    float _3024 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3026 = _3014 * _3014;
    float _3028 = fma(_3018, _3018, _3026);
    float _3030 = fma(_3022, _3022, _3028);
    float _3032 = rsqrt(_3030);
    float _3034 = sqrt(_3030);
    float _3036 = _3032 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3038 = _3018 * _3036;
    float _3040 = _3022 * _3036;
    float _3042 = _3038 * _3038;
    float _3044 = _3040 * _3040;
    float _3046 = _3042 + _3044;
    float _3048 = sqrt(_3046);
    bool _3050 = _3048 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3052 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3054 = _3048 + _3052;
    float _3056 = _3032;
    float _3058 = _3008;
    float _3060 = _3054;
    float _3062 = _3006;
    float _3064 = _3014;
    float _3066 = _3036;
    if (_3050)
    {
        float _3068 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3056 = _3068;
    }
    float _3070 = _3056;
    if (_3050)
    {
        float _3072 = rsqrt(_3046);
        _3058 = _3072;
    }
    float _3074 = _3058;
    float _3076 = _3074;
    if (_3050)
    {
        float _3078 = _3054 * _3070;
        _3060 = _3078;
    }
    float _3080 = _3060;
    if (_3050)
    {
        float _3082 = _3080 * 0.15915493667125701904296875;
        _3062 = _3082;
    }
    float _3084 = _3062;
    float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3088 = fma(_3034, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3086);
    float _3090 = precise::clamp(_3088, 0.0, 1.0);
    float _3092 = _3070;
    float _3094 = _3084;
    if (_3050)
    {
        float _3096 = _3084 * 6.283185482025146484375;
        float _3098 = sin(_3096);
        _3092 = _3098;
    }
    float _3100 = _3092;
    float _3102 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3104 = precise::max(0.0, _3102);
    float _3106 = _3022;
    float _3108 = _3104;
    if (_3050)
    {
        float _3110 = _3084 * 6.283185482025146484375;
        float _3112 = cos(_3110);
        _3106 = _3112;
    }
    float _3114 = _3106;
    float _3116 = -_3036;
    float _3118 = -_3104;
    float _3120 = fma(_3014, _3116, _3118);
    if (!_3050)
    {
        _3064 = _3040;
    }
    float _3122 = _3064;
    float _3124 = _3122;
    if (_3050)
    {
        float _3126 = _3120 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3108 = _3126;
    }
    float _3128 = _3108;
    float _3130 = _3100;
    float _3132 = _3128;
    if (_3050)
    {
        float _3134 = fma(_3100, _3128, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3130 = _3134;
    }
    float _3136 = _3130;
    float _3138 = _3136;
    float _3140 = _3114;
    if (_3050)
    {
        float _3142 = _3114 + (-1.0);
        _3132 = _3142;
    }
    float _3144 = _3132;
    float _3146 = _3144;
    if (_3050)
    {
        float _3148 = _3074 * _3136;
        _3066 = _3148;
    }
    float _3150 = _3066;
    if (!_3050)
    {
        _3076 = _3038;
    }
    float _3152 = _3076;
    float _3154 = _3152;
    if (_3050)
    {
        float _3156 = _3144 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3094 = _3156;
    }
    float _3158 = _3094;
    if (_3050)
    {
        float _3160 = _3038 * _3150;
        _3154 = _3160;
    }
    float _3162 = _3154;
    if (!_3050)
    {
        _3138 = _3120;
    }
    float _3164 = _3138;
    float _3166 = _3164;
    if (_3050)
    {
        float _3168 = _3040 * _3150;
        _3124 = _3168;
    }
    float _3170 = _3124;
    if (!_3050)
    {
        _3146 = _3042;
    }
    float _3172 = _3146;
    float _3174 = _3172;
    if (_3050)
    {
        float _3176 = fma(_3120, _3114, _3158);
        _3166 = _3176;
    }
    float _3178 = _3166;
    if (_3050)
    {
        float _3180 = _3162 * _3162;
        _3174 = _3180;
    }
    float _3182 = _3174;
    if (!_3050)
    {
        _3140 = _3044;
    }
    float _3184 = _3140;
    float _3186 = _3184;
    if (_3050)
    {
        float _3188 = _3170 * _3170;
        _3186 = _3188;
    }
    float _3190 = _3186;
    float _3192 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3194 = fma(_3178, _3178, _3182);
    float _3196 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3192);
    float _3198 = _3194 + _3190;
    float _3200 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3202 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3204 = -_3090;
    float _3206 = _3204 + 1.0;
    float _3208 = rsqrt(_3198);
    float _3210 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3200);
    float _3212 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3214 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3202);
    float _3216 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3196);
    float _3218 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3210);
    float _3220 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3212);
    float _3222 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3214);
    float _3224 = abs(_3206);
    float _3226 = log2(_3224);
    float _3228 = _3218 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3230 = fma(_2882, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3220);
    float _3232 = _3222 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3234 = _3216 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3236 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3238 = _3230 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3240 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3242 = _3208 * _3162;
    float _3244 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3236);
    float _3246 = _3208 * _3178;
    float _3248 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3250 = _3242 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3252 = _3208 * _3170;
    float _3254 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3244);
    float _3256 = -_3248;
    float _3258 = fma(_3256, _3024, 1.0);
    float _3260 = -_3250;
    float _3262 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3260);
    float _3264 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3266 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3254);
    float _3268 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3270 = -_3252;
    float _3272 = fma(_3270, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3262);
    float _3274 = exp2(_3264);
    float _3276 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3240);
    float _3278 = _3246 + 1.0;
    float _3280 = fma(_3272, -0.5, 0.5);
    float _3282 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3276);
    float _3284 = log2(_3258);
    float _3286 = fma(_3272, 0.5, 0.5);
    float _3288 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3268);
    float _3290 = fma(_3286, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3292 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3288);
    float _3294 = 1.0 / _3266;
    float _3296 = -_3246;
    float _3298 = fma(_3274, _3278, _3296);
    float _3300 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3282);
    float _3302 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3292);
    float _3304 = fma(_3286, _3290, -0.212114393711090087890625);
    float _3306 = sqrt(_3280);
    float _3308 = _3284 * 0.693147182464599609375;
    float _3310 = fma(_3286, _3304, 1.570728778839111328125);
    float _3312 = _3308 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3314 = _3300 * _3294;
    float _3316 = _3302 * _3294;
    float _3318 = fma(_3314, 0.5, 0.5);
    float _3320 = fma(_3316, -0.5, 0.5);
    float _3322 = fma(_3298, 0.5, 0.5);
    float _3324 = _3306 * 0.636619746685028076171875;
    float3 _8435 = float3(_3318, _3320, _3312);
    float _3326 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8435, float3(0.0), isnan(_8435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8435, float3(0.0), isnan(_8435)), level(0.0)).x;
    float _3328 = -_3310;
    float _3330 = fma(_3324, _3328, 1.0);
    float3 _8451 = float3(_3318, _3320, _3312);
    float4 _3333 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8451, float3(0.0), isnan(_8451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8451, float3(0.0), isnan(_8451)), level(0.0)).xyzw;
    float _3335 = _3333.x;
    float _3337 = _3333.y;
    float _3339 = _3333.z;
    float _3341 = _3333.w;
    float2 _8468 = float2(_3330, _3322);
    float3 _3345 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8468, float2(0.0), isnan(_8468)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8468, float2(0.0), isnan(_8468)), level(0.0)).xyz;
    float _3347 = _3345.x;
    float _3349 = _3345.y;
    float _3351 = _3345.z;
    float _3353 = _3226 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3355 = _3228 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3357 = _2950 > 0.0;
    bool _3359 = isnan(_2950);
    bool _3361 = _3357 || _3359;
    bool _3363 = isnan(0.0);
    bool _3365 = _3361 || _3363;
    float _3367 = _3300 + _3266;
    float _3369 = fma(_3232, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3355);
    float _3371 = exp2(_3353);
    bool _3373 = _3010 <= 0.0;
    bool _3375 = !_3365;
    bool _3377 = _3373 || _3375;
    float _3379 = _3367 * 0.5;
    float _3381 = fma(_3234, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3369);
    float _3383 = fma(_3238, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3381);
    float _3385 = _2950 * _3010;
    float _3387 = _3266 * 0.5;
    float _3389 = _3383 + _3266;
    float _3391 = _3385 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3300;
    out.gl_Position.y = _3302;
    out.gl_Position.z = _3383;
    out.gl_Position.w = _3266;
    float _3393 = _3389 * 0.5;
    float _3395 = -_3371;
    float _3397 = _3395 + 1.0;
    float _3399 = fma(_3302, -0.5, _3387);
    float _3401 = _3391 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3403 = _3397 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3379;
    out.m_68.y = _3399;
    out.m_68.z = _3393;
    out.m_68.w = _3266;
    float _3405 = -_3403;
    float _3407 = _3405 + 1.0;
    out.m_45.x = _3401;
    float _3409 = _3403 * _3326;
    float _3411 = _3341 * _3409;
    float _3413 = _3341 * _3407;
    float _3415 = _3351 * _3409;
    float _3417 = fma(_3347, _3411, _3335);
    float _3419 = fma(_3349, _3411, _3337);
    float _3421 = fma(_3341, _3415, _3339);
    out.m_70.x = _3417;
    out.m_70.y = _3419;
    out.m_70.z = _3421;
    out.m_70.w = _3413;
    if (!_3377)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3423 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3423;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

