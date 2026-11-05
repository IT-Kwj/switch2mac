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
    float4 m_58 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1345 = as_type<float>(_99);
        out.gl_Position.z = _1345;
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
        float _1413 = as_type<float>(_135);
        out.gl_Position.z = _1413;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    float _161 = _155 * 6.283185482025146484375;
    float _163 = floor(_155);
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _173 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_167;
    int _189 = _187 ? 0 : 1;
    bool _191 = !_181;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_189);
    int _197 = abs(_193);
    float _199 = -_163;
    float _201 = _155 + _199;
    float _203 = -_201;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _207 = float(_195);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = fma(_185, 0.5, 0.5);
    bool _213 = !_171;
    int _215 = _213 ? 0 : 1;
    float _217 = abs(_205);
    float _219 = _207 * _217;
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_215);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_197);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _219);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _441 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
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
    float _465 = in.m_42.x;
    float _467 = in.m_42.y;
    float _469 = in.m_42.z;
    float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _473 = in.m_52.y;
    bool _475 = _143 > 0.5;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _477;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _483 = _481 != 0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _487 = _463 + _485;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _491 = _489 != 0;
    float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _497 = 1.0 / _479;
    float _499 = _467 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _501 = _467 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _503 = _467 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _505 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].x, _499);
    float _507 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].x, _501);
    float _509 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
    bool _511 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _513 = isnan(_463);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = _473 > 0.5;
    float _525 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
    float _527 = _487 * _497;
    bool _529 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _531 = isnan(_463);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
    float _543 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
    float _545 = -_539;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _549;
    float _553 = -_159;
    int _555 = _523 ? as_type<int>(_553) : as_type<int>(_159);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _557;
    float _561 = _521 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _563;
    float _567 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _569 = fma(_559, _527, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _571 = _525 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _573 = fma(_565, _527, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _575 = -_177;
    int _577 = _475 ? as_type<int>(_575) : as_type<int>(_177);
    float _579 = _567 * _561;
    float _581 = _569 * _561;
    float _583 = _573 * _561;
    bool _585 = !_483;
    float _587 = _585 ? _177 : as_type<float>(_577);
    float _589 = _543 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _591 = !_491;
    float _593 = _591 ? _159 : as_type<float>(_555);
    float _595 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _597 = -_521;
    float _599 = _597 + 1.0;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _603 = _589 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _607 = _571 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _611 = _595 + _609;
    float _613 = _587 + 0.5;
    float _615 = _603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _619 = -_593;
    float _621 = _619 + 0.5;
    float _623 = _613 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].x, _615);
    float _627 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].x, _617);
    float _629 = _603 * _603;
    float _631 = _621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _633 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[28].z, _625);
    float _635 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _637 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].z, _583);
    float _639 = _623 * _471;
    float _641 = _631 * _493;
    bool _643 = _633 >= 0.0;
    float _645 = fma(_611, _611, _629);
    float _647 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].y, _635);
    float _649 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].z, _637);
    float _651 = fma(_607, _607, _645);
    float _653 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = rsqrt(_651);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _663 = 0.0;
    int _665 = as_type<int>(_661);
    if (_643)
    {
        _663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _667 = _663;
    float _669 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _677 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_643)
    {
        float _685 = _667 * 5.0;
        _665 = as_type<int>(_685);
    }
    int _687 = _665;
    out.m_54.x = _639;
    out.m_54.y = _641;
    float _689 = _603 * _655;
    float _691 = _611 * _655;
    out.m_56.x = _677;
    out.m_56.y = _679;
    out.m_56.z = _681;
    out.m_58.x = _671;
    out.m_58.y = _683;
    out.m_58.z = _673;
    out.m_58.w = _675;
    if (_643)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2343 = as_type<float>(_687);
        out.gl_Position.z = _2343;
    }
    if (_643)
    {
        out.m_45.x = 0.0;
    }
    if (_643)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _693 = -_689;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _697 = -_691;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _595);
    float _701 = _607 * _655;
    float _703 = -_689;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _709 = _695 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _699 + _711;
    float _715 = -_701;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _571);
    float _719 = in.m_60.x;
    float _721 = in.m_60.y;
    float _723 = _709 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = -_691;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _731 = _717 + _729;
    float _733 = _705 * _705;
    float _735 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _737 = -_701;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _741 = fma(_727, _727, _733);
    float _743 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[28].z, _735);
    float _745 = fma(_739, _739, _741);
    bool _747 = _743 >= 0.0;
    float _749 = sqrt(_745);
    float _751 = _433 * _719;
    float _753 = _435 * _721;
    float _755 = _731;
    if (_747)
    {
        _755 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _757 = _755;
    int _759 = as_type<int>(_757);
    if (_747)
    {
        out.m_45.x = 0.0;
    }
    float _761 = _243 * _751;
    float _763 = _243 * _753;
    if (_747)
    {
        float _765 = _757 * 5.0;
        _759 = as_type<int>(_765);
    }
    int _767 = _759;
    float _769 = _655 * _749;
    if (_747)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2491 = as_type<float>(_767);
        out.gl_Position.z = _2491;
    }
    if (_747)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _771 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _775 = _761 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _779 = _769 * _771;
    float _781 = _769 * _775;
    float _783 = _769 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = _783 * 0.5;
    float _787 = _773 * _779;
    float _789 = _777 * _781;
    float _791 = _787 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _793 = _787 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _791);
    float _797 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _793);
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _795);
    float _801 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _797);
    float _803 = _799 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _805 = _801 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _807 = _571 + _803;
    float _809 = _595 + _805;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _807 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _817 = _809 + _815;
    float _819 = _813 * _813;
    float _821 = fma(_817, _817, _819);
    float _823 = _787 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = sqrt(_821);
    float _827 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _829 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _827);
    float _831 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _833 = _589 + _831;
    bool _835 = _825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _837 = _787;
    float _839 = _789;
    float _841 = _785;
    float _843 = _807;
    if (!_835)
    {
        _837 = _809;
    }
    float _845 = _837;
    float _847 = _845;
    if (!_835)
    {
        _839 = _807;
    }
    float _849 = _839;
    float _851 = _849;
    if (!_835)
    {
        _841 = _833;
    }
    float _853 = _841;
    bool _855 = !_835;
    float _857 = _853;
    if (!_855)
    {
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _863 = _825 + _861;
        float _865 = rsqrt(_821);
        float _867 = _863 * _859;
        float _869 = _833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = _867 * 0.15915493667125701904296875;
        float _873 = _871 * 6.283185482025146484375;
        float _875 = sin(_873);
        float _877 = _871 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = fma(_875, _869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _883 = _865 * _881;
        float _885 = _879 + (-1.0);
        float _887 = fma(_817, _883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _889 = fma(_813, _883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _891 = _885 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _893 = fma(_833, _879, _891);
        _857 = _893;
        _847 = _887;
        _851 = _889;
    }
    float _895 = _857;
    float _897 = _847;
    float _899 = _851;
    float _901 = -_689;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _905 = -_691;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _909 = -_701;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _903 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _907 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _923 = _911 + _921;
    float _925 = _915 * _915;
    float _927 = fma(_919, _919, _925);
    float _929 = fma(_923, _923, _927);
    float _931 = rsqrt(_929);
    float _933 = _931 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _935 = _919 * _933;
    float _937 = _923 * _933;
    float _939 = _935 * _935;
    float _941 = _937 * _937;
    float _943 = _939 + _941;
    float _945 = sqrt(_943);
    bool _947 = _945 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _951 = _945 + _949;
    float _953 = _923;
    float _955 = _897;
    float _957 = _951;
    float _959 = _915;
    float _961 = _935;
    if (_947)
    {
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _963;
    }
    float _965 = _953;
    if (_947)
    {
        float _967 = rsqrt(_943);
        _955 = _967;
    }
    float _969 = _955;
    float _971 = _969;
    if (_947)
    {
        float _973 = _951 * _965;
        _957 = _973;
    }
    float _975 = _957;
    if (_947)
    {
        float _977 = _975 * 0.15915493667125701904296875;
        _843 = _977;
    }
    float _979 = _843;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _983 = _931;
    if (_947)
    {
        float _985 = _979 * 6.283185482025146484375;
        float _987 = sin(_985);
        _983 = _987;
    }
    float _989 = _983;
    float _991 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _993 = precise::max(0.0, _991);
    float _995 = _927;
    float _997 = _991;
    float _999 = _993;
    if (_947)
    {
        float _1001 = _979 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        _995 = _1003;
    }
    float _1005 = _995;
    float _1007 = -_933;
    float _1009 = -_993;
    float _1011 = fma(_915, _1007, _1009);
    if (_947)
    {
        float _1013 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _997 = _1013;
    }
    float _1015 = _997;
    float _1017 = sqrt(_929);
    float _1019 = _989;
    float _1021 = _1015;
    if (_947)
    {
        float _1023 = fma(_989, _1015, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _959 = _1023;
    }
    float _1025 = _959;
    float _1027 = _1025;
    if (!_947)
    {
        _1019 = _937;
    }
    float _1029 = _1019;
    float _1031 = _1029;
    if (_947)
    {
        float _1033 = _1005 + (-1.0);
        _1021 = _1033;
    }
    float _1035 = _1021;
    float _1037 = _1035;
    if (_947)
    {
        float _1039 = _969 * _1025;
        _1027 = _1039;
    }
    float _1041 = _1027;
    if (!_947)
    {
        _971 = _1011;
    }
    float _1043 = _971;
    float _1045 = _1043;
    if (_947)
    {
        float _1047 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _999 = _1047;
    }
    float _1049 = _999;
    float _1051 = _1049;
    if (_947)
    {
        float _1053 = _935 * _1041;
        _961 = _1053;
    }
    float _1055 = _961;
    if (!_947)
    {
        _1037 = _939;
    }
    float _1057 = _1037;
    float _1059 = _1057;
    if (_947)
    {
        float _1061 = _937 * _1041;
        _1031 = _1061;
    }
    float _1063 = _1031;
    if (_947)
    {
        float _1065 = fma(_1011, _1005, _1049);
        _1045 = _1065;
    }
    float _1067 = _1045;
    if (_947)
    {
        float _1069 = _1055 * _1055;
        _1059 = _1069;
    }
    float _1071 = _1059;
    if (!_947)
    {
        _1051 = _941;
    }
    float _1073 = _1051;
    float _1075 = _1073;
    if (_947)
    {
        float _1077 = _1063 * _1063;
        _1075 = _1077;
    }
    float _1079 = _1075;
    float _1081 = fma(_1067, _1067, _1071);
    float _1083 = _903 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = _1081 + _1079;
    float _1087 = _903 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1091 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1089);
    float _1093 = precise::clamp(_1091, 0.0, 1.0);
    float _1095 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1097 = rsqrt(_1085);
    float _1099 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1087);
    float _1101 = _903 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = -_1093;
    float _1105 = _1103 + 1.0;
    float _1107 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1099);
    float _1109 = _903 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1111 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1115 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1109);
    float _1117 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1111);
    float _1119 = abs(_1105);
    float _1121 = log2(_1119);
    float _1123 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1125 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1115);
    float _1127 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1129 = _1097 * _1055;
    float _1131 = -_1123;
    float _1133 = fma(_1131, _981, 1.0);
    float _1135 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1095);
    float _1137 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1141 = _1097 * _1067;
    float _1143 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1145 = _1097 * _1063;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1139);
    float _1149 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1151 = -_1143;
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1151);
    float _1155 = log2(_1133);
    float _1157 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1159 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1161 = -_1145;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1153);
    float _1165 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1157);
    float _1169 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = fma(_1163, -0.5, 0.5);
    float _1173 = exp2(_1159);
    float _1175 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1165);
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1163, 0.5, 0.5);
    float _1181 = _1141 + 1.0;
    float _1183 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1175);
    float _1185 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1187 = fma(_1179, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1189 = 1.0 / _1167;
    float _1191 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1183);
    float _1193 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1185);
    float _1195 = fma(_1179, _1187, -0.212114393711090087890625);
    float _1197 = _1155 * 0.693147182464599609375;
    float _1199 = fma(_1179, _1195, 1.570728778839111328125);
    float _1201 = sqrt(_1171);
    float _1203 = -_1141;
    float _1205 = fma(_1173, _1181, _1203);
    float _1207 = _1197 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1209 = fma(_1205, 0.5, 0.5);
    float _1211 = _1191 * _1189;
    float _1213 = _1193 * _1189;
    float _1215 = fma(_1211, 0.5, 0.5);
    float _1217 = fma(_1213, -0.5, 0.5);
    float _1219 = _1201 * 0.636619746685028076171875;
    float3 _3248 = float3(_1215, _1217, _1207);
    float _1221 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3248, float3(0.0), isnan(_3248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3248, float3(0.0), isnan(_3248)), level(0.0)).x;
    float _1223 = -_1199;
    float _1225 = fma(_1219, _1223, 1.0);
    float3 _3264 = float3(_1215, _1217, _1207);
    float4 _1228 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3264, float3(0.0), isnan(_3264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3264, float3(0.0), isnan(_3264)), level(0.0)).xyzw;
    float _1230 = _1228.x;
    float _1232 = _1228.y;
    float _1234 = _1228.z;
    float _1236 = _1228.w;
    float2 _3281 = float2(_1225, _1209);
    float3 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3281, float2(0.0), isnan(_3281)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3281, float2(0.0), isnan(_3281)), level(0.0)).xyz;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1250 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1252 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1250);
    float _1254 = exp2(_1248);
    float _1256 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1252);
    float _1258 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1256);
    float _1260 = _1258 + _1167;
    out.gl_Position.x = _1191;
    out.gl_Position.y = _1193;
    out.gl_Position.z = _1258;
    out.gl_Position.w = _1167;
    float _1262 = _1260 * 0.5;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1270 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1262;
    out.m_62.w = _1167;
    out.m_45.x = _1268;
    float _1272 = _1270 * _1221;
    float _1274 = -_1270;
    float _1276 = _1274 + 1.0;
    float _1278 = _1236 * _1272;
    float _1280 = _1236 * _1276;
    float _1282 = _1246 * _1272;
    float _1284 = fma(_1242, _1278, _1230);
    float _1286 = fma(_1244, _1278, _1232);
    float _1288 = fma(_1236, _1282, _1234);
    out.m_64.x = _1284;
    out.m_64.y = _1286;
    out.m_64.z = _1288;
    out.m_64.w = _1280;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1345 = as_type<float>(_99);
        out.gl_Position.z = _1345;
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
        float _1413 = as_type<float>(_135);
        out.gl_Position.z = _1413;
    }
    if (_129)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    float _161 = _155 * 6.283185482025146484375;
    float _163 = floor(_155);
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _173 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_167;
    int _189 = _187 ? 0 : 1;
    bool _191 = !_181;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_189);
    int _197 = abs(_193);
    float _199 = -_163;
    float _201 = _155 + _199;
    float _203 = -_201;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _207 = float(_195);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = fma(_185, 0.5, 0.5);
    bool _213 = !_171;
    int _215 = _213 ? 0 : 1;
    float _217 = abs(_205);
    float _219 = _207 * _217;
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_215);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_197);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _219);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _441 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
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
    float _465 = in.m_42.x;
    float _467 = in.m_42.y;
    float _469 = in.m_42.z;
    float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _473 = in.m_52.y;
    bool _475 = _143 > 0.5;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _477;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _483 = _481 != 0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _487 = _463 + _485;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _491 = _489 != 0;
    float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _497 = 1.0 / _479;
    float _499 = _467 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _501 = _467 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _503 = _467 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _505 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].x, _499);
    float _507 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].x, _501);
    float _509 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
    bool _511 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _513 = isnan(_463);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = _473 > 0.5;
    float _525 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
    float _527 = _487 * _497;
    bool _529 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _531 = isnan(_463);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
    float _543 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
    float _545 = -_539;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _549;
    float _553 = -_159;
    int _555 = _523 ? as_type<int>(_553) : as_type<int>(_159);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _557;
    float _561 = _521 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _563;
    float _567 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _569 = fma(_559, _527, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _571 = _525 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _573 = fma(_565, _527, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _575 = -_177;
    int _577 = _475 ? as_type<int>(_575) : as_type<int>(_177);
    float _579 = _567 * _561;
    float _581 = _569 * _561;
    float _583 = _573 * _561;
    bool _585 = !_483;
    float _587 = _585 ? _177 : as_type<float>(_577);
    float _589 = _543 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _591 = !_491;
    float _593 = _591 ? _159 : as_type<float>(_555);
    float _595 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _597 = -_521;
    float _599 = _597 + 1.0;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _603 = _589 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _607 = _571 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _611 = _595 + _609;
    float _613 = _587 + 0.5;
    float _615 = _603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _619 = -_593;
    float _621 = _619 + 0.5;
    float _623 = _613 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].x, _615);
    float _627 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].x, _617);
    float _629 = _603 * _603;
    float _631 = _621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _633 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[28].z, _625);
    float _635 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _637 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].z, _583);
    float _639 = _623 * _471;
    float _641 = _631 * _493;
    bool _643 = _633 >= 0.0;
    float _645 = fma(_611, _611, _629);
    float _647 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].y, _635);
    float _649 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].z, _637);
    float _651 = fma(_607, _607, _645);
    float _653 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = rsqrt(_651);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _663 = 0.0;
    int _665 = as_type<int>(_661);
    if (_643)
    {
        _663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _667 = _663;
    float _669 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _677 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_643)
    {
        float _685 = _667 * 5.0;
        _665 = as_type<int>(_685);
    }
    int _687 = _665;
    out.m_54.x = _639;
    out.m_54.y = _641;
    float _689 = _603 * _655;
    float _691 = _611 * _655;
    out.m_56.x = _677;
    out.m_56.y = _679;
    out.m_56.z = _681;
    out.m_58.x = _671;
    out.m_58.y = _683;
    out.m_58.z = _673;
    out.m_58.w = _675;
    if (_643)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2343 = as_type<float>(_687);
        out.gl_Position.z = _2343;
    }
    if (_643)
    {
        out.m_45.x = 0.0;
    }
    if (_643)
    {
        return out;
    }
    float _693 = -_689;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _697 = -_691;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _595);
    float _701 = _607 * _655;
    float _703 = -_689;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _709 = _695 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _699 + _711;
    float _715 = -_701;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _571);
    float _719 = in.m_60.x;
    float _721 = in.m_60.y;
    float _723 = _709 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = -_691;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _731 = _717 + _729;
    float _733 = _705 * _705;
    float _735 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _737 = -_701;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _741 = fma(_727, _727, _733);
    float _743 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[28].z, _735);
    float _745 = fma(_739, _739, _741);
    bool _747 = _743 >= 0.0;
    float _749 = sqrt(_745);
    float _751 = _433 * _719;
    float _753 = _435 * _721;
    float _755 = _731;
    if (_747)
    {
        _755 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _757 = _755;
    int _759 = as_type<int>(_757);
    if (_747)
    {
        out.m_45.x = 0.0;
    }
    float _761 = _243 * _751;
    float _763 = _243 * _753;
    if (_747)
    {
        float _765 = _757 * 5.0;
        _759 = as_type<int>(_765);
    }
    int _767 = _759;
    float _769 = _655 * _749;
    if (_747)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2491 = as_type<float>(_767);
        out.gl_Position.z = _2491;
    }
    if (_747)
    {
        return out;
    }
    float _771 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _775 = _761 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _779 = _769 * _771;
    float _781 = _769 * _775;
    float _783 = _769 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = _783 * 0.5;
    float _787 = _773 * _779;
    float _789 = _777 * _781;
    float _791 = _787 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _793 = _787 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _791);
    float _797 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _793);
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _795);
    float _801 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _797);
    float _803 = _799 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _805 = _801 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _807 = _571 + _803;
    float _809 = _595 + _805;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _807 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _817 = _809 + _815;
    float _819 = _813 * _813;
    float _821 = fma(_817, _817, _819);
    float _823 = _787 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = sqrt(_821);
    float _827 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _829 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _827);
    float _831 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _833 = _589 + _831;
    bool _835 = _825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _837 = _787;
    float _839 = _789;
    float _841 = _785;
    float _843 = _807;
    if (!_835)
    {
        _837 = _809;
    }
    float _845 = _837;
    float _847 = _845;
    if (!_835)
    {
        _839 = _807;
    }
    float _849 = _839;
    float _851 = _849;
    if (!_835)
    {
        _841 = _833;
    }
    float _853 = _841;
    bool _855 = !_835;
    float _857 = _853;
    if (!_855)
    {
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _863 = _825 + _861;
        float _865 = rsqrt(_821);
        float _867 = _863 * _859;
        float _869 = _833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = _867 * 0.15915493667125701904296875;
        float _873 = _871 * 6.283185482025146484375;
        float _875 = sin(_873);
        float _877 = _871 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = fma(_875, _869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _883 = _865 * _881;
        float _885 = _879 + (-1.0);
        float _887 = fma(_817, _883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _889 = fma(_813, _883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _891 = _885 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _893 = fma(_833, _879, _891);
        _857 = _893;
        _847 = _887;
        _851 = _889;
    }
    float _895 = _857;
    float _897 = _847;
    float _899 = _851;
    float _901 = -_689;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _905 = -_691;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _909 = -_701;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _903 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _907 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _923 = _911 + _921;
    float _925 = _915 * _915;
    float _927 = fma(_919, _919, _925);
    float _929 = fma(_923, _923, _927);
    float _931 = rsqrt(_929);
    float _933 = _931 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _935 = _919 * _933;
    float _937 = _923 * _933;
    float _939 = _935 * _935;
    float _941 = _937 * _937;
    float _943 = _939 + _941;
    float _945 = sqrt(_943);
    bool _947 = _945 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _951 = _945 + _949;
    float _953 = _923;
    float _955 = _897;
    float _957 = _951;
    float _959 = _915;
    float _961 = _935;
    if (_947)
    {
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _963;
    }
    float _965 = _953;
    if (_947)
    {
        float _967 = rsqrt(_943);
        _955 = _967;
    }
    float _969 = _955;
    float _971 = _969;
    if (_947)
    {
        float _973 = _951 * _965;
        _957 = _973;
    }
    float _975 = _957;
    if (_947)
    {
        float _977 = _975 * 0.15915493667125701904296875;
        _843 = _977;
    }
    float _979 = _843;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _983 = _931;
    if (_947)
    {
        float _985 = _979 * 6.283185482025146484375;
        float _987 = sin(_985);
        _983 = _987;
    }
    float _989 = _983;
    float _991 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _993 = precise::max(0.0, _991);
    float _995 = _927;
    float _997 = _991;
    float _999 = _993;
    if (_947)
    {
        float _1001 = _979 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        _995 = _1003;
    }
    float _1005 = _995;
    float _1007 = -_933;
    float _1009 = -_993;
    float _1011 = fma(_915, _1007, _1009);
    if (_947)
    {
        float _1013 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _997 = _1013;
    }
    float _1015 = _997;
    float _1017 = sqrt(_929);
    float _1019 = _989;
    float _1021 = _1015;
    if (_947)
    {
        float _1023 = fma(_989, _1015, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _959 = _1023;
    }
    float _1025 = _959;
    float _1027 = _1025;
    if (!_947)
    {
        _1019 = _937;
    }
    float _1029 = _1019;
    float _1031 = _1029;
    if (_947)
    {
        float _1033 = _1005 + (-1.0);
        _1021 = _1033;
    }
    float _1035 = _1021;
    float _1037 = _1035;
    if (_947)
    {
        float _1039 = _969 * _1025;
        _1027 = _1039;
    }
    float _1041 = _1027;
    if (!_947)
    {
        _971 = _1011;
    }
    float _1043 = _971;
    float _1045 = _1043;
    if (_947)
    {
        float _1047 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _999 = _1047;
    }
    float _1049 = _999;
    float _1051 = _1049;
    if (_947)
    {
        float _1053 = _935 * _1041;
        _961 = _1053;
    }
    float _1055 = _961;
    if (!_947)
    {
        _1037 = _939;
    }
    float _1057 = _1037;
    float _1059 = _1057;
    if (_947)
    {
        float _1061 = _937 * _1041;
        _1031 = _1061;
    }
    float _1063 = _1031;
    if (_947)
    {
        float _1065 = fma(_1011, _1005, _1049);
        _1045 = _1065;
    }
    float _1067 = _1045;
    if (_947)
    {
        float _1069 = _1055 * _1055;
        _1059 = _1069;
    }
    float _1071 = _1059;
    if (!_947)
    {
        _1051 = _941;
    }
    float _1073 = _1051;
    float _1075 = _1073;
    if (_947)
    {
        float _1077 = _1063 * _1063;
        _1075 = _1077;
    }
    float _1079 = _1075;
    float _1081 = fma(_1067, _1067, _1071);
    float _1083 = _903 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = _1081 + _1079;
    float _1087 = _903 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1091 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1089);
    float _1093 = precise::clamp(_1091, 0.0, 1.0);
    float _1095 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1097 = rsqrt(_1085);
    float _1099 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1087);
    float _1101 = _903 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = -_1093;
    float _1105 = _1103 + 1.0;
    float _1107 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1099);
    float _1109 = _903 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1111 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1115 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1109);
    float _1117 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1111);
    float _1119 = abs(_1105);
    float _1121 = log2(_1119);
    float _1123 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1125 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1115);
    float _1127 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1129 = _1097 * _1055;
    float _1131 = -_1123;
    float _1133 = fma(_1131, _981, 1.0);
    float _1135 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1095);
    float _1137 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1141 = _1097 * _1067;
    float _1143 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1145 = _1097 * _1063;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1139);
    float _1149 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1151 = -_1143;
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1151);
    float _1155 = log2(_1133);
    float _1157 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1159 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1161 = -_1145;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1153);
    float _1165 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1157);
    float _1169 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = fma(_1163, -0.5, 0.5);
    float _1173 = exp2(_1159);
    float _1175 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1165);
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1163, 0.5, 0.5);
    float _1181 = _1141 + 1.0;
    float _1183 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1175);
    float _1185 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1187 = fma(_1179, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1189 = 1.0 / _1167;
    float _1191 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1183);
    float _1193 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1185);
    float _1195 = fma(_1179, _1187, -0.212114393711090087890625);
    float _1197 = _1155 * 0.693147182464599609375;
    float _1199 = fma(_1179, _1195, 1.570728778839111328125);
    float _1201 = sqrt(_1171);
    float _1203 = -_1141;
    float _1205 = fma(_1173, _1181, _1203);
    float _1207 = _1197 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1209 = fma(_1205, 0.5, 0.5);
    float _1211 = _1191 * _1189;
    float _1213 = _1193 * _1189;
    float _1215 = fma(_1211, 0.5, 0.5);
    float _1217 = fma(_1213, -0.5, 0.5);
    float _1219 = _1201 * 0.636619746685028076171875;
    float3 _3248 = float3(_1215, _1217, _1207);
    float _1221 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3248, float3(0.0), isnan(_3248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3248, float3(0.0), isnan(_3248)), level(0.0)).x;
    float _1223 = -_1199;
    float _1225 = fma(_1219, _1223, 1.0);
    float3 _3264 = float3(_1215, _1217, _1207);
    float4 _1228 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3264, float3(0.0), isnan(_3264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3264, float3(0.0), isnan(_3264)), level(0.0)).xyzw;
    float _1230 = _1228.x;
    float _1232 = _1228.y;
    float _1234 = _1228.z;
    float _1236 = _1228.w;
    float2 _3281 = float2(_1225, _1209);
    float3 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3281, float2(0.0), isnan(_3281)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3281, float2(0.0), isnan(_3281)), level(0.0)).xyz;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1250 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1252 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1250);
    float _1254 = exp2(_1248);
    float _1256 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1252);
    float _1258 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1256);
    float _1260 = _1258 + _1167;
    out.gl_Position.x = _1191;
    out.gl_Position.y = _1193;
    out.gl_Position.z = _1258;
    out.gl_Position.w = _1167;
    float _1262 = _1260 * 0.5;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1270 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1262;
    out.m_62.w = _1167;
    out.m_45.x = _1268;
    float _1272 = _1270 * _1221;
    float _1274 = -_1270;
    float _1276 = _1274 + 1.0;
    float _1278 = _1236 * _1272;
    float _1280 = _1236 * _1276;
    float _1282 = _1246 * _1272;
    float _1284 = fma(_1242, _1278, _1230);
    float _1286 = fma(_1244, _1278, _1232);
    float _1288 = fma(_1236, _1282, _1234);
    out.m_64.x = _1284;
    out.m_64.y = _1286;
    out.m_64.z = _1288;
    out.m_64.w = _1280;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _1345 = as_type<float>(_99);
        out.gl_Position.z = _1345;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1413 = as_type<float>(_135);
        out.gl_Position.z = _1413;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_52.x;
    float _145 = _141 * _139;
    int _147 = as_type<int>(_137) & 1;
    bool _149 = _147 != 0;
    int _151 = as_type<int>(_137) & 2;
    bool _153 = _151 != 0;
    float _155 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _145);
    bool _157 = !_153;
    float _159 = _157 ? (-0.5) : 0.5;
    float _161 = _155 * 6.283185482025146484375;
    float _163 = floor(_155);
    int _165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _167 = _165 != 0;
    int _169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _171 = _169 != 0;
    float _173 = _161 * 0.15915493667125701904296875;
    bool _175 = !_149;
    float _177 = _175 ? (-0.5) : 0.5;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _173 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_167;
    int _189 = _187 ? 0 : 1;
    bool _191 = !_181;
    int _193 = _191 ? 0 : 1;
    int _195 = abs(_189);
    int _197 = abs(_193);
    float _199 = -_163;
    float _201 = _155 + _199;
    float _203 = -_201;
    float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _207 = float(_195);
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _211 = fma(_185, 0.5, 0.5);
    bool _213 = !_171;
    int _215 = _213 ? 0 : 1;
    float _217 = abs(_205);
    float _219 = _207 * _217;
    bool _221 = _201 < 0.5;
    float _223 = float(_221);
    int _225 = abs(_215);
    float _227 = -_211;
    float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _231 = float(_197);
    float _233 = -_223;
    float _235 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _237 = float(_225);
    float _239 = fma(_231, _229, _219);
    float _241 = abs(_235);
    float _243 = fma(_237, _241, _239);
    bool _245 = !_209;
    float _261;
    if (!_245)
    {
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
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
        float _441 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
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
    float _465 = in.m_42.x;
    float _467 = in.m_42.y;
    float _469 = in.m_42.z;
    float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _473 = in.m_52.y;
    bool _475 = _143 > 0.5;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _477;
    int _481 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _483 = _481 != 0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _487 = _463 + _485;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _491 = _489 != 0;
    float _493 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _497 = 1.0 / _479;
    float _499 = _467 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _501 = _467 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _503 = _467 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _505 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].x, _499);
    float _507 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].x, _501);
    float _509 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].x, _503);
    bool _511 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _513 = isnan(_463);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    bool _523 = _473 > 0.5;
    float _525 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[6].z, _509);
    float _527 = _487 * _497;
    bool _529 = _463 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _531 = isnan(_463);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[4].z, _505);
    float _543 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[5].z, _507);
    float _545 = -_539;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _549;
    float _553 = -_159;
    int _555 = _523 ? as_type<int>(_553) : as_type<int>(_159);
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _557;
    float _561 = _521 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _563;
    float _567 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _569 = fma(_559, _527, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _571 = _525 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _573 = fma(_565, _527, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _575 = -_177;
    int _577 = _475 ? as_type<int>(_575) : as_type<int>(_177);
    float _579 = _567 * _561;
    float _581 = _569 * _561;
    float _583 = _573 * _561;
    bool _585 = !_483;
    float _587 = _585 ? _177 : as_type<float>(_577);
    float _589 = _543 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _591 = !_491;
    float _593 = _591 ? _159 : as_type<float>(_555);
    float _595 = _541 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _597 = -_521;
    float _599 = _597 + 1.0;
    float _601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _603 = _589 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _607 = _571 + _605;
    float _609 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _611 = _595 + _609;
    float _613 = _587 + 0.5;
    float _615 = _603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _617 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _619 = -_593;
    float _621 = _619 + 0.5;
    float _623 = _613 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[28].x, _615);
    float _627 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].x, _617);
    float _629 = _603 * _603;
    float _631 = _621 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _633 = fma(_607, (*spvDescriptorSet0.vp_c8)._m0[28].z, _625);
    float _635 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _637 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[107].z, _583);
    float _639 = _623 * _471;
    float _641 = _631 * _493;
    bool _643 = _633 >= 0.0;
    float _645 = fma(_611, _611, _629);
    float _647 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].y, _635);
    float _649 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[108].z, _637);
    float _651 = fma(_607, _607, _645);
    float _653 = _627 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = rsqrt(_651);
    float _657 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _661 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _663 = 0.0;
    int _665 = as_type<int>(_661);
    if (_643)
    {
        _663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _667 = _663;
    float _669 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _671 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _661 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _677 = _657 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = _495 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = _669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_643)
    {
        float _685 = _667 * 5.0;
        _665 = as_type<int>(_685);
    }
    int _687 = _665;
    out.m_54.x = _639;
    out.m_54.y = _641;
    float _689 = _603 * _655;
    float _691 = _611 * _655;
    out.m_56.x = _677;
    out.m_56.y = _679;
    out.m_56.z = _681;
    out.m_58.x = _671;
    out.m_58.y = _683;
    out.m_58.z = _673;
    out.m_58.w = _675;
    if (_643)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2343 = as_type<float>(_687);
        out.gl_Position.z = _2343;
    }
    if (_643)
    {
        out.m_45.x = 0.0;
    }
    if (_643)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _693 = -_689;
    float _695 = fma(_693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _589);
    float _697 = -_691;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[18].w, _595);
    float _701 = _607 * _655;
    float _703 = -_689;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[18].w, _603);
    float _707 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _709 = _695 + _707;
    float _711 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _713 = _699 + _711;
    float _715 = -_701;
    float _717 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _571);
    float _719 = in.m_60.x;
    float _721 = in.m_60.y;
    float _723 = _709 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _725 = -_691;
    float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _611);
    float _729 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _731 = _717 + _729;
    float _733 = _705 * _705;
    float _735 = fma(_713, (*spvDescriptorSet0.vp_c8)._m0[28].x, _723);
    float _737 = -_701;
    float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    float _741 = fma(_727, _727, _733);
    float _743 = fma(_731, (*spvDescriptorSet0.vp_c8)._m0[28].z, _735);
    float _745 = fma(_739, _739, _741);
    bool _747 = _743 >= 0.0;
    float _749 = sqrt(_745);
    float _751 = _433 * _719;
    float _753 = _435 * _721;
    float _755 = _731;
    if (_747)
    {
        _755 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _757 = _755;
    int _759 = as_type<int>(_757);
    if (_747)
    {
        out.m_45.x = 0.0;
    }
    float _761 = _243 * _751;
    float _763 = _243 * _753;
    if (_747)
    {
        float _765 = _757 * 5.0;
        _759 = as_type<int>(_765);
    }
    int _767 = _759;
    float _769 = _655 * _749;
    if (_747)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2491 = as_type<float>(_767);
        out.gl_Position.z = _2491;
    }
    if (_747)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _771 = _763 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _159);
    float _775 = _761 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _779 = _769 * _771;
    float _781 = _769 * _775;
    float _783 = _769 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _785 = _783 * 0.5;
    float _787 = _773 * _779;
    float _789 = _777 * _781;
    float _791 = _787 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _793 = _787 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _795 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[26].x, _791);
    float _797 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[24].x, _793);
    float _799 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[26].z, _795);
    float _801 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[24].z, _797);
    float _803 = _799 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _805 = _801 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _807 = _571 + _803;
    float _809 = _595 + _805;
    float _811 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _813 = _807 + _811;
    float _815 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _817 = _809 + _815;
    float _819 = _813 * _813;
    float _821 = fma(_817, _817, _819);
    float _823 = _787 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = sqrt(_821);
    float _827 = fma(_789, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _829 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[25].z, _827);
    float _831 = _829 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _833 = _589 + _831;
    bool _835 = _825 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _837 = _787;
    float _839 = _789;
    float _841 = _785;
    float _843 = _807;
    if (!_835)
    {
        _837 = _809;
    }
    float _845 = _837;
    float _847 = _845;
    if (!_835)
    {
        _839 = _807;
    }
    float _849 = _839;
    float _851 = _849;
    if (!_835)
    {
        _841 = _833;
    }
    float _853 = _841;
    bool _855 = !_835;
    float _857 = _853;
    if (!_855)
    {
        float _859 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _861 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _863 = _825 + _861;
        float _865 = rsqrt(_821);
        float _867 = _863 * _859;
        float _869 = _833 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = _867 * 0.15915493667125701904296875;
        float _873 = _871 * 6.283185482025146484375;
        float _875 = sin(_873);
        float _877 = _871 * 6.283185482025146484375;
        float _879 = cos(_877);
        float _881 = fma(_875, _869, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _883 = _865 * _881;
        float _885 = _879 + (-1.0);
        float _887 = fma(_817, _883, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _889 = fma(_813, _883, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _891 = _885 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _893 = fma(_833, _879, _891);
        _857 = _893;
        _847 = _887;
        _851 = _889;
    }
    float _895 = _857;
    float _897 = _847;
    float _899 = _851;
    float _901 = -_689;
    float _903 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[18].w, _895);
    float _905 = -_691;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _909 = -_701;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _899);
    float _913 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _915 = _903 + _913;
    float _917 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _919 = _907 + _917;
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _923 = _911 + _921;
    float _925 = _915 * _915;
    float _927 = fma(_919, _919, _925);
    float _929 = fma(_923, _923, _927);
    float _931 = rsqrt(_929);
    float _933 = _931 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _935 = _919 * _933;
    float _937 = _923 * _933;
    float _939 = _935 * _935;
    float _941 = _937 * _937;
    float _943 = _939 + _941;
    float _945 = sqrt(_943);
    bool _947 = _945 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _949 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _951 = _945 + _949;
    float _953 = _923;
    float _955 = _897;
    float _957 = _951;
    float _959 = _915;
    float _961 = _935;
    if (_947)
    {
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _953 = _963;
    }
    float _965 = _953;
    if (_947)
    {
        float _967 = rsqrt(_943);
        _955 = _967;
    }
    float _969 = _955;
    float _971 = _969;
    if (_947)
    {
        float _973 = _951 * _965;
        _957 = _973;
    }
    float _975 = _957;
    if (_947)
    {
        float _977 = _975 * 0.15915493667125701904296875;
        _843 = _977;
    }
    float _979 = _843;
    float _981 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _983 = _931;
    if (_947)
    {
        float _985 = _979 * 6.283185482025146484375;
        float _987 = sin(_985);
        _983 = _987;
    }
    float _989 = _983;
    float _991 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _993 = precise::max(0.0, _991);
    float _995 = _927;
    float _997 = _991;
    float _999 = _993;
    if (_947)
    {
        float _1001 = _979 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        _995 = _1003;
    }
    float _1005 = _995;
    float _1007 = -_933;
    float _1009 = -_993;
    float _1011 = fma(_915, _1007, _1009);
    if (_947)
    {
        float _1013 = _1011 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _997 = _1013;
    }
    float _1015 = _997;
    float _1017 = sqrt(_929);
    float _1019 = _989;
    float _1021 = _1015;
    if (_947)
    {
        float _1023 = fma(_989, _1015, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _959 = _1023;
    }
    float _1025 = _959;
    float _1027 = _1025;
    if (!_947)
    {
        _1019 = _937;
    }
    float _1029 = _1019;
    float _1031 = _1029;
    if (_947)
    {
        float _1033 = _1005 + (-1.0);
        _1021 = _1033;
    }
    float _1035 = _1021;
    float _1037 = _1035;
    if (_947)
    {
        float _1039 = _969 * _1025;
        _1027 = _1039;
    }
    float _1041 = _1027;
    if (!_947)
    {
        _971 = _1011;
    }
    float _1043 = _971;
    float _1045 = _1043;
    if (_947)
    {
        float _1047 = _1035 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _999 = _1047;
    }
    float _1049 = _999;
    float _1051 = _1049;
    if (_947)
    {
        float _1053 = _935 * _1041;
        _961 = _1053;
    }
    float _1055 = _961;
    if (!_947)
    {
        _1037 = _939;
    }
    float _1057 = _1037;
    float _1059 = _1057;
    if (_947)
    {
        float _1061 = _937 * _1041;
        _1031 = _1061;
    }
    float _1063 = _1031;
    if (_947)
    {
        float _1065 = fma(_1011, _1005, _1049);
        _1045 = _1065;
    }
    float _1067 = _1045;
    if (_947)
    {
        float _1069 = _1055 * _1055;
        _1059 = _1069;
    }
    float _1071 = _1059;
    if (!_947)
    {
        _1051 = _941;
    }
    float _1073 = _1051;
    float _1075 = _1073;
    if (_947)
    {
        float _1077 = _1063 * _1063;
        _1075 = _1077;
    }
    float _1079 = _1075;
    float _1081 = fma(_1067, _1067, _1071);
    float _1083 = _903 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1085 = _1081 + _1079;
    float _1087 = _903 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1089 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1091 = fma(_1017, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1089);
    float _1093 = precise::clamp(_1091, 0.0, 1.0);
    float _1095 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1083);
    float _1097 = rsqrt(_1085);
    float _1099 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1087);
    float _1101 = _903 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = -_1093;
    float _1105 = _1103 + 1.0;
    float _1107 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1099);
    float _1109 = _903 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1111 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1115 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1109);
    float _1117 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1111);
    float _1119 = abs(_1105);
    float _1121 = log2(_1119);
    float _1123 = _1113 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1125 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1115);
    float _1127 = _1117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1129 = _1097 * _1055;
    float _1131 = -_1123;
    float _1133 = fma(_1131, _981, 1.0);
    float _1135 = fma(_911, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1095);
    float _1137 = _1125 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1141 = _1097 * _1067;
    float _1143 = _1129 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1145 = _1097 * _1063;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1139);
    float _1149 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1151 = -_1143;
    float _1153 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1151);
    float _1155 = log2(_1133);
    float _1157 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1159 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1161 = -_1145;
    float _1163 = fma(_1161, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1153);
    float _1165 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1167 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1157);
    float _1169 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = fma(_1163, -0.5, 0.5);
    float _1173 = exp2(_1159);
    float _1175 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1165);
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1163, 0.5, 0.5);
    float _1181 = _1141 + 1.0;
    float _1183 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1175);
    float _1185 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1187 = fma(_1179, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1189 = 1.0 / _1167;
    float _1191 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1183);
    float _1193 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1185);
    float _1195 = fma(_1179, _1187, -0.212114393711090087890625);
    float _1197 = _1155 * 0.693147182464599609375;
    float _1199 = fma(_1179, _1195, 1.570728778839111328125);
    float _1201 = sqrt(_1171);
    float _1203 = -_1141;
    float _1205 = fma(_1173, _1181, _1203);
    float _1207 = _1197 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1209 = fma(_1205, 0.5, 0.5);
    float _1211 = _1191 * _1189;
    float _1213 = _1193 * _1189;
    float _1215 = fma(_1211, 0.5, 0.5);
    float _1217 = fma(_1213, -0.5, 0.5);
    float _1219 = _1201 * 0.636619746685028076171875;
    float3 _3248 = float3(_1215, _1217, _1207);
    float _1221 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3248, float3(0.0), isnan(_3248)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3248, float3(0.0), isnan(_3248)), level(0.0)).x;
    float _1223 = -_1199;
    float _1225 = fma(_1219, _1223, 1.0);
    float3 _3264 = float3(_1215, _1217, _1207);
    float4 _1228 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3264, float3(0.0), isnan(_3264)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3264, float3(0.0), isnan(_3264)), level(0.0)).xyzw;
    float _1230 = _1228.x;
    float _1232 = _1228.y;
    float _1234 = _1228.z;
    float _1236 = _1228.w;
    float2 _3281 = float2(_1225, _1209);
    float3 _1240 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3281, float2(0.0), isnan(_3281)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3281, float2(0.0), isnan(_3281)), level(0.0)).xyz;
    float _1242 = _1240.x;
    float _1244 = _1240.y;
    float _1246 = _1240.z;
    float _1248 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1250 = _1127 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1252 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1250);
    float _1254 = exp2(_1248);
    float _1256 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1252);
    float _1258 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1256);
    float _1260 = _1258 + _1167;
    out.gl_Position.x = _1191;
    out.gl_Position.y = _1193;
    out.gl_Position.z = _1258;
    out.gl_Position.w = _1167;
    float _1262 = _1260 * 0.5;
    float _1264 = -_1254;
    float _1266 = _1264 + 1.0;
    float _1268 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1270 = _1266 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1262;
    out.m_62.w = _1167;
    out.m_45.x = _1268;
    float _1272 = _1270 * _1221;
    float _1274 = -_1270;
    float _1276 = _1274 + 1.0;
    float _1278 = _1236 * _1272;
    float _1280 = _1236 * _1276;
    float _1282 = _1246 * _1272;
    float _1284 = fma(_1242, _1278, _1230);
    float _1286 = fma(_1244, _1278, _1232);
    float _1288 = fma(_1236, _1282, _1234);
    out.m_64.x = _1284;
    out.m_64.y = _1286;
    out.m_64.z = _1288;
    out.m_64.w = _1280;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

