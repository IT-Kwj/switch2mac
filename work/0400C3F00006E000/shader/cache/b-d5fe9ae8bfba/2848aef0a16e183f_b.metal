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
    float4 m_54 [[user(locn1)]];
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
    float4 m_52 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _177 = false;
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
        float _1211 = as_type<float>(_99);
        out.gl_Position.z = _1211;
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
        float _1279 = as_type<float>(_135);
        out.gl_Position.z = _1279;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_52.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_83);
        float _181 = 1.0 / _179;
        float _183 = _117 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = in.m_52.x;
    float _189 = in.m_52.y;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _193 = in.m_42.x;
    float _195 = in.m_42.y;
    float _197 = in.m_42.z;
    float _199 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _199);
    float _203 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _205 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _201);
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _203);
    float _209 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _211 = sqrt(_205);
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _215 = _187 > 0.5;
    float _217 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _209);
    float _219 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _221 = _189 > 0.5;
    float _223 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _225 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _217);
    float _227 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _207);
    float _229 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _231 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].y, _223);
    float _233 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _237 = _235 != 0;
    float _239 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].x, _229);
    float _241 = sqrt(_227);
    float _243 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].y, _231);
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _251 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].x, _239);
    float _253 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].z, _233);
    float _255 = _243 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _257 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].w, _249);
    float _259 = sqrt(_225);
    float _261 = _251 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _263 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].z, _253);
    float _265 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].w, _257);
    float _267 = _211 * _261;
    float _269 = _263 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _271 = _265 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _273 = _241 * _255;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _277 = _273 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _279 = _273 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _281 = _273 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _283 = _275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _285 = _259 * _269;
    float _287 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[25].x, _277);
    float _289 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[24].x, _279);
    float _291 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[26].x, _281);
    float _293 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[25].z, _287);
    float _295 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[24].z, _289);
    float _297 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[26].z, _291);
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _301 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[25].w, _293);
    float _303 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[24].w, _295);
    float _305 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[26].w, _297);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _301 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _313 = _303 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _315 = _305 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _317 = 1.0 / _309;
    float _319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _321 = _311 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _325 = _313 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _329 = _315 + _327;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _333 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = _321 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_54.x = _283;
    out.m_54.y = _333;
    out.m_54.z = _219;
    out.m_54.w = _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[28].x, _339);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _349 = _185 + _347;
    float _351 = 1.0 / _337;
    float _353 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[28].z, _345);
    float _355 = _349 * _317;
    float _357 = -_151;
    int _359 = _215 ? as_type<int>(_357) : as_type<int>(_151);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _365 = _353 >= 0.0;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _369 = -_155;
    int _371 = _221 ? as_type<int>(_369) : as_type<int>(_155);
    float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _375 = _321 * _321;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _379 = !_247;
    float _381 = _379 ? _155 : as_type<float>(_371);
    float _383 = _361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _385 = _363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = fma(_325, _325, _375);
    float _391 = 1.0 / _343;
    float _393 = -_381;
    float _395 = _393 + 0.5;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _185 + _397;
    float _401 = fma(_329, _329, _389);
    out.m_56.x = _383;
    out.m_56.y = _385;
    out.m_56.z = _387;
    out.m_56.w = _377;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _405 = _399 * _351;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _185 + _407;
    bool _411 = !_237;
    float _413 = _411 ? _151 : as_type<float>(_359);
    float _415 = _403 * _373;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = rsqrt(_401);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _413 + 0.5;
    bool _429 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_185);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    if (_365)
    {
        out.m_45.x = 0.0;
    }
    float _441 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = _427 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = fma(_419, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _447 = _409 * _391;
    bool _449 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_185);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _443 * _191;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = _443;
    if (_365)
    {
        _467 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _469 = _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = fma(_465, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    out.m_58.x = _461;
    out.m_58.y = _415;
    int _477 = as_type<int>(_469);
    if (_365)
    {
        float _479 = _469 * 5.0;
        _477 = as_type<int>(_479);
    }
    int _481 = _477;
    float _483 = fma(_473, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _485 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_185);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_439;
    float _499 = _497 + 1.0;
    float _501 = _321 * _421;
    float _503 = _501;
    if (_365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1985 = as_type<float>(_481);
        out.gl_Position.z = _1985;
    }
    float _505 = _325 * _421;
    if (_365)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _507 = -_501;
    float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    bool _511 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _513 = isnan(_185);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _495 * _499;
    float _525 = -_495;
    float _527 = _525 + 1.0;
    float _529 = -_505;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _313);
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _535 = _509 + _533;
    float _537 = _329 * _421;
    float _539 = _521 * _527;
    float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _543 = _531 + _541;
    float _545 = _535 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _547 = -_537;
    float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _315);
    float _551 = -_521;
    float _553 = _551 + 1.0;
    float _555 = -_501;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _321);
    float _559 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[28].x, _545);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _549 + _561;
    float _565 = _459 * _553;
    float _567 = _557 * _557;
    float _569 = -_505;
    float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _573 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _559);
    float _575 = _445 * _565;
    float _577 = _475 * _565;
    float _579 = fma(_571, _571, _567);
    bool _581 = _573 >= 0.0;
    float _583 = -_459;
    float _585 = _583 + 1.0;
    float _587 = in.m_60.x;
    float _589 = in.m_60.y;
    float _591 = -_537;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _329);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _595;
    float _599 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _601;
    float _605 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _607 = fma(_593, _593, _579);
    float _609 = fma(_597, _447, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _611 = fma(_441, _539, _599);
    float _613 = fma(_603, _447, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _615 = fma(_483, _539, _605);
    float _617 = sqrt(_607);
    float _619 = fma(_609, _523, _611);
    float _621 = _611;
    if (_581)
    {
        _621 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _623 = _621;
    float _625 = fma(_613, _523, _615);
    int _627 = as_type<int>(_623);
    if (_581)
    {
        out.m_45.x = 0.0;
    }
    float _629 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[146].x, _619);
    float _631 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[146].y, _625);
    if (_581)
    {
        float _633 = _623 * 5.0;
        _627 = as_type<int>(_633);
    }
    int _635 = _627;
    float _637 = _629 * _587;
    if (_581)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_635);
        out.gl_Position.z = _2223;
    }
    float _639 = _631 * _589;
    float _641 = _421 * _617;
    if (_581)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _643 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    float _651 = _641 * _643;
    float _653 = _641 * _647;
    float _655 = _641 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _657 = _655 * 0.5;
    float _659 = _645 * _651;
    float _661 = _649 * _653;
    float _663 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].x, _665);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _671);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _673);
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _685 = _315 + _681;
    float _687 = _313 + _683;
    float _689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _691 = _685 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _695 = _687 + _693;
    float _697 = _691 * _691;
    float _699 = fma(_695, _695, _697);
    float _701 = _679 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _703 = sqrt(_699);
    float _705 = _311 + _701;
    bool _707 = _703 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _709 = _679;
    float _711 = _701;
    float _713 = _663;
    float _715 = _657;
    if (!_707)
    {
        _709 = _687;
    }
    float _717 = _709;
    float _719 = _717;
    if (!_707)
    {
        _711 = _685;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_707)
    {
        _713 = _705;
    }
    float _725 = _713;
    bool _727 = !_707;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _703 + _733;
        float _737 = rsqrt(_699);
        float _739 = _735 * _731;
        float _741 = _705 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _743 = _739 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = cos(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = sin(_749);
        float _753 = _747 + (-1.0);
        float _755 = fma(_751, _741, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = _753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = _737 * _755;
        float _761 = fma(_705, _747, _757);
        float _763 = fma(_695, _759, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _765 = fma(_691, _759, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _729 = _761;
        _719 = _763;
        _723 = _765;
    }
    float _767 = _729;
    float _769 = _719;
    float _771 = _723;
    float _773 = -_501;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _767);
    float _777 = -_505;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _769);
    float _781 = -_537;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = _775 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _791 = _779 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _795 = _783 + _793;
    float _797 = _787 * _787;
    float _799 = fma(_791, _791, _797);
    float _801 = fma(_795, _795, _799);
    float _803 = rsqrt(_801);
    float _805 = _803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _807 = _791 * _805;
    float _809 = _795 * _805;
    float _811 = _807 * _807;
    float _813 = _809 * _809;
    float _815 = _811 + _813;
    float _817 = sqrt(_815);
    bool _819 = _817 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _821 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _823 = _817 + _821;
    float _825 = _803;
    float _827 = _815;
    float _829 = _823;
    float _831 = _787;
    float _833 = _807;
    if (_819)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _825 = _835;
    }
    float _837 = _825;
    if (_819)
    {
        float _839 = rsqrt(_815);
        _827 = _839;
    }
    float _841 = _827;
    if (_819)
    {
        float _843 = _823 * _837;
        _829 = _843;
    }
    float _845 = _829;
    if (_819)
    {
        float _847 = _845 * 0.15915493667125701904296875;
        _715 = _847;
    }
    float _849 = _715;
    float _851 = _837;
    if (_819)
    {
        float _853 = _849 * 6.283185482025146484375;
        float _855 = sin(_853);
        _851 = _855;
    }
    float _857 = _851;
    float _859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _861 = precise::max(0.0, _859);
    float _863 = _795;
    float _865 = _861;
    if (_819)
    {
        float _867 = _849 * 6.283185482025146484375;
        float _869 = cos(_867);
        _863 = _869;
    }
    float _871 = _863;
    float _873 = -_805;
    float _875 = -_861;
    float _877 = fma(_787, _873, _875);
    float _879 = _877;
    if (_819)
    {
        float _881 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _865 = _881;
    }
    float _883 = _865;
    float _885 = sqrt(_801);
    float _887 = _857;
    float _889 = _883;
    if (_819)
    {
        float _891 = fma(_857, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = _893;
    if (_819)
    {
        float _897 = _871 + (-1.0);
        _889 = _897;
    }
    float _899 = _889;
    float _901 = _899;
    if (_819)
    {
        float _903 = _841 * _893;
        _503 = _903;
    }
    float _905 = _503;
    if (!_819)
    {
        _895 = _809;
    }
    float _907 = _895;
    float _909 = _907;
    if (_819)
    {
        float _911 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _831 = _911;
    }
    float _913 = _831;
    float _915 = _913;
    if (_819)
    {
        float _917 = _807 * _905;
        _833 = _917;
    }
    float _919 = _833;
    if (!_819)
    {
        _901 = _811;
    }
    float _921 = _901;
    float _923 = _921;
    if (_819)
    {
        float _925 = _809 * _905;
        _909 = _925;
    }
    float _927 = _909;
    if (_819)
    {
        float _929 = fma(_877, _871, _913);
        _879 = _929;
    }
    float _931 = _879;
    if (_819)
    {
        float _933 = _919 * _919;
        _923 = _933;
    }
    float _935 = _923;
    if (!_819)
    {
        _915 = _813;
    }
    float _937 = _915;
    float _939 = _937;
    if (_819)
    {
        float _941 = _927 * _927;
        _939 = _941;
    }
    float _943 = _939;
    float _945 = fma(_931, _931, _935);
    float _947 = _775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _949 = _945 + _943;
    float _951 = _775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _955 = fma(_885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _953);
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = _775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _961 = rsqrt(_949);
    float _963 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _951);
    float _965 = _775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _967 = -_957;
    float _969 = _967 + 1.0;
    float _971 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _959);
    float _973 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _975 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _965);
    float _977 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _947);
    float _979 = abs(_969);
    float _981 = log2(_979);
    float _983 = _973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _985 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[1].z, _975);
    float _987 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[0].z, _971);
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _991 = _983 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[3].z, _977);
    float _997 = _961 * _919;
    float _999 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1003 = _961 * _931;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1007 = _961 * _927;
    float _1009 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1001);
    float _1011 = _995 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1013 = -_1005;
    float _1015 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1013);
    float _1017 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1019 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1009);
    float _1021 = -_991;
    float _1023 = fma(_1021, _989, 1.0);
    float _1025 = -_1007;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1015);
    float _1029 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1031 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1019);
    float _1033 = exp2(_1017);
    float _1035 = fma(_1027, -0.5, 0.5);
    float _1037 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1039 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1029);
    float _1041 = fma(_1027, 0.5, 0.5);
    float _1043 = _1003 + 1.0;
    float _1045 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1037);
    float _1047 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1039);
    float _1049 = log2(_1023);
    float _1051 = fma(_1041, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1053 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1045);
    float _1055 = fma(_1041, _1051, -0.212114393711090087890625);
    float _1057 = 1.0 / _1031;
    float _1059 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1047);
    float _1061 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1053);
    float _1063 = -_1003;
    float _1065 = fma(_1033, _1043, _1063);
    float _1067 = fma(_1041, _1055, 1.570728778839111328125);
    float _1069 = fma(_1065, 0.5, 0.5);
    float _1071 = sqrt(_1035);
    float _1073 = _1049 * 0.693147182464599609375;
    float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1077 = _1059 * _1057;
    float _1079 = _1061 * _1057;
    float _1081 = fma(_1077, 0.5, 0.5);
    float _1083 = fma(_1079, -0.5, 0.5);
    float _1085 = _1071 * 0.636619746685028076171875;
    float3 _2978 = float3(_1081, _1083, _1075);
    float _1087 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2978, float3(0.0), isnan(_2978)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2978, float3(0.0), isnan(_2978)), level(0.0)).x;
    float3 _2989 = float3(_1081, _1083, _1075);
    float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2989, float3(0.0), isnan(_2989)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2989, float3(0.0), isnan(_2989)), level(0.0)).xyzw;
    float _1092 = _1090.x;
    float _1094 = _1090.y;
    float _1096 = _1090.z;
    float _1098 = _1090.w;
    float _1100 = -_1067;
    float _1102 = fma(_1085, _1100, 1.0);
    float2 _3011 = float2(_1102, _1069);
    float3 _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3011, float2(0.0), isnan(_3011)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3011, float2(0.0), isnan(_3011)), level(0.0)).xyz;
    float _1108 = _1106.x;
    float _1110 = _1106.y;
    float _1112 = _1106.z;
    float _1114 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1116 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1118 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1116);
    float _1120 = exp2(_1114);
    float _1122 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1118);
    float _1124 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1122);
    float _1126 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1128 = _1124 + _1031;
    out.gl_Position.x = _1059;
    out.gl_Position.y = _1061;
    out.gl_Position.z = _1124;
    out.gl_Position.w = _1031;
    float _1130 = _1128 * 0.5;
    float _1132 = -_1120;
    float _1134 = _1132 + 1.0;
    out.m_45.x = _1126;
    float _1136 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1130;
    out.m_62.w = _1031;
    float _1138 = _1136 * _1087;
    float _1140 = -_1136;
    float _1142 = _1140 + 1.0;
    float _1144 = _1098 * _1138;
    float _1146 = _1112 * _1138;
    float _1148 = fma(_1108, _1144, _1092);
    float _1150 = fma(_1110, _1144, _1094);
    float _1152 = _1098 * _1142;
    float _1154 = fma(_1098, _1146, _1096);
    out.m_64.x = _1148;
    out.m_64.y = _1150;
    out.m_64.z = _1154;
    out.m_64.w = _1152;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _177 = false;
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
        float _1211 = as_type<float>(_99);
        out.gl_Position.z = _1211;
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
        float _1279 = as_type<float>(_135);
        out.gl_Position.z = _1279;
    }
    if (_129)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_52.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_83);
        float _181 = 1.0 / _179;
        float _183 = _117 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = in.m_52.x;
    float _189 = in.m_52.y;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _193 = in.m_42.x;
    float _195 = in.m_42.y;
    float _197 = in.m_42.z;
    float _199 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _199);
    float _203 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _205 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _201);
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _203);
    float _209 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _211 = sqrt(_205);
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _215 = _187 > 0.5;
    float _217 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _209);
    float _219 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _221 = _189 > 0.5;
    float _223 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _225 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _217);
    float _227 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _207);
    float _229 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _231 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].y, _223);
    float _233 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _237 = _235 != 0;
    float _239 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].x, _229);
    float _241 = sqrt(_227);
    float _243 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].y, _231);
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _251 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].x, _239);
    float _253 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].z, _233);
    float _255 = _243 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _257 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].w, _249);
    float _259 = sqrt(_225);
    float _261 = _251 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _263 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].z, _253);
    float _265 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].w, _257);
    float _267 = _211 * _261;
    float _269 = _263 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _271 = _265 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _273 = _241 * _255;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _277 = _273 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _279 = _273 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _281 = _273 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _283 = _275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _285 = _259 * _269;
    float _287 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[25].x, _277);
    float _289 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[24].x, _279);
    float _291 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[26].x, _281);
    float _293 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[25].z, _287);
    float _295 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[24].z, _289);
    float _297 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[26].z, _291);
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _301 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[25].w, _293);
    float _303 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[24].w, _295);
    float _305 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[26].w, _297);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _301 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _313 = _303 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _315 = _305 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _317 = 1.0 / _309;
    float _319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _321 = _311 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _325 = _313 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _329 = _315 + _327;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _333 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = _321 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_54.x = _283;
    out.m_54.y = _333;
    out.m_54.z = _219;
    out.m_54.w = _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[28].x, _339);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _349 = _185 + _347;
    float _351 = 1.0 / _337;
    float _353 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[28].z, _345);
    float _355 = _349 * _317;
    float _357 = -_151;
    int _359 = _215 ? as_type<int>(_357) : as_type<int>(_151);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _365 = _353 >= 0.0;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _369 = -_155;
    int _371 = _221 ? as_type<int>(_369) : as_type<int>(_155);
    float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _375 = _321 * _321;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _379 = !_247;
    float _381 = _379 ? _155 : as_type<float>(_371);
    float _383 = _361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _385 = _363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = fma(_325, _325, _375);
    float _391 = 1.0 / _343;
    float _393 = -_381;
    float _395 = _393 + 0.5;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _185 + _397;
    float _401 = fma(_329, _329, _389);
    out.m_56.x = _383;
    out.m_56.y = _385;
    out.m_56.z = _387;
    out.m_56.w = _377;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _405 = _399 * _351;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _185 + _407;
    bool _411 = !_237;
    float _413 = _411 ? _151 : as_type<float>(_359);
    float _415 = _403 * _373;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = rsqrt(_401);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _413 + 0.5;
    bool _429 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_185);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    if (_365)
    {
        out.m_45.x = 0.0;
    }
    float _441 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = _427 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = fma(_419, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _447 = _409 * _391;
    bool _449 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_185);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _443 * _191;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = _443;
    if (_365)
    {
        _467 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _469 = _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = fma(_465, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    out.m_58.x = _461;
    out.m_58.y = _415;
    int _477 = as_type<int>(_469);
    if (_365)
    {
        float _479 = _469 * 5.0;
        _477 = as_type<int>(_479);
    }
    int _481 = _477;
    float _483 = fma(_473, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _485 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_185);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_439;
    float _499 = _497 + 1.0;
    float _501 = _321 * _421;
    float _503 = _501;
    if (_365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1985 = as_type<float>(_481);
        out.gl_Position.z = _1985;
    }
    float _505 = _325 * _421;
    if (_365)
    {
        return out;
    }
    float _507 = -_501;
    float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    bool _511 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _513 = isnan(_185);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _495 * _499;
    float _525 = -_495;
    float _527 = _525 + 1.0;
    float _529 = -_505;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _313);
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _535 = _509 + _533;
    float _537 = _329 * _421;
    float _539 = _521 * _527;
    float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _543 = _531 + _541;
    float _545 = _535 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _547 = -_537;
    float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _315);
    float _551 = -_521;
    float _553 = _551 + 1.0;
    float _555 = -_501;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _321);
    float _559 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[28].x, _545);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _549 + _561;
    float _565 = _459 * _553;
    float _567 = _557 * _557;
    float _569 = -_505;
    float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _573 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _559);
    float _575 = _445 * _565;
    float _577 = _475 * _565;
    float _579 = fma(_571, _571, _567);
    bool _581 = _573 >= 0.0;
    float _583 = -_459;
    float _585 = _583 + 1.0;
    float _587 = in.m_60.x;
    float _589 = in.m_60.y;
    float _591 = -_537;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _329);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _595;
    float _599 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _601;
    float _605 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _607 = fma(_593, _593, _579);
    float _609 = fma(_597, _447, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _611 = fma(_441, _539, _599);
    float _613 = fma(_603, _447, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _615 = fma(_483, _539, _605);
    float _617 = sqrt(_607);
    float _619 = fma(_609, _523, _611);
    float _621 = _611;
    if (_581)
    {
        _621 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _623 = _621;
    float _625 = fma(_613, _523, _615);
    int _627 = as_type<int>(_623);
    if (_581)
    {
        out.m_45.x = 0.0;
    }
    float _629 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[146].x, _619);
    float _631 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[146].y, _625);
    if (_581)
    {
        float _633 = _623 * 5.0;
        _627 = as_type<int>(_633);
    }
    int _635 = _627;
    float _637 = _629 * _587;
    if (_581)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_635);
        out.gl_Position.z = _2223;
    }
    float _639 = _631 * _589;
    float _641 = _421 * _617;
    if (_581)
    {
        return out;
    }
    float _643 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    float _651 = _641 * _643;
    float _653 = _641 * _647;
    float _655 = _641 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _657 = _655 * 0.5;
    float _659 = _645 * _651;
    float _661 = _649 * _653;
    float _663 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].x, _665);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _671);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _673);
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _685 = _315 + _681;
    float _687 = _313 + _683;
    float _689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _691 = _685 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _695 = _687 + _693;
    float _697 = _691 * _691;
    float _699 = fma(_695, _695, _697);
    float _701 = _679 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _703 = sqrt(_699);
    float _705 = _311 + _701;
    bool _707 = _703 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _709 = _679;
    float _711 = _701;
    float _713 = _663;
    float _715 = _657;
    if (!_707)
    {
        _709 = _687;
    }
    float _717 = _709;
    float _719 = _717;
    if (!_707)
    {
        _711 = _685;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_707)
    {
        _713 = _705;
    }
    float _725 = _713;
    bool _727 = !_707;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _703 + _733;
        float _737 = rsqrt(_699);
        float _739 = _735 * _731;
        float _741 = _705 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _743 = _739 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = cos(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = sin(_749);
        float _753 = _747 + (-1.0);
        float _755 = fma(_751, _741, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = _753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = _737 * _755;
        float _761 = fma(_705, _747, _757);
        float _763 = fma(_695, _759, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _765 = fma(_691, _759, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _729 = _761;
        _719 = _763;
        _723 = _765;
    }
    float _767 = _729;
    float _769 = _719;
    float _771 = _723;
    float _773 = -_501;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _767);
    float _777 = -_505;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _769);
    float _781 = -_537;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = _775 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _791 = _779 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _795 = _783 + _793;
    float _797 = _787 * _787;
    float _799 = fma(_791, _791, _797);
    float _801 = fma(_795, _795, _799);
    float _803 = rsqrt(_801);
    float _805 = _803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _807 = _791 * _805;
    float _809 = _795 * _805;
    float _811 = _807 * _807;
    float _813 = _809 * _809;
    float _815 = _811 + _813;
    float _817 = sqrt(_815);
    bool _819 = _817 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _821 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _823 = _817 + _821;
    float _825 = _803;
    float _827 = _815;
    float _829 = _823;
    float _831 = _787;
    float _833 = _807;
    if (_819)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _825 = _835;
    }
    float _837 = _825;
    if (_819)
    {
        float _839 = rsqrt(_815);
        _827 = _839;
    }
    float _841 = _827;
    if (_819)
    {
        float _843 = _823 * _837;
        _829 = _843;
    }
    float _845 = _829;
    if (_819)
    {
        float _847 = _845 * 0.15915493667125701904296875;
        _715 = _847;
    }
    float _849 = _715;
    float _851 = _837;
    if (_819)
    {
        float _853 = _849 * 6.283185482025146484375;
        float _855 = sin(_853);
        _851 = _855;
    }
    float _857 = _851;
    float _859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _861 = precise::max(0.0, _859);
    float _863 = _795;
    float _865 = _861;
    if (_819)
    {
        float _867 = _849 * 6.283185482025146484375;
        float _869 = cos(_867);
        _863 = _869;
    }
    float _871 = _863;
    float _873 = -_805;
    float _875 = -_861;
    float _877 = fma(_787, _873, _875);
    float _879 = _877;
    if (_819)
    {
        float _881 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _865 = _881;
    }
    float _883 = _865;
    float _885 = sqrt(_801);
    float _887 = _857;
    float _889 = _883;
    if (_819)
    {
        float _891 = fma(_857, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = _893;
    if (_819)
    {
        float _897 = _871 + (-1.0);
        _889 = _897;
    }
    float _899 = _889;
    float _901 = _899;
    if (_819)
    {
        float _903 = _841 * _893;
        _503 = _903;
    }
    float _905 = _503;
    if (!_819)
    {
        _895 = _809;
    }
    float _907 = _895;
    float _909 = _907;
    if (_819)
    {
        float _911 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _831 = _911;
    }
    float _913 = _831;
    float _915 = _913;
    if (_819)
    {
        float _917 = _807 * _905;
        _833 = _917;
    }
    float _919 = _833;
    if (!_819)
    {
        _901 = _811;
    }
    float _921 = _901;
    float _923 = _921;
    if (_819)
    {
        float _925 = _809 * _905;
        _909 = _925;
    }
    float _927 = _909;
    if (_819)
    {
        float _929 = fma(_877, _871, _913);
        _879 = _929;
    }
    float _931 = _879;
    if (_819)
    {
        float _933 = _919 * _919;
        _923 = _933;
    }
    float _935 = _923;
    if (!_819)
    {
        _915 = _813;
    }
    float _937 = _915;
    float _939 = _937;
    if (_819)
    {
        float _941 = _927 * _927;
        _939 = _941;
    }
    float _943 = _939;
    float _945 = fma(_931, _931, _935);
    float _947 = _775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _949 = _945 + _943;
    float _951 = _775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _955 = fma(_885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _953);
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = _775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _961 = rsqrt(_949);
    float _963 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _951);
    float _965 = _775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _967 = -_957;
    float _969 = _967 + 1.0;
    float _971 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _959);
    float _973 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _975 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _965);
    float _977 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _947);
    float _979 = abs(_969);
    float _981 = log2(_979);
    float _983 = _973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _985 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[1].z, _975);
    float _987 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[0].z, _971);
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _991 = _983 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[3].z, _977);
    float _997 = _961 * _919;
    float _999 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1003 = _961 * _931;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1007 = _961 * _927;
    float _1009 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1001);
    float _1011 = _995 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1013 = -_1005;
    float _1015 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1013);
    float _1017 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1019 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1009);
    float _1021 = -_991;
    float _1023 = fma(_1021, _989, 1.0);
    float _1025 = -_1007;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1015);
    float _1029 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1031 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1019);
    float _1033 = exp2(_1017);
    float _1035 = fma(_1027, -0.5, 0.5);
    float _1037 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1039 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1029);
    float _1041 = fma(_1027, 0.5, 0.5);
    float _1043 = _1003 + 1.0;
    float _1045 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1037);
    float _1047 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1039);
    float _1049 = log2(_1023);
    float _1051 = fma(_1041, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1053 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1045);
    float _1055 = fma(_1041, _1051, -0.212114393711090087890625);
    float _1057 = 1.0 / _1031;
    float _1059 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1047);
    float _1061 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1053);
    float _1063 = -_1003;
    float _1065 = fma(_1033, _1043, _1063);
    float _1067 = fma(_1041, _1055, 1.570728778839111328125);
    float _1069 = fma(_1065, 0.5, 0.5);
    float _1071 = sqrt(_1035);
    float _1073 = _1049 * 0.693147182464599609375;
    float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1077 = _1059 * _1057;
    float _1079 = _1061 * _1057;
    float _1081 = fma(_1077, 0.5, 0.5);
    float _1083 = fma(_1079, -0.5, 0.5);
    float _1085 = _1071 * 0.636619746685028076171875;
    float3 _2978 = float3(_1081, _1083, _1075);
    float _1087 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2978, float3(0.0), isnan(_2978)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2978, float3(0.0), isnan(_2978)), level(0.0)).x;
    float3 _2989 = float3(_1081, _1083, _1075);
    float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2989, float3(0.0), isnan(_2989)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2989, float3(0.0), isnan(_2989)), level(0.0)).xyzw;
    float _1092 = _1090.x;
    float _1094 = _1090.y;
    float _1096 = _1090.z;
    float _1098 = _1090.w;
    float _1100 = -_1067;
    float _1102 = fma(_1085, _1100, 1.0);
    float2 _3011 = float2(_1102, _1069);
    float3 _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3011, float2(0.0), isnan(_3011)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3011, float2(0.0), isnan(_3011)), level(0.0)).xyz;
    float _1108 = _1106.x;
    float _1110 = _1106.y;
    float _1112 = _1106.z;
    float _1114 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1116 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1118 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1116);
    float _1120 = exp2(_1114);
    float _1122 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1118);
    float _1124 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1122);
    float _1126 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1128 = _1124 + _1031;
    out.gl_Position.x = _1059;
    out.gl_Position.y = _1061;
    out.gl_Position.z = _1124;
    out.gl_Position.w = _1031;
    float _1130 = _1128 * 0.5;
    float _1132 = -_1120;
    float _1134 = _1132 + 1.0;
    out.m_45.x = _1126;
    float _1136 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1130;
    out.m_62.w = _1031;
    float _1138 = _1136 * _1087;
    float _1140 = -_1136;
    float _1142 = _1140 + 1.0;
    float _1144 = _1098 * _1138;
    float _1146 = _1112 * _1138;
    float _1148 = fma(_1108, _1144, _1092);
    float _1150 = fma(_1110, _1144, _1094);
    float _1152 = _1098 * _1142;
    float _1154 = fma(_1098, _1146, _1096);
    out.m_64.x = _1148;
    out.m_64.y = _1150;
    out.m_64.z = _1154;
    out.m_64.w = _1152;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _177 = false;
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
        float _1211 = as_type<float>(_99);
        out.gl_Position.z = _1211;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1279 = as_type<float>(_135);
        out.gl_Position.z = _1279;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_52.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_83);
        float _181 = 1.0 / _179;
        float _183 = _117 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = in.m_52.x;
    float _189 = in.m_52.y;
    float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _193 = in.m_42.x;
    float _195 = in.m_42.y;
    float _197 = in.m_42.z;
    float _199 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _199);
    float _203 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _205 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _201);
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _203);
    float _209 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _211 = sqrt(_205);
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _215 = _187 > 0.5;
    float _217 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _209);
    float _219 = _213 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _221 = _189 > 0.5;
    float _223 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _225 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _217);
    float _227 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _207);
    float _229 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _231 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].y, _223);
    float _233 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _237 = _235 != 0;
    float _239 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].x, _229);
    float _241 = sqrt(_227);
    float _243 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].y, _231);
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = _195 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _251 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].x, _239);
    float _253 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].z, _233);
    float _255 = _243 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _257 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[14].w, _249);
    float _259 = sqrt(_225);
    float _261 = _251 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _263 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].z, _253);
    float _265 = fma(_197, (*spvDescriptorSet0.vp_c10)._m0[16].w, _257);
    float _267 = _211 * _261;
    float _269 = _263 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _271 = _265 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _273 = _241 * _255;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _277 = _273 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _279 = _273 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _281 = _273 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _283 = _275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _285 = _259 * _269;
    float _287 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[25].x, _277);
    float _289 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[24].x, _279);
    float _291 = fma(_267, (*spvDescriptorSet0.vp_c8)._m0[26].x, _281);
    float _293 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[25].z, _287);
    float _295 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[24].z, _289);
    float _297 = fma(_285, (*spvDescriptorSet0.vp_c8)._m0[26].z, _291);
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _301 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[25].w, _293);
    float _303 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[24].w, _295);
    float _305 = fma(_271, (*spvDescriptorSet0.vp_c8)._m0[26].w, _297);
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _301 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _313 = _303 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _315 = _305 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _317 = 1.0 / _309;
    float _319 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _321 = _311 + _319;
    float _323 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _325 = _313 + _323;
    float _327 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _329 = _315 + _327;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _333 = _299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _335;
    float _339 = _321 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    out.m_54.x = _283;
    out.m_54.y = _333;
    out.m_54.z = _219;
    out.m_54.w = _331;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _341;
    float _345 = fma(_325, (*spvDescriptorSet0.vp_c8)._m0[28].x, _339);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _349 = _185 + _347;
    float _351 = 1.0 / _337;
    float _353 = fma(_329, (*spvDescriptorSet0.vp_c8)._m0[28].z, _345);
    float _355 = _349 * _317;
    float _357 = -_151;
    int _359 = _215 ? as_type<int>(_357) : as_type<int>(_151);
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _365 = _353 >= 0.0;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _369 = -_155;
    int _371 = _221 ? as_type<int>(_369) : as_type<int>(_155);
    float _373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _375 = _321 * _321;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _379 = !_247;
    float _381 = _379 ? _155 : as_type<float>(_371);
    float _383 = _361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _385 = _363 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = fma(_325, _325, _375);
    float _391 = 1.0 / _343;
    float _393 = -_381;
    float _395 = _393 + 0.5;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _185 + _397;
    float _401 = fma(_329, _329, _389);
    out.m_56.x = _383;
    out.m_56.y = _385;
    out.m_56.z = _387;
    out.m_56.w = _377;
    float _403 = _395 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _405 = _399 * _351;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _185 + _407;
    bool _411 = !_237;
    float _413 = _411 ? _151 : as_type<float>(_359);
    float _415 = _403 * _373;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _417;
    float _421 = rsqrt(_401);
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _427 = _413 + 0.5;
    bool _429 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _431 = isnan(_185);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    if (_365)
    {
        out.m_45.x = 0.0;
    }
    float _441 = fma(_425, _355, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _443 = _427 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _445 = fma(_419, _405, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _447 = _409 * _391;
    bool _449 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_185);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _443 * _191;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _463;
    float _467 = _443;
    if (_365)
    {
        _467 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _469 = _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _475 = fma(_465, _405, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    out.m_58.x = _461;
    out.m_58.y = _415;
    int _477 = as_type<int>(_469);
    if (_365)
    {
        float _479 = _469 * 5.0;
        _477 = as_type<int>(_479);
    }
    int _481 = _477;
    float _483 = fma(_473, _355, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _485 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _487 = isnan(_185);
    bool _489 = _485 || _487;
    bool _491 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _493 = _489 || _491;
    float _495 = float(_493);
    float _497 = -_439;
    float _499 = _497 + 1.0;
    float _501 = _321 * _421;
    float _503 = _501;
    if (_365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1985 = as_type<float>(_481);
        out.gl_Position.z = _1985;
    }
    float _505 = _325 * _421;
    if (_365)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _507 = -_501;
    float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[18].w, _311);
    bool _511 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _513 = isnan(_185);
    bool _515 = _511 || _513;
    bool _517 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _519 = _515 || _517;
    float _521 = float(_519);
    float _523 = _495 * _499;
    float _525 = -_495;
    float _527 = _525 + 1.0;
    float _529 = -_505;
    float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[18].w, _313);
    float _533 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _535 = _509 + _533;
    float _537 = _329 * _421;
    float _539 = _521 * _527;
    float _541 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _543 = _531 + _541;
    float _545 = _535 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _547 = -_537;
    float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[18].w, _315);
    float _551 = -_521;
    float _553 = _551 + 1.0;
    float _555 = -_501;
    float _557 = fma(_555, (*spvDescriptorSet0.vp_c9)._m0[18].w, _321);
    float _559 = fma(_543, (*spvDescriptorSet0.vp_c8)._m0[28].x, _545);
    float _561 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _563 = _549 + _561;
    float _565 = _459 * _553;
    float _567 = _557 * _557;
    float _569 = -_505;
    float _571 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _325);
    float _573 = fma(_563, (*spvDescriptorSet0.vp_c8)._m0[28].z, _559);
    float _575 = _445 * _565;
    float _577 = _475 * _565;
    float _579 = fma(_571, _571, _567);
    bool _581 = _573 >= 0.0;
    float _583 = -_459;
    float _585 = _583 + 1.0;
    float _587 = in.m_60.x;
    float _589 = in.m_60.y;
    float _591 = -_537;
    float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[18].w, _329);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _595;
    float _599 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].x, _575);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _601;
    float _605 = fma(_585, (*spvDescriptorSet0.vp_c9)._m0[143].y, _577);
    float _607 = fma(_593, _593, _579);
    float _609 = fma(_597, _447, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _611 = fma(_441, _539, _599);
    float _613 = fma(_603, _447, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _615 = fma(_483, _539, _605);
    float _617 = sqrt(_607);
    float _619 = fma(_609, _523, _611);
    float _621 = _611;
    if (_581)
    {
        _621 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _623 = _621;
    float _625 = fma(_613, _523, _615);
    int _627 = as_type<int>(_623);
    if (_581)
    {
        out.m_45.x = 0.0;
    }
    float _629 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[146].x, _619);
    float _631 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[146].y, _625);
    if (_581)
    {
        float _633 = _623 * 5.0;
        _627 = as_type<int>(_633);
    }
    int _635 = _627;
    float _637 = _629 * _587;
    if (_581)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_635);
        out.gl_Position.z = _2223;
    }
    float _639 = _631 * _589;
    float _641 = _421 * _617;
    if (_581)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _643 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _645 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _647 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    float _651 = _641 * _643;
    float _653 = _641 * _647;
    float _655 = _641 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _657 = _655 * 0.5;
    float _659 = _645 * _651;
    float _661 = _649 * _653;
    float _663 = _659 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _667 = _659 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _669 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[26].x, _663);
    float _671 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[24].x, _665);
    float _673 = fma(_661, (*spvDescriptorSet0.vp_c8)._m0[25].x, _667);
    float _675 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[26].z, _669);
    float _677 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[24].z, _671);
    float _679 = fma(_657, (*spvDescriptorSet0.vp_c8)._m0[25].z, _673);
    float _681 = _675 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _683 = _677 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _685 = _315 + _681;
    float _687 = _313 + _683;
    float _689 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _691 = _685 + _689;
    float _693 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _695 = _687 + _693;
    float _697 = _691 * _691;
    float _699 = fma(_695, _695, _697);
    float _701 = _679 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _703 = sqrt(_699);
    float _705 = _311 + _701;
    bool _707 = _703 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _709 = _679;
    float _711 = _701;
    float _713 = _663;
    float _715 = _657;
    if (!_707)
    {
        _709 = _687;
    }
    float _717 = _709;
    float _719 = _717;
    if (!_707)
    {
        _711 = _685;
    }
    float _721 = _711;
    float _723 = _721;
    if (!_707)
    {
        _713 = _705;
    }
    float _725 = _713;
    bool _727 = !_707;
    float _729 = _725;
    if (!_727)
    {
        float _731 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _735 = _703 + _733;
        float _737 = rsqrt(_699);
        float _739 = _735 * _731;
        float _741 = _705 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _743 = _739 * 0.15915493667125701904296875;
        float _745 = _743 * 6.283185482025146484375;
        float _747 = cos(_745);
        float _749 = _743 * 6.283185482025146484375;
        float _751 = sin(_749);
        float _753 = _747 + (-1.0);
        float _755 = fma(_751, _741, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _757 = _753 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _759 = _737 * _755;
        float _761 = fma(_705, _747, _757);
        float _763 = fma(_695, _759, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _765 = fma(_691, _759, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _729 = _761;
        _719 = _763;
        _723 = _765;
    }
    float _767 = _729;
    float _769 = _719;
    float _771 = _723;
    float _773 = -_501;
    float _775 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _767);
    float _777 = -_505;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _769);
    float _781 = -_537;
    float _783 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _771);
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = _775 + _785;
    float _789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _791 = _779 + _789;
    float _793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _795 = _783 + _793;
    float _797 = _787 * _787;
    float _799 = fma(_791, _791, _797);
    float _801 = fma(_795, _795, _799);
    float _803 = rsqrt(_801);
    float _805 = _803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _807 = _791 * _805;
    float _809 = _795 * _805;
    float _811 = _807 * _807;
    float _813 = _809 * _809;
    float _815 = _811 + _813;
    float _817 = sqrt(_815);
    bool _819 = _817 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _821 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _823 = _817 + _821;
    float _825 = _803;
    float _827 = _815;
    float _829 = _823;
    float _831 = _787;
    float _833 = _807;
    if (_819)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _825 = _835;
    }
    float _837 = _825;
    if (_819)
    {
        float _839 = rsqrt(_815);
        _827 = _839;
    }
    float _841 = _827;
    if (_819)
    {
        float _843 = _823 * _837;
        _829 = _843;
    }
    float _845 = _829;
    if (_819)
    {
        float _847 = _845 * 0.15915493667125701904296875;
        _715 = _847;
    }
    float _849 = _715;
    float _851 = _837;
    if (_819)
    {
        float _853 = _849 * 6.283185482025146484375;
        float _855 = sin(_853);
        _851 = _855;
    }
    float _857 = _851;
    float _859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _861 = precise::max(0.0, _859);
    float _863 = _795;
    float _865 = _861;
    if (_819)
    {
        float _867 = _849 * 6.283185482025146484375;
        float _869 = cos(_867);
        _863 = _869;
    }
    float _871 = _863;
    float _873 = -_805;
    float _875 = -_861;
    float _877 = fma(_787, _873, _875);
    float _879 = _877;
    if (_819)
    {
        float _881 = _877 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _865 = _881;
    }
    float _883 = _865;
    float _885 = sqrt(_801);
    float _887 = _857;
    float _889 = _883;
    if (_819)
    {
        float _891 = fma(_857, _883, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _887 = _891;
    }
    float _893 = _887;
    float _895 = _893;
    if (_819)
    {
        float _897 = _871 + (-1.0);
        _889 = _897;
    }
    float _899 = _889;
    float _901 = _899;
    if (_819)
    {
        float _903 = _841 * _893;
        _503 = _903;
    }
    float _905 = _503;
    if (!_819)
    {
        _895 = _809;
    }
    float _907 = _895;
    float _909 = _907;
    if (_819)
    {
        float _911 = _899 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _831 = _911;
    }
    float _913 = _831;
    float _915 = _913;
    if (_819)
    {
        float _917 = _807 * _905;
        _833 = _917;
    }
    float _919 = _833;
    if (!_819)
    {
        _901 = _811;
    }
    float _921 = _901;
    float _923 = _921;
    if (_819)
    {
        float _925 = _809 * _905;
        _909 = _925;
    }
    float _927 = _909;
    if (_819)
    {
        float _929 = fma(_877, _871, _913);
        _879 = _929;
    }
    float _931 = _879;
    if (_819)
    {
        float _933 = _919 * _919;
        _923 = _933;
    }
    float _935 = _923;
    if (!_819)
    {
        _915 = _813;
    }
    float _937 = _915;
    float _939 = _937;
    if (_819)
    {
        float _941 = _927 * _927;
        _939 = _941;
    }
    float _943 = _939;
    float _945 = fma(_931, _931, _935);
    float _947 = _775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _949 = _945 + _943;
    float _951 = _775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _953 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _955 = fma(_885, (*spvDescriptorSet0.vp_c15)._m0[23].w, _953);
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = _775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _961 = rsqrt(_949);
    float _963 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _951);
    float _965 = _775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _967 = -_957;
    float _969 = _967 + 1.0;
    float _971 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _959);
    float _973 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[2].z, _963);
    float _975 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _965);
    float _977 = fma(_779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _947);
    float _979 = abs(_969);
    float _981 = log2(_979);
    float _983 = _973 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _985 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[1].z, _975);
    float _987 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[0].z, _971);
    float _989 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _991 = _983 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _993 = _985 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = fma(_783, (*spvDescriptorSet0.vp_c8)._m0[3].z, _977);
    float _997 = _961 * _919;
    float _999 = _987 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1001 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1003 = _961 * _931;
    float _1005 = _997 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1007 = _961 * _927;
    float _1009 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1001);
    float _1011 = _995 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1013 = -_1005;
    float _1015 = fma(_1003, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1013);
    float _1017 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1019 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1009);
    float _1021 = -_991;
    float _1023 = fma(_1021, _989, 1.0);
    float _1025 = -_1007;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1015);
    float _1029 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1031 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1019);
    float _1033 = exp2(_1017);
    float _1035 = fma(_1027, -0.5, 0.5);
    float _1037 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1039 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1029);
    float _1041 = fma(_1027, 0.5, 0.5);
    float _1043 = _1003 + 1.0;
    float _1045 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1037);
    float _1047 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1039);
    float _1049 = log2(_1023);
    float _1051 = fma(_1041, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1053 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1045);
    float _1055 = fma(_1041, _1051, -0.212114393711090087890625);
    float _1057 = 1.0 / _1031;
    float _1059 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1047);
    float _1061 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1053);
    float _1063 = -_1003;
    float _1065 = fma(_1033, _1043, _1063);
    float _1067 = fma(_1041, _1055, 1.570728778839111328125);
    float _1069 = fma(_1065, 0.5, 0.5);
    float _1071 = sqrt(_1035);
    float _1073 = _1049 * 0.693147182464599609375;
    float _1075 = _1073 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1077 = _1059 * _1057;
    float _1079 = _1061 * _1057;
    float _1081 = fma(_1077, 0.5, 0.5);
    float _1083 = fma(_1079, -0.5, 0.5);
    float _1085 = _1071 * 0.636619746685028076171875;
    float3 _2978 = float3(_1081, _1083, _1075);
    float _1087 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2978, float3(0.0), isnan(_2978)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2978, float3(0.0), isnan(_2978)), level(0.0)).x;
    float3 _2989 = float3(_1081, _1083, _1075);
    float4 _1090 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2989, float3(0.0), isnan(_2989)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2989, float3(0.0), isnan(_2989)), level(0.0)).xyzw;
    float _1092 = _1090.x;
    float _1094 = _1090.y;
    float _1096 = _1090.z;
    float _1098 = _1090.w;
    float _1100 = -_1067;
    float _1102 = fma(_1085, _1100, 1.0);
    float2 _3011 = float2(_1102, _1069);
    float3 _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3011, float2(0.0), isnan(_3011)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3011, float2(0.0), isnan(_3011)), level(0.0)).xyz;
    float _1108 = _1106.x;
    float _1110 = _1106.y;
    float _1112 = _1106.z;
    float _1114 = _981 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1116 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1118 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1116);
    float _1120 = exp2(_1114);
    float _1122 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1118);
    float _1124 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1122);
    float _1126 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1128 = _1124 + _1031;
    out.gl_Position.x = _1059;
    out.gl_Position.y = _1061;
    out.gl_Position.z = _1124;
    out.gl_Position.w = _1031;
    float _1130 = _1128 * 0.5;
    float _1132 = -_1120;
    float _1134 = _1132 + 1.0;
    out.m_45.x = _1126;
    float _1136 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1130;
    out.m_62.w = _1031;
    float _1138 = _1136 * _1087;
    float _1140 = -_1136;
    float _1142 = _1140 + 1.0;
    float _1144 = _1098 * _1138;
    float _1146 = _1112 * _1138;
    float _1148 = fma(_1108, _1144, _1092);
    float _1150 = fma(_1110, _1144, _1094);
    float _1152 = _1098 * _1142;
    float _1154 = fma(_1098, _1146, _1096);
    out.m_64.x = _1148;
    out.m_64.y = _1150;
    out.m_64.z = _1154;
    out.m_64.w = _1152;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

