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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _857 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1351 = as_type<float>(_101);
        out.gl_Position.z = _1351;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1420 = as_type<float>(_137);
        out.gl_Position.z = _1420;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_54.w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _141;
    if (!_153)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_139) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_139) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_153;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _141 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _141);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_153;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _141 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _155, _261);
    float _269 = fma(_257, _157, _263);
    float _271 = fma(_257, _159, _265);
    float _273 = fma(_267, _143, _161);
    float _275 = fma(_269, _143, _163);
    float _277 = fma(_271, _143, _165);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_56.x;
    float _311 = in.m_56.y;
    float _313 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _315 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _317 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _319 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _313);
    float _321 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _315);
    float _323 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _317);
    float _325 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _319);
    float _327 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _321);
    float _329 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _331 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _333 = _327 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _341 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _343 = _333 + _341;
    float _345 = _329 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _351 = _331 + _349;
    float _353 = _343 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _355 = 1.0 / _337;
    bool _357 = _309 > 0.5;
    float _359 = _339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _361 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _363 = _311 > 0.5;
    float _365 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[28].x, _353);
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _369 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _371 = _345 + _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _375 = _367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[28].z, _365);
    out.m_58.x = _359;
    out.m_58.y = _361;
    out.m_58.z = _375;
    out.m_58.w = _373;
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _393 = _391 != 0;
    float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _397 = -_193;
    int _399 = _357 ? as_type<int>(_397) : as_type<int>(_193);
    bool _401 = _383 >= 0.0;
    out.m_60.x = _385;
    out.m_60.y = _387;
    out.m_60.z = _389;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _405 = _403 != 0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = _307 + _407;
    float _411 = -_197;
    int _413 = _363 ? as_type<int>(_411) : as_type<int>(_197);
    float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _417 = _343 * _343;
    bool _419 = !_393;
    float _421 = _419 ? _193 : as_type<float>(_399);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _427 = !_405;
    float _429 = _427 ? _197 : as_type<float>(_413);
    float _431 = fma(_351, _351, _417);
    float _433 = _421 + 0.5;
    float _435 = 1.0 / _425;
    float _437 = fma(_371, _371, _431);
    float _439 = -_429;
    float _441 = _439 + 0.5;
    float _443 = _433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = _375;
    float _447 = _333;
    if (_401)
    {
        _445 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _449 = _445;
    float _451 = _441 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _453 = _443 * _395;
    float _455 = rsqrt(_437);
    float _457 = _451 * _415;
    int _459 = as_type<int>(_449);
    if (_401)
    {
        float _461 = _449 * 5.0;
        _459 = as_type<int>(_461);
    }
    int _463 = _459;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _467 = _307 + _465;
    float _469 = _409 * _355;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    out.m_62.x = _453;
    out.m_62.y = _457;
    float _479 = _467 * _435;
    float _481 = fma(_473, _469, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _483 = fma(_477, _469, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2020 = as_type<float>(_463);
        out.gl_Position.z = _2020;
    }
    bool _485 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_307);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    if (_401)
    {
        out.m_47.x = 0.0;
    }
    float _497 = _343 * _455;
    float _499 = _351 * _455;
    if (_401)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _501 = -_497;
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _333);
    float _505 = -_499;
    float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[18].w, _331);
    float _509 = _371 * _455;
    bool _511 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _513 = isnan(_307);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _503 + _523;
    bool _527 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_307);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_495;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _545 = _507 + _543;
    float _547 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _549 = -_509;
    float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _553 = _537 * _541;
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[28].x, _547);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _551 + _561;
    float _565 = -_497;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _343);
    float _569 = _521 * _557;
    float _571 = -_499;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _351);
    float _575 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _559);
    float _577 = _567 * _567;
    float _579 = _481 * _569;
    float _581 = -_509;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _371);
    float _585 = _483 * _569;
    float _587 = fma(_573, _573, _577);
    bool _589 = _575 >= 0.0;
    float _591 = in.m_54.x;
    float _593 = in.m_54.y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _599 = -_521;
    float _601 = _599 + 1.0;
    float _603 = fma(_583, _583, _587);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _609 = fma(_597, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _615 = fma(_607, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = sqrt(_603);
    float _619 = fma(_609, _553, _611);
    float _621 = fma(_615, _553, _613);
    float _623 = _583;
    int _625 = as_type<int>(_621);
    if (_589)
    {
        _623 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _627 = _623;
    float _629 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[145].x, _619);
    if (_589)
    {
        out.m_47.x = 0.0;
    }
    float _631 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[145].y, _621);
    if (_589)
    {
        float _633 = _627 * 5.0;
        _625 = as_type<int>(_633);
    }
    int _635 = _625;
    if (_589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2286 = as_type<float>(_635);
        out.gl_Position.z = _2286;
    }
    float _637 = _629 * _591;
    float _639 = _631 * _593;
    float _641 = _455 * _617;
    if (_589)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _643 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _651 = _641 * _643;
    float _653 = _641 * _647;
    float _655 = _645 * _651;
    float _657 = _649 * _653;
    float _659 = _641 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _661 = _659 * 0.5;
    float _663 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _665 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _663);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _665);
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].z, _667);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _675 = _671 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _677 = _673 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _679 = _331 + _675;
    float _681 = _345 + _677;
    float _683 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _685 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _687 = _679 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _691 = _681 + _689;
    float _693 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _683);
    float _695 = _687 * _687;
    float _697 = _691 * _691;
    float _699 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].z, _693);
    float _701 = _695 + _697;
    float _703 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _705 = sqrt(_701);
    float _707 = _333 + _703;
    bool _709 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _711 = _703;
    float _713 = _661;
    float _715 = _655;
    float _717 = _697;
    float _719 = _701;
    if (!_709)
    {
        _711 = _695;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_709)
    {
        _713 = _679;
    }
    float _725 = _713;
    float _727 = _725;
    if (!_709)
    {
        _447 = _681;
    }
    float _729 = _447;
    float _731 = _729;
    if (!_709)
    {
        _715 = _707;
    }
    float _733 = _715;
    bool _735 = !_709;
    float _737 = _733;
    if (!_735)
    {
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _743 = _705 + _741;
        float _745 = rsqrt(_701);
        float _747 = _743 * _739;
        float _749 = _707 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _751 = _747 * 0.15915493667125701904296875;
        float _753 = _751 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _751 * 6.283185482025146484375;
        float _759 = cos(_757);
        float _761 = fma(_755, _749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _763 = _745 * _761;
        float _765 = _759 + (-1.0);
        float _767 = fma(_687, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _769 = fma(_691, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _771 = _765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _773 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _775 = _767 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _779 = _769 + _777;
        float _781 = fma(_707, _759, _771);
        float _783 = _775 * _775;
        float _785 = _779 * _779;
        _737 = _781;
        _723 = _783;
        _717 = _785;
        _727 = _767;
        _731 = _769;
    }
    float _787 = _737;
    float _789 = _723;
    float _791 = _717;
    float _793 = _727;
    float _795 = _731;
    float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _799 = _787 + _797;
    float _801 = fma(_799, _799, _789);
    float _803 = _801 + _791;
    float _805 = sqrt(_803);
    bool _807 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _809 = isnan(_805);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _815 = _811 || _813;
    float _817 = _789;
    float _819 = _803;
    float _821 = _805;
    if (!_815)
    {
        _817 = 1.0;
    }
    float _823 = _817;
    bool _825 = !_815;
    float _827 = _823;
    if (!_825)
    {
        bool _829 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _831 = isnan(_805);
        bool _833 = _829 || _831;
        bool _835 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _837 = _833 || _835;
        if (!_837)
        {
            float _839 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _841 = _805 + _839;
            float _843 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _845 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _843;
            float _847 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _849 = _847 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _851 = 1.0 / _845;
            float _853 = _841 * _851;
            float _855 = fma(_853, _849, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _827 = _855;
            _819 = _845;
            _857 = true;
        }
        else
        {
            bool _859 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _861 = isnan(_805);
            bool _863 = _859 || _861;
            bool _865 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _867 = _863 || _865;
            if (!_867)
            {
                float _869 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _871 = _805 + _869;
                float _873 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _875 = _873 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _877 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _879 = _877 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _881 = 1.0 / _875;
                float _883 = _871 * _881;
                float _885 = fma(_883, _879, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _827 = _885;
                _819 = _875;
                _857 = true;
            }
            else
            {
                _827 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _857 = false;
    float _887 = _827;
    float _889 = _819;
    float _891 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _893 = _787 + _891;
    float _895 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _897 = _793 + _895;
    float _899 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _901 = _795 + _899;
    float _903 = fma(_893, _887, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _905 = fma(_897, _887, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _907 = fma(_901, _887, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _909 = -_497;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _913 = -_499;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _917 = -_509;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _923 = _911 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _915 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _931 = _919 + _929;
    float _933 = _923 * _923;
    float _935 = fma(_927, _927, _933);
    float _937 = fma(_931, _931, _935);
    float _939 = rsqrt(_937);
    float _941 = _939 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _943 = _927 * _941;
    float _945 = _931 * _941;
    float _947 = _943 * _943;
    float _949 = _945 * _945;
    float _951 = _947 + _949;
    float _953 = sqrt(_951);
    bool _955 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _959 = _953 + _957;
    float _961 = _939;
    float _963 = _889;
    float _965 = _959;
    float _967 = _923;
    float _969 = _943;
    if (_955)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _961 = _971;
    }
    float _973 = _961;
    if (_955)
    {
        float _975 = rsqrt(_951);
        _963 = _975;
    }
    float _977 = _963;
    float _979 = _977;
    if (_955)
    {
        float _981 = _959 * _973;
        _965 = _981;
    }
    float _983 = _965;
    if (_955)
    {
        float _985 = _983 * 0.15915493667125701904296875;
        _821 = _985;
    }
    float _987 = _821;
    float _989 = _931;
    if (_955)
    {
        float _991 = _987 * 6.283185482025146484375;
        float _993 = sin(_991);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _999 = precise::max(0.0, _997);
    float _1001 = _973;
    float _1003 = _999;
    if (_955)
    {
        float _1005 = _987 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        _1001 = _1007;
    }
    float _1009 = _1001;
    float _1011 = -_941;
    float _1013 = -_999;
    float _1015 = fma(_923, _1011, _1013);
    if (_955)
    {
        float _1017 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _967 = _1017;
    }
    float _1019 = _967;
    float _1021 = sqrt(_937);
    float _1023 = _1019;
    float _1025 = _995;
    if (_955)
    {
        float _1027 = fma(_995, _1019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1023 = _1027;
    }
    float _1029 = _1023;
    float _1031 = _1029;
    if (!_955)
    {
        _1025 = _1015;
    }
    float _1033 = _1025;
    float _1035 = _1033;
    float _1037 = _1009;
    if (_955)
    {
        float _1039 = _1009 + (-1.0);
        _1003 = _1039;
    }
    float _1041 = _1003;
    float _1043 = _1041;
    if (_955)
    {
        float _1045 = _977 * _1029;
        _719 = _1045;
    }
    float _1047 = _719;
    if (!_955)
    {
        _1031 = _947;
    }
    float _1049 = _1031;
    float _1051 = _911 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1053 = _1049;
    if (_955)
    {
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1055;
    }
    float _1057 = _979;
    if (_955)
    {
        float _1059 = _943 * _1047;
        _969 = _1059;
    }
    float _1061 = _969;
    if (!_955)
    {
        _1043 = _945;
    }
    float _1063 = _1043;
    float _1065 = _1063;
    if (_955)
    {
        float _1067 = _945 * _1047;
        _1065 = _1067;
    }
    float _1069 = _1065;
    if (_955)
    {
        float _1071 = fma(_1015, _1009, _1057);
        _1035 = _1071;
    }
    float _1073 = _1035;
    if (_955)
    {
        float _1075 = _1061 * _1061;
        _1053 = _1075;
    }
    float _1077 = _1053;
    if (!_955)
    {
        _1037 = _949;
    }
    float _1079 = _1037;
    float _1081 = _1079;
    if (_955)
    {
        float _1083 = _1069 * _1069;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = fma(_1073, _1073, _1077);
    float _1089 = _911 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1091 = _1087 + _1085;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1095 = fma(_1021, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1093);
    float _1097 = precise::clamp(_1095, 0.0, 1.0);
    float _1099 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1089);
    float _1101 = _911 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = _911 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1105 = -_1097;
    float _1107 = _1105 + 1.0;
    float _1109 = rsqrt(_1091);
    float _1111 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1099);
    float _1113 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1117 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1119 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1103);
    float _1121 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1113);
    float _1123 = abs(_1107);
    float _1125 = log2(_1123);
    float _1127 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1051);
    float _1129 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1119);
    float _1131 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1133 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1135 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1127);
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1141 = _1109 * _1061;
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = _1109 * _1073;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1139);
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1151 = _1109 * _1069;
    float _1153 = -_1133;
    float _1155 = fma(_1153, _1115, 1.0);
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1159 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1161 = -_1149;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1161);
    float _1165 = log2(_1155);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1157);
    float _1169 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = -_1151;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1163);
    float _1175 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1173, -0.5, 0.5);
    float _1181 = exp2(_1159);
    float _1183 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1175);
    float _1185 = fma(_1173, 0.5, 0.5);
    float _1187 = _1145 + 1.0;
    float _1189 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1191 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1183);
    float _1193 = fma(_1185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1195 = 1.0 / _1167;
    float _1197 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1189);
    float _1199 = fma(_1185, _1193, -0.212114393711090087890625);
    float _1201 = fma(_1185, _1199, 1.570728778839111328125);
    float _1203 = sqrt(_1179);
    float _1205 = -_1145;
    float _1207 = fma(_1181, _1187, _1205);
    float _1209 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1211 = _1165 * 0.693147182464599609375;
    float _1213 = fma(_1207, 0.5, 0.5);
    float _1215 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1217 = _1209 * _1195;
    float _1219 = _1197 * _1195;
    float _1221 = fma(_1217, 0.5, 0.5);
    float _1223 = fma(_1219, -0.5, 0.5);
    float _1225 = _1203 * 0.636619746685028076171875;
    float _1227 = -_1201;
    float _1229 = fma(_1225, _1227, 1.0);
    float3 _3276 = float3(_1221, _1223, _1215);
    float _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3276, float3(0.0), isnan(_3276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3276, float3(0.0), isnan(_3276)), level(0.0)).x;
    float3 _3287 = float3(_1221, _1223, _1215);
    float4 _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3287, float3(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3287, float3(0.0), isnan(_3287)), level(0.0)).xyzw;
    float _1236 = _1234.x;
    float _1238 = _1234.y;
    float _1240 = _1234.z;
    float _1242 = _1234.w;
    float2 _3304 = float2(_1229, _1213);
    float3 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3304, float2(0.0), isnan(_3304)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3304, float2(0.0), isnan(_3304)), level(0.0)).xyz;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1256 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1258 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1256);
    float _1260 = exp2(_1254);
    float _1262 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1258);
    float _1264 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1262);
    float _1266 = _1264 + _1167;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1197;
    out.gl_Position.z = _1264;
    out.gl_Position.w = _1167;
    float _1268 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1270 = _1266 * 0.5;
    float _1272 = -_1260;
    float _1274 = _1272 + 1.0;
    out.m_47.x = _1268;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1270;
    out.m_64.w = _1167;
    float _1278 = _1276 * _1231;
    float _1280 = -_1276;
    float _1282 = _1280 + 1.0;
    float _1284 = _1242 * _1278;
    float _1286 = _1252 * _1278;
    float _1288 = _1242 * _1282;
    float _1290 = fma(_1248, _1284, _1236);
    float _1292 = fma(_1250, _1284, _1238);
    float _1294 = fma(_1242, _1286, _1240);
    out.m_66.x = _1290;
    out.m_66.y = _1292;
    out.m_66.z = _1294;
    out.m_66.w = _1288;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _857 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1351 = as_type<float>(_101);
        out.gl_Position.z = _1351;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1420 = as_type<float>(_137);
        out.gl_Position.z = _1420;
    }
    if (_129)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_54.w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _141;
    if (!_153)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_139) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_139) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_153;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _141 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _141);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_153;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _141 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _155, _261);
    float _269 = fma(_257, _157, _263);
    float _271 = fma(_257, _159, _265);
    float _273 = fma(_267, _143, _161);
    float _275 = fma(_269, _143, _163);
    float _277 = fma(_271, _143, _165);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_56.x;
    float _311 = in.m_56.y;
    float _313 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _315 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _317 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _319 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _313);
    float _321 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _315);
    float _323 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _317);
    float _325 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _319);
    float _327 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _321);
    float _329 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _331 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _333 = _327 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _341 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _343 = _333 + _341;
    float _345 = _329 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _351 = _331 + _349;
    float _353 = _343 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _355 = 1.0 / _337;
    bool _357 = _309 > 0.5;
    float _359 = _339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _361 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _363 = _311 > 0.5;
    float _365 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[28].x, _353);
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _369 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _371 = _345 + _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _375 = _367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[28].z, _365);
    out.m_58.x = _359;
    out.m_58.y = _361;
    out.m_58.z = _375;
    out.m_58.w = _373;
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _393 = _391 != 0;
    float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _397 = -_193;
    int _399 = _357 ? as_type<int>(_397) : as_type<int>(_193);
    bool _401 = _383 >= 0.0;
    out.m_60.x = _385;
    out.m_60.y = _387;
    out.m_60.z = _389;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _405 = _403 != 0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = _307 + _407;
    float _411 = -_197;
    int _413 = _363 ? as_type<int>(_411) : as_type<int>(_197);
    float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _417 = _343 * _343;
    bool _419 = !_393;
    float _421 = _419 ? _193 : as_type<float>(_399);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _427 = !_405;
    float _429 = _427 ? _197 : as_type<float>(_413);
    float _431 = fma(_351, _351, _417);
    float _433 = _421 + 0.5;
    float _435 = 1.0 / _425;
    float _437 = fma(_371, _371, _431);
    float _439 = -_429;
    float _441 = _439 + 0.5;
    float _443 = _433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = _375;
    float _447 = _333;
    if (_401)
    {
        _445 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _449 = _445;
    float _451 = _441 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _453 = _443 * _395;
    float _455 = rsqrt(_437);
    float _457 = _451 * _415;
    int _459 = as_type<int>(_449);
    if (_401)
    {
        float _461 = _449 * 5.0;
        _459 = as_type<int>(_461);
    }
    int _463 = _459;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _467 = _307 + _465;
    float _469 = _409 * _355;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    out.m_62.x = _453;
    out.m_62.y = _457;
    float _479 = _467 * _435;
    float _481 = fma(_473, _469, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _483 = fma(_477, _469, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2020 = as_type<float>(_463);
        out.gl_Position.z = _2020;
    }
    bool _485 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_307);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    if (_401)
    {
        out.m_47.x = 0.0;
    }
    float _497 = _343 * _455;
    float _499 = _351 * _455;
    if (_401)
    {
        return out;
    }
    float _501 = -_497;
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _333);
    float _505 = -_499;
    float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[18].w, _331);
    float _509 = _371 * _455;
    bool _511 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _513 = isnan(_307);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _503 + _523;
    bool _527 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_307);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_495;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _545 = _507 + _543;
    float _547 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _549 = -_509;
    float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _553 = _537 * _541;
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[28].x, _547);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _551 + _561;
    float _565 = -_497;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _343);
    float _569 = _521 * _557;
    float _571 = -_499;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _351);
    float _575 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _559);
    float _577 = _567 * _567;
    float _579 = _481 * _569;
    float _581 = -_509;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _371);
    float _585 = _483 * _569;
    float _587 = fma(_573, _573, _577);
    bool _589 = _575 >= 0.0;
    float _591 = in.m_54.x;
    float _593 = in.m_54.y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _599 = -_521;
    float _601 = _599 + 1.0;
    float _603 = fma(_583, _583, _587);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _609 = fma(_597, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _615 = fma(_607, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = sqrt(_603);
    float _619 = fma(_609, _553, _611);
    float _621 = fma(_615, _553, _613);
    float _623 = _583;
    int _625 = as_type<int>(_621);
    if (_589)
    {
        _623 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _627 = _623;
    float _629 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[145].x, _619);
    if (_589)
    {
        out.m_47.x = 0.0;
    }
    float _631 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[145].y, _621);
    if (_589)
    {
        float _633 = _627 * 5.0;
        _625 = as_type<int>(_633);
    }
    int _635 = _625;
    if (_589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2286 = as_type<float>(_635);
        out.gl_Position.z = _2286;
    }
    float _637 = _629 * _591;
    float _639 = _631 * _593;
    float _641 = _455 * _617;
    if (_589)
    {
        return out;
    }
    float _643 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _651 = _641 * _643;
    float _653 = _641 * _647;
    float _655 = _645 * _651;
    float _657 = _649 * _653;
    float _659 = _641 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _661 = _659 * 0.5;
    float _663 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _665 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _663);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _665);
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].z, _667);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _675 = _671 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _677 = _673 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _679 = _331 + _675;
    float _681 = _345 + _677;
    float _683 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _685 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _687 = _679 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _691 = _681 + _689;
    float _693 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _683);
    float _695 = _687 * _687;
    float _697 = _691 * _691;
    float _699 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].z, _693);
    float _701 = _695 + _697;
    float _703 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _705 = sqrt(_701);
    float _707 = _333 + _703;
    bool _709 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _711 = _703;
    float _713 = _661;
    float _715 = _655;
    float _717 = _697;
    float _719 = _701;
    if (!_709)
    {
        _711 = _695;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_709)
    {
        _713 = _679;
    }
    float _725 = _713;
    float _727 = _725;
    if (!_709)
    {
        _447 = _681;
    }
    float _729 = _447;
    float _731 = _729;
    if (!_709)
    {
        _715 = _707;
    }
    float _733 = _715;
    bool _735 = !_709;
    float _737 = _733;
    if (!_735)
    {
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _743 = _705 + _741;
        float _745 = rsqrt(_701);
        float _747 = _743 * _739;
        float _749 = _707 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _751 = _747 * 0.15915493667125701904296875;
        float _753 = _751 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _751 * 6.283185482025146484375;
        float _759 = cos(_757);
        float _761 = fma(_755, _749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _763 = _745 * _761;
        float _765 = _759 + (-1.0);
        float _767 = fma(_687, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _769 = fma(_691, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _771 = _765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _773 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _775 = _767 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _779 = _769 + _777;
        float _781 = fma(_707, _759, _771);
        float _783 = _775 * _775;
        float _785 = _779 * _779;
        _737 = _781;
        _723 = _783;
        _717 = _785;
        _727 = _767;
        _731 = _769;
    }
    float _787 = _737;
    float _789 = _723;
    float _791 = _717;
    float _793 = _727;
    float _795 = _731;
    float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _799 = _787 + _797;
    float _801 = fma(_799, _799, _789);
    float _803 = _801 + _791;
    float _805 = sqrt(_803);
    bool _807 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _809 = isnan(_805);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _815 = _811 || _813;
    float _817 = _789;
    float _819 = _803;
    float _821 = _805;
    if (!_815)
    {
        _817 = 1.0;
    }
    float _823 = _817;
    bool _825 = !_815;
    float _827 = _823;
    if (!_825)
    {
        bool _829 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _831 = isnan(_805);
        bool _833 = _829 || _831;
        bool _835 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _837 = _833 || _835;
        if (!_837)
        {
            float _839 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _841 = _805 + _839;
            float _843 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _845 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _843;
            float _847 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _849 = _847 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _851 = 1.0 / _845;
            float _853 = _841 * _851;
            float _855 = fma(_853, _849, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _827 = _855;
            _819 = _845;
            _857 = true;
        }
        else
        {
            bool _859 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _861 = isnan(_805);
            bool _863 = _859 || _861;
            bool _865 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _867 = _863 || _865;
            if (!_867)
            {
                float _869 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _871 = _805 + _869;
                float _873 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _875 = _873 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _877 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _879 = _877 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _881 = 1.0 / _875;
                float _883 = _871 * _881;
                float _885 = fma(_883, _879, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _827 = _885;
                _819 = _875;
                _857 = true;
            }
            else
            {
                _827 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _857 = false;
    float _887 = _827;
    float _889 = _819;
    float _891 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _893 = _787 + _891;
    float _895 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _897 = _793 + _895;
    float _899 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _901 = _795 + _899;
    float _903 = fma(_893, _887, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _905 = fma(_897, _887, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _907 = fma(_901, _887, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _909 = -_497;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _913 = -_499;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _917 = -_509;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _923 = _911 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _915 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _931 = _919 + _929;
    float _933 = _923 * _923;
    float _935 = fma(_927, _927, _933);
    float _937 = fma(_931, _931, _935);
    float _939 = rsqrt(_937);
    float _941 = _939 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _943 = _927 * _941;
    float _945 = _931 * _941;
    float _947 = _943 * _943;
    float _949 = _945 * _945;
    float _951 = _947 + _949;
    float _953 = sqrt(_951);
    bool _955 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _959 = _953 + _957;
    float _961 = _939;
    float _963 = _889;
    float _965 = _959;
    float _967 = _923;
    float _969 = _943;
    if (_955)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _961 = _971;
    }
    float _973 = _961;
    if (_955)
    {
        float _975 = rsqrt(_951);
        _963 = _975;
    }
    float _977 = _963;
    float _979 = _977;
    if (_955)
    {
        float _981 = _959 * _973;
        _965 = _981;
    }
    float _983 = _965;
    if (_955)
    {
        float _985 = _983 * 0.15915493667125701904296875;
        _821 = _985;
    }
    float _987 = _821;
    float _989 = _931;
    if (_955)
    {
        float _991 = _987 * 6.283185482025146484375;
        float _993 = sin(_991);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _999 = precise::max(0.0, _997);
    float _1001 = _973;
    float _1003 = _999;
    if (_955)
    {
        float _1005 = _987 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        _1001 = _1007;
    }
    float _1009 = _1001;
    float _1011 = -_941;
    float _1013 = -_999;
    float _1015 = fma(_923, _1011, _1013);
    if (_955)
    {
        float _1017 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _967 = _1017;
    }
    float _1019 = _967;
    float _1021 = sqrt(_937);
    float _1023 = _1019;
    float _1025 = _995;
    if (_955)
    {
        float _1027 = fma(_995, _1019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1023 = _1027;
    }
    float _1029 = _1023;
    float _1031 = _1029;
    if (!_955)
    {
        _1025 = _1015;
    }
    float _1033 = _1025;
    float _1035 = _1033;
    float _1037 = _1009;
    if (_955)
    {
        float _1039 = _1009 + (-1.0);
        _1003 = _1039;
    }
    float _1041 = _1003;
    float _1043 = _1041;
    if (_955)
    {
        float _1045 = _977 * _1029;
        _719 = _1045;
    }
    float _1047 = _719;
    if (!_955)
    {
        _1031 = _947;
    }
    float _1049 = _1031;
    float _1051 = _911 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1053 = _1049;
    if (_955)
    {
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1055;
    }
    float _1057 = _979;
    if (_955)
    {
        float _1059 = _943 * _1047;
        _969 = _1059;
    }
    float _1061 = _969;
    if (!_955)
    {
        _1043 = _945;
    }
    float _1063 = _1043;
    float _1065 = _1063;
    if (_955)
    {
        float _1067 = _945 * _1047;
        _1065 = _1067;
    }
    float _1069 = _1065;
    if (_955)
    {
        float _1071 = fma(_1015, _1009, _1057);
        _1035 = _1071;
    }
    float _1073 = _1035;
    if (_955)
    {
        float _1075 = _1061 * _1061;
        _1053 = _1075;
    }
    float _1077 = _1053;
    if (!_955)
    {
        _1037 = _949;
    }
    float _1079 = _1037;
    float _1081 = _1079;
    if (_955)
    {
        float _1083 = _1069 * _1069;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = fma(_1073, _1073, _1077);
    float _1089 = _911 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1091 = _1087 + _1085;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1095 = fma(_1021, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1093);
    float _1097 = precise::clamp(_1095, 0.0, 1.0);
    float _1099 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1089);
    float _1101 = _911 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = _911 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1105 = -_1097;
    float _1107 = _1105 + 1.0;
    float _1109 = rsqrt(_1091);
    float _1111 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1099);
    float _1113 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1117 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1119 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1103);
    float _1121 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1113);
    float _1123 = abs(_1107);
    float _1125 = log2(_1123);
    float _1127 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1051);
    float _1129 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1119);
    float _1131 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1133 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1135 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1127);
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1141 = _1109 * _1061;
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = _1109 * _1073;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1139);
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1151 = _1109 * _1069;
    float _1153 = -_1133;
    float _1155 = fma(_1153, _1115, 1.0);
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1159 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1161 = -_1149;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1161);
    float _1165 = log2(_1155);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1157);
    float _1169 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = -_1151;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1163);
    float _1175 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1173, -0.5, 0.5);
    float _1181 = exp2(_1159);
    float _1183 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1175);
    float _1185 = fma(_1173, 0.5, 0.5);
    float _1187 = _1145 + 1.0;
    float _1189 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1191 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1183);
    float _1193 = fma(_1185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1195 = 1.0 / _1167;
    float _1197 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1189);
    float _1199 = fma(_1185, _1193, -0.212114393711090087890625);
    float _1201 = fma(_1185, _1199, 1.570728778839111328125);
    float _1203 = sqrt(_1179);
    float _1205 = -_1145;
    float _1207 = fma(_1181, _1187, _1205);
    float _1209 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1211 = _1165 * 0.693147182464599609375;
    float _1213 = fma(_1207, 0.5, 0.5);
    float _1215 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1217 = _1209 * _1195;
    float _1219 = _1197 * _1195;
    float _1221 = fma(_1217, 0.5, 0.5);
    float _1223 = fma(_1219, -0.5, 0.5);
    float _1225 = _1203 * 0.636619746685028076171875;
    float _1227 = -_1201;
    float _1229 = fma(_1225, _1227, 1.0);
    float3 _3276 = float3(_1221, _1223, _1215);
    float _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3276, float3(0.0), isnan(_3276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3276, float3(0.0), isnan(_3276)), level(0.0)).x;
    float3 _3287 = float3(_1221, _1223, _1215);
    float4 _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3287, float3(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3287, float3(0.0), isnan(_3287)), level(0.0)).xyzw;
    float _1236 = _1234.x;
    float _1238 = _1234.y;
    float _1240 = _1234.z;
    float _1242 = _1234.w;
    float2 _3304 = float2(_1229, _1213);
    float3 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3304, float2(0.0), isnan(_3304)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3304, float2(0.0), isnan(_3304)), level(0.0)).xyz;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1256 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1258 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1256);
    float _1260 = exp2(_1254);
    float _1262 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1258);
    float _1264 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1262);
    float _1266 = _1264 + _1167;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1197;
    out.gl_Position.z = _1264;
    out.gl_Position.w = _1167;
    float _1268 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1270 = _1266 * 0.5;
    float _1272 = -_1260;
    float _1274 = _1272 + 1.0;
    out.m_47.x = _1268;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1270;
    out.m_64.w = _1167;
    float _1278 = _1276 * _1231;
    float _1280 = -_1276;
    float _1282 = _1280 + 1.0;
    float _1284 = _1242 * _1278;
    float _1286 = _1252 * _1278;
    float _1288 = _1242 * _1282;
    float _1290 = fma(_1248, _1284, _1236);
    float _1292 = fma(_1250, _1284, _1238);
    float _1294 = fma(_1242, _1286, _1240);
    out.m_66.x = _1290;
    out.m_66.y = _1292;
    out.m_66.z = _1294;
    out.m_66.w = _1288;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _857 = false;
    bool _299 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1351 = as_type<float>(_101);
        out.gl_Position.z = _1351;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1420 = as_type<float>(_137);
        out.gl_Position.z = _1420;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_54.w;
    bool _145 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _147 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = in.m_49.x;
    float _157 = in.m_49.y;
    float _159 = in.m_49.z;
    float _161 = in.m_44.x;
    float _163 = in.m_44.y;
    float _165 = in.m_44.z;
    float _167 = 0.0;
    float _169 = _141;
    if (!_153)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_153)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_139) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_139) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_153;
    float _201 = _181;
    if (!_199)
    {
        float _203 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = log2(_203);
        float _207 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _209 = _207 + 1.0;
        float _211 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = _141 * _205;
        float _215 = 1.0 / _209;
        float _217 = _211 * 0.693147182464599609375;
        float _219 = exp2(_213);
        float _221 = 1.0 / _217;
        float _223 = _219 + (-1.0);
        float _225 = -_223;
        float _227 = fma(_225, _221, _141);
        float _229 = _227 * _215;
        float _231 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _231;
    }
    float _233 = _201;
    bool _235 = !_153;
    if (!_235)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _141 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _169 = _255;
    }
    float _257 = _169;
    bool _259 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _261 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _263 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _265 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _267 = fma(_257, _155, _261);
    float _269 = fma(_257, _157, _263);
    float _271 = fma(_257, _159, _265);
    float _273 = fma(_267, _143, _161);
    float _275 = fma(_269, _143, _163);
    float _277 = fma(_271, _143, _165);
    bool _279 = !_259;
    float _297;
    if (!_279)
    {
        float _281 = in.m_56.x;
        float _283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _285 = _281 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _287 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _289 = _287 * _283;
        float _291 = floor(_289);
        float _293 = -_291;
        float _295 = _289 + _293;
        _297 = _295;
        _299 = true;
    }
    else
    {
        float _301 = float(_85);
        float _303 = 1.0 / _301;
        float _305 = _119 * _303;
        _297 = _305;
    }
    _299 = false;
    float _307 = _297;
    float _309 = in.m_56.x;
    float _311 = in.m_56.y;
    float _313 = _275 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _315 = _275 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _317 = _275 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _319 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].x, _313);
    float _321 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].x, _315);
    float _323 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].x, _317);
    float _325 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[4].z, _319);
    float _327 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[5].z, _321);
    float _329 = fma(_277, (*spvDescriptorSet0.vp_c10)._m0[6].z, _323);
    float _331 = _325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _333 = _327 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _341 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _343 = _333 + _341;
    float _345 = _329 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _351 = _331 + _349;
    float _353 = _343 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _355 = 1.0 / _337;
    bool _357 = _309 > 0.5;
    float _359 = _339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _361 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _363 = _311 > 0.5;
    float _365 = fma(_351, (*spvDescriptorSet0.vp_c8)._m0[28].x, _353);
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _369 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _371 = _345 + _369;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _375 = _367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _383 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[28].z, _365);
    out.m_58.x = _359;
    out.m_58.y = _361;
    out.m_58.z = _375;
    out.m_58.w = _373;
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _393 = _391 != 0;
    float _395 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _397 = -_193;
    int _399 = _357 ? as_type<int>(_397) : as_type<int>(_193);
    bool _401 = _383 >= 0.0;
    out.m_60.x = _385;
    out.m_60.y = _387;
    out.m_60.z = _389;
    int _403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _405 = _403 != 0;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _409 = _307 + _407;
    float _411 = -_197;
    int _413 = _363 ? as_type<int>(_411) : as_type<int>(_197);
    float _415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _417 = _343 * _343;
    bool _419 = !_393;
    float _421 = _419 ? _193 : as_type<float>(_399);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _427 = !_405;
    float _429 = _427 ? _197 : as_type<float>(_413);
    float _431 = fma(_351, _351, _417);
    float _433 = _421 + 0.5;
    float _435 = 1.0 / _425;
    float _437 = fma(_371, _371, _431);
    float _439 = -_429;
    float _441 = _439 + 0.5;
    float _443 = _433 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = _375;
    float _447 = _333;
    if (_401)
    {
        _445 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _449 = _445;
    float _451 = _441 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _453 = _443 * _395;
    float _455 = rsqrt(_437);
    float _457 = _451 * _415;
    int _459 = as_type<int>(_449);
    if (_401)
    {
        float _461 = _449 * 5.0;
        _459 = as_type<int>(_461);
    }
    int _463 = _459;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _467 = _307 + _465;
    float _469 = _409 * _355;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    out.m_62.x = _453;
    out.m_62.y = _457;
    float _479 = _467 * _435;
    float _481 = fma(_473, _469, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _483 = fma(_477, _469, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    if (_401)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2020 = as_type<float>(_463);
        out.gl_Position.z = _2020;
    }
    bool _485 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_307);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    if (_401)
    {
        out.m_47.x = 0.0;
    }
    float _497 = _343 * _455;
    float _499 = _351 * _455;
    if (_401)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _501 = -_497;
    float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _333);
    float _505 = -_499;
    float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[18].w, _331);
    float _509 = _371 * _455;
    bool _511 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _513 = isnan(_307);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _525 = _503 + _523;
    bool _527 = _307 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _529 = isnan(_307);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = -_495;
    float _541 = _539 + 1.0;
    float _543 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _545 = _507 + _543;
    float _547 = _525 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _549 = -_509;
    float _551 = fma(_549, (*spvDescriptorSet0.vp_c9)._m0[18].w, _345);
    float _553 = _537 * _541;
    float _555 = -_537;
    float _557 = _555 + 1.0;
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c8)._m0[28].x, _547);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _551 + _561;
    float _565 = -_497;
    float _567 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _343);
    float _569 = _521 * _557;
    float _571 = -_499;
    float _573 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[18].w, _351);
    float _575 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _559);
    float _577 = _567 * _567;
    float _579 = _481 * _569;
    float _581 = -_509;
    float _583 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[18].w, _371);
    float _585 = _483 * _569;
    float _587 = fma(_573, _573, _577);
    bool _589 = _575 >= 0.0;
    float _591 = in.m_54.x;
    float _593 = in.m_54.y;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _599 = -_521;
    float _601 = _599 + 1.0;
    float _603 = fma(_583, _583, _587);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _609 = fma(_597, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].x, _579);
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[143].y, _585);
    float _615 = fma(_607, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = sqrt(_603);
    float _619 = fma(_609, _553, _611);
    float _621 = fma(_615, _553, _613);
    float _623 = _583;
    int _625 = as_type<int>(_621);
    if (_589)
    {
        _623 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _627 = _623;
    float _629 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[145].x, _619);
    if (_589)
    {
        out.m_47.x = 0.0;
    }
    float _631 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[145].y, _621);
    if (_589)
    {
        float _633 = _627 * 5.0;
        _625 = as_type<int>(_633);
    }
    int _635 = _625;
    if (_589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2286 = as_type<float>(_635);
        out.gl_Position.z = _2286;
    }
    float _637 = _629 * _591;
    float _639 = _631 * _593;
    float _641 = _455 * _617;
    if (_589)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _643 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _651 = _641 * _643;
    float _653 = _641 * _647;
    float _655 = _645 * _651;
    float _657 = _649 * _653;
    float _659 = _641 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _661 = _659 * 0.5;
    float _663 = _655 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _665 = _655 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _667 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].x, _663);
    float _669 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].x, _665);
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].z, _667);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _675 = _671 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _677 = _673 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _679 = _331 + _675;
    float _681 = _345 + _677;
    float _683 = _655 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _685 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _687 = _679 + _685;
    float _689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _691 = _681 + _689;
    float _693 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].x, _683);
    float _695 = _687 * _687;
    float _697 = _691 * _691;
    float _699 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].z, _693);
    float _701 = _695 + _697;
    float _703 = _699 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _705 = sqrt(_701);
    float _707 = _333 + _703;
    bool _709 = _705 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _711 = _703;
    float _713 = _661;
    float _715 = _655;
    float _717 = _697;
    float _719 = _701;
    if (!_709)
    {
        _711 = _695;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_709)
    {
        _713 = _679;
    }
    float _725 = _713;
    float _727 = _725;
    if (!_709)
    {
        _447 = _681;
    }
    float _729 = _447;
    float _731 = _729;
    if (!_709)
    {
        _715 = _707;
    }
    float _733 = _715;
    bool _735 = !_709;
    float _737 = _733;
    if (!_735)
    {
        float _739 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _741 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _743 = _705 + _741;
        float _745 = rsqrt(_701);
        float _747 = _743 * _739;
        float _749 = _707 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _751 = _747 * 0.15915493667125701904296875;
        float _753 = _751 * 6.283185482025146484375;
        float _755 = sin(_753);
        float _757 = _751 * 6.283185482025146484375;
        float _759 = cos(_757);
        float _761 = fma(_755, _749, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _763 = _745 * _761;
        float _765 = _759 + (-1.0);
        float _767 = fma(_687, _763, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _769 = fma(_691, _763, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _771 = _765 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _773 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _775 = _767 + _773;
        float _777 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _779 = _769 + _777;
        float _781 = fma(_707, _759, _771);
        float _783 = _775 * _775;
        float _785 = _779 * _779;
        _737 = _781;
        _723 = _783;
        _717 = _785;
        _727 = _767;
        _731 = _769;
    }
    float _787 = _737;
    float _789 = _723;
    float _791 = _717;
    float _793 = _727;
    float _795 = _731;
    float _797 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _799 = _787 + _797;
    float _801 = fma(_799, _799, _789);
    float _803 = _801 + _791;
    float _805 = sqrt(_803);
    bool _807 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _809 = isnan(_805);
    bool _811 = _807 || _809;
    bool _813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _815 = _811 || _813;
    float _817 = _789;
    float _819 = _803;
    float _821 = _805;
    if (!_815)
    {
        _817 = 1.0;
    }
    float _823 = _817;
    bool _825 = !_815;
    float _827 = _823;
    if (!_825)
    {
        bool _829 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _831 = isnan(_805);
        bool _833 = _829 || _831;
        bool _835 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _837 = _833 || _835;
        if (!_837)
        {
            float _839 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _841 = _805 + _839;
            float _843 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _845 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _843;
            float _847 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _849 = _847 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _851 = 1.0 / _845;
            float _853 = _841 * _851;
            float _855 = fma(_853, _849, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _827 = _855;
            _819 = _845;
            _857 = true;
        }
        else
        {
            bool _859 = _805 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _861 = isnan(_805);
            bool _863 = _859 || _861;
            bool _865 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _867 = _863 || _865;
            if (!_867)
            {
                float _869 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _871 = _805 + _869;
                float _873 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _875 = _873 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _877 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _879 = _877 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _881 = 1.0 / _875;
                float _883 = _871 * _881;
                float _885 = fma(_883, _879, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _827 = _885;
                _819 = _875;
                _857 = true;
            }
            else
            {
                _827 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _857 = false;
    float _887 = _827;
    float _889 = _819;
    float _891 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _893 = _787 + _891;
    float _895 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _897 = _793 + _895;
    float _899 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _901 = _795 + _899;
    float _903 = fma(_893, _887, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _905 = fma(_897, _887, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _907 = fma(_901, _887, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _909 = -_497;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _903);
    float _913 = -_499;
    float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[18].w, _905);
    float _917 = -_509;
    float _919 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[18].w, _907);
    float _921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _923 = _911 + _921;
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _915 + _925;
    float _929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _931 = _919 + _929;
    float _933 = _923 * _923;
    float _935 = fma(_927, _927, _933);
    float _937 = fma(_931, _931, _935);
    float _939 = rsqrt(_937);
    float _941 = _939 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _943 = _927 * _941;
    float _945 = _931 * _941;
    float _947 = _943 * _943;
    float _949 = _945 * _945;
    float _951 = _947 + _949;
    float _953 = sqrt(_951);
    bool _955 = _953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _959 = _953 + _957;
    float _961 = _939;
    float _963 = _889;
    float _965 = _959;
    float _967 = _923;
    float _969 = _943;
    if (_955)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _961 = _971;
    }
    float _973 = _961;
    if (_955)
    {
        float _975 = rsqrt(_951);
        _963 = _975;
    }
    float _977 = _963;
    float _979 = _977;
    if (_955)
    {
        float _981 = _959 * _973;
        _965 = _981;
    }
    float _983 = _965;
    if (_955)
    {
        float _985 = _983 * 0.15915493667125701904296875;
        _821 = _985;
    }
    float _987 = _821;
    float _989 = _931;
    if (_955)
    {
        float _991 = _987 * 6.283185482025146484375;
        float _993 = sin(_991);
        _989 = _993;
    }
    float _995 = _989;
    float _997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _999 = precise::max(0.0, _997);
    float _1001 = _973;
    float _1003 = _999;
    if (_955)
    {
        float _1005 = _987 * 6.283185482025146484375;
        float _1007 = cos(_1005);
        _1001 = _1007;
    }
    float _1009 = _1001;
    float _1011 = -_941;
    float _1013 = -_999;
    float _1015 = fma(_923, _1011, _1013);
    if (_955)
    {
        float _1017 = _1015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _967 = _1017;
    }
    float _1019 = _967;
    float _1021 = sqrt(_937);
    float _1023 = _1019;
    float _1025 = _995;
    if (_955)
    {
        float _1027 = fma(_995, _1019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1023 = _1027;
    }
    float _1029 = _1023;
    float _1031 = _1029;
    if (!_955)
    {
        _1025 = _1015;
    }
    float _1033 = _1025;
    float _1035 = _1033;
    float _1037 = _1009;
    if (_955)
    {
        float _1039 = _1009 + (-1.0);
        _1003 = _1039;
    }
    float _1041 = _1003;
    float _1043 = _1041;
    if (_955)
    {
        float _1045 = _977 * _1029;
        _719 = _1045;
    }
    float _1047 = _719;
    if (!_955)
    {
        _1031 = _947;
    }
    float _1049 = _1031;
    float _1051 = _911 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1053 = _1049;
    if (_955)
    {
        float _1055 = _1041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _979 = _1055;
    }
    float _1057 = _979;
    if (_955)
    {
        float _1059 = _943 * _1047;
        _969 = _1059;
    }
    float _1061 = _969;
    if (!_955)
    {
        _1043 = _945;
    }
    float _1063 = _1043;
    float _1065 = _1063;
    if (_955)
    {
        float _1067 = _945 * _1047;
        _1065 = _1067;
    }
    float _1069 = _1065;
    if (_955)
    {
        float _1071 = fma(_1015, _1009, _1057);
        _1035 = _1071;
    }
    float _1073 = _1035;
    if (_955)
    {
        float _1075 = _1061 * _1061;
        _1053 = _1075;
    }
    float _1077 = _1053;
    if (!_955)
    {
        _1037 = _949;
    }
    float _1079 = _1037;
    float _1081 = _1079;
    if (_955)
    {
        float _1083 = _1069 * _1069;
        _1081 = _1083;
    }
    float _1085 = _1081;
    float _1087 = fma(_1073, _1073, _1077);
    float _1089 = _911 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1091 = _1087 + _1085;
    float _1093 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1095 = fma(_1021, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1093);
    float _1097 = precise::clamp(_1095, 0.0, 1.0);
    float _1099 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1089);
    float _1101 = _911 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1103 = _911 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1105 = -_1097;
    float _1107 = _1105 + 1.0;
    float _1109 = rsqrt(_1091);
    float _1111 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1099);
    float _1113 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1101);
    float _1115 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1117 = _1111 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1119 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1103);
    float _1121 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1113);
    float _1123 = abs(_1107);
    float _1125 = log2(_1123);
    float _1127 = fma(_915, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1051);
    float _1129 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1119);
    float _1131 = _1121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1133 = _1117 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1135 = fma(_919, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1127);
    float _1137 = _1129 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1139 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1141 = _1109 * _1061;
    float _1143 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1145 = _1109 * _1073;
    float _1147 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1139);
    float _1149 = _1141 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1151 = _1109 * _1069;
    float _1153 = -_1133;
    float _1155 = fma(_1153, _1115, 1.0);
    float _1157 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1147);
    float _1159 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1161 = -_1149;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1161);
    float _1165 = log2(_1155);
    float _1167 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1157);
    float _1169 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1171 = -_1151;
    float _1173 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1163);
    float _1175 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1177 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1169);
    float _1179 = fma(_1173, -0.5, 0.5);
    float _1181 = exp2(_1159);
    float _1183 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1175);
    float _1185 = fma(_1173, 0.5, 0.5);
    float _1187 = _1145 + 1.0;
    float _1189 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1177);
    float _1191 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1183);
    float _1193 = fma(_1185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1195 = 1.0 / _1167;
    float _1197 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1189);
    float _1199 = fma(_1185, _1193, -0.212114393711090087890625);
    float _1201 = fma(_1185, _1199, 1.570728778839111328125);
    float _1203 = sqrt(_1179);
    float _1205 = -_1145;
    float _1207 = fma(_1181, _1187, _1205);
    float _1209 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1191);
    float _1211 = _1165 * 0.693147182464599609375;
    float _1213 = fma(_1207, 0.5, 0.5);
    float _1215 = _1211 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1217 = _1209 * _1195;
    float _1219 = _1197 * _1195;
    float _1221 = fma(_1217, 0.5, 0.5);
    float _1223 = fma(_1219, -0.5, 0.5);
    float _1225 = _1203 * 0.636619746685028076171875;
    float _1227 = -_1201;
    float _1229 = fma(_1225, _1227, 1.0);
    float3 _3276 = float3(_1221, _1223, _1215);
    float _1231 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3276, float3(0.0), isnan(_3276)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3276, float3(0.0), isnan(_3276)), level(0.0)).x;
    float3 _3287 = float3(_1221, _1223, _1215);
    float4 _1234 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3287, float3(0.0), isnan(_3287)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3287, float3(0.0), isnan(_3287)), level(0.0)).xyzw;
    float _1236 = _1234.x;
    float _1238 = _1234.y;
    float _1240 = _1234.z;
    float _1242 = _1234.w;
    float2 _3304 = float2(_1229, _1213);
    float3 _1246 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3304, float2(0.0), isnan(_3304)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3304, float2(0.0), isnan(_3304)), level(0.0)).xyz;
    float _1248 = _1246.x;
    float _1250 = _1246.y;
    float _1252 = _1246.z;
    float _1254 = _1125 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1256 = _1131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1258 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1256);
    float _1260 = exp2(_1254);
    float _1262 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1258);
    float _1264 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1262);
    float _1266 = _1264 + _1167;
    out.gl_Position.x = _1209;
    out.gl_Position.y = _1197;
    out.gl_Position.z = _1264;
    out.gl_Position.w = _1167;
    float _1268 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1270 = _1266 * 0.5;
    float _1272 = -_1260;
    float _1274 = _1272 + 1.0;
    out.m_47.x = _1268;
    float _1276 = _1274 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1270;
    out.m_64.w = _1167;
    float _1278 = _1276 * _1231;
    float _1280 = -_1276;
    float _1282 = _1280 + 1.0;
    float _1284 = _1242 * _1278;
    float _1286 = _1252 * _1278;
    float _1288 = _1242 * _1282;
    float _1290 = fma(_1248, _1284, _1236);
    float _1292 = fma(_1250, _1284, _1238);
    float _1294 = fma(_1242, _1286, _1240);
    out.m_66.x = _1290;
    out.m_66.y = _1292;
    out.m_66.z = _1294;
    out.m_66.w = _1288;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

