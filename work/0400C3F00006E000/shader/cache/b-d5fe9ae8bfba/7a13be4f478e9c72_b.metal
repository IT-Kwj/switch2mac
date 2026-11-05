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
    float4 m_58 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _997 = false;
    bool _823 = false;
    bool _571 = false;
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
        float _2790 = as_type<float>(_99);
        out.gl_Position.z = _2790;
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
        float _2858 = as_type<float>(_135);
        out.gl_Position.z = _2858;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _159 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _157);
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _165 = _159;
    float _167 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _169 = _139;
    if (!_155)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _165 = _173;
    }
    float _175 = _165;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_155;
    float _205 = _181;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _139);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
        _167 = _219;
    }
    float _237 = _205;
    float _239 = _167;
    bool _241 = !_155;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _139 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _169 = _263;
    }
    float _265 = _169;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _267;
    float _275 = _271;
    if (!_155)
    {
        float _277 = _117 * _117;
        float _279 = _277 * 0.5;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = fma(_265, _141, _267);
    float _285 = fma(_265, _143, _269);
    float _287 = fma(_265, _145, _271);
    if (!_155)
    {
        float _289 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _289;
    }
    float _291 = _273;
    bool _293 = !_155;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _117 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _117);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _275 = _313;
    }
    float _327 = _295;
    float _329 = _275;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_155)
    {
        _333 = _117;
    }
    float _335 = _333;
    bool _337 = !_155;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _143, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = sqrt(_201);
    float _371 = fma(_361, _141, _363);
    float _373 = -_365;
    float _375 = _285 + _373;
    float _377 = fma(_361, _145, _367);
    float _379 = -_371;
    float _381 = _283 + _379;
    float _383 = _375 * _375;
    float _385 = -_377;
    float _387 = _287 + _385;
    float _389 = sqrt(_163);
    float _391 = fma(_381, _381, _383);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _397 = fma(_387, _387, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _395);
    float _405 = sqrt(_397);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _401);
    float _413 = in.m_52.w;
    float _415 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _417 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].x, _411);
    float _421 = sqrt(_407);
    float _423 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].y, _403);
    float _425 = in.m_42.x;
    float _427 = in.m_42.y;
    float _429 = in.m_42.z;
    float _431 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _415);
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].z, _417);
    float _435 = _369 * _423;
    float _437 = _389 * _419;
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].w, _431);
    bool _441 = _405 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_405);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _421 * _433;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _467 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _469 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _471 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _465);
    float _473 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _467);
    float _475 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _469);
    float _477 = fma(_283, _413, _425);
    float _479 = fma(_285, _413, _427);
    float _481 = _439;
    float _483 = _471;
    float _485 = _475;
    if (_449)
    {
        _481 = _471;
    }
    float _487 = _481;
    float _489 = fma(_287, _413, _429);
    float _491 = _487;
    if (_449)
    {
        _483 = _473;
    }
    float _493 = _483;
    float _495 = _493;
    if (!_449)
    {
        bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _499 = !_497;
        if (!_499)
        {
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _511);
            float _519 = _369 * _513;
            float _521 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _523 = _389 * _515;
            float _525 = _421 * _517;
            float _527 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _521);
            float _531 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _533 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _535 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].x, _527);
            float _537 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
            float _543 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].z, _535);
            float _545 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].z, _539);
            float _547 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].z, _541);
            float _549 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].w, _543);
            float _551 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].w, _545);
            float _553 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].w, _547);
            float _555 = _549 * _549;
            float _557 = fma(_551, _551, _555);
            float _559 = fma(_553, _553, _557);
            float _561 = rsqrt(_559);
            float _563 = _561 * 9.9999999747524270787835121154785e-07;
            float _565 = _551 * _563;
            float _567 = _549 * _563;
            float _569 = _553 * _563;
            _495 = _567;
            _491 = _565;
            _485 = _569;
            _571 = true;
        }
        else
        {
            float _573 = _143 * _143;
            float _575 = fma(_141, _141, _573);
            float _577 = fma(_145, _145, _575);
            float _579 = sqrt(_577);
            bool _581 = _579 >= 9.9999999747524270787835121154785e-07;
            bool _583 = isnan(_579);
            bool _585 = _581 || _583;
            bool _587 = isnan(9.9999999747524270787835121154785e-07);
            bool _589 = _585 || _587;
            if (!_589)
            {
                float _591 = _427 * _427;
                float _593 = fma(_425, _425, _591);
                float _595 = fma(_429, _429, _593);
                float _597 = sqrt(_595);
                bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
                bool _601 = isnan(_597);
                bool _603 = _599 || _601;
                bool _605 = isnan(9.9999999747524270787835121154785e-07);
                bool _607 = _603 || _605;
                if (!_607)
                {
                    float _609 = _369 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _611 = _389 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _613 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _615 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _617 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
                    float _623 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _617);
                    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
                    float _629 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
                    float _631 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _631);
                    float _639 = _633 * _633;
                    float _641 = fma(_635, _635, _639);
                    float _643 = fma(_637, _637, _641);
                    float _645 = rsqrt(_643);
                    float _647 = _645 * 9.9999999747524270787835121154785e-07;
                    float _649 = _635 * _647;
                    float _651 = _633 * _647;
                    float _653 = _637 * _647;
                    _495 = _651;
                    _491 = _649;
                    _485 = _653;
                    _571 = true;
                }
                else
                {
                    float _655 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _657 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _659 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _661 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _663 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].y, _655);
                    float _665 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].x, _657);
                    float _667 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].z, _659);
                    float _669 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].w, _661);
                    float _671 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
                    float _673 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].x, _665);
                    float _675 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].z, _667);
                    float _677 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].w, _669);
                    float _679 = _369 * _671;
                    float _681 = _389 * _673;
                    float _683 = _421 * _675;
                    float _685 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _685);
                    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
                    float _695 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
                    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _691);
                    float _699 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
                    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
                    float _703 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].w, _697);
                    float _705 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].w, _699);
                    float _707 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].w, _701);
                    float _709 = _703 * _703;
                    float _711 = fma(_705, _705, _709);
                    float _713 = fma(_707, _707, _711);
                    float _715 = rsqrt(_713);
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    float _719 = _705 * _717;
                    float _721 = _703 * _717;
                    float _723 = _707 * _717;
                    _495 = _721;
                    _491 = _719;
                    _485 = _723;
                    _571 = true;
                }
            }
            else
            {
                float _725 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _727 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _729 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _731 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _733 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _725);
                float _735 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _727);
                float _737 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _729);
                float _739 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _735);
                float _745 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _737);
                float _747 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _739);
                float _749 = _369 * _741;
                float _751 = _389 * _743;
                float _753 = _421 * _745;
                float _755 = _749 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _757 = _749 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _759 = _749 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _761 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].x, _755);
                float _763 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _757);
                float _765 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
                float _769 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _763);
                float _771 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
                float _773 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].w, _767);
                float _775 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].w, _769);
                float _777 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].w, _771);
                float _779 = _773 * _773;
                float _781 = fma(_775, _775, _779);
                float _783 = fma(_777, _777, _781);
                float _785 = rsqrt(_783);
                float _787 = _785 * 9.9999999747524270787835121154785e-07;
                float _789 = _775 * _787;
                float _791 = _773 * _787;
                float _793 = _777 * _787;
                _495 = _791;
                _491 = _789;
                _485 = _793;
            }
        }
    }
    _571 = false;
    float _795 = _495;
    float _797 = _491;
    float _799 = _485;
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _803 = !_801;
    float _821;
    if (!_803)
    {
        float _805 = in.m_54.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_83);
        float _827 = 1.0 / _825;
        float _829 = _117 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _841 = 1.0 / _835;
    bool _843 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _845 = isnan(_831);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _861 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _863 = isnan(_831);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _875 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = 1.0 / _839;
    float _879 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _885 = _831 + _883;
    float _887 = -_853;
    float _889 = _887 + 1.0;
    out.m_56.x = _875;
    out.m_56.y = _879;
    out.m_56.z = _881;
    out.m_56.w = _873;
    float _891 = _885 * _841;
    bool _893 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _895 = isnan(_831);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = _871 * _889;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _909 = _831 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _911;
    float _915 = -_871;
    float _917 = _915 + 1.0;
    float _919 = in.m_52.x;
    float _921 = in.m_52.y;
    bool _923 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _925 = fma(_913, _891, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _927 = _903 * _917;
    float _929 = _909 * _877;
    float _931 = -_903;
    float _933 = _931 + 1.0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _943 = _925 * _927;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _949 = fma(_937, _891, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _951 = fma(_941, _929, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _953 = fma(_947, _929, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _955 = _949 * _927;
    float _957 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[143].x, _943);
    float _959 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[143].y, _955);
    float _961 = fma(_951, _905, _957);
    float _963 = fma(_953, _905, _959);
    float _965 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[145].x, _961);
    float _967 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[145].y, _963);
    float _969 = _965 * _919;
    float _971 = _967 * _921;
    bool _973 = !_923;
    float _993;
    float _995;
    if (!_973)
    {
        float _975 = in.m_54.x;
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _979 = float(_83);
        float _981 = _975 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _985 = _983 * _977;
        float _987 = floor(_985);
        float _989 = -_987;
        float _991 = _985 + _989;
        _993 = _979;
        _995 = _991;
        _997 = true;
    }
    else
    {
        float _999 = float(_83);
        float _1001 = 1.0 / _999;
        float _1003 = _117 * _1001;
        _993 = _999;
        _995 = _1003;
    }
    _997 = false;
    float _1005 = _993;
    float _1007 = _995;
    float _1009 = _795 * _795;
    float _1011 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1013 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1015 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1017 = fma(_797, _797, _1009);
    float _1019 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1021 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1013);
    float _1023 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1015);
    float _1025 = fma(_799, _799, _1017);
    float _1027 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1019);
    float _1029 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1031 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1021);
    float _1033 = rsqrt(_1025);
    float _1035 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1023);
    float _1037 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1027);
    bool _1039 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    float _1049 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1051 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1053 = _421 * _1049;
    float _1055 = _1033 * _799;
    float _1057 = _1033 * _797;
    float _1059 = _1033 * _795;
    float _1061 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1065 = _1055 * _1063;
    float _1067 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1011);
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1071 = _1059 * _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1075 = _1057 * _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1079 = -_1065;
    float _1081 = fma(_1057, _1077, _1079);
    float _1083 = _1061 * _1029;
    float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1087 = -_1071;
    float _1089 = fma(_1055, _1085, _1087);
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1093 = -_1075;
    float _1095 = fma(_1059, _1091, _1093);
    float _1097 = _1081 * _1081;
    float _1099 = _1031 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1101 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1067);
    float _1103 = _971 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1105 = fma(_1089, _1089, _1097);
    float _1107 = _369 * _1099;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1111 = fma(_1095, _1095, _1105);
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1117 = _389 * _1109;
    float _1119 = _1103 * _1113;
    float _1121 = rsqrt(_1111);
    float _1123 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1125 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1127 = _1119 * _1055;
    float _1129 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1115);
    float _1131 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1123);
    float _1133 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1125);
    float _1135 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1137 = _1119 * _1057;
    float _1139 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1141 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1143 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1129);
    float _1145 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1139);
    float _1147 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1141);
    float _1149 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1143);
    float _1151 = _1081 * _1121;
    float _1153 = _1089 * _1121;
    float _1155 = _1095 * _1121;
    float _1157 = _1147 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1159 = _1057 * _1151;
    float _1161 = fma(_1083, _1153, _1137);
    float _1163 = fma(_1083, _1155, _1127);
    float _1165 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1167 = -_1159;
    float _1169 = fma(_1059, _1153, _1167);
    float _1171 = _1059 * _1155;
    float _1173 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1175 = _1119 * _1059;
    float _1177 = fma(_1135, _1169, _1163);
    float _1179 = -_1171;
    float _1181 = fma(_1055, _1151, _1179);
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1185 = _1055 * _1153;
    float _1187 = _1157 + _1177;
    float _1189 = fma(_1135, _1181, _1161);
    float _1191 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1183);
    float _1193 = fma(_1083, _1151, _1175);
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1197 = _1187 + _1195;
    float _1199 = _1165 + _1189;
    float _1201 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    float _1203 = -_1185;
    float _1205 = fma(_1057, _1155, _1203);
    float _1207 = _1197 * _1197;
    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1211 = _1199 + _1209;
    float _1213 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1215 = fma(_1135, _1205, _1193);
    float _1217 = _1155;
    float _1219 = _1083;
    float _1221 = _1119;
    float _1223 = _1199;
    float _1225 = _1205;
    float _1227 = _1197;
    if (_1047)
    {
        _1217 = 1.0;
    }
    float _1229 = _1217;
    float _1231 = fma(_1211, _1211, _1207);
    float _1233 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1235 = _1173 + _1215;
    float _1237 = sqrt(_1231);
    float _1239 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1233);
    float _1241 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1239);
    float _1243 = 1.0 / _1213;
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1247 = _1245 + _1213;
    bool _1249 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1261 = _1259 != 0;
    float _1263 = _1247 * _1243;
    float _1265 = _1263 * 0.5;
    bool _1267 = !_1257;
    int _1269 = _1267 ? 0 : 1;
    bool _1271 = !_1253;
    int _1273 = _1271 ? 0 : 1;
    bool _1275 = !_1261;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = _1247;
    float _1281 = _1235;
    float _1283 = _1229;
    if (!_1249)
    {
        _1279 = _1199;
    }
    float _1285 = _1279;
    float _1287 = _1285;
    if (!_1249)
    {
        _1219 = _1187;
    }
    float _1289 = _1219;
    float _1291 = _1289;
    if (!_1249)
    {
        _1221 = _1235;
    }
    float _1293 = _1221;
    bool _1295 = !_1249;
    float _1297 = _1293;
    if (!_1295)
    {
        float _1299 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1303 = _1237 + _1301;
        float _1305 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1307 = rsqrt(_1231);
        float _1309 = _1303 * _1299;
        float _1311 = _1309 * 0.15915493667125701904296875;
        float _1313 = _1311 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = _1311 * 6.283185482025146484375;
        float _1319 = sin(_1317);
        float _1321 = _1315 + (-1.0);
        float _1323 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = fma(_1319, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1327 = fma(_1235, _1315, _1323);
        float _1329 = _1307 * _1325;
        float _1331 = fma(_1211, _1329, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1333 = fma(_1197, _1329, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1297 = _1327;
        _1287 = _1331;
        _1291 = _1333;
    }
    float _1335 = _1297;
    float _1337 = _1287;
    float _1339 = _1291;
    if (!_1047)
    {
        float _1341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = _1341 * 0.15915493667125701904296875;
        float _1345 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1349 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1347);
        float _1351 = _1343 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        float _1355 = _1345 * 0.15915493667125701904296875;
        float _1357 = _1343 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1353;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1349;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1373;
        float _1383 = 1.0 / _1379;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1387 = _1375 * _1385;
        float _1389 = _1371 * _1381;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = fma(_1389, _1387, _1391);
        float _1395 = _1393 * _1383;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        _1281 = _1383;
        _1223 = _1355;
        _1283 = _1397;
    }
    float _1399 = _1281;
    float _1401 = _1223;
    float _1403 = _1283;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1407 = _1335 + _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1411 = _1337 + _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1415 = _1339 + _1413;
    float _1417 = _1407 * _1407;
    float _1419 = fma(_1411, _1411, _1417);
    float _1421 = fma(_1415, _1415, _1419);
    float _1423 = rsqrt(_1421);
    float _1425 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1427 = _1411 * _1425;
    float _1429 = _1415 * _1425;
    float _1431 = _1427 * _1427;
    float _1433 = _1429 * _1429;
    float _1435 = _1431 + _1433;
    float _1437 = sqrt(_1435);
    bool _1439 = _1437 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = _1437 + _1441;
    float _1445 = _1423;
    float _1447 = _1435;
    float _1449 = _1443;
    float _1451 = _1399;
    float _1453 = _1407;
    float _1455 = _1401;
    if (_1439)
    {
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1445 = _1457;
    }
    float _1459 = _1445;
    if (_1439)
    {
        float _1461 = rsqrt(_1435);
        _1447 = _1461;
    }
    float _1463 = _1447;
    if (_1439)
    {
        float _1465 = _1443 * _1459;
        _1449 = _1465;
    }
    float _1467 = _1449;
    if (_1439)
    {
        float _1469 = _1467 * 0.15915493667125701904296875;
        _1451 = _1469;
    }
    float _1471 = _1451;
    float _1473 = _1415;
    if (_1439)
    {
        float _1475 = _1471 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1483 = precise::max(0.0, _1481);
    float _1485 = _1459;
    float _1487 = _1483;
    if (_1439)
    {
        float _1489 = _1471 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        _1485 = _1491;
    }
    float _1493 = _1485;
    float _1495 = -_1425;
    float _1497 = -_1483;
    float _1499 = fma(_1407, _1495, _1497);
    if (_1439)
    {
        float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1501;
    }
    float _1503 = _1453;
    float _1505 = _1479;
    float _1507 = _1503;
    if (_1439)
    {
        float _1509 = fma(_1479, _1503, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1455 = _1509;
    }
    float _1511 = _1455;
    float _1513 = _1511;
    if (!_1439)
    {
        _1505 = _1427;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (!_1439)
    {
        _1507 = _1499;
    }
    float _1519 = _1507;
    float _1521 = _1519;
    float _1523 = _1493;
    if (_1439)
    {
        float _1525 = _1493 + (-1.0);
        _1487 = _1525;
    }
    float _1527 = _1487;
    float _1529 = _1527;
    if (_1439)
    {
        float _1531 = _1463 * _1511;
        _1225 = _1531;
    }
    float _1533 = _1225;
    if (!_1439)
    {
        _1513 = _1431;
    }
    float _1535 = _1513;
    float _1537 = sqrt(_1421);
    float _1539 = _1535;
    if (_1439)
    {
        float _1541 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1541;
    }
    float _1543 = _1227;
    if (_1439)
    {
        float _1545 = _1427 * _1533;
        _1517 = _1545;
    }
    float _1547 = _1517;
    if (!_1439)
    {
        _1529 = _1429;
    }
    float _1549 = _1529;
    float _1551 = _1549;
    if (_1439)
    {
        float _1553 = _1429 * _1533;
        _1551 = _1553;
    }
    float _1555 = _1551;
    if (_1439)
    {
        float _1557 = fma(_1499, _1493, _1543);
        _1521 = _1557;
    }
    float _1559 = _1521;
    if (_1439)
    {
        float _1561 = _1547 * _1547;
        _1539 = _1561;
    }
    float _1563 = _1539;
    if (!_1439)
    {
        _1523 = _1433;
    }
    float _1565 = _1523;
    float _1567 = _1565;
    if (_1439)
    {
        float _1569 = _1555 * _1555;
        _1567 = _1569;
    }
    float _1571 = _1567;
    float _1573 = fma(_1559, _1559, _1563);
    float _1575 = _1573 + _1571;
    float _1577 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1581 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1579);
    float _1583 = precise::clamp(_1581, 0.0, 1.0);
    float _1585 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1587 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1589 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1591 = rsqrt(_1575);
    float _1593 = -_1583;
    float _1595 = _1593 + 1.0;
    float _1597 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1599 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1589);
    float _1601 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1585);
    float _1603 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1605 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1607 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1597);
    float _1609 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1611 = abs(_1595);
    float _1613 = log2(_1611);
    float _1615 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1603);
    float _1617 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1607);
    float _1619 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1621 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1623 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1615);
    float _1625 = _1591 * _1547;
    float _1627 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1629 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1631 = _1591 * _1559;
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1635 = _1591 * _1555;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1629);
    float _1639 = -_1621;
    float _1641 = fma(_1639, _1587, 1.0);
    float _1643 = -_1633;
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1643);
    float _1647 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1649 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1637);
    float _1651 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1653 = -_1635;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1645);
    float _1657 = log2(_1641);
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1649);
    float _1661 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1663 = fma(_1655, -0.5, 0.5);
    float _1665 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1667 = fma(_1655, 0.5, 0.5);
    float _1669 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1661);
    float _1671 = _1631 + 1.0;
    float _1673 = exp2(_1651);
    float _1675 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1665);
    float _1677 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1669);
    float _1679 = fma(_1667, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1681 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1675);
    float _1683 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1677);
    float _1685 = fma(_1667, _1679, -0.212114393711090087890625);
    float _1687 = 1.0 / _1659;
    float _1689 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1681);
    float _1691 = _1657 * 0.693147182464599609375;
    float _1693 = fma(_1667, _1685, 1.570728778839111328125);
    float _1695 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1697 = sqrt(_1663);
    float _1699 = -_1631;
    float _1701 = fma(_1673, _1671, _1699);
    float _1703 = _1683 * _1687;
    float _1705 = _1689 * _1687;
    float _1707 = fma(_1703, 0.5, 0.5);
    float _1709 = fma(_1705, -0.5, 0.5);
    float _1711 = _1697 * 0.636619746685028076171875;
    float _1713 = fma(_1701, 0.5, 0.5);
    float3 _5582 = float3(_1707, _1709, _1695);
    float _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5582, float3(0.0), isnan(_5582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5582, float3(0.0), isnan(_5582)), level(0.0)).x;
    float3 _5593 = float3(_1707, _1709, _1695);
    float4 _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5593, float3(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5593, float3(0.0), isnan(_5593)), level(0.0)).xyzw;
    float _1720 = _1718.x;
    float _1722 = _1718.y;
    float _1724 = _1718.z;
    float _1726 = _1718.w;
    float _1728 = -_1693;
    float _1730 = fma(_1711, _1728, 1.0);
    float2 _5615 = float2(_1730, _1713);
    float3 _1734 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _1736 = _1734.x;
    float _1738 = _1734.y;
    float _1740 = _1734.z;
    float _1742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1744 = int(_1742);
    float _1746 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1748 = int(_1746);
    float _1750 = float(_1744);
    float _1752 = 1.0 / _1005;
    float _1754 = float(uint(_1748));
    float _1756 = 1.0 / _1750;
    int _1758 = ~_1748;
    int _1760 = _1758 + 1;
    float _1762 = 1.0 / _1754;
    float _1764 = _117 * _1756;
    float _1766 = trunc(_1764);
    int _1768 = int(_1766);
    int _1770 = as_type<int>(_1762) + (-2);
    float _1772 = float(uint(_1768));
    float _1774 = as_type<float>(_1770) * _1772;
    int _1776 = ~_1748;
    int _1778 = _1776 + 1;
    float _1780 = trunc(_1774);
    float _1782 = precise::max(_1780, 0.0);
    uint _1785 = uint(_1782);
    float _1787 = in.m_54.x;
    float _1789 = in.m_54.y;
    float _1791 = in.m_54.z;
    float _1793 = in.m_54.w;
    int _1795 = _1778 * int(_1785);
    int _1797 = _1795 + _1768;
    float _1799 = float(uint(_1797));
    bool _1801 = _1793 > 0.5;
    float _1803 = as_type<float>(_1770) * _1799;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1807 = _1805 != 0;
    float _1809 = trunc(_1803);
    float _1811 = precise::max(_1809, 0.0);
    uint _1813 = uint(_1811);
    bool _1815 = !_1807;
    float _1817 = _1815 ? 7.345489978790283203125 : 1.0;
    float _1819 = _1817 * _1787;
    int _1821 = _1748 + (-1);
    float _1823 = floor(_1819);
    int _1825 = int(_1785) + int(_1813);
    float _1827 = float(_1748);
    float _1829 = float(_1768);
    int _1831 = _1760 * _1825;
    int _1833 = _1831 + _1768;
    bool _1835 = _1829 >= _1827;
    bool _1837 = isnan(_1829);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1827);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    bool _1847 = uint(_1833) >= uint(_1748);
    float _1849 = -_1823;
    float _1851 = _1819 + _1849;
    float _1853 = trunc(_1845);
    int _1855 = int(_1853);
    bool _1857 = !_1847;
    int _1859 = _1857 ? 0 : (-1);
    bool _1861 = _1748 == 0;
    int _1863 = ~_1825;
    int _1865 = _1863 + _1859;
    int _1867 = _1865 + 1;
    float _1869 = _1851 * _1827;
    float _1871 = _117 * _1827;
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1875 = _1873 != 0;
    int _1877 = _1748 * _1867;
    int _1879 = _1877 + _1768;
    float _1881 = _1871 * _1752;
    float _1883 = trunc(_1869);
    int _1885 = int(_1883);
    bool _1887 = !_1861;
    int _1889 = _1887 ? _1879 : (-1);
    int _1891 = ~_1855;
    int _1893 = _1891 + 1;
    int _1895 = _1893 + 1;
    bool _1897 = !_1875;
    int _1899 = _1897 ? 0 : 1;
    float _1901 = trunc(_1881);
    int _1903 = int(_1901);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1907 = _1905 != 0;
    int _1909 = _1889 * _1895;
    int _1911 = abs(_1269);
    int _1913 = abs(_1899);
    int _1915 = _1855 * _1821;
    int _1917 = _1915 + _1909;
    int _1919 = abs(_1273);
    int _1921 = _1885 * _1913;
    int _1923 = _1921 + _1768;
    bool _1925 = !_1907;
    int _1927 = _1925 ? 0 : 1;
    int _1929 = abs(_1277);
    int _1931 = _1917 * _1911;
    int _1933 = abs(_1927);
    int _1935 = _1903 * _1919;
    int _1937 = _1935 + _1931;
    int _1939 = ~_1748;
    int _1941 = _1939 + 1;
    int _1943 = _1923 * _1929;
    int _1945 = _1943 + _1937;
    int _1947 = ~_1748;
    int _1949 = _1947 + 1;
    int _1951 = ~_1748;
    int _1953 = _1951 + 1;
    int _1955 = _1885 * _1933;
    int _1957 = _1955 + _1945;
    float _1959 = float(uint(_1957));
    float _1961 = as_type<float>(_1770) * _1959;
    float _1963 = trunc(_1961);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = _1941 * int(_1967);
    int _1971 = _1969 + _1957;
    float _1973 = float(uint(_1971));
    float _1975 = as_type<float>(_1770) * _1973;
    float _1977 = trunc(_1975);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    int _1983 = ~_1748;
    int _1985 = _1983 + 1;
    int _1987 = int(_1967) + int(_1981);
    float _1989 = float(uint(_1923));
    int _1991 = _1949 * _1987;
    int _1993 = _1991 + _1957;
    float _1995 = as_type<float>(_1770) * _1989;
    bool _1997 = uint(_1993) >= uint(_1748);
    float _1999 = trunc(_1995);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    bool _2005 = !_1997;
    int _2007 = _2005 ? 0 : (-1);
    int _2009 = ~_1987;
    int _2011 = _2009 + _2007;
    int _2013 = _2011 + 1;
    int _2015 = _1748 * _2013;
    int _2017 = _2015 + _1957;
    int _2019 = _1985 * int(_2003);
    int _2021 = _2019 + _1923;
    bool _2023 = !_1861;
    int _2025 = _2023 ? _2017 : (-1);
    int _2027 = _2025 >> 31;
    float _2029 = float(uint(_2021));
    int _2031 = _2027 & 3;
    int _2033 = _2025 & 3;
    bool _2035 = _2033 != 0;
    float _2037 = as_type<float>(_1770) * _2029;
    int _2039 = _2025 + _2031;
    bool _2041 = uint(_2033) > 1u;
    int _2043 = _2039 >> 2;
    float _2045 = trunc(_2037);
    float _2047 = precise::max(_2045, 0.0);
    uint _2049 = uint(_2047);
    int _2051 = _2025 & 3;
    bool _2053 = _2051 != 0;
    int _2055 = _2043 << 4;
    int _2057 = _2055 + 368;
    int _2059 = _2053 ? 0 : 1;
    uint _2061 = uint(int(uint(_2057) >> uint(2)));
    uint _2063 = uint(int(uint(int(_2061)) >> uint(2)));
    int _2065 = int(_2061) & 3;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[int(_2063)][_2065];
    int _2069 = int(_2061) + 1;
    uint _2071 = uint(int(uint(_2069) >> uint(2)));
    int _2073 = _2069 & 3;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[int(_2071)][_2073];
    bool _2077 = _2033 != 3;
    int _2079 = ~_2059;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    int _2085 = _2083;
    float _2087 = _1791;
    if (!_2041)
    {
        int _2089 = ~_2059;
        int _2091 = _2089 + 1;
        _2085 = _2091;
    }
    int _2093 = _2085;
    int _2095 = _2057 + 8;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    uint _2099 = uint(int(uint(int(_2097)) >> uint(2)));
    int _2101 = int(_2097) & 3;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[int(_2099)][_2101];
    int _2105 = int(_2097) + 1;
    uint _2107 = uint(int(uint(_2105) >> uint(2)));
    int _2109 = _2105 & 3;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[int(_2107)][_2109];
    int _2113 = int(_2003) + int(_2049);
    bool _2115 = uint(_2033) >= 2u;
    int _2117 = abs(_2093);
    int _2119 = _1953 * _2113;
    int _2121 = _2119 + _1923;
    int _2123 = _2115 ? 0 : 1;
    int _2125 = ~_2117;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    bool _2131 = _2033 != 3;
    bool _2133 = !_2035;
    int _2135 = _2133 ? 0 : 1;
    int _2137 = ~_2123;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    int _2143 = _2141;
    if (_2077)
    {
        int _2145 = ~_2123;
        int _2147 = _2145 + 1;
        _2143 = _2147;
    }
    int _2149 = _2143;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2153 = _2151 != 0;
    int _2155 = abs(_2135);
    float _2157 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2159 = int(_2157);
    int _2161 = abs(_2149);
    bool _2163 = !_2153;
    int _2165 = _2163 ? 0 : 1;
    bool _2167 = uint(_2121) >= uint(_1748);
    int _2169 = abs(_2165);
    int _2171 = ~_2161;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2179 = _2177 != 0;
    int _2181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2183 = _2181 != 0;
    float _2185 = float(uint(_2159));
    int _2187 = _2129 * as_type<int>(_2075);
    bool _2189 = !_2131;
    int _2191 = _2189 ? 0 : (-1);
    bool _2193 = _1789 > 0.5;
    int _2195 = abs(_2191);
    int _2197 = ~_2155;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    bool _2203 = !_2167;
    int _2205 = _2203 ? 0 : (-1);
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2209 = _2207 != 0;
    int _2211 = _2201 * as_type<int>(_2067);
    int _2213 = _2211 + _2187;
    int _2215 = ~_2195;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    int _2221 = _2175 * as_type<int>(_2103);
    int _2223 = _2221 + _2213;
    int _2225 = ~_2169;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    int _2231 = abs(_2159);
    int _2233 = _2219 * as_type<int>(_2111);
    int _2235 = _2233 + _2223;
    int _2237 = ~_2113;
    int _2239 = _2237 + _2205;
    int _2241 = _2239 + 1;
    float _2243 = 1.0 / _2185;
    int _2245 = _2235 * _2229;
    float _2247 = float(uint(_2231));
    int _2249 = _1748 * _2241;
    int _2251 = _2249 + _1923;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2255 = 1.0 / _2247;
    bool _2257 = !_1861;
    int _2259 = _2257 ? _2251 : (-1);
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2263 = _2261 != 0;
    float _2265 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2267 = _2259 * _2169;
    int _2269 = _2267 + _2245;
    float _2271 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2275 = as_type<int>(_2243) + (-2);
    float _2277 = -_2253;
    float _2279 = fma(_2265, 2.0, _2277);
    float _2281 = 1.0 / _2273;
    int _2283 = abs(_2269);
    float _2285 = -_117;
    float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2279);
    float _2289 = float(uint(_2269));
    int _2291 = as_type<int>(_2255) + (-2);
    float _2293 = float(uint(_2283));
    float _2295 = as_type<float>(_2275) * _2289;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2299 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2301 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2301;
    float _2305 = as_type<float>(_2291) * _2293;
    int _2307 = ~_2159;
    int _2309 = _2307 + 1;
    float _2311 = trunc(_2295);
    float _2313 = precise::max(_2311, 0.0);
    uint _2315 = uint(_2313);
    float _2317 = fma(_2299, -2.0, _2297);
    int _2319 = ~_2231;
    int _2321 = _2319 + 1;
    float _2323 = _2303 * _2281;
    float _2325 = -_199;
    int _2327 = _1801 ? as_type<int>(_2325) : as_type<int>(_199);
    float _2329 = -_199;
    int _2331 = _2193 ? as_type<int>(_2329) : as_type<int>(_199);
    float _2333 = trunc(_2305);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    bool _2339 = !_2179;
    float _2341 = _2339 ? _199 : as_type<float>(_2327);
    bool _2343 = !_2183;
    float _2345 = _2343 ? _199 : as_type<float>(_2331);
    bool _2347 = _1787 > 0.5;
    bool _2349 = _1791 > 0.5;
    int _2351 = _2309 * int(_2315);
    int _2353 = _2351 + _2269;
    float _2355 = -_193;
    int _2357 = _2349 ? as_type<int>(_2355) : as_type<int>(_193);
    float _2359 = float(uint(_2353));
    float _2361 = -_193;
    float _2363 = _2347 ? _2361 : _193;
    int _2365 = _2321 * int(_2337);
    int _2367 = _2365 + _2283;
    float _2369 = as_type<float>(_2275) * _2359;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2373 = !_2209;
    float _2375 = _2373 ? _193 : _2363;
    float _2377 = float(uint(_2367));
    float _2379 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2371);
    float _2381 = _2363;
    float _2383 = _2377;
    if (!_1807)
    {
        _2381 = _1789;
    }
    float _2385 = _2381;
    float _2387 = trunc(_2369);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = _2385;
    if (_1807)
    {
        _2393 = _1787;
    }
    float _2395 = _2393;
    float _2397 = as_type<float>(_2291) * _2377;
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2401 = _1007 + _2399;
    bool _2403 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2405 = isnan(_1007);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    bool _2415 = !_2263;
    float _2417 = _2415 ? _193 : as_type<float>(_2357);
    float _2419 = trunc(_2397);
    float _2421 = precise::max(_2419, 0.0);
    uint _2423 = uint(_2421);
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2427 = fma(_2323, _2401, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2429 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2431 = isnan(_1007);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = -_2413;
    float _2443 = _2441 + 1.0;
    float _2445 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2425);
    if (!_1807)
    {
        _2383 = _1791;
    }
    float _2447 = _2383;
    float _2449 = _2439 * _2443;
    float _2451 = _2447;
    if (_1807)
    {
        _2451 = _1789;
    }
    float _2453 = _2451;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1807)
    {
        _2087 = _1789;
    }
    float _2457 = _2087;
    float _2459 = _2427 * _2449;
    int _2461 = int(_2315) + int(_2391);
    float _2463 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2455);
    float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2467 = int(_2337) + int(_2423);
    float _2469 = -_2439;
    float _2471 = _2469 + 1.0;
    int _2473 = ~_2159;
    int _2475 = _2473 + 1;
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2459);
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2481 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2445);
    int _2483 = ~_2231;
    int _2485 = _2483 + 1;
    float _2487 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2479);
    float _2489 = _2457 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2491 = _2475 * _2461;
    int _2493 = _2491 + _2269;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2497 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2501 = _2485 * _2467;
    int _2503 = _2501 + _2283;
    bool _2505 = uint(_2493) >= uint(_2159);
    float _2507 = -_2495;
    float _2509 = fma(_2497, 2.0, _2507);
    float _2511 = fma(_2489, -2.0, _2499);
    float _2513 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2379);
    bool _2515 = !_2505;
    int _2517 = _2515 ? 0 : (-1);
    float _2519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2521 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2523 = _2417 + 0.5;
    float _2525 = -_117;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2509);
    float _2529 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2317);
    float _2531 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2487);
    float _2533 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2463);
    float _2535 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2511);
    int _2537 = ~_2461;
    int _2539 = _2537 + _2517;
    int _2541 = _2539 + 1;
    float _2543 = fma(_2521, _2523, _2527);
    bool _2545 = uint(_2503) >= uint(_2231);
    float _2547 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2477);
    int _2549 = _2269 ^ _2159;
    int _2551 = _2159 * _2541;
    int _2553 = _2551 + _2269;
    bool _2555 = !_2545;
    int _2557 = _2555 ? 0 : (-1);
    float _2559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2561 = uint(int(uint(_2549) >> uint(31)));
    float _2563 = _2519 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2565 = _2159 == 0;
    bool _2567 = _2159 == 0;
    float _2569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2571 = ~_2557;
    int _2573 = _2467 + _2571;
    int _2575 = _2573 + 1;
    int _2577 = ~int(_2561);
    int _2579 = _2577 + 1;
    float _2581 = _2341 + (-0.5);
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2585 = _2575 ^ _2579;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2589 = -_2563;
    float _2591 = -_2535;
    float _2593 = fma(_2589, _2581, _2591);
    int _2595 = ~_2579;
    int _2597 = _2595 + _2585;
    int _2599 = _2597 + 1;
    float _2601 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2603 = !_2565;
    int _2605 = _2603 ? _2553 : (-1);
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2609 = !_2567;
    int _2611 = _2609 ? _2599 : (-1);
    float _2613 = _2587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2615 = float(_2605);
    float _2617 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2619 = float(_2611);
    float _2621 = _2583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2623 = _2607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2625 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2627 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2601);
    float _2629 = -_2529;
    float _2631 = fma(_2617, _2619, _2629);
    float _2633 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_58.x = _2621;
    out.m_58.y = _2623;
    out.m_58.z = _2613;
    out.m_58.w = _2625;
    float _2637 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2627);
    float _2639 = _2375 + 0.5;
    float _2641 = fma(_2635, _2615, _2287);
    float _2643 = exp2(_2633);
    float _2645 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2637);
    bool _2647 = _1403 > 0.0;
    bool _2649 = isnan(_1403);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2635, _2639, _2641);
    float _2659 = _1659 * 0.5;
    float _2661 = _2645 + _1659;
    out.gl_Position.x = _1683;
    out.gl_Position.y = _1689;
    out.gl_Position.z = _2645;
    out.gl_Position.w = _1659;
    float _2663 = _2661 * 0.5;
    float _2665 = -_2531;
    float _2667 = _2665 + 1.0;
    float _2669 = _2345 + (-0.5);
    float _2671 = -_2533;
    float _2673 = _2671 + 1.0;
    float _2675 = -_2667;
    float _2677 = fma(_2417, _2675, _2543);
    float _2679 = -_2617;
    float _2681 = fma(_2679, _2669, _2631);
    float _2683 = -_2643;
    float _2685 = _2683 + 1.0;
    float _2687 = -_2481;
    float _2689 = _2687 + 1.0;
    float _2691 = -_2513;
    float _2693 = _2691 + 1.0;
    float _2695 = _1683 + _1659;
    float _2697 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2699 = fma(_2345, _2689, _2681);
    float _2701 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2703 = -_2693;
    float _2705 = fma(_2375, _2703, _2657);
    float _2707 = _2697 * _1715;
    float _2709 = -_2697;
    float _2711 = _2709 + 1.0;
    float _2713 = fma(_2341, _2673, _2593);
    float _2715 = _1726 * _2707;
    float _2717 = _1740 * _2707;
    float _2719 = _2695 * 0.5;
    float _2721 = fma(_1689, -0.5, _2659);
    float _2723 = fma(_1736, _2715, _1720);
    float _2725 = fma(_1738, _2715, _1722);
    float _2727 = _2701 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2729 = _1726 * _2711;
    float _2731 = fma(_1726, _2717, _1724);
    out.m_60.x = _2719;
    out.m_60.y = _2721;
    out.m_60.z = _2663;
    out.m_60.w = _1659;
    out.m_62.x = _2705;
    out.m_62.y = _2699;
    out.m_62.z = _2677;
    out.m_62.w = _2713;
    out.m_45.x = _2727;
    out.m_64.x = _2723;
    out.m_64.y = _2725;
    out.m_64.z = _2731;
    out.m_64.w = _2729;
    if (_2655)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2733 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2733;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _997 = false;
    bool _823 = false;
    bool _571 = false;
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
        float _2790 = as_type<float>(_99);
        out.gl_Position.z = _2790;
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
        float _2858 = as_type<float>(_135);
        out.gl_Position.z = _2858;
    }
    if (_129)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _159 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _157);
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _165 = _159;
    float _167 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _169 = _139;
    if (!_155)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _165 = _173;
    }
    float _175 = _165;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_155;
    float _205 = _181;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _139);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
        _167 = _219;
    }
    float _237 = _205;
    float _239 = _167;
    bool _241 = !_155;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _139 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _169 = _263;
    }
    float _265 = _169;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _267;
    float _275 = _271;
    if (!_155)
    {
        float _277 = _117 * _117;
        float _279 = _277 * 0.5;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = fma(_265, _141, _267);
    float _285 = fma(_265, _143, _269);
    float _287 = fma(_265, _145, _271);
    if (!_155)
    {
        float _289 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _289;
    }
    float _291 = _273;
    bool _293 = !_155;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _117 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _117);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _275 = _313;
    }
    float _327 = _295;
    float _329 = _275;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_155)
    {
        _333 = _117;
    }
    float _335 = _333;
    bool _337 = !_155;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _143, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = sqrt(_201);
    float _371 = fma(_361, _141, _363);
    float _373 = -_365;
    float _375 = _285 + _373;
    float _377 = fma(_361, _145, _367);
    float _379 = -_371;
    float _381 = _283 + _379;
    float _383 = _375 * _375;
    float _385 = -_377;
    float _387 = _287 + _385;
    float _389 = sqrt(_163);
    float _391 = fma(_381, _381, _383);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _397 = fma(_387, _387, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _395);
    float _405 = sqrt(_397);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _401);
    float _413 = in.m_52.w;
    float _415 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _417 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].x, _411);
    float _421 = sqrt(_407);
    float _423 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].y, _403);
    float _425 = in.m_42.x;
    float _427 = in.m_42.y;
    float _429 = in.m_42.z;
    float _431 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _415);
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].z, _417);
    float _435 = _369 * _423;
    float _437 = _389 * _419;
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].w, _431);
    bool _441 = _405 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_405);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _421 * _433;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _467 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _469 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _471 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _465);
    float _473 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _467);
    float _475 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _469);
    float _477 = fma(_283, _413, _425);
    float _479 = fma(_285, _413, _427);
    float _481 = _439;
    float _483 = _471;
    float _485 = _475;
    if (_449)
    {
        _481 = _471;
    }
    float _487 = _481;
    float _489 = fma(_287, _413, _429);
    float _491 = _487;
    if (_449)
    {
        _483 = _473;
    }
    float _493 = _483;
    float _495 = _493;
    if (!_449)
    {
        bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _499 = !_497;
        if (!_499)
        {
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _511);
            float _519 = _369 * _513;
            float _521 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _523 = _389 * _515;
            float _525 = _421 * _517;
            float _527 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _521);
            float _531 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _533 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _535 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].x, _527);
            float _537 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
            float _543 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].z, _535);
            float _545 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].z, _539);
            float _547 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].z, _541);
            float _549 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].w, _543);
            float _551 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].w, _545);
            float _553 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].w, _547);
            float _555 = _549 * _549;
            float _557 = fma(_551, _551, _555);
            float _559 = fma(_553, _553, _557);
            float _561 = rsqrt(_559);
            float _563 = _561 * 9.9999999747524270787835121154785e-07;
            float _565 = _551 * _563;
            float _567 = _549 * _563;
            float _569 = _553 * _563;
            _495 = _567;
            _491 = _565;
            _485 = _569;
            _571 = true;
        }
        else
        {
            float _573 = _143 * _143;
            float _575 = fma(_141, _141, _573);
            float _577 = fma(_145, _145, _575);
            float _579 = sqrt(_577);
            bool _581 = _579 >= 9.9999999747524270787835121154785e-07;
            bool _583 = isnan(_579);
            bool _585 = _581 || _583;
            bool _587 = isnan(9.9999999747524270787835121154785e-07);
            bool _589 = _585 || _587;
            if (!_589)
            {
                float _591 = _427 * _427;
                float _593 = fma(_425, _425, _591);
                float _595 = fma(_429, _429, _593);
                float _597 = sqrt(_595);
                bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
                bool _601 = isnan(_597);
                bool _603 = _599 || _601;
                bool _605 = isnan(9.9999999747524270787835121154785e-07);
                bool _607 = _603 || _605;
                if (!_607)
                {
                    float _609 = _369 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _611 = _389 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _613 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _615 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _617 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
                    float _623 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _617);
                    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
                    float _629 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
                    float _631 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _631);
                    float _639 = _633 * _633;
                    float _641 = fma(_635, _635, _639);
                    float _643 = fma(_637, _637, _641);
                    float _645 = rsqrt(_643);
                    float _647 = _645 * 9.9999999747524270787835121154785e-07;
                    float _649 = _635 * _647;
                    float _651 = _633 * _647;
                    float _653 = _637 * _647;
                    _495 = _651;
                    _491 = _649;
                    _485 = _653;
                    _571 = true;
                }
                else
                {
                    float _655 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _657 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _659 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _661 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _663 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].y, _655);
                    float _665 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].x, _657);
                    float _667 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].z, _659);
                    float _669 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].w, _661);
                    float _671 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
                    float _673 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].x, _665);
                    float _675 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].z, _667);
                    float _677 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].w, _669);
                    float _679 = _369 * _671;
                    float _681 = _389 * _673;
                    float _683 = _421 * _675;
                    float _685 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _685);
                    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
                    float _695 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
                    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _691);
                    float _699 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
                    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
                    float _703 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].w, _697);
                    float _705 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].w, _699);
                    float _707 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].w, _701);
                    float _709 = _703 * _703;
                    float _711 = fma(_705, _705, _709);
                    float _713 = fma(_707, _707, _711);
                    float _715 = rsqrt(_713);
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    float _719 = _705 * _717;
                    float _721 = _703 * _717;
                    float _723 = _707 * _717;
                    _495 = _721;
                    _491 = _719;
                    _485 = _723;
                    _571 = true;
                }
            }
            else
            {
                float _725 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _727 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _729 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _731 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _733 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _725);
                float _735 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _727);
                float _737 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _729);
                float _739 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _735);
                float _745 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _737);
                float _747 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _739);
                float _749 = _369 * _741;
                float _751 = _389 * _743;
                float _753 = _421 * _745;
                float _755 = _749 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _757 = _749 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _759 = _749 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _761 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].x, _755);
                float _763 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _757);
                float _765 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
                float _769 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _763);
                float _771 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
                float _773 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].w, _767);
                float _775 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].w, _769);
                float _777 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].w, _771);
                float _779 = _773 * _773;
                float _781 = fma(_775, _775, _779);
                float _783 = fma(_777, _777, _781);
                float _785 = rsqrt(_783);
                float _787 = _785 * 9.9999999747524270787835121154785e-07;
                float _789 = _775 * _787;
                float _791 = _773 * _787;
                float _793 = _777 * _787;
                _495 = _791;
                _491 = _789;
                _485 = _793;
            }
        }
    }
    _571 = false;
    float _795 = _495;
    float _797 = _491;
    float _799 = _485;
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _803 = !_801;
    float _821;
    if (!_803)
    {
        float _805 = in.m_54.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_83);
        float _827 = 1.0 / _825;
        float _829 = _117 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _841 = 1.0 / _835;
    bool _843 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _845 = isnan(_831);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _861 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _863 = isnan(_831);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _875 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = 1.0 / _839;
    float _879 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _885 = _831 + _883;
    float _887 = -_853;
    float _889 = _887 + 1.0;
    out.m_56.x = _875;
    out.m_56.y = _879;
    out.m_56.z = _881;
    out.m_56.w = _873;
    float _891 = _885 * _841;
    bool _893 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _895 = isnan(_831);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = _871 * _889;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _909 = _831 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _911;
    float _915 = -_871;
    float _917 = _915 + 1.0;
    float _919 = in.m_52.x;
    float _921 = in.m_52.y;
    bool _923 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _925 = fma(_913, _891, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _927 = _903 * _917;
    float _929 = _909 * _877;
    float _931 = -_903;
    float _933 = _931 + 1.0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _943 = _925 * _927;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _949 = fma(_937, _891, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _951 = fma(_941, _929, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _953 = fma(_947, _929, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _955 = _949 * _927;
    float _957 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[143].x, _943);
    float _959 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[143].y, _955);
    float _961 = fma(_951, _905, _957);
    float _963 = fma(_953, _905, _959);
    float _965 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[145].x, _961);
    float _967 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[145].y, _963);
    float _969 = _965 * _919;
    float _971 = _967 * _921;
    bool _973 = !_923;
    float _993;
    float _995;
    if (!_973)
    {
        float _975 = in.m_54.x;
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _979 = float(_83);
        float _981 = _975 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _985 = _983 * _977;
        float _987 = floor(_985);
        float _989 = -_987;
        float _991 = _985 + _989;
        _993 = _979;
        _995 = _991;
        _997 = true;
    }
    else
    {
        float _999 = float(_83);
        float _1001 = 1.0 / _999;
        float _1003 = _117 * _1001;
        _993 = _999;
        _995 = _1003;
    }
    _997 = false;
    float _1005 = _993;
    float _1007 = _995;
    float _1009 = _795 * _795;
    float _1011 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1013 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1015 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1017 = fma(_797, _797, _1009);
    float _1019 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1021 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1013);
    float _1023 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1015);
    float _1025 = fma(_799, _799, _1017);
    float _1027 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1019);
    float _1029 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1031 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1021);
    float _1033 = rsqrt(_1025);
    float _1035 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1023);
    float _1037 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1027);
    bool _1039 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    float _1049 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1051 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1053 = _421 * _1049;
    float _1055 = _1033 * _799;
    float _1057 = _1033 * _797;
    float _1059 = _1033 * _795;
    float _1061 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1065 = _1055 * _1063;
    float _1067 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1011);
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1071 = _1059 * _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1075 = _1057 * _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1079 = -_1065;
    float _1081 = fma(_1057, _1077, _1079);
    float _1083 = _1061 * _1029;
    float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1087 = -_1071;
    float _1089 = fma(_1055, _1085, _1087);
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1093 = -_1075;
    float _1095 = fma(_1059, _1091, _1093);
    float _1097 = _1081 * _1081;
    float _1099 = _1031 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1101 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1067);
    float _1103 = _971 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1105 = fma(_1089, _1089, _1097);
    float _1107 = _369 * _1099;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1111 = fma(_1095, _1095, _1105);
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1117 = _389 * _1109;
    float _1119 = _1103 * _1113;
    float _1121 = rsqrt(_1111);
    float _1123 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1125 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1127 = _1119 * _1055;
    float _1129 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1115);
    float _1131 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1123);
    float _1133 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1125);
    float _1135 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1137 = _1119 * _1057;
    float _1139 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1141 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1143 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1129);
    float _1145 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1139);
    float _1147 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1141);
    float _1149 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1143);
    float _1151 = _1081 * _1121;
    float _1153 = _1089 * _1121;
    float _1155 = _1095 * _1121;
    float _1157 = _1147 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1159 = _1057 * _1151;
    float _1161 = fma(_1083, _1153, _1137);
    float _1163 = fma(_1083, _1155, _1127);
    float _1165 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1167 = -_1159;
    float _1169 = fma(_1059, _1153, _1167);
    float _1171 = _1059 * _1155;
    float _1173 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1175 = _1119 * _1059;
    float _1177 = fma(_1135, _1169, _1163);
    float _1179 = -_1171;
    float _1181 = fma(_1055, _1151, _1179);
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1185 = _1055 * _1153;
    float _1187 = _1157 + _1177;
    float _1189 = fma(_1135, _1181, _1161);
    float _1191 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1183);
    float _1193 = fma(_1083, _1151, _1175);
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1197 = _1187 + _1195;
    float _1199 = _1165 + _1189;
    float _1201 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    float _1203 = -_1185;
    float _1205 = fma(_1057, _1155, _1203);
    float _1207 = _1197 * _1197;
    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1211 = _1199 + _1209;
    float _1213 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1215 = fma(_1135, _1205, _1193);
    float _1217 = _1155;
    float _1219 = _1083;
    float _1221 = _1119;
    float _1223 = _1199;
    float _1225 = _1205;
    float _1227 = _1197;
    if (_1047)
    {
        _1217 = 1.0;
    }
    float _1229 = _1217;
    float _1231 = fma(_1211, _1211, _1207);
    float _1233 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1235 = _1173 + _1215;
    float _1237 = sqrt(_1231);
    float _1239 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1233);
    float _1241 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1239);
    float _1243 = 1.0 / _1213;
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1247 = _1245 + _1213;
    bool _1249 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1261 = _1259 != 0;
    float _1263 = _1247 * _1243;
    float _1265 = _1263 * 0.5;
    bool _1267 = !_1257;
    int _1269 = _1267 ? 0 : 1;
    bool _1271 = !_1253;
    int _1273 = _1271 ? 0 : 1;
    bool _1275 = !_1261;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = _1247;
    float _1281 = _1235;
    float _1283 = _1229;
    if (!_1249)
    {
        _1279 = _1199;
    }
    float _1285 = _1279;
    float _1287 = _1285;
    if (!_1249)
    {
        _1219 = _1187;
    }
    float _1289 = _1219;
    float _1291 = _1289;
    if (!_1249)
    {
        _1221 = _1235;
    }
    float _1293 = _1221;
    bool _1295 = !_1249;
    float _1297 = _1293;
    if (!_1295)
    {
        float _1299 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1303 = _1237 + _1301;
        float _1305 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1307 = rsqrt(_1231);
        float _1309 = _1303 * _1299;
        float _1311 = _1309 * 0.15915493667125701904296875;
        float _1313 = _1311 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = _1311 * 6.283185482025146484375;
        float _1319 = sin(_1317);
        float _1321 = _1315 + (-1.0);
        float _1323 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = fma(_1319, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1327 = fma(_1235, _1315, _1323);
        float _1329 = _1307 * _1325;
        float _1331 = fma(_1211, _1329, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1333 = fma(_1197, _1329, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1297 = _1327;
        _1287 = _1331;
        _1291 = _1333;
    }
    float _1335 = _1297;
    float _1337 = _1287;
    float _1339 = _1291;
    if (!_1047)
    {
        float _1341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = _1341 * 0.15915493667125701904296875;
        float _1345 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1349 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1347);
        float _1351 = _1343 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        float _1355 = _1345 * 0.15915493667125701904296875;
        float _1357 = _1343 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1353;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1349;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1373;
        float _1383 = 1.0 / _1379;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1387 = _1375 * _1385;
        float _1389 = _1371 * _1381;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = fma(_1389, _1387, _1391);
        float _1395 = _1393 * _1383;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        _1281 = _1383;
        _1223 = _1355;
        _1283 = _1397;
    }
    float _1399 = _1281;
    float _1401 = _1223;
    float _1403 = _1283;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1407 = _1335 + _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1411 = _1337 + _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1415 = _1339 + _1413;
    float _1417 = _1407 * _1407;
    float _1419 = fma(_1411, _1411, _1417);
    float _1421 = fma(_1415, _1415, _1419);
    float _1423 = rsqrt(_1421);
    float _1425 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1427 = _1411 * _1425;
    float _1429 = _1415 * _1425;
    float _1431 = _1427 * _1427;
    float _1433 = _1429 * _1429;
    float _1435 = _1431 + _1433;
    float _1437 = sqrt(_1435);
    bool _1439 = _1437 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = _1437 + _1441;
    float _1445 = _1423;
    float _1447 = _1435;
    float _1449 = _1443;
    float _1451 = _1399;
    float _1453 = _1407;
    float _1455 = _1401;
    if (_1439)
    {
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1445 = _1457;
    }
    float _1459 = _1445;
    if (_1439)
    {
        float _1461 = rsqrt(_1435);
        _1447 = _1461;
    }
    float _1463 = _1447;
    if (_1439)
    {
        float _1465 = _1443 * _1459;
        _1449 = _1465;
    }
    float _1467 = _1449;
    if (_1439)
    {
        float _1469 = _1467 * 0.15915493667125701904296875;
        _1451 = _1469;
    }
    float _1471 = _1451;
    float _1473 = _1415;
    if (_1439)
    {
        float _1475 = _1471 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1483 = precise::max(0.0, _1481);
    float _1485 = _1459;
    float _1487 = _1483;
    if (_1439)
    {
        float _1489 = _1471 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        _1485 = _1491;
    }
    float _1493 = _1485;
    float _1495 = -_1425;
    float _1497 = -_1483;
    float _1499 = fma(_1407, _1495, _1497);
    if (_1439)
    {
        float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1501;
    }
    float _1503 = _1453;
    float _1505 = _1479;
    float _1507 = _1503;
    if (_1439)
    {
        float _1509 = fma(_1479, _1503, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1455 = _1509;
    }
    float _1511 = _1455;
    float _1513 = _1511;
    if (!_1439)
    {
        _1505 = _1427;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (!_1439)
    {
        _1507 = _1499;
    }
    float _1519 = _1507;
    float _1521 = _1519;
    float _1523 = _1493;
    if (_1439)
    {
        float _1525 = _1493 + (-1.0);
        _1487 = _1525;
    }
    float _1527 = _1487;
    float _1529 = _1527;
    if (_1439)
    {
        float _1531 = _1463 * _1511;
        _1225 = _1531;
    }
    float _1533 = _1225;
    if (!_1439)
    {
        _1513 = _1431;
    }
    float _1535 = _1513;
    float _1537 = sqrt(_1421);
    float _1539 = _1535;
    if (_1439)
    {
        float _1541 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1541;
    }
    float _1543 = _1227;
    if (_1439)
    {
        float _1545 = _1427 * _1533;
        _1517 = _1545;
    }
    float _1547 = _1517;
    if (!_1439)
    {
        _1529 = _1429;
    }
    float _1549 = _1529;
    float _1551 = _1549;
    if (_1439)
    {
        float _1553 = _1429 * _1533;
        _1551 = _1553;
    }
    float _1555 = _1551;
    if (_1439)
    {
        float _1557 = fma(_1499, _1493, _1543);
        _1521 = _1557;
    }
    float _1559 = _1521;
    if (_1439)
    {
        float _1561 = _1547 * _1547;
        _1539 = _1561;
    }
    float _1563 = _1539;
    if (!_1439)
    {
        _1523 = _1433;
    }
    float _1565 = _1523;
    float _1567 = _1565;
    if (_1439)
    {
        float _1569 = _1555 * _1555;
        _1567 = _1569;
    }
    float _1571 = _1567;
    float _1573 = fma(_1559, _1559, _1563);
    float _1575 = _1573 + _1571;
    float _1577 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1581 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1579);
    float _1583 = precise::clamp(_1581, 0.0, 1.0);
    float _1585 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1587 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1589 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1591 = rsqrt(_1575);
    float _1593 = -_1583;
    float _1595 = _1593 + 1.0;
    float _1597 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1599 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1589);
    float _1601 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1585);
    float _1603 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1605 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1607 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1597);
    float _1609 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1611 = abs(_1595);
    float _1613 = log2(_1611);
    float _1615 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1603);
    float _1617 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1607);
    float _1619 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1621 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1623 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1615);
    float _1625 = _1591 * _1547;
    float _1627 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1629 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1631 = _1591 * _1559;
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1635 = _1591 * _1555;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1629);
    float _1639 = -_1621;
    float _1641 = fma(_1639, _1587, 1.0);
    float _1643 = -_1633;
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1643);
    float _1647 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1649 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1637);
    float _1651 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1653 = -_1635;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1645);
    float _1657 = log2(_1641);
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1649);
    float _1661 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1663 = fma(_1655, -0.5, 0.5);
    float _1665 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1667 = fma(_1655, 0.5, 0.5);
    float _1669 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1661);
    float _1671 = _1631 + 1.0;
    float _1673 = exp2(_1651);
    float _1675 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1665);
    float _1677 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1669);
    float _1679 = fma(_1667, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1681 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1675);
    float _1683 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1677);
    float _1685 = fma(_1667, _1679, -0.212114393711090087890625);
    float _1687 = 1.0 / _1659;
    float _1689 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1681);
    float _1691 = _1657 * 0.693147182464599609375;
    float _1693 = fma(_1667, _1685, 1.570728778839111328125);
    float _1695 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1697 = sqrt(_1663);
    float _1699 = -_1631;
    float _1701 = fma(_1673, _1671, _1699);
    float _1703 = _1683 * _1687;
    float _1705 = _1689 * _1687;
    float _1707 = fma(_1703, 0.5, 0.5);
    float _1709 = fma(_1705, -0.5, 0.5);
    float _1711 = _1697 * 0.636619746685028076171875;
    float _1713 = fma(_1701, 0.5, 0.5);
    float3 _5582 = float3(_1707, _1709, _1695);
    float _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5582, float3(0.0), isnan(_5582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5582, float3(0.0), isnan(_5582)), level(0.0)).x;
    float3 _5593 = float3(_1707, _1709, _1695);
    float4 _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5593, float3(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5593, float3(0.0), isnan(_5593)), level(0.0)).xyzw;
    float _1720 = _1718.x;
    float _1722 = _1718.y;
    float _1724 = _1718.z;
    float _1726 = _1718.w;
    float _1728 = -_1693;
    float _1730 = fma(_1711, _1728, 1.0);
    float2 _5615 = float2(_1730, _1713);
    float3 _1734 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _1736 = _1734.x;
    float _1738 = _1734.y;
    float _1740 = _1734.z;
    float _1742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1744 = int(_1742);
    float _1746 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1748 = int(_1746);
    float _1750 = float(_1744);
    float _1752 = 1.0 / _1005;
    float _1754 = float(uint(_1748));
    float _1756 = 1.0 / _1750;
    int _1758 = ~_1748;
    int _1760 = _1758 + 1;
    float _1762 = 1.0 / _1754;
    float _1764 = _117 * _1756;
    float _1766 = trunc(_1764);
    int _1768 = int(_1766);
    int _1770 = as_type<int>(_1762) + (-2);
    float _1772 = float(uint(_1768));
    float _1774 = as_type<float>(_1770) * _1772;
    int _1776 = ~_1748;
    int _1778 = _1776 + 1;
    float _1780 = trunc(_1774);
    float _1782 = precise::max(_1780, 0.0);
    uint _1785 = uint(_1782);
    float _1787 = in.m_54.x;
    float _1789 = in.m_54.y;
    float _1791 = in.m_54.z;
    float _1793 = in.m_54.w;
    int _1795 = _1778 * int(_1785);
    int _1797 = _1795 + _1768;
    float _1799 = float(uint(_1797));
    bool _1801 = _1793 > 0.5;
    float _1803 = as_type<float>(_1770) * _1799;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1807 = _1805 != 0;
    float _1809 = trunc(_1803);
    float _1811 = precise::max(_1809, 0.0);
    uint _1813 = uint(_1811);
    bool _1815 = !_1807;
    float _1817 = _1815 ? 7.345489978790283203125 : 1.0;
    float _1819 = _1817 * _1787;
    int _1821 = _1748 + (-1);
    float _1823 = floor(_1819);
    int _1825 = int(_1785) + int(_1813);
    float _1827 = float(_1748);
    float _1829 = float(_1768);
    int _1831 = _1760 * _1825;
    int _1833 = _1831 + _1768;
    bool _1835 = _1829 >= _1827;
    bool _1837 = isnan(_1829);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1827);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    bool _1847 = uint(_1833) >= uint(_1748);
    float _1849 = -_1823;
    float _1851 = _1819 + _1849;
    float _1853 = trunc(_1845);
    int _1855 = int(_1853);
    bool _1857 = !_1847;
    int _1859 = _1857 ? 0 : (-1);
    bool _1861 = _1748 == 0;
    int _1863 = ~_1825;
    int _1865 = _1863 + _1859;
    int _1867 = _1865 + 1;
    float _1869 = _1851 * _1827;
    float _1871 = _117 * _1827;
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1875 = _1873 != 0;
    int _1877 = _1748 * _1867;
    int _1879 = _1877 + _1768;
    float _1881 = _1871 * _1752;
    float _1883 = trunc(_1869);
    int _1885 = int(_1883);
    bool _1887 = !_1861;
    int _1889 = _1887 ? _1879 : (-1);
    int _1891 = ~_1855;
    int _1893 = _1891 + 1;
    int _1895 = _1893 + 1;
    bool _1897 = !_1875;
    int _1899 = _1897 ? 0 : 1;
    float _1901 = trunc(_1881);
    int _1903 = int(_1901);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1907 = _1905 != 0;
    int _1909 = _1889 * _1895;
    int _1911 = abs(_1269);
    int _1913 = abs(_1899);
    int _1915 = _1855 * _1821;
    int _1917 = _1915 + _1909;
    int _1919 = abs(_1273);
    int _1921 = _1885 * _1913;
    int _1923 = _1921 + _1768;
    bool _1925 = !_1907;
    int _1927 = _1925 ? 0 : 1;
    int _1929 = abs(_1277);
    int _1931 = _1917 * _1911;
    int _1933 = abs(_1927);
    int _1935 = _1903 * _1919;
    int _1937 = _1935 + _1931;
    int _1939 = ~_1748;
    int _1941 = _1939 + 1;
    int _1943 = _1923 * _1929;
    int _1945 = _1943 + _1937;
    int _1947 = ~_1748;
    int _1949 = _1947 + 1;
    int _1951 = ~_1748;
    int _1953 = _1951 + 1;
    int _1955 = _1885 * _1933;
    int _1957 = _1955 + _1945;
    float _1959 = float(uint(_1957));
    float _1961 = as_type<float>(_1770) * _1959;
    float _1963 = trunc(_1961);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = _1941 * int(_1967);
    int _1971 = _1969 + _1957;
    float _1973 = float(uint(_1971));
    float _1975 = as_type<float>(_1770) * _1973;
    float _1977 = trunc(_1975);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    int _1983 = ~_1748;
    int _1985 = _1983 + 1;
    int _1987 = int(_1967) + int(_1981);
    float _1989 = float(uint(_1923));
    int _1991 = _1949 * _1987;
    int _1993 = _1991 + _1957;
    float _1995 = as_type<float>(_1770) * _1989;
    bool _1997 = uint(_1993) >= uint(_1748);
    float _1999 = trunc(_1995);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    bool _2005 = !_1997;
    int _2007 = _2005 ? 0 : (-1);
    int _2009 = ~_1987;
    int _2011 = _2009 + _2007;
    int _2013 = _2011 + 1;
    int _2015 = _1748 * _2013;
    int _2017 = _2015 + _1957;
    int _2019 = _1985 * int(_2003);
    int _2021 = _2019 + _1923;
    bool _2023 = !_1861;
    int _2025 = _2023 ? _2017 : (-1);
    int _2027 = _2025 >> 31;
    float _2029 = float(uint(_2021));
    int _2031 = _2027 & 3;
    int _2033 = _2025 & 3;
    bool _2035 = _2033 != 0;
    float _2037 = as_type<float>(_1770) * _2029;
    int _2039 = _2025 + _2031;
    bool _2041 = uint(_2033) > 1u;
    int _2043 = _2039 >> 2;
    float _2045 = trunc(_2037);
    float _2047 = precise::max(_2045, 0.0);
    uint _2049 = uint(_2047);
    int _2051 = _2025 & 3;
    bool _2053 = _2051 != 0;
    int _2055 = _2043 << 4;
    int _2057 = _2055 + 368;
    int _2059 = _2053 ? 0 : 1;
    uint _2061 = uint(int(uint(_2057) >> uint(2)));
    uint _2063 = uint(int(uint(int(_2061)) >> uint(2)));
    int _2065 = int(_2061) & 3;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[int(_2063)][_2065];
    int _2069 = int(_2061) + 1;
    uint _2071 = uint(int(uint(_2069) >> uint(2)));
    int _2073 = _2069 & 3;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[int(_2071)][_2073];
    bool _2077 = _2033 != 3;
    int _2079 = ~_2059;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    int _2085 = _2083;
    float _2087 = _1791;
    if (!_2041)
    {
        int _2089 = ~_2059;
        int _2091 = _2089 + 1;
        _2085 = _2091;
    }
    int _2093 = _2085;
    int _2095 = _2057 + 8;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    uint _2099 = uint(int(uint(int(_2097)) >> uint(2)));
    int _2101 = int(_2097) & 3;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[int(_2099)][_2101];
    int _2105 = int(_2097) + 1;
    uint _2107 = uint(int(uint(_2105) >> uint(2)));
    int _2109 = _2105 & 3;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[int(_2107)][_2109];
    int _2113 = int(_2003) + int(_2049);
    bool _2115 = uint(_2033) >= 2u;
    int _2117 = abs(_2093);
    int _2119 = _1953 * _2113;
    int _2121 = _2119 + _1923;
    int _2123 = _2115 ? 0 : 1;
    int _2125 = ~_2117;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    bool _2131 = _2033 != 3;
    bool _2133 = !_2035;
    int _2135 = _2133 ? 0 : 1;
    int _2137 = ~_2123;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    int _2143 = _2141;
    if (_2077)
    {
        int _2145 = ~_2123;
        int _2147 = _2145 + 1;
        _2143 = _2147;
    }
    int _2149 = _2143;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2153 = _2151 != 0;
    int _2155 = abs(_2135);
    float _2157 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2159 = int(_2157);
    int _2161 = abs(_2149);
    bool _2163 = !_2153;
    int _2165 = _2163 ? 0 : 1;
    bool _2167 = uint(_2121) >= uint(_1748);
    int _2169 = abs(_2165);
    int _2171 = ~_2161;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2179 = _2177 != 0;
    int _2181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2183 = _2181 != 0;
    float _2185 = float(uint(_2159));
    int _2187 = _2129 * as_type<int>(_2075);
    bool _2189 = !_2131;
    int _2191 = _2189 ? 0 : (-1);
    bool _2193 = _1789 > 0.5;
    int _2195 = abs(_2191);
    int _2197 = ~_2155;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    bool _2203 = !_2167;
    int _2205 = _2203 ? 0 : (-1);
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2209 = _2207 != 0;
    int _2211 = _2201 * as_type<int>(_2067);
    int _2213 = _2211 + _2187;
    int _2215 = ~_2195;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    int _2221 = _2175 * as_type<int>(_2103);
    int _2223 = _2221 + _2213;
    int _2225 = ~_2169;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    int _2231 = abs(_2159);
    int _2233 = _2219 * as_type<int>(_2111);
    int _2235 = _2233 + _2223;
    int _2237 = ~_2113;
    int _2239 = _2237 + _2205;
    int _2241 = _2239 + 1;
    float _2243 = 1.0 / _2185;
    int _2245 = _2235 * _2229;
    float _2247 = float(uint(_2231));
    int _2249 = _1748 * _2241;
    int _2251 = _2249 + _1923;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2255 = 1.0 / _2247;
    bool _2257 = !_1861;
    int _2259 = _2257 ? _2251 : (-1);
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2263 = _2261 != 0;
    float _2265 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2267 = _2259 * _2169;
    int _2269 = _2267 + _2245;
    float _2271 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2275 = as_type<int>(_2243) + (-2);
    float _2277 = -_2253;
    float _2279 = fma(_2265, 2.0, _2277);
    float _2281 = 1.0 / _2273;
    int _2283 = abs(_2269);
    float _2285 = -_117;
    float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2279);
    float _2289 = float(uint(_2269));
    int _2291 = as_type<int>(_2255) + (-2);
    float _2293 = float(uint(_2283));
    float _2295 = as_type<float>(_2275) * _2289;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2299 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2301 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2301;
    float _2305 = as_type<float>(_2291) * _2293;
    int _2307 = ~_2159;
    int _2309 = _2307 + 1;
    float _2311 = trunc(_2295);
    float _2313 = precise::max(_2311, 0.0);
    uint _2315 = uint(_2313);
    float _2317 = fma(_2299, -2.0, _2297);
    int _2319 = ~_2231;
    int _2321 = _2319 + 1;
    float _2323 = _2303 * _2281;
    float _2325 = -_199;
    int _2327 = _1801 ? as_type<int>(_2325) : as_type<int>(_199);
    float _2329 = -_199;
    int _2331 = _2193 ? as_type<int>(_2329) : as_type<int>(_199);
    float _2333 = trunc(_2305);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    bool _2339 = !_2179;
    float _2341 = _2339 ? _199 : as_type<float>(_2327);
    bool _2343 = !_2183;
    float _2345 = _2343 ? _199 : as_type<float>(_2331);
    bool _2347 = _1787 > 0.5;
    bool _2349 = _1791 > 0.5;
    int _2351 = _2309 * int(_2315);
    int _2353 = _2351 + _2269;
    float _2355 = -_193;
    int _2357 = _2349 ? as_type<int>(_2355) : as_type<int>(_193);
    float _2359 = float(uint(_2353));
    float _2361 = -_193;
    float _2363 = _2347 ? _2361 : _193;
    int _2365 = _2321 * int(_2337);
    int _2367 = _2365 + _2283;
    float _2369 = as_type<float>(_2275) * _2359;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2373 = !_2209;
    float _2375 = _2373 ? _193 : _2363;
    float _2377 = float(uint(_2367));
    float _2379 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2371);
    float _2381 = _2363;
    float _2383 = _2377;
    if (!_1807)
    {
        _2381 = _1789;
    }
    float _2385 = _2381;
    float _2387 = trunc(_2369);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = _2385;
    if (_1807)
    {
        _2393 = _1787;
    }
    float _2395 = _2393;
    float _2397 = as_type<float>(_2291) * _2377;
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2401 = _1007 + _2399;
    bool _2403 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2405 = isnan(_1007);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    bool _2415 = !_2263;
    float _2417 = _2415 ? _193 : as_type<float>(_2357);
    float _2419 = trunc(_2397);
    float _2421 = precise::max(_2419, 0.0);
    uint _2423 = uint(_2421);
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2427 = fma(_2323, _2401, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2429 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2431 = isnan(_1007);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = -_2413;
    float _2443 = _2441 + 1.0;
    float _2445 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2425);
    if (!_1807)
    {
        _2383 = _1791;
    }
    float _2447 = _2383;
    float _2449 = _2439 * _2443;
    float _2451 = _2447;
    if (_1807)
    {
        _2451 = _1789;
    }
    float _2453 = _2451;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1807)
    {
        _2087 = _1789;
    }
    float _2457 = _2087;
    float _2459 = _2427 * _2449;
    int _2461 = int(_2315) + int(_2391);
    float _2463 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2455);
    float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2467 = int(_2337) + int(_2423);
    float _2469 = -_2439;
    float _2471 = _2469 + 1.0;
    int _2473 = ~_2159;
    int _2475 = _2473 + 1;
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2459);
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2481 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2445);
    int _2483 = ~_2231;
    int _2485 = _2483 + 1;
    float _2487 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2479);
    float _2489 = _2457 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2491 = _2475 * _2461;
    int _2493 = _2491 + _2269;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2497 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2501 = _2485 * _2467;
    int _2503 = _2501 + _2283;
    bool _2505 = uint(_2493) >= uint(_2159);
    float _2507 = -_2495;
    float _2509 = fma(_2497, 2.0, _2507);
    float _2511 = fma(_2489, -2.0, _2499);
    float _2513 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2379);
    bool _2515 = !_2505;
    int _2517 = _2515 ? 0 : (-1);
    float _2519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2521 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2523 = _2417 + 0.5;
    float _2525 = -_117;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2509);
    float _2529 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2317);
    float _2531 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2487);
    float _2533 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2463);
    float _2535 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2511);
    int _2537 = ~_2461;
    int _2539 = _2537 + _2517;
    int _2541 = _2539 + 1;
    float _2543 = fma(_2521, _2523, _2527);
    bool _2545 = uint(_2503) >= uint(_2231);
    float _2547 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2477);
    int _2549 = _2269 ^ _2159;
    int _2551 = _2159 * _2541;
    int _2553 = _2551 + _2269;
    bool _2555 = !_2545;
    int _2557 = _2555 ? 0 : (-1);
    float _2559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2561 = uint(int(uint(_2549) >> uint(31)));
    float _2563 = _2519 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2565 = _2159 == 0;
    bool _2567 = _2159 == 0;
    float _2569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2571 = ~_2557;
    int _2573 = _2467 + _2571;
    int _2575 = _2573 + 1;
    int _2577 = ~int(_2561);
    int _2579 = _2577 + 1;
    float _2581 = _2341 + (-0.5);
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2585 = _2575 ^ _2579;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2589 = -_2563;
    float _2591 = -_2535;
    float _2593 = fma(_2589, _2581, _2591);
    int _2595 = ~_2579;
    int _2597 = _2595 + _2585;
    int _2599 = _2597 + 1;
    float _2601 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2603 = !_2565;
    int _2605 = _2603 ? _2553 : (-1);
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2609 = !_2567;
    int _2611 = _2609 ? _2599 : (-1);
    float _2613 = _2587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2615 = float(_2605);
    float _2617 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2619 = float(_2611);
    float _2621 = _2583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2623 = _2607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2625 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2627 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2601);
    float _2629 = -_2529;
    float _2631 = fma(_2617, _2619, _2629);
    float _2633 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_58.x = _2621;
    out.m_58.y = _2623;
    out.m_58.z = _2613;
    out.m_58.w = _2625;
    float _2637 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2627);
    float _2639 = _2375 + 0.5;
    float _2641 = fma(_2635, _2615, _2287);
    float _2643 = exp2(_2633);
    float _2645 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2637);
    bool _2647 = _1403 > 0.0;
    bool _2649 = isnan(_1403);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2635, _2639, _2641);
    float _2659 = _1659 * 0.5;
    float _2661 = _2645 + _1659;
    out.gl_Position.x = _1683;
    out.gl_Position.y = _1689;
    out.gl_Position.z = _2645;
    out.gl_Position.w = _1659;
    float _2663 = _2661 * 0.5;
    float _2665 = -_2531;
    float _2667 = _2665 + 1.0;
    float _2669 = _2345 + (-0.5);
    float _2671 = -_2533;
    float _2673 = _2671 + 1.0;
    float _2675 = -_2667;
    float _2677 = fma(_2417, _2675, _2543);
    float _2679 = -_2617;
    float _2681 = fma(_2679, _2669, _2631);
    float _2683 = -_2643;
    float _2685 = _2683 + 1.0;
    float _2687 = -_2481;
    float _2689 = _2687 + 1.0;
    float _2691 = -_2513;
    float _2693 = _2691 + 1.0;
    float _2695 = _1683 + _1659;
    float _2697 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2699 = fma(_2345, _2689, _2681);
    float _2701 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2703 = -_2693;
    float _2705 = fma(_2375, _2703, _2657);
    float _2707 = _2697 * _1715;
    float _2709 = -_2697;
    float _2711 = _2709 + 1.0;
    float _2713 = fma(_2341, _2673, _2593);
    float _2715 = _1726 * _2707;
    float _2717 = _1740 * _2707;
    float _2719 = _2695 * 0.5;
    float _2721 = fma(_1689, -0.5, _2659);
    float _2723 = fma(_1736, _2715, _1720);
    float _2725 = fma(_1738, _2715, _1722);
    float _2727 = _2701 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2729 = _1726 * _2711;
    float _2731 = fma(_1726, _2717, _1724);
    out.m_60.x = _2719;
    out.m_60.y = _2721;
    out.m_60.z = _2663;
    out.m_60.w = _1659;
    out.m_62.x = _2705;
    out.m_62.y = _2699;
    out.m_62.z = _2677;
    out.m_62.w = _2713;
    out.m_45.x = _2727;
    out.m_64.x = _2723;
    out.m_64.y = _2725;
    out.m_64.z = _2731;
    out.m_64.w = _2729;
    if (_2655)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2733 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2733;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _997 = false;
    bool _823 = false;
    bool _571 = false;
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
        float _2790 = as_type<float>(_99);
        out.gl_Position.z = _2790;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2858 = as_type<float>(_135);
        out.gl_Position.z = _2858;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    float _139 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _141 = in.m_47.x;
    float _143 = in.m_47.y;
    float _145 = in.m_47.z;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _159 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _157);
    float _161 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _163 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _159);
    float _165 = _159;
    float _167 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _169 = _139;
    if (!_155)
    {
        float _171 = _139 * _139;
        float _173 = _171 * 0.5;
        _165 = _173;
    }
    float _175 = _165;
    float _177 = _175;
    if (!_155)
    {
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _177 = _179;
    }
    float _181 = _177;
    int _183 = as_type<int>(_137) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_137) & 2;
    bool _189 = _187 != 0;
    bool _191 = !_185;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _161);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_155;
    float _205 = _181;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _139 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _139);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
        _167 = _219;
    }
    float _237 = _205;
    float _239 = _167;
    bool _241 = !_155;
    float _243 = _239;
    if (!_241)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _139 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _169 = _263;
    }
    float _265 = _169;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = _267;
    float _275 = _271;
    if (!_155)
    {
        float _277 = _117 * _117;
        float _279 = _277 * 0.5;
        _243 = _279;
    }
    float _281 = _243;
    float _283 = fma(_265, _141, _267);
    float _285 = fma(_265, _143, _269);
    float _287 = fma(_265, _145, _271);
    if (!_155)
    {
        float _289 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _273 = _289;
    }
    float _291 = _273;
    bool _293 = !_155;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _117 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _117);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
        _275 = _313;
    }
    float _327 = _295;
    float _329 = _275;
    float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _333 = _329;
    if (!_155)
    {
        _333 = _117;
    }
    float _335 = _333;
    bool _337 = !_155;
    float _339 = _335;
    if (!_337)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _117 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _339 = _359;
    }
    float _361 = _339;
    float _363 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_361, _143, _331);
    float _367 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = sqrt(_201);
    float _371 = fma(_361, _141, _363);
    float _373 = -_365;
    float _375 = _285 + _373;
    float _377 = fma(_361, _145, _367);
    float _379 = -_371;
    float _381 = _283 + _379;
    float _383 = _375 * _375;
    float _385 = -_377;
    float _387 = _287 + _385;
    float _389 = sqrt(_163);
    float _391 = fma(_381, _381, _383);
    float _393 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _395 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _397 = fma(_387, _387, _391);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _393);
    float _401 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _403 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _395);
    float _405 = sqrt(_397);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _401);
    float _413 = in.m_52.w;
    float _415 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _417 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _419 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].x, _411);
    float _421 = sqrt(_407);
    float _423 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].y, _403);
    float _425 = in.m_42.x;
    float _427 = in.m_42.y;
    float _429 = in.m_42.z;
    float _431 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _415);
    float _433 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].z, _417);
    float _435 = _369 * _423;
    float _437 = _389 * _419;
    float _439 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[16].w, _431);
    bool _441 = _405 >= 9.9999999747524270787835121154785e-07;
    bool _443 = isnan(_405);
    bool _445 = _441 || _443;
    bool _447 = isnan(9.9999999747524270787835121154785e-07);
    bool _449 = _445 || _447;
    float _451 = _435 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _453 = _435 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _455 = _435 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _451);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _453);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _455);
    float _463 = _421 * _433;
    float _465 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _467 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _469 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _471 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[24].w, _465);
    float _473 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[25].w, _467);
    float _475 = fma(_439, (*spvDescriptorSet0.vp_c8)._m0[26].w, _469);
    float _477 = fma(_283, _413, _425);
    float _479 = fma(_285, _413, _427);
    float _481 = _439;
    float _483 = _471;
    float _485 = _475;
    if (_449)
    {
        _481 = _471;
    }
    float _487 = _481;
    float _489 = fma(_287, _413, _429);
    float _491 = _487;
    if (_449)
    {
        _483 = _473;
    }
    float _493 = _483;
    float _495 = _493;
    if (!_449)
    {
        bool _497 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _499 = !_497;
        if (!_499)
        {
            float _501 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _507 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _501);
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _511);
            float _519 = _369 * _513;
            float _521 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _523 = _389 * _515;
            float _525 = _421 * _517;
            float _527 = _519 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _529 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _521);
            float _531 = _519 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _533 = _519 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _535 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[25].x, _527);
            float _537 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _529);
            float _539 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[24].x, _531);
            float _541 = fma(_523, (*spvDescriptorSet0.vp_c8)._m0[26].x, _533);
            float _543 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].z, _535);
            float _545 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].z, _539);
            float _547 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].z, _541);
            float _549 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[25].w, _543);
            float _551 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[24].w, _545);
            float _553 = fma(_537, (*spvDescriptorSet0.vp_c8)._m0[26].w, _547);
            float _555 = _549 * _549;
            float _557 = fma(_551, _551, _555);
            float _559 = fma(_553, _553, _557);
            float _561 = rsqrt(_559);
            float _563 = _561 * 9.9999999747524270787835121154785e-07;
            float _565 = _551 * _563;
            float _567 = _549 * _563;
            float _569 = _553 * _563;
            _495 = _567;
            _491 = _565;
            _485 = _569;
            _571 = true;
        }
        else
        {
            float _573 = _143 * _143;
            float _575 = fma(_141, _141, _573);
            float _577 = fma(_145, _145, _575);
            float _579 = sqrt(_577);
            bool _581 = _579 >= 9.9999999747524270787835121154785e-07;
            bool _583 = isnan(_579);
            bool _585 = _581 || _583;
            bool _587 = isnan(9.9999999747524270787835121154785e-07);
            bool _589 = _585 || _587;
            if (!_589)
            {
                float _591 = _427 * _427;
                float _593 = fma(_425, _425, _591);
                float _595 = fma(_429, _429, _593);
                float _597 = sqrt(_595);
                bool _599 = _597 >= 9.9999999747524270787835121154785e-07;
                bool _601 = isnan(_597);
                bool _603 = _599 || _601;
                bool _605 = isnan(9.9999999747524270787835121154785e-07);
                bool _607 = _603 || _605;
                if (!_607)
                {
                    float _609 = _369 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _611 = _389 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _613 = _421 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _615 = _609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _617 = _609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _619 = _609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _621 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].x, _615);
                    float _623 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].x, _617);
                    float _625 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].z, _621);
                    float _629 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].z, _623);
                    float _631 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].z, _625);
                    float _633 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _631);
                    float _639 = _633 * _633;
                    float _641 = fma(_635, _635, _639);
                    float _643 = fma(_637, _637, _641);
                    float _645 = rsqrt(_643);
                    float _647 = _645 * 9.9999999747524270787835121154785e-07;
                    float _649 = _635 * _647;
                    float _651 = _633 * _647;
                    float _653 = _637 * _647;
                    _495 = _651;
                    _491 = _649;
                    _485 = _653;
                    _571 = true;
                }
                else
                {
                    float _655 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _657 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _659 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _661 = _427 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _663 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].y, _655);
                    float _665 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].x, _657);
                    float _667 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].z, _659);
                    float _669 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[14].w, _661);
                    float _671 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].y, _663);
                    float _673 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].x, _665);
                    float _675 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].z, _667);
                    float _677 = fma(_429, (*spvDescriptorSet0.vp_c10)._m0[16].w, _669);
                    float _679 = _369 * _671;
                    float _681 = _389 * _673;
                    float _683 = _421 * _675;
                    float _685 = _679 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _687 = _679 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _689 = _679 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _691 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[25].x, _685);
                    float _693 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[24].x, _687);
                    float _695 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[26].x, _689);
                    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].z, _691);
                    float _699 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].z, _693);
                    float _701 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].z, _695);
                    float _703 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[25].w, _697);
                    float _705 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[24].w, _699);
                    float _707 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[26].w, _701);
                    float _709 = _703 * _703;
                    float _711 = fma(_705, _705, _709);
                    float _713 = fma(_707, _707, _711);
                    float _715 = rsqrt(_713);
                    float _717 = _715 * 9.9999999747524270787835121154785e-07;
                    float _719 = _705 * _717;
                    float _721 = _703 * _717;
                    float _723 = _707 * _717;
                    _495 = _721;
                    _491 = _719;
                    _485 = _723;
                    _571 = true;
                }
            }
            else
            {
                float _725 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _727 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _729 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _731 = _143 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _733 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].y, _725);
                float _735 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].x, _727);
                float _737 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].z, _729);
                float _739 = fma(_141, (*spvDescriptorSet0.vp_c10)._m0[14].w, _731);
                float _741 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].y, _733);
                float _743 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].x, _735);
                float _745 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].z, _737);
                float _747 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[16].w, _739);
                float _749 = _369 * _741;
                float _751 = _389 * _743;
                float _753 = _421 * _745;
                float _755 = _749 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _757 = _749 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _759 = _749 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _761 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[25].x, _755);
                float _763 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[24].x, _757);
                float _765 = fma(_751, (*spvDescriptorSet0.vp_c8)._m0[26].x, _759);
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
                float _769 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _763);
                float _771 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _765);
                float _773 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[25].w, _767);
                float _775 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[24].w, _769);
                float _777 = fma(_747, (*spvDescriptorSet0.vp_c8)._m0[26].w, _771);
                float _779 = _773 * _773;
                float _781 = fma(_775, _775, _779);
                float _783 = fma(_777, _777, _781);
                float _785 = rsqrt(_783);
                float _787 = _785 * 9.9999999747524270787835121154785e-07;
                float _789 = _775 * _787;
                float _791 = _773 * _787;
                float _793 = _777 * _787;
                _495 = _791;
                _491 = _789;
                _485 = _793;
            }
        }
    }
    _571 = false;
    float _795 = _495;
    float _797 = _491;
    float _799 = _485;
    bool _801 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _803 = !_801;
    float _821;
    if (!_803)
    {
        float _805 = in.m_54.x;
        float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _809 = _805 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _811 = fma(_809, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _813 = _811 * _807;
        float _815 = floor(_813);
        float _817 = -_815;
        float _819 = _813 + _817;
        _821 = _819;
        _823 = true;
    }
    else
    {
        float _825 = float(_83);
        float _827 = 1.0 / _825;
        float _829 = _117 * _827;
        _821 = _829;
    }
    _823 = false;
    float _831 = _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _839 = _837 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _841 = 1.0 / _835;
    bool _843 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _845 = isnan(_831);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _861 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _863 = isnan(_831);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _875 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = 1.0 / _839;
    float _879 = _857 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _881 = _859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _885 = _831 + _883;
    float _887 = -_853;
    float _889 = _887 + 1.0;
    out.m_56.x = _875;
    out.m_56.y = _879;
    out.m_56.z = _881;
    out.m_56.w = _873;
    float _891 = _885 * _841;
    bool _893 = _831 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _895 = isnan(_831);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = _871 * _889;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _909 = _831 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _911;
    float _915 = -_871;
    float _917 = _915 + 1.0;
    float _919 = in.m_52.x;
    float _921 = in.m_52.y;
    bool _923 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _925 = fma(_913, _891, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _927 = _903 * _917;
    float _929 = _909 * _877;
    float _931 = -_903;
    float _933 = _931 + 1.0;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _935;
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _941 = _939 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _943 = _925 * _927;
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _947 = _945 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _949 = fma(_937, _891, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _951 = fma(_941, _929, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _953 = fma(_947, _929, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _955 = _949 * _927;
    float _957 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[143].x, _943);
    float _959 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[143].y, _955);
    float _961 = fma(_951, _905, _957);
    float _963 = fma(_953, _905, _959);
    float _965 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[145].x, _961);
    float _967 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[145].y, _963);
    float _969 = _965 * _919;
    float _971 = _967 * _921;
    bool _973 = !_923;
    float _993;
    float _995;
    if (!_973)
    {
        float _975 = in.m_54.x;
        float _977 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _979 = float(_83);
        float _981 = _975 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _983 = fma(_981, (*spvDescriptorSet0.vp_c9)._m0[11].w, _117);
        float _985 = _983 * _977;
        float _987 = floor(_985);
        float _989 = -_987;
        float _991 = _985 + _989;
        _993 = _979;
        _995 = _991;
        _997 = true;
    }
    else
    {
        float _999 = float(_83);
        float _1001 = 1.0 / _999;
        float _1003 = _117 * _1001;
        _993 = _999;
        _995 = _1003;
    }
    _997 = false;
    float _1005 = _993;
    float _1007 = _995;
    float _1009 = _795 * _795;
    float _1011 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1013 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1015 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1017 = fma(_797, _797, _1009);
    float _1019 = _479 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1021 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1013);
    float _1023 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1015);
    float _1025 = fma(_799, _799, _1017);
    float _1027 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1019);
    float _1029 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1031 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1021);
    float _1033 = rsqrt(_1025);
    float _1035 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1023);
    float _1037 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1027);
    bool _1039 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1041 = isnan(0.5);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1047 = _1043 || _1045;
    float _1049 = _1035 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1051 = _1037 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1053 = _421 * _1049;
    float _1055 = _1033 * _799;
    float _1057 = _1033 * _797;
    float _1059 = _1033 * _795;
    float _1061 = _969 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1065 = _1055 * _1063;
    float _1067 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1011);
    float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1071 = _1059 * _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1075 = _1057 * _1073;
    float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1079 = -_1065;
    float _1081 = fma(_1057, _1077, _1079);
    float _1083 = _1061 * _1029;
    float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1087 = -_1071;
    float _1089 = fma(_1055, _1085, _1087);
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1093 = -_1075;
    float _1095 = fma(_1059, _1091, _1093);
    float _1097 = _1081 * _1081;
    float _1099 = _1031 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1101 = fma(_489, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1067);
    float _1103 = _971 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1105 = fma(_1089, _1089, _1097);
    float _1107 = _369 * _1099;
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1111 = fma(_1095, _1095, _1105);
    float _1113 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1115 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1117 = _389 * _1109;
    float _1119 = _1103 * _1113;
    float _1121 = rsqrt(_1111);
    float _1123 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1125 = _1107 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1127 = _1119 * _1055;
    float _1129 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1115);
    float _1131 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1123);
    float _1133 = fma(_1117, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1125);
    float _1135 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1137 = _1119 * _1057;
    float _1139 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1131);
    float _1141 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1133);
    float _1143 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1129);
    float _1145 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1139);
    float _1147 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1141);
    float _1149 = fma(_1051, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1143);
    float _1151 = _1081 * _1121;
    float _1153 = _1089 * _1121;
    float _1155 = _1095 * _1121;
    float _1157 = _1147 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1159 = _1057 * _1151;
    float _1161 = fma(_1083, _1153, _1137);
    float _1163 = fma(_1083, _1155, _1127);
    float _1165 = _1145 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1167 = -_1159;
    float _1169 = fma(_1059, _1153, _1167);
    float _1171 = _1059 * _1155;
    float _1173 = _1149 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1175 = _1119 * _1059;
    float _1177 = fma(_1135, _1169, _1163);
    float _1179 = -_1171;
    float _1181 = fma(_1055, _1151, _1179);
    float _1183 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1185 = _1055 * _1153;
    float _1187 = _1157 + _1177;
    float _1189 = fma(_1135, _1181, _1161);
    float _1191 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1183);
    float _1193 = fma(_1083, _1151, _1175);
    float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1197 = _1187 + _1195;
    float _1199 = _1165 + _1189;
    float _1201 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1191);
    float _1203 = -_1185;
    float _1205 = fma(_1057, _1155, _1203);
    float _1207 = _1197 * _1197;
    float _1209 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1211 = _1199 + _1209;
    float _1213 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1215 = fma(_1135, _1205, _1193);
    float _1217 = _1155;
    float _1219 = _1083;
    float _1221 = _1119;
    float _1223 = _1199;
    float _1225 = _1205;
    float _1227 = _1197;
    if (_1047)
    {
        _1217 = 1.0;
    }
    float _1229 = _1217;
    float _1231 = fma(_1211, _1211, _1207);
    float _1233 = _1173 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1235 = _1173 + _1215;
    float _1237 = sqrt(_1231);
    float _1239 = fma(_1165, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1233);
    float _1241 = fma(_1157, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1239);
    float _1243 = 1.0 / _1213;
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1247 = _1245 + _1213;
    bool _1249 = _1237 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1261 = _1259 != 0;
    float _1263 = _1247 * _1243;
    float _1265 = _1263 * 0.5;
    bool _1267 = !_1257;
    int _1269 = _1267 ? 0 : 1;
    bool _1271 = !_1253;
    int _1273 = _1271 ? 0 : 1;
    bool _1275 = !_1261;
    int _1277 = _1275 ? 0 : 1;
    float _1279 = _1247;
    float _1281 = _1235;
    float _1283 = _1229;
    if (!_1249)
    {
        _1279 = _1199;
    }
    float _1285 = _1279;
    float _1287 = _1285;
    if (!_1249)
    {
        _1219 = _1187;
    }
    float _1289 = _1219;
    float _1291 = _1289;
    if (!_1249)
    {
        _1221 = _1235;
    }
    float _1293 = _1221;
    bool _1295 = !_1249;
    float _1297 = _1293;
    if (!_1295)
    {
        float _1299 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1303 = _1237 + _1301;
        float _1305 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1307 = rsqrt(_1231);
        float _1309 = _1303 * _1299;
        float _1311 = _1309 * 0.15915493667125701904296875;
        float _1313 = _1311 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = _1311 * 6.283185482025146484375;
        float _1319 = sin(_1317);
        float _1321 = _1315 + (-1.0);
        float _1323 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = fma(_1319, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1327 = fma(_1235, _1315, _1323);
        float _1329 = _1307 * _1325;
        float _1331 = fma(_1211, _1329, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1333 = fma(_1197, _1329, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1297 = _1327;
        _1287 = _1331;
        _1291 = _1333;
    }
    float _1335 = _1297;
    float _1337 = _1287;
    float _1339 = _1291;
    if (!_1047)
    {
        float _1341 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1343 = _1341 * 0.15915493667125701904296875;
        float _1345 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1347 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1349 = fma(_1265, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1347);
        float _1351 = _1343 * 6.283185482025146484375;
        float _1353 = cos(_1351);
        float _1355 = _1345 * 0.15915493667125701904296875;
        float _1357 = _1343 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1353;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1349;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1373;
        float _1383 = 1.0 / _1379;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1387 = _1375 * _1385;
        float _1389 = _1371 * _1381;
        float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1393 = fma(_1389, _1387, _1391);
        float _1395 = _1393 * _1383;
        float _1397 = precise::clamp(_1395, 0.0, 1.0);
        _1281 = _1383;
        _1223 = _1355;
        _1283 = _1397;
    }
    float _1399 = _1281;
    float _1401 = _1223;
    float _1403 = _1283;
    float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1407 = _1335 + _1405;
    float _1409 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1411 = _1337 + _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1415 = _1339 + _1413;
    float _1417 = _1407 * _1407;
    float _1419 = fma(_1411, _1411, _1417);
    float _1421 = fma(_1415, _1415, _1419);
    float _1423 = rsqrt(_1421);
    float _1425 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1427 = _1411 * _1425;
    float _1429 = _1415 * _1425;
    float _1431 = _1427 * _1427;
    float _1433 = _1429 * _1429;
    float _1435 = _1431 + _1433;
    float _1437 = sqrt(_1435);
    bool _1439 = _1437 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1443 = _1437 + _1441;
    float _1445 = _1423;
    float _1447 = _1435;
    float _1449 = _1443;
    float _1451 = _1399;
    float _1453 = _1407;
    float _1455 = _1401;
    if (_1439)
    {
        float _1457 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1445 = _1457;
    }
    float _1459 = _1445;
    if (_1439)
    {
        float _1461 = rsqrt(_1435);
        _1447 = _1461;
    }
    float _1463 = _1447;
    if (_1439)
    {
        float _1465 = _1443 * _1459;
        _1449 = _1465;
    }
    float _1467 = _1449;
    if (_1439)
    {
        float _1469 = _1467 * 0.15915493667125701904296875;
        _1451 = _1469;
    }
    float _1471 = _1451;
    float _1473 = _1415;
    if (_1439)
    {
        float _1475 = _1471 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        _1473 = _1477;
    }
    float _1479 = _1473;
    float _1481 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1483 = precise::max(0.0, _1481);
    float _1485 = _1459;
    float _1487 = _1483;
    if (_1439)
    {
        float _1489 = _1471 * 6.283185482025146484375;
        float _1491 = cos(_1489);
        _1485 = _1491;
    }
    float _1493 = _1485;
    float _1495 = -_1425;
    float _1497 = -_1483;
    float _1499 = fma(_1407, _1495, _1497);
    if (_1439)
    {
        float _1501 = _1499 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1453 = _1501;
    }
    float _1503 = _1453;
    float _1505 = _1479;
    float _1507 = _1503;
    if (_1439)
    {
        float _1509 = fma(_1479, _1503, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1455 = _1509;
    }
    float _1511 = _1455;
    float _1513 = _1511;
    if (!_1439)
    {
        _1505 = _1427;
    }
    float _1515 = _1505;
    float _1517 = _1515;
    if (!_1439)
    {
        _1507 = _1499;
    }
    float _1519 = _1507;
    float _1521 = _1519;
    float _1523 = _1493;
    if (_1439)
    {
        float _1525 = _1493 + (-1.0);
        _1487 = _1525;
    }
    float _1527 = _1487;
    float _1529 = _1527;
    if (_1439)
    {
        float _1531 = _1463 * _1511;
        _1225 = _1531;
    }
    float _1533 = _1225;
    if (!_1439)
    {
        _1513 = _1431;
    }
    float _1535 = _1513;
    float _1537 = sqrt(_1421);
    float _1539 = _1535;
    if (_1439)
    {
        float _1541 = _1527 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1227 = _1541;
    }
    float _1543 = _1227;
    if (_1439)
    {
        float _1545 = _1427 * _1533;
        _1517 = _1545;
    }
    float _1547 = _1517;
    if (!_1439)
    {
        _1529 = _1429;
    }
    float _1549 = _1529;
    float _1551 = _1549;
    if (_1439)
    {
        float _1553 = _1429 * _1533;
        _1551 = _1553;
    }
    float _1555 = _1551;
    if (_1439)
    {
        float _1557 = fma(_1499, _1493, _1543);
        _1521 = _1557;
    }
    float _1559 = _1521;
    if (_1439)
    {
        float _1561 = _1547 * _1547;
        _1539 = _1561;
    }
    float _1563 = _1539;
    if (!_1439)
    {
        _1523 = _1433;
    }
    float _1565 = _1523;
    float _1567 = _1565;
    if (_1439)
    {
        float _1569 = _1555 * _1555;
        _1567 = _1569;
    }
    float _1571 = _1567;
    float _1573 = fma(_1559, _1559, _1563);
    float _1575 = _1573 + _1571;
    float _1577 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1581 = fma(_1537, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1579);
    float _1583 = precise::clamp(_1581, 0.0, 1.0);
    float _1585 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1587 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1589 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1577);
    float _1591 = rsqrt(_1575);
    float _1593 = -_1583;
    float _1595 = _1593 + 1.0;
    float _1597 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1599 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1589);
    float _1601 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1585);
    float _1603 = _1335 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1605 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1607 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1597);
    float _1609 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1601);
    float _1611 = abs(_1595);
    float _1613 = log2(_1611);
    float _1615 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1603);
    float _1617 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1607);
    float _1619 = _1609 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1621 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1623 = fma(_1339, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1615);
    float _1625 = _1591 * _1547;
    float _1627 = _1617 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1629 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1631 = _1591 * _1559;
    float _1633 = _1625 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1635 = _1591 * _1555;
    float _1637 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1629);
    float _1639 = -_1621;
    float _1641 = fma(_1639, _1587, 1.0);
    float _1643 = -_1633;
    float _1645 = fma(_1631, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1643);
    float _1647 = _1623 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1649 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1637);
    float _1651 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1653 = -_1635;
    float _1655 = fma(_1653, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1645);
    float _1657 = log2(_1641);
    float _1659 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1649);
    float _1661 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1663 = fma(_1655, -0.5, 0.5);
    float _1665 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1667 = fma(_1655, 0.5, 0.5);
    float _1669 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1661);
    float _1671 = _1631 + 1.0;
    float _1673 = exp2(_1651);
    float _1675 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1665);
    float _1677 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1669);
    float _1679 = fma(_1667, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1681 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1675);
    float _1683 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1677);
    float _1685 = fma(_1667, _1679, -0.212114393711090087890625);
    float _1687 = 1.0 / _1659;
    float _1689 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1681);
    float _1691 = _1657 * 0.693147182464599609375;
    float _1693 = fma(_1667, _1685, 1.570728778839111328125);
    float _1695 = _1691 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1697 = sqrt(_1663);
    float _1699 = -_1631;
    float _1701 = fma(_1673, _1671, _1699);
    float _1703 = _1683 * _1687;
    float _1705 = _1689 * _1687;
    float _1707 = fma(_1703, 0.5, 0.5);
    float _1709 = fma(_1705, -0.5, 0.5);
    float _1711 = _1697 * 0.636619746685028076171875;
    float _1713 = fma(_1701, 0.5, 0.5);
    float3 _5582 = float3(_1707, _1709, _1695);
    float _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5582, float3(0.0), isnan(_5582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5582, float3(0.0), isnan(_5582)), level(0.0)).x;
    float3 _5593 = float3(_1707, _1709, _1695);
    float4 _1718 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5593, float3(0.0), isnan(_5593)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5593, float3(0.0), isnan(_5593)), level(0.0)).xyzw;
    float _1720 = _1718.x;
    float _1722 = _1718.y;
    float _1724 = _1718.z;
    float _1726 = _1718.w;
    float _1728 = -_1693;
    float _1730 = fma(_1711, _1728, 1.0);
    float2 _5615 = float2(_1730, _1713);
    float3 _1734 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5615, float2(0.0), isnan(_5615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5615, float2(0.0), isnan(_5615)), level(0.0)).xyz;
    float _1736 = _1734.x;
    float _1738 = _1734.y;
    float _1740 = _1734.z;
    float _1742 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1744 = int(_1742);
    float _1746 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1748 = int(_1746);
    float _1750 = float(_1744);
    float _1752 = 1.0 / _1005;
    float _1754 = float(uint(_1748));
    float _1756 = 1.0 / _1750;
    int _1758 = ~_1748;
    int _1760 = _1758 + 1;
    float _1762 = 1.0 / _1754;
    float _1764 = _117 * _1756;
    float _1766 = trunc(_1764);
    int _1768 = int(_1766);
    int _1770 = as_type<int>(_1762) + (-2);
    float _1772 = float(uint(_1768));
    float _1774 = as_type<float>(_1770) * _1772;
    int _1776 = ~_1748;
    int _1778 = _1776 + 1;
    float _1780 = trunc(_1774);
    float _1782 = precise::max(_1780, 0.0);
    uint _1785 = uint(_1782);
    float _1787 = in.m_54.x;
    float _1789 = in.m_54.y;
    float _1791 = in.m_54.z;
    float _1793 = in.m_54.w;
    int _1795 = _1778 * int(_1785);
    int _1797 = _1795 + _1768;
    float _1799 = float(uint(_1797));
    bool _1801 = _1793 > 0.5;
    float _1803 = as_type<float>(_1770) * _1799;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1807 = _1805 != 0;
    float _1809 = trunc(_1803);
    float _1811 = precise::max(_1809, 0.0);
    uint _1813 = uint(_1811);
    bool _1815 = !_1807;
    float _1817 = _1815 ? 7.345489978790283203125 : 1.0;
    float _1819 = _1817 * _1787;
    int _1821 = _1748 + (-1);
    float _1823 = floor(_1819);
    int _1825 = int(_1785) + int(_1813);
    float _1827 = float(_1748);
    float _1829 = float(_1768);
    int _1831 = _1760 * _1825;
    int _1833 = _1831 + _1768;
    bool _1835 = _1829 >= _1827;
    bool _1837 = isnan(_1829);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1827);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    bool _1847 = uint(_1833) >= uint(_1748);
    float _1849 = -_1823;
    float _1851 = _1819 + _1849;
    float _1853 = trunc(_1845);
    int _1855 = int(_1853);
    bool _1857 = !_1847;
    int _1859 = _1857 ? 0 : (-1);
    bool _1861 = _1748 == 0;
    int _1863 = ~_1825;
    int _1865 = _1863 + _1859;
    int _1867 = _1865 + 1;
    float _1869 = _1851 * _1827;
    float _1871 = _117 * _1827;
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1875 = _1873 != 0;
    int _1877 = _1748 * _1867;
    int _1879 = _1877 + _1768;
    float _1881 = _1871 * _1752;
    float _1883 = trunc(_1869);
    int _1885 = int(_1883);
    bool _1887 = !_1861;
    int _1889 = _1887 ? _1879 : (-1);
    int _1891 = ~_1855;
    int _1893 = _1891 + 1;
    int _1895 = _1893 + 1;
    bool _1897 = !_1875;
    int _1899 = _1897 ? 0 : 1;
    float _1901 = trunc(_1881);
    int _1903 = int(_1901);
    int _1905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1907 = _1905 != 0;
    int _1909 = _1889 * _1895;
    int _1911 = abs(_1269);
    int _1913 = abs(_1899);
    int _1915 = _1855 * _1821;
    int _1917 = _1915 + _1909;
    int _1919 = abs(_1273);
    int _1921 = _1885 * _1913;
    int _1923 = _1921 + _1768;
    bool _1925 = !_1907;
    int _1927 = _1925 ? 0 : 1;
    int _1929 = abs(_1277);
    int _1931 = _1917 * _1911;
    int _1933 = abs(_1927);
    int _1935 = _1903 * _1919;
    int _1937 = _1935 + _1931;
    int _1939 = ~_1748;
    int _1941 = _1939 + 1;
    int _1943 = _1923 * _1929;
    int _1945 = _1943 + _1937;
    int _1947 = ~_1748;
    int _1949 = _1947 + 1;
    int _1951 = ~_1748;
    int _1953 = _1951 + 1;
    int _1955 = _1885 * _1933;
    int _1957 = _1955 + _1945;
    float _1959 = float(uint(_1957));
    float _1961 = as_type<float>(_1770) * _1959;
    float _1963 = trunc(_1961);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = _1941 * int(_1967);
    int _1971 = _1969 + _1957;
    float _1973 = float(uint(_1971));
    float _1975 = as_type<float>(_1770) * _1973;
    float _1977 = trunc(_1975);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    int _1983 = ~_1748;
    int _1985 = _1983 + 1;
    int _1987 = int(_1967) + int(_1981);
    float _1989 = float(uint(_1923));
    int _1991 = _1949 * _1987;
    int _1993 = _1991 + _1957;
    float _1995 = as_type<float>(_1770) * _1989;
    bool _1997 = uint(_1993) >= uint(_1748);
    float _1999 = trunc(_1995);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    bool _2005 = !_1997;
    int _2007 = _2005 ? 0 : (-1);
    int _2009 = ~_1987;
    int _2011 = _2009 + _2007;
    int _2013 = _2011 + 1;
    int _2015 = _1748 * _2013;
    int _2017 = _2015 + _1957;
    int _2019 = _1985 * int(_2003);
    int _2021 = _2019 + _1923;
    bool _2023 = !_1861;
    int _2025 = _2023 ? _2017 : (-1);
    int _2027 = _2025 >> 31;
    float _2029 = float(uint(_2021));
    int _2031 = _2027 & 3;
    int _2033 = _2025 & 3;
    bool _2035 = _2033 != 0;
    float _2037 = as_type<float>(_1770) * _2029;
    int _2039 = _2025 + _2031;
    bool _2041 = uint(_2033) > 1u;
    int _2043 = _2039 >> 2;
    float _2045 = trunc(_2037);
    float _2047 = precise::max(_2045, 0.0);
    uint _2049 = uint(_2047);
    int _2051 = _2025 & 3;
    bool _2053 = _2051 != 0;
    int _2055 = _2043 << 4;
    int _2057 = _2055 + 368;
    int _2059 = _2053 ? 0 : 1;
    uint _2061 = uint(int(uint(_2057) >> uint(2)));
    uint _2063 = uint(int(uint(int(_2061)) >> uint(2)));
    int _2065 = int(_2061) & 3;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[int(_2063)][_2065];
    int _2069 = int(_2061) + 1;
    uint _2071 = uint(int(uint(_2069) >> uint(2)));
    int _2073 = _2069 & 3;
    float _2075 = (*spvDescriptorSet0.vp_c9)._m0[int(_2071)][_2073];
    bool _2077 = _2033 != 3;
    int _2079 = ~_2059;
    int _2081 = _2079 + 1;
    int _2083 = _2081 + 1;
    int _2085 = _2083;
    float _2087 = _1791;
    if (!_2041)
    {
        int _2089 = ~_2059;
        int _2091 = _2089 + 1;
        _2085 = _2091;
    }
    int _2093 = _2085;
    int _2095 = _2057 + 8;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    uint _2099 = uint(int(uint(int(_2097)) >> uint(2)));
    int _2101 = int(_2097) & 3;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[int(_2099)][_2101];
    int _2105 = int(_2097) + 1;
    uint _2107 = uint(int(uint(_2105) >> uint(2)));
    int _2109 = _2105 & 3;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[int(_2107)][_2109];
    int _2113 = int(_2003) + int(_2049);
    bool _2115 = uint(_2033) >= 2u;
    int _2117 = abs(_2093);
    int _2119 = _1953 * _2113;
    int _2121 = _2119 + _1923;
    int _2123 = _2115 ? 0 : 1;
    int _2125 = ~_2117;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    bool _2131 = _2033 != 3;
    bool _2133 = !_2035;
    int _2135 = _2133 ? 0 : 1;
    int _2137 = ~_2123;
    int _2139 = _2137 + 1;
    int _2141 = _2139 + 1;
    int _2143 = _2141;
    if (_2077)
    {
        int _2145 = ~_2123;
        int _2147 = _2145 + 1;
        _2143 = _2147;
    }
    int _2149 = _2143;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2153 = _2151 != 0;
    int _2155 = abs(_2135);
    float _2157 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2159 = int(_2157);
    int _2161 = abs(_2149);
    bool _2163 = !_2153;
    int _2165 = _2163 ? 0 : 1;
    bool _2167 = uint(_2121) >= uint(_1748);
    int _2169 = abs(_2165);
    int _2171 = ~_2161;
    int _2173 = _2171 + 1;
    int _2175 = _2173 + 1;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2179 = _2177 != 0;
    int _2181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2183 = _2181 != 0;
    float _2185 = float(uint(_2159));
    int _2187 = _2129 * as_type<int>(_2075);
    bool _2189 = !_2131;
    int _2191 = _2189 ? 0 : (-1);
    bool _2193 = _1789 > 0.5;
    int _2195 = abs(_2191);
    int _2197 = ~_2155;
    int _2199 = _2197 + 1;
    int _2201 = _2199 + 1;
    bool _2203 = !_2167;
    int _2205 = _2203 ? 0 : (-1);
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2209 = _2207 != 0;
    int _2211 = _2201 * as_type<int>(_2067);
    int _2213 = _2211 + _2187;
    int _2215 = ~_2195;
    int _2217 = _2215 + 1;
    int _2219 = _2217 + 1;
    int _2221 = _2175 * as_type<int>(_2103);
    int _2223 = _2221 + _2213;
    int _2225 = ~_2169;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    int _2231 = abs(_2159);
    int _2233 = _2219 * as_type<int>(_2111);
    int _2235 = _2233 + _2223;
    int _2237 = ~_2113;
    int _2239 = _2237 + _2205;
    int _2241 = _2239 + 1;
    float _2243 = 1.0 / _2185;
    int _2245 = _2235 * _2229;
    float _2247 = float(uint(_2231));
    int _2249 = _1748 * _2241;
    int _2251 = _2249 + _1923;
    float _2253 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2255 = 1.0 / _2247;
    bool _2257 = !_1861;
    int _2259 = _2257 ? _2251 : (-1);
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2263 = _2261 != 0;
    float _2265 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2267 = _2259 * _2169;
    int _2269 = _2267 + _2245;
    float _2271 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2273 = _2271 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2275 = as_type<int>(_2243) + (-2);
    float _2277 = -_2253;
    float _2279 = fma(_2265, 2.0, _2277);
    float _2281 = 1.0 / _2273;
    int _2283 = abs(_2269);
    float _2285 = -_117;
    float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2279);
    float _2289 = float(uint(_2269));
    int _2291 = as_type<int>(_2255) + (-2);
    float _2293 = float(uint(_2283));
    float _2295 = as_type<float>(_2275) * _2289;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2299 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2301 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2301;
    float _2305 = as_type<float>(_2291) * _2293;
    int _2307 = ~_2159;
    int _2309 = _2307 + 1;
    float _2311 = trunc(_2295);
    float _2313 = precise::max(_2311, 0.0);
    uint _2315 = uint(_2313);
    float _2317 = fma(_2299, -2.0, _2297);
    int _2319 = ~_2231;
    int _2321 = _2319 + 1;
    float _2323 = _2303 * _2281;
    float _2325 = -_199;
    int _2327 = _1801 ? as_type<int>(_2325) : as_type<int>(_199);
    float _2329 = -_199;
    int _2331 = _2193 ? as_type<int>(_2329) : as_type<int>(_199);
    float _2333 = trunc(_2305);
    float _2335 = precise::max(_2333, 0.0);
    uint _2337 = uint(_2335);
    bool _2339 = !_2179;
    float _2341 = _2339 ? _199 : as_type<float>(_2327);
    bool _2343 = !_2183;
    float _2345 = _2343 ? _199 : as_type<float>(_2331);
    bool _2347 = _1787 > 0.5;
    bool _2349 = _1791 > 0.5;
    int _2351 = _2309 * int(_2315);
    int _2353 = _2351 + _2269;
    float _2355 = -_193;
    int _2357 = _2349 ? as_type<int>(_2355) : as_type<int>(_193);
    float _2359 = float(uint(_2353));
    float _2361 = -_193;
    float _2363 = _2347 ? _2361 : _193;
    int _2365 = _2321 * int(_2337);
    int _2367 = _2365 + _2283;
    float _2369 = as_type<float>(_2275) * _2359;
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2373 = !_2209;
    float _2375 = _2373 ? _193 : _2363;
    float _2377 = float(uint(_2367));
    float _2379 = fma(_1787, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2371);
    float _2381 = _2363;
    float _2383 = _2377;
    if (!_1807)
    {
        _2381 = _1789;
    }
    float _2385 = _2381;
    float _2387 = trunc(_2369);
    float _2389 = precise::max(_2387, 0.0);
    uint _2391 = uint(_2389);
    float _2393 = _2385;
    if (_1807)
    {
        _2393 = _1787;
    }
    float _2395 = _2393;
    float _2397 = as_type<float>(_2291) * _2377;
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2401 = _1007 + _2399;
    bool _2403 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2405 = isnan(_1007);
    bool _2407 = _2403 || _2405;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2411 = _2407 || _2409;
    float _2413 = float(_2411);
    bool _2415 = !_2263;
    float _2417 = _2415 ? _193 : as_type<float>(_2357);
    float _2419 = trunc(_2397);
    float _2421 = precise::max(_2419, 0.0);
    uint _2423 = uint(_2421);
    float _2425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2427 = fma(_2323, _2401, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2429 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2431 = isnan(_1007);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    float _2441 = -_2413;
    float _2443 = _2441 + 1.0;
    float _2445 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2425);
    if (!_1807)
    {
        _2383 = _1791;
    }
    float _2447 = _2383;
    float _2449 = _2439 * _2443;
    float _2451 = _2447;
    if (_1807)
    {
        _2451 = _1789;
    }
    float _2453 = _2451;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1807)
    {
        _2087 = _1789;
    }
    float _2457 = _2087;
    float _2459 = _2427 * _2449;
    int _2461 = int(_2315) + int(_2391);
    float _2463 = fma(_2453, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2455);
    float _2465 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2467 = int(_2337) + int(_2423);
    float _2469 = -_2439;
    float _2471 = _2469 + 1.0;
    int _2473 = ~_2159;
    int _2475 = _2473 + 1;
    float _2477 = fma(_2471, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2459);
    float _2479 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2481 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2445);
    int _2483 = ~_2231;
    int _2485 = _2483 + 1;
    float _2487 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2479);
    float _2489 = _2457 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2491 = _2475 * _2461;
    int _2493 = _2491 + _2269;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2497 = _2395 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2499 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2501 = _2485 * _2467;
    int _2503 = _2501 + _2283;
    bool _2505 = uint(_2493) >= uint(_2159);
    float _2507 = -_2495;
    float _2509 = fma(_2497, 2.0, _2507);
    float _2511 = fma(_2489, -2.0, _2499);
    float _2513 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2379);
    bool _2515 = !_2505;
    int _2517 = _2515 ? 0 : (-1);
    float _2519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2521 = _2465 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2523 = _2417 + 0.5;
    float _2525 = -_117;
    float _2527 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2509);
    float _2529 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2317);
    float _2531 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2487);
    float _2533 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2463);
    float _2535 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2511);
    int _2537 = ~_2461;
    int _2539 = _2537 + _2517;
    int _2541 = _2539 + 1;
    float _2543 = fma(_2521, _2523, _2527);
    bool _2545 = uint(_2503) >= uint(_2231);
    float _2547 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2477);
    int _2549 = _2269 ^ _2159;
    int _2551 = _2159 * _2541;
    int _2553 = _2551 + _2269;
    bool _2555 = !_2545;
    int _2557 = _2555 ? 0 : (-1);
    float _2559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _2561 = uint(int(uint(_2549) >> uint(31)));
    float _2563 = _2519 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2565 = _2159 == 0;
    bool _2567 = _2159 == 0;
    float _2569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2571 = ~_2557;
    int _2573 = _2467 + _2571;
    int _2575 = _2573 + 1;
    int _2577 = ~int(_2561);
    int _2579 = _2577 + 1;
    float _2581 = _2341 + (-0.5);
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2585 = _2575 ^ _2579;
    float _2587 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2589 = -_2563;
    float _2591 = -_2535;
    float _2593 = fma(_2589, _2581, _2591);
    int _2595 = ~_2579;
    int _2597 = _2595 + _2585;
    int _2599 = _2597 + 1;
    float _2601 = _1619 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2603 = !_2565;
    int _2605 = _2603 ? _2553 : (-1);
    float _2607 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2609 = !_2567;
    int _2611 = _2609 ? _2599 : (-1);
    float _2613 = _2587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2615 = float(_2605);
    float _2617 = _2559 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2619 = float(_2611);
    float _2621 = _2583 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2623 = _2607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2625 = _2547 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2627 = fma(_1627, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2601);
    float _2629 = -_2529;
    float _2631 = fma(_2617, _2619, _2629);
    float _2633 = _1613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    out.m_58.x = _2621;
    out.m_58.y = _2623;
    out.m_58.z = _2613;
    out.m_58.w = _2625;
    float _2637 = fma(_1605, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2627);
    float _2639 = _2375 + 0.5;
    float _2641 = fma(_2635, _2615, _2287);
    float _2643 = exp2(_2633);
    float _2645 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2637);
    bool _2647 = _1403 > 0.0;
    bool _2649 = isnan(_1403);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = fma(_2635, _2639, _2641);
    float _2659 = _1659 * 0.5;
    float _2661 = _2645 + _1659;
    out.gl_Position.x = _1683;
    out.gl_Position.y = _1689;
    out.gl_Position.z = _2645;
    out.gl_Position.w = _1659;
    float _2663 = _2661 * 0.5;
    float _2665 = -_2531;
    float _2667 = _2665 + 1.0;
    float _2669 = _2345 + (-0.5);
    float _2671 = -_2533;
    float _2673 = _2671 + 1.0;
    float _2675 = -_2667;
    float _2677 = fma(_2417, _2675, _2543);
    float _2679 = -_2617;
    float _2681 = fma(_2679, _2669, _2631);
    float _2683 = -_2643;
    float _2685 = _2683 + 1.0;
    float _2687 = -_2481;
    float _2689 = _2687 + 1.0;
    float _2691 = -_2513;
    float _2693 = _2691 + 1.0;
    float _2695 = _1683 + _1659;
    float _2697 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2699 = fma(_2345, _2689, _2681);
    float _2701 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2703 = -_2693;
    float _2705 = fma(_2375, _2703, _2657);
    float _2707 = _2697 * _1715;
    float _2709 = -_2697;
    float _2711 = _2709 + 1.0;
    float _2713 = fma(_2341, _2673, _2593);
    float _2715 = _1726 * _2707;
    float _2717 = _1740 * _2707;
    float _2719 = _2695 * 0.5;
    float _2721 = fma(_1689, -0.5, _2659);
    float _2723 = fma(_1736, _2715, _1720);
    float _2725 = fma(_1738, _2715, _1722);
    float _2727 = _2701 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2729 = _1726 * _2711;
    float _2731 = fma(_1726, _2717, _1724);
    out.m_60.x = _2719;
    out.m_60.y = _2721;
    out.m_60.z = _2663;
    out.m_60.w = _1659;
    out.m_62.x = _2705;
    out.m_62.y = _2699;
    out.m_62.z = _2677;
    out.m_62.w = _2713;
    out.m_45.x = _2727;
    out.m_64.x = _2723;
    out.m_64.y = _2725;
    out.m_64.z = _2731;
    out.m_64.w = _2729;
    if (_2655)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2733 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2733;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

