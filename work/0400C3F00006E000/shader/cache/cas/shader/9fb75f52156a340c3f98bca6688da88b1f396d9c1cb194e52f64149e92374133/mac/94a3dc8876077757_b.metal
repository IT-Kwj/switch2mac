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
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1949 = false;
    bool _1239 = false;
    bool _1059 = false;
    bool _945 = false;
    bool _835 = false;
    bool _577 = false;
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
        float _2737 = as_type<float>(_101);
        out.gl_Position.z = _2737;
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
        float _2806 = as_type<float>(_137);
        out.gl_Position.z = _2806;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _161 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _159);
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _161);
    float _167 = _161;
    float _169 = _141;
    if (!_157)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_157)
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
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_157;
    float _205 = _181;
    float _207 = _195;
    if (!_203)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _141 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _141);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _237;
        _207 = _227;
    }
    float _239 = _205;
    float _241 = _207;
    bool _243 = !_157;
    float _245 = _241;
    float _247 = _239;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _141 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _169 = _267;
        _245 = _255;
    }
    float _269 = _169;
    float _271 = _245;
    float _273 = 0.0;
    float _275 = _271;
    if (!_157)
    {
        float _277 = _119 * _119;
        float _279 = _277 * 0.5;
        _273 = _279;
    }
    float _281 = _273;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _275 = _119;
    }
    float _289 = _275;
    float _291 = fma(_269, _143, _283);
    float _293 = _289;
    if (!_157)
    {
        float _295 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _295;
    }
    float _297 = _247;
    bool _299 = !_157;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _119 * _305;
        float _315 = 1.0 / _309;
        float _317 = _311 * 0.693147182464599609375;
        float _319 = exp2(_313);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _119);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_157;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _119 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = fma(_269, _145, _285);
    float _363 = fma(_269, _147, _287);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _145, _359);
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_357, _143, _365);
    float _373 = -_367;
    float _375 = _361 + _373;
    float _377 = fma(_357, _147, _369);
    float _379 = -_371;
    float _381 = _291 + _379;
    float _383 = _375 * _375;
    float _385 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _387 = -_377;
    float _389 = _363 + _387;
    float _391 = sqrt(_201);
    float _393 = fma(_381, _381, _383);
    float _395 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _385);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _399 = fma(_389, _389, _393);
    float _401 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _403 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _395);
    float _405 = sqrt(_165);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _397);
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _413 = in.m_54.w;
    float _415 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _401);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].y, _407);
    float _419 = sqrt(_399);
    float _421 = in.m_44.x;
    float _423 = in.m_44.y;
    float _425 = in.m_44.z;
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].x, _415);
    float _429 = _391 * _417;
    float _431 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _433 = sqrt(_403);
    float _435 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _437 = _405 * _427;
    float _439 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _411);
    float _441 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].z, _435);
    float _443 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _445 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _447 = _419 >= 9.9999999747524270787835121154785e-07;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan(9.9999999747524270787835121154785e-07);
    bool _455 = _451 || _453;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _431);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _443);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _445);
    float _463 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].w, _439);
    float _465 = _433 * _441;
    float _467 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _469 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _473 = fma(_363, _413, _425);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].w, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].w, _469);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].w, _471);
    float _481 = fma(_291, _413, _421);
    float _483 = fma(_361, _413, _423);
    float _485 = _363;
    float _487 = _463;
    float _489 = _475;
    if (_455)
    {
        _485 = _475;
    }
    float _491 = _485;
    float _493 = _491;
    if (_455)
    {
        _487 = _477;
    }
    float _495 = _487;
    float _497 = _495;
    if (_455)
    {
        _489 = _479;
    }
    float _499 = _489;
    float _501 = _499;
    if (!_455)
    {
        bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _505 = !_503;
        if (!_505)
        {
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _511 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _513);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _515);
            float _523 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _517);
            float _527 = _391 * _519;
            float _529 = _405 * _521;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _523);
            float _533 = _433 * _525;
            float _535 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _537 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _541 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _531);
            float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
            float _545 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
            float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _543);
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _547);
            float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].w, _549);
            float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].w, _551);
            float _559 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].w, _553);
            float _561 = _555 * _555;
            float _563 = fma(_557, _557, _561);
            float _565 = fma(_559, _559, _563);
            float _567 = rsqrt(_565);
            float _569 = _567 * 9.9999999747524270787835121154785e-07;
            float _571 = _557 * _569;
            float _573 = _555 * _569;
            float _575 = _559 * _569;
            _497 = _573;
            _493 = _571;
            _501 = _575;
            _577 = true;
        }
        else
        {
            float _579 = _145 * _145;
            float _581 = fma(_143, _143, _579);
            float _583 = fma(_147, _147, _581);
            float _585 = sqrt(_583);
            bool _587 = _585 >= 9.9999999747524270787835121154785e-07;
            bool _589 = isnan(_585);
            bool _591 = _587 || _589;
            bool _593 = isnan(9.9999999747524270787835121154785e-07);
            bool _595 = _591 || _593;
            if (!_595)
            {
                float _597 = _423 * _423;
                float _599 = fma(_421, _421, _597);
                float _601 = fma(_425, _425, _599);
                float _603 = sqrt(_601);
                bool _605 = _603 >= 9.9999999747524270787835121154785e-07;
                bool _607 = isnan(_603);
                bool _609 = _605 || _607;
                bool _611 = isnan(9.9999999747524270787835121154785e-07);
                bool _613 = _609 || _611;
                if (!_613)
                {
                    float _615 = _391 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _617 = _405 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _619 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _621 = _615 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _623 = _615 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _625 = _615 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _627 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _621);
                    float _629 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _625);
                    float _633 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[25].z, _627);
                    float _635 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[24].z, _629);
                    float _637 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[26].z, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _635);
                    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _637);
                    float _645 = _639 * _639;
                    float _647 = fma(_641, _641, _645);
                    float _649 = fma(_643, _643, _647);
                    float _651 = rsqrt(_649);
                    float _653 = _651 * 9.9999999747524270787835121154785e-07;
                    float _655 = _641 * _653;
                    float _657 = _639 * _653;
                    float _659 = _643 * _653;
                    _497 = _657;
                    _493 = _655;
                    _501 = _659;
                    _577 = true;
                }
                else
                {
                    float _661 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _663 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _665 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _667 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _669 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].y, _661);
                    float _671 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].x, _663);
                    float _673 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].z, _665);
                    float _675 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].w, _667);
                    float _677 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].y, _669);
                    float _679 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].x, _671);
                    float _681 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].z, _673);
                    float _683 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].w, _675);
                    float _685 = _391 * _677;
                    float _687 = _405 * _679;
                    float _689 = _433 * _681;
                    float _691 = _685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _693 = _685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _695 = _685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].x, _691);
                    float _699 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
                    float _703 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].z, _697);
                    float _705 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].z, _699);
                    float _707 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].z, _701);
                    float _709 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].w, _703);
                    float _711 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].w, _705);
                    float _713 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].w, _707);
                    float _715 = _709 * _709;
                    float _717 = fma(_711, _711, _715);
                    float _719 = fma(_713, _713, _717);
                    float _721 = rsqrt(_719);
                    float _723 = _721 * 9.9999999747524270787835121154785e-07;
                    float _725 = _711 * _723;
                    float _727 = _709 * _723;
                    float _729 = _713 * _723;
                    _497 = _727;
                    _493 = _725;
                    _501 = _729;
                    _577 = true;
                }
            }
            else
            {
                float _731 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _733 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _735 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _737 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].y, _731);
                float _739 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].x, _733);
                float _741 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].z, _735);
                float _743 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _745 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _747 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _749 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = _391 * _743;
                float _753 = _405 * _745;
                float _755 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].w, _747);
                float _757 = _433 * _749;
                float _759 = _751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].w, _755);
                float _765 = _751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _769 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _771 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _769);
                float _777 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _771);
                float _779 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].w, _773);
                float _781 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].w, _775);
                float _783 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].w, _777);
                float _785 = _779 * _779;
                float _787 = fma(_781, _781, _785);
                float _789 = fma(_783, _783, _787);
                float _791 = rsqrt(_789);
                float _793 = _791 * 9.9999999747524270787835121154785e-07;
                float _795 = _781 * _793;
                float _797 = _779 * _793;
                float _799 = _783 * _793;
                _497 = _797;
                _493 = _795;
                _501 = _799;
            }
        }
    }
    _577 = false;
    float _801 = _497;
    float _803 = _493;
    float _805 = _501;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _809 = !_807;
    float _811 = _801;
    float _813 = _803;
    float _815 = _805;
    float _833;
    if (!_809)
    {
        float _817 = in.m_56.x;
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _821 = _817 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _825 = _823 * _819;
        float _827 = floor(_825);
        float _829 = -_827;
        float _831 = _825 + _829;
        _833 = _831;
        _835 = true;
    }
    else
    {
        float _837 = float(_85);
        float _839 = 1.0 / _837;
        float _841 = _119 * _839;
        _833 = _841;
    }
    _835 = false;
    float _843 = _833;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _847 = _843 + _845;
    float _849 = in.m_54.x;
    float _851 = in.m_54.y;
    bool _853 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _855 = isnan(_843);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _865;
    bool _869 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _871 = isnan(_843);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _885;
    float _889 = 1.0 / _867;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _893 = _879 * _883;
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _847 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _901;
    float _905 = fma(_887, _899, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _907 = fma(_903, _899, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _909 = _905 * _893;
    float _911 = _907 * _893;
    float _913 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].x, _909);
    float _915 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].y, _911);
    float _917 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[144].x, _913);
    float _919 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[144].y, _915);
    float _921 = _917 * _849;
    float _923 = _919 * _851;
    bool _925 = !_891;
    float _943;
    if (!_925)
    {
        float _927 = in.m_56.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_85);
        float _949 = 1.0 / _947;
        float _951 = _119 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _957 = _953 + _955;
    bool _959 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _961 = isnan(_953);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _971;
    bool _975 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _977 = isnan(_953);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = -_969;
    float _989 = _987 + 1.0;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _991;
    float _995 = 1.0 / _973;
    bool _997 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _999 = _985 * _989;
    float _1001 = -_985;
    float _1003 = _1001 + 1.0;
    float _1005 = _957 * _995;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1007;
    float _1011 = fma(_993, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1013;
    float _1017 = fma(_1009, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1019 = _1011 * _999;
    float _1021 = fma(_1015, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1023 = _1017 * _999;
    float _1025 = _1021 * _999;
    float _1027 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1019);
    float _1029 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1025);
    float _1031 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1023);
    float _1033 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1027);
    float _1035 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1029);
    float _1037 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1031);
    bool _1039 = !_997;
    float _1057;
    if (!_1039)
    {
        float _1041 = in.m_56.x;
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1045 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _1049 = _1047 * _1043;
        float _1051 = floor(_1049);
        float _1053 = -_1051;
        float _1055 = _1049 + _1053;
        _1057 = _1055;
        _1059 = true;
    }
    else
    {
        float _1061 = float(_85);
        float _1063 = 1.0 / _1061;
        float _1065 = _119 * _1063;
        _1057 = _1065;
    }
    _1059 = false;
    float _1067 = _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1071 = _1067 + _1069;
    float _1073 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1083 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1085 = isnan(_1067);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1099 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1101 = isnan(_1067);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1077;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1113;
    float _1117 = -_1093;
    float _1119 = _1117 + 1.0;
    bool _1121 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1123 = isnan(_1067);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1137 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = 1.0 / _1081;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1145 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1147 = 1.0 / _1097;
    float _1149 = _1115 * _1111;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1155 = _1109 * _1119;
    float _1157 = -_1109;
    float _1159 = _1157 + 1.0;
    float _1161 = fma(_1149, _1071, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1163;
    float _1167 = _1131 * _1159;
    float _1169 = _1153 * _1139;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1173 = _1067 + _1171;
    bool _1175 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1177 = isnan(_1067);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = _1161 * _1167;
    float _1189 = -_1131;
    float _1191 = _1189 + 1.0;
    float _1193 = fma(_1169, _1173, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1197 = _1067 + _1195;
    float _1199 = _1165 * _1147;
    float _1201 = -_1185;
    float _1203 = _1201 + 1.0;
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1187);
    float _1207 = fma(_1199, _1197, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1209 = _1093 * _1203;
    float _1211 = fma(_1193, _1155, _1205);
    float _1213 = fma(_1207, _1209, _1211);
    float _1215 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1213);
    float _1217 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1137;
    out.m_58.y = _1141;
    out.m_58.z = _1143;
    out.m_58.w = _1217;
    bool _1219 = !_1145;
    float _1237;
    if (!_1219)
    {
        float _1221 = in.m_56.x;
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1225 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1229 = _1227 * _1223;
        float _1231 = floor(_1229);
        float _1233 = -_1231;
        float _1235 = _1229 + _1233;
        _1237 = _1235;
        _1239 = true;
    }
    else
    {
        float _1241 = float(_85);
        float _1243 = 1.0 / _1241;
        float _1245 = _119 * _1243;
        _1237 = _1245;
    }
    _1239 = false;
    float _1247 = _1237;
    float _1249 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1251 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1253 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1255 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1257 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1249);
    float _1259 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1251);
    float _1261 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1253);
    float _1263 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1255);
    float _1265 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1257);
    float _1267 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1259);
    float _1269 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1261);
    float _1271 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1275 = _1267 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1277 = _1269 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1279 = in.m_56.x;
    float _1281 = in.m_56.y;
    float _1283 = in.m_56.z;
    float _1285 = in.m_56.w;
    float _1287 = _391 * _1273;
    float _1289 = _405 * _1275;
    float _1291 = _433 * _1277;
    float _1293 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1295);
    float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1299);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1309 = _1247 + _1307;
    float _1311 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1301);
    float _1313 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1303);
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1305);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1319 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1311);
    float _1321 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1313);
    float _1323 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1315);
    float _1325 = _1319 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1327 = _1321 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1329 = _1323 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    bool _1331 = _1285 > 0.5;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1335 = _1325 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1327 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1329 + _1341;
    float _1345 = _1335 * _1335;
    float _1347 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1349;
    float _1353 = fma(_1339, _1339, _1345);
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1357 = _1355 != 0;
    float _1359 = _801 * _801;
    float _1361 = 1.0 / _1351;
    float _1363 = fma(_1343, _1343, _1353);
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1367 = _1365 != 0;
    float _1369 = fma(_803, _803, _1359);
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1373 = _1371 != 0;
    float _1375 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1379 = _1377 != 0;
    float _1381 = rsqrt(_1363);
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1385 = _1383 != 0;
    float _1387 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1389 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1391 = fma(_1387, -2.0, _1317);
    float _1393 = fma(_805, _805, _1369);
    float _1395 = _1309 * _1361;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1401 = rsqrt(_1393);
    float _1403 = -_199;
    int _1405 = _1331 ? as_type<int>(_1403) : as_type<int>(_199);
    float _1407 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1397);
    bool _1409 = _1279 > 0.5;
    float _1411 = -_1399;
    float _1413 = fma(_1389, 2.0, _1411);
    float _1415 = _1335 * _1381;
    float _1417 = _1339 * _1381;
    float _1419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1421 = -_1415;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    float _1425 = -_1417;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1339);
    float _1429 = -_193;
    int _1431 = _1409 ? as_type<int>(_1429) : as_type<int>(_193);
    float _1433 = -_119;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1413);
    float _1437 = _1423 * _1423;
    float _1439 = _1389;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1443 = _1283;
    float _1445 = _1393;
    if (!_1357)
    {
        _1439 = _1281;
    }
    float _1447 = _1439;
    float _1449 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1391);
    float _1451 = _1401 * _805;
    float _1453 = fma(_1427, _1427, _1437);
    float _1455 = _1343 * _1381;
    float _1457 = _1401 * _803;
    float _1459 = _1401 * _801;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1463 = _1451 * _1461;
    bool _1465 = _1283 > 0.5;
    float _1467 = -_1455;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _1471 = _1447;
    if (_1357)
    {
        _1471 = _1279;
    }
    float _1473 = _1471;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1479 = _1459 * _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1483 = -_1463;
    float _1485 = fma(_1457, _1481, _1483);
    float _1487 = -_193;
    int _1489 = _1465 ? as_type<int>(_1487) : as_type<int>(_193);
    float _1491 = fma(_1469, _1469, _1453);
    if (!_1357)
    {
        _1441 = _1283;
    }
    float _1493 = _1441;
    float _1495 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1475);
    bool _1497 = _1281 > 0.5;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1501 = -_1479;
    float _1503 = fma(_1451, _1499, _1501);
    float _1505 = _1493;
    if (_1357)
    {
        _1505 = _1281;
    }
    float _1507 = _1505;
    float _1509 = _1485 * _1485;
    if (_1357)
    {
        _1443 = _1281;
    }
    float _1511 = _1443;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1515 = _1457 * _1513;
    float _1517 = sqrt(_1491);
    float _1519 = fma(_1503, _1503, _1509);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1523 = -_1515;
    float _1525 = fma(_1459, _1521, _1523);
    float _1527 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1529 = fma(_1525, _1525, _1519);
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1539;
    float _1543 = rsqrt(_1529);
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1547 = fma(_1533, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1549 = _1381 * _1517;
    float _1551 = fma(_1537, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1553 = -_199;
    int _1555 = _1497 ? as_type<int>(_1553) : as_type<int>(_199);
    float _1557 = fma(_1541, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1559 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1545);
    float _1561 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1563 = !_1367;
    float _1565 = _1563 ? _193 : as_type<float>(_1431);
    float _1567 = _1347 * _1549;
    bool _1569 = !_1379;
    float _1571 = _1569 ? _193 : as_type<float>(_1489);
    float _1573 = _1561 * _1549;
    bool _1575 = !_1373;
    float _1577 = _1575 ? _199 : as_type<float>(_1555);
    bool _1579 = !_1385;
    float _1581 = _1579 ? _199 : as_type<float>(_1405);
    float _1583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1585 = _1525 * _1543;
    float _1587 = _1485 * _1543;
    float _1589 = _1503 * _1543;
    float _1591 = _1567 * _1583;
    float _1593 = _1459 * _1585;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1597 = _1573 * _1375;
    float _1599 = _1591 * _1457;
    float _1601 = _1457 * _1587;
    float _1603 = _1591 * _1451;
    float _1605 = -_1593;
    float _1607 = fma(_1451, _1587, _1605);
    float _1609 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1611 = _1609 * 0.5;
    float _1613 = _1565 + 0.5;
    float _1615 = fma(_1597, _1589, _1599);
    float _1617 = -_1601;
    float _1619 = fma(_1459, _1589, _1617);
    float _1621 = fma(_1597, _1585, _1603);
    float _1623 = fma(_1527, _1613, _1435);
    float _1625 = fma(_1611, _1607, _1615);
    float _1627 = _1451 * _1589;
    float _1629 = fma(_1611, _1619, _1621);
    float _1631 = _1577 + (-0.5);
    float _1633 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1635 = _1327 + _1625;
    float _1637 = _1329 + _1629;
    float _1639 = _1591 * _1459;
    float _1641 = -_1633;
    float _1643 = -_1449;
    float _1645 = fma(_1641, _1631, _1643);
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1649 = _1635 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1653 = _1637 + _1651;
    float _1655 = fma(_1597, _1587, _1639);
    float _1657 = -_1627;
    float _1659 = fma(_1457, _1585, _1657);
    float _1661 = _1649 * _1649;
    float _1663 = _1653 * _1653;
    bool _1665 = _1247 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1667 = isnan(_1247);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1679 = _1247 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1681 = isnan(_1247);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1661 + _1663;
    float _1693 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1695 = -_1689;
    float _1697 = _1695 + 1.0;
    float _1699 = sqrt(_1691);
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1703 = _1675 * _1697;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1709 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1701);
    float _1711 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1713 = _1547 * _1703;
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1717 = _1551 * _1703;
    float _1719 = _1557 * _1703;
    float _1721 = -_1705;
    float _1723 = fma(_1711, 2.0, _1721);
    float _1725 = fma(_1693, -2.0, _1707);
    float _1727 = fma(_1611, _1659, _1655);
    float _1729 = -_1675;
    float _1731 = _1729 + 1.0;
    float _1733 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1735 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1737 = _1571 + 0.5;
    float _1739 = _1581 + (-0.5);
    float _1741 = -_119;
    float _1743 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1723);
    float _1745 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1725);
    float _1747 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1713);
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1717);
    float _1751 = fma(_1733, _1737, _1743);
    float _1753 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1755 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1719);
    float _1757 = _1325 + _1727;
    float _1759 = -_1753;
    float _1761 = -_1745;
    float _1763 = fma(_1759, _1739, _1761);
    bool _1765 = !_1735;
    float _1767 = _1757;
    float _1769 = _1661;
    float _1771 = _1663;
    float _1773 = _1635;
    float _1775 = _1637;
    float _1777 = _1581;
    if (!_1765)
    {
        float _1779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1783 = _1699 + _1781;
        float _1785 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1787 = rsqrt(_1691);
        float _1789 = _1783 * _1779;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1791 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = _1791 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = fma(_1795, _1785, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1803 = _1787 * _1801;
        float _1805 = _1799 + (-1.0);
        float _1807 = fma(_1649, _1803, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1809 = fma(_1653, _1803, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1811 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1815 = _1807 + _1813;
        float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1819 = _1809 + _1817;
        float _1821 = fma(_1757, _1799, _1811);
        float _1823 = _1815 * _1815;
        float _1825 = _1819 * _1819;
        _1767 = _1821;
        _1769 = _1823;
        _1771 = _1825;
        _1773 = _1807;
        _1775 = _1809;
    }
    float _1827 = _1767;
    float _1829 = _1769;
    float _1831 = _1771;
    float _1833 = _1773;
    float _1835 = _1775;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1839 = _1827 + _1837;
    float _1841 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    float _1843 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1495);
    float _1845 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1709);
    float _1847 = fma(_1839, _1839, _1829);
    float _1849 = -_1841;
    float _1851 = _1849 + 1.0;
    float _1853 = -_1843;
    float _1855 = _1853 + 1.0;
    float _1857 = -_1845;
    float _1859 = _1857 + 1.0;
    float _1861 = _1847 + _1831;
    float _1863 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1747);
    float _1865 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1749);
    float _1867 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1755);
    float _1869 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1559);
    float _1871 = -_1851;
    float _1873 = fma(_1565, _1871, _1623);
    float _1875 = sqrt(_1861);
    float _1877 = fma(_1577, _1855, _1645);
    float _1879 = -_1859;
    float _1881 = fma(_1571, _1879, _1751);
    float _1883 = -_1869;
    float _1885 = _1883 + 1.0;
    float _1887 = _1863 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1889 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1891 = _1867 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1893 = fma(_1581, _1885, _1763);
    float _1895 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1899 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1873;
    out.m_60.y = _1877;
    out.m_60.z = _1881;
    out.m_60.w = _1893;
    out.m_62.x = _1895;
    out.m_62.y = _1897;
    out.m_62.z = _1899;
    bool _1901 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1903 = isnan(_1875);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1909 = _1905 || _1907;
    float _1911 = _1899;
    float _1913 = _1897;
    if (!_1909)
    {
        _1777 = 1.0;
    }
    float _1915 = _1777;
    bool _1917 = !_1909;
    float _1919 = _1915;
    if (!_1917)
    {
        bool _1921 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1923 = isnan(_1875);
        bool _1925 = _1921 || _1923;
        bool _1927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1929 = _1925 || _1927;
        if (!_1929)
        {
            float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1933 = _1875 + _1931;
            float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1937 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1935;
            float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1941 = _1939 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1943 = 1.0 / _1937;
            float _1945 = _1933 * _1943;
            float _1947 = fma(_1945, _1941, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1919 = _1947;
            _1949 = true;
        }
        else
        {
            bool _1951 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1953 = isnan(_1875);
            bool _1955 = _1951 || _1953;
            bool _1957 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1959 = _1955 || _1957;
            if (!_1959)
            {
                float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1963 = _1875 + _1961;
                float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1967 = _1965 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1969 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1971 = _1969 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1973 = 1.0 / _1967;
                float _1975 = _1963 * _1973;
                float _1977 = fma(_1975, _1971, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1919 = _1977;
                _1949 = true;
            }
            else
            {
                _1919 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1949 = false;
    float _1979 = _1919;
    float _1981 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1983 = _1827 + _1981;
    float _1985 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1987 = _1833 + _1985;
    float _1989 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1991 = _1835 + _1989;
    float _1993 = fma(_1983, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1995 = fma(_1987, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1997 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1999 = -_1325;
    float _2001 = _1999 + _1993;
    float _2003 = -_1327;
    float _2005 = _2003 + _1995;
    float _2007 = -_1329;
    float _2009 = _2007 + _1997;
    float _2011 = _2001 * _2001;
    float _2013 = fma(_2005, _2005, _2011);
    float _2015 = fma(_2009, _2009, _2013);
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 > 0.0;
    bool _2021 = !_2019;
    float _2023 = _2017;
    float _2025 = _1993;
    float _2027 = _1995;
    float _2029 = _1997;
    float _2031 = _2015;
    if (!_2021)
    {
        bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2035 = _1869;
        if (_2033)
        {
            float _2037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2035 = _2037;
        }
        float _2039 = _2035;
        if (_2033)
        {
            _1911 = _1393;
        }
        float _2041 = _1911;
        float _2043 = _2041;
        if (_2033)
        {
            float _2045 = _2039 * _803;
            _2023 = _2045;
        }
        float _2047 = _2023;
        float _2049 = _2047;
        float _2051 = _2047;
        if (_2033)
        {
            float _2053 = _2039 * _801;
            _1445 = _2053;
        }
        float _2055 = _1445;
        float _2057 = _2055;
        if (_2033)
        {
            float _2059 = _2039 * _805;
            _1913 = _2059;
        }
        float _2061 = _1913;
        float _2063 = _2061;
        if (!_2033)
        {
            float _2065 = _119 + 1.0;
            float _2067 = _2065;
            if (!_157)
            {
                float _2069 = _2065 * _2065;
                float _2071 = _2069 * 0.5;
                _2049 = _2071;
            }
            float _2073 = _2049;
            float _2075 = _2073;
            if (!_157)
            {
                float _2077 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2075 = _2077;
            }
            float _2079 = _2075;
            bool _2081 = !_157;
            float _2083 = _2079;
            if (!_2081)
            {
                float _2085 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2087 = log2(_2085);
                float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2091 = _2089 + 1.0;
                float _2093 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2095 = _2087 * _2065;
                float _2097 = 1.0 / _2091;
                float _2099 = _2093 * 0.693147182464599609375;
                float _2101 = exp2(_2095);
                float _2103 = 1.0 / _2099;
                float _2105 = _2101 + (-1.0);
                float _2107 = -_2105;
                float _2109 = fma(_2107, _2103, _2065);
                float _2111 = _2109 * _2097;
                float _2113 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2083 = _2113;
            }
            float _2115 = _2083;
            float _2117 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2119 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2121 = !_157;
            if (!_2121)
            {
                float _2123 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2125 = log2(_2123);
                float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2129 = _2127 + 1.0;
                float _2131 = 1.0 / _2129;
                float _2133 = _2125 * _2065;
                float _2135 = exp2(_2133);
                float _2137 = -_2135;
                float _2139 = _2137 + 1.0;
                float _2141 = _2139 * _2131;
                _2067 = _2141;
            }
            float _2143 = _2067;
            float _2145 = fma(_2143, _145, _2119);
            float _2147 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2149 = fma(_2143, _143, _2117);
            float _2151 = -_367;
            float _2153 = _2151 + _2145;
            float _2155 = fma(_2143, _147, _2147);
            float _2157 = -_371;
            float _2159 = _2157 + _2149;
            float _2161 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _2163 = -_377;
            float _2165 = _2163 + _2155;
            float _2167 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _2169 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _2171 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2161);
            float _2173 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _2175 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2167);
            float _2177 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2171);
            float _2179 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2173);
            float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2175);
            float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2169);
            float _2185 = _391 * _2177;
            float _2187 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2179);
            float _2189 = _405 * _2181;
            float _2191 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2183);
            float _2193 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _2195 = _433 * _2187;
            float _2197 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
            float _2203 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2197);
            float _2205 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
            float _2207 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2201);
            float _2209 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2203);
            float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2205);
            float _2213 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2207);
            float _2215 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2209);
            float _2217 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2211);
            float _2219 = _2213 * _2213;
            float _2221 = fma(_2215, _2215, _2219);
            float _2223 = fma(_2217, _2217, _2221);
            _2043 = _2223;
            _811 = _2213;
            _813 = _2215;
            _815 = _2217;
            _2051 = _2215;
            _2057 = _2213;
            _2063 = _2217;
        }
        float _2225 = _2043;
        float _2227 = _811;
        float _2229 = _813;
        float _2231 = _815;
        float _2233 = _2051;
        float _2235 = _2057;
        float _2237 = _2063;
        float _2239 = sqrt(_2225);
        float _2241 = rsqrt(_2015);
        bool _2243 = _2239 > 0.0;
        float _2245 = _2005 * _2241;
        float _2247 = _2001 * _2241;
        float _2249 = _2009 * _2241;
        bool _2251 = !_2243;
        if (!_2251)
        {
            float _2253 = rsqrt(_2225);
            float _2255 = _2253 * _2227;
            float _2257 = _2253 * _2229;
            float _2259 = _2247 * _2255;
            float _2261 = _2253 * _2231;
            float _2263 = fma(_2245, _2257, _2259);
            float _2265 = fma(_2249, _2261, _2263);
            float _2267 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2269 = fma(_2233, _2267, _1995);
            float _2271 = fma(_2235, _2267, _1993);
            float _2273 = fma(_2237, _2267, _1997);
            _2025 = _2271;
            _2027 = _2269;
            _2029 = _2273;
        }
    }
    float _2275 = _2025;
    float _2277 = _2027;
    float _2279 = _2029;
    float _2281 = -_1415;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2275);
    float _2285 = -_1417;
    float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2277);
    float _2289 = -_1455;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2295 = _2283 + _2293;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2299 = _2287 + _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2303 = _2291 + _2301;
    float _2305 = _2295 * _2295;
    float _2307 = fma(_2299, _2299, _2305);
    float _2309 = fma(_2303, _2303, _2307);
    float _2311 = rsqrt(_2309);
    float _2313 = sqrt(_2309);
    float _2315 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2317 = _2299 * _2315;
    float _2319 = _2303 * _2315;
    float _2321 = _2317 * _2317;
    float _2323 = _2319 * _2319;
    float _2325 = _2321 + _2323;
    float _2327 = sqrt(_2325);
    bool _2329 = _2327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2333 = _2327 + _2331;
    float _2335 = _2311;
    float _2337 = _2333;
    float _2339 = _2295;
    float _2341 = _2315;
    if (_2329)
    {
        float _2343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2335 = _2343;
    }
    float _2345 = _2335;
    float _2347 = _2345;
    if (_2329)
    {
        float _2349 = _2333 * _2345;
        _2337 = _2349;
    }
    float _2351 = _2337;
    if (_2329)
    {
        float _2353 = rsqrt(_2325);
        _2347 = _2353;
    }
    float _2355 = _2347;
    float _2357 = _2355;
    if (_2329)
    {
        float _2359 = _2351 * 0.15915493667125701904296875;
        _2031 = _2359;
    }
    float _2361 = _2031;
    float _2363 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2365 = _2303;
    float _2367 = _2361;
    if (_2329)
    {
        float _2369 = _2361 * 6.283185482025146484375;
        float _2371 = sin(_2369);
        _2365 = _2371;
    }
    float _2373 = _2365;
    float _2375 = precise::max(0.0, _2363);
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2379 = _2275;
    float _2381 = _2375;
    if (_2329)
    {
        float _2383 = _2361 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        _2379 = _2385;
    }
    float _2387 = _2379;
    float _2389 = -_2315;
    float _2391 = -_2375;
    float _2393 = fma(_2295, _2389, _2391);
    if (_2329)
    {
        float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2339 = _2395;
    }
    float _2397 = _2339;
    float _2399 = _2373;
    float _2401 = _2397;
    if (_2329)
    {
        float _2403 = fma(_2373, _2397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2399 = _2403;
    }
    float _2405 = _2399;
    float _2407 = _2405;
    if (!_2329)
    {
        _2401 = _2393;
    }
    float _2409 = _2401;
    float _2411 = _2409;
    if (_2329)
    {
        float _2413 = _2355 * _2405;
        _2341 = _2413;
    }
    float _2415 = _2341;
    if (!_2329)
    {
        _2357 = _2317;
    }
    float _2417 = _2357;
    float _2419 = _2417;
    float _2421 = _2387;
    if (_2329)
    {
        float _2423 = _2387 + (-1.0);
        _2381 = _2423;
    }
    float _2425 = _2381;
    float _2427 = _2425;
    if (_2329)
    {
        float _2429 = _2317 * _2415;
        _2419 = _2429;
    }
    float _2431 = _2419;
    if (!_2329)
    {
        _2407 = _2321;
    }
    float _2433 = _2407;
    float _2435 = _2433;
    if (_2329)
    {
        float _2437 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2437;
    }
    float _2439 = _2367;
    if (!_2329)
    {
        _2427 = _2319;
    }
    float _2441 = _2427;
    float _2443 = _2441;
    if (_2329)
    {
        float _2445 = _2319 * _2415;
        _2443 = _2445;
    }
    float _2447 = _2443;
    if (_2329)
    {
        float _2449 = _2431 * _2431;
        _2435 = _2449;
    }
    float _2451 = _2435;
    if (_2329)
    {
        float _2453 = fma(_2393, _2387, _2439);
        _2411 = _2453;
    }
    float _2455 = _2411;
    if (!_2329)
    {
        _2421 = _2323;
    }
    float _2457 = _2421;
    float _2459 = _2457;
    if (_2329)
    {
        float _2461 = _2447 * _2447;
        _2459 = _2461;
    }
    float _2463 = _2459;
    float _2465 = fma(_2455, _2455, _2451);
    float _2467 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _2465 + _2463;
    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2473 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2471);
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    float _2479 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2481 = rsqrt(_2469);
    float _2483 = -_2475;
    float _2485 = _2483 + 1.0;
    float _2487 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2477);
    float _2489 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2491 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2479);
    float _2493 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2495 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2497 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2489);
    float _2499 = abs(_2485);
    float _2501 = log2(_2499);
    float _2503 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2491);
    float _2505 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2507 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2493);
    float _2509 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2497);
    float _2511 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2513 = -_2505;
    float _2515 = fma(_2513, _2377, 1.0);
    float _2517 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2507);
    float _2519 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2521 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2523 = _2481 * _2431;
    float _2525 = _2481 * _2455;
    float _2527 = _2481 * _2447;
    float _2529 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2521);
    float _2531 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2533 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2535 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2537 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2529);
    float _2539 = -_2531;
    float _2541 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2539);
    float _2543 = log2(_2515);
    float _2545 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2547 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2537);
    float _2549 = -_2527;
    float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2541);
    float _2553 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2555 = fma(_2551, -0.5, 0.5);
    float _2557 = exp2(_2535);
    float _2559 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2553);
    float _2561 = fma(_2551, 0.5, 0.5);
    float _2563 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2545);
    float _2565 = _2525 + 1.0;
    float _2567 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2559);
    float _2569 = fma(_2561, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2571 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2563);
    float _2573 = 1.0 / _2547;
    float _2575 = _2543 * 0.693147182464599609375;
    float _2577 = fma(_2561, _2569, -0.212114393711090087890625);
    float _2579 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2581 = fma(_2561, _2577, 1.570728778839111328125);
    float _2583 = sqrt(_2555);
    float _2585 = -_2525;
    float _2587 = fma(_2557, _2565, _2585);
    float _2589 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2567);
    float _2591 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2571);
    float _2593 = fma(_2587, 0.5, 0.5);
    float _2595 = _2589 * _2573;
    float _2597 = _2591 * _2573;
    float _2599 = fma(_2595, 0.5, 0.5);
    float _2601 = fma(_2597, -0.5, 0.5);
    float _2603 = _2583 * 0.636619746685028076171875;
    float3 _7001 = float3(_2599, _2601, _2579);
    float _2605 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).x;
    float3 _7012 = float3(_2599, _2601, _2579);
    float4 _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7012, float3(0.0), isnan(_7012)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7012, float3(0.0), isnan(_7012)), level(0.0)).xyzw;
    float _2610 = _2608.x;
    float _2612 = _2608.y;
    float _2614 = _2608.z;
    float _2616 = _2608.w;
    float _2618 = -_2581;
    float _2620 = fma(_2603, _2618, 1.0);
    float2 _7034 = float2(_2620, _2593);
    float3 _2624 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _2626 = _2624.x;
    float _2628 = _2624.y;
    float _2630 = _2624.z;
    float _2632 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2634 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2636 = _2589 + _2547;
    float _2638 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2632);
    float _2640 = _2636 * 0.5;
    float _2642 = exp2(_2634);
    float _2644 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2638);
    float _2646 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2644);
    float _2648 = _2547 * 0.5;
    float _2650 = _2646 + _2547;
    float _2652 = -_2642;
    float _2654 = _2652 + 1.0;
    float _2656 = fma(_2591, -0.5, _2648);
    float _2658 = _2650 * 0.5;
    float _2660 = _2654 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2589;
    out.gl_Position.y = _2591;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _2547;
    float _2662 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2640;
    out.m_64.y = _2656;
    out.m_64.z = _2658;
    out.m_64.w = _2547;
    out.m_47.x = _2662;
    float _2664 = _2660 * _2605;
    float _2666 = -_2660;
    float _2668 = _2666 + 1.0;
    float _2670 = _2616 * _2664;
    float _2672 = _2630 * _2664;
    float _2674 = fma(_2626, _2670, _2610);
    float _2676 = fma(_2628, _2670, _2612);
    float _2678 = _2616 * _2668;
    float _2680 = fma(_2616, _2672, _2614);
    out.m_66.x = _2674;
    out.m_66.y = _2676;
    out.m_66.z = _2680;
    out.m_66.w = _2678;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1949 = false;
    bool _1239 = false;
    bool _1059 = false;
    bool _945 = false;
    bool _835 = false;
    bool _577 = false;
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
        float _2737 = as_type<float>(_101);
        out.gl_Position.z = _2737;
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
        float _2806 = as_type<float>(_137);
        out.gl_Position.z = _2806;
    }
    if (_129)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _161 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _159);
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _161);
    float _167 = _161;
    float _169 = _141;
    if (!_157)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_157)
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
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_157;
    float _205 = _181;
    float _207 = _195;
    if (!_203)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _141 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _141);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _237;
        _207 = _227;
    }
    float _239 = _205;
    float _241 = _207;
    bool _243 = !_157;
    float _245 = _241;
    float _247 = _239;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _141 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _169 = _267;
        _245 = _255;
    }
    float _269 = _169;
    float _271 = _245;
    float _273 = 0.0;
    float _275 = _271;
    if (!_157)
    {
        float _277 = _119 * _119;
        float _279 = _277 * 0.5;
        _273 = _279;
    }
    float _281 = _273;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _275 = _119;
    }
    float _289 = _275;
    float _291 = fma(_269, _143, _283);
    float _293 = _289;
    if (!_157)
    {
        float _295 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _295;
    }
    float _297 = _247;
    bool _299 = !_157;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _119 * _305;
        float _315 = 1.0 / _309;
        float _317 = _311 * 0.693147182464599609375;
        float _319 = exp2(_313);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _119);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_157;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _119 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = fma(_269, _145, _285);
    float _363 = fma(_269, _147, _287);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _145, _359);
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_357, _143, _365);
    float _373 = -_367;
    float _375 = _361 + _373;
    float _377 = fma(_357, _147, _369);
    float _379 = -_371;
    float _381 = _291 + _379;
    float _383 = _375 * _375;
    float _385 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _387 = -_377;
    float _389 = _363 + _387;
    float _391 = sqrt(_201);
    float _393 = fma(_381, _381, _383);
    float _395 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _385);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _399 = fma(_389, _389, _393);
    float _401 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _403 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _395);
    float _405 = sqrt(_165);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _397);
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _413 = in.m_54.w;
    float _415 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _401);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].y, _407);
    float _419 = sqrt(_399);
    float _421 = in.m_44.x;
    float _423 = in.m_44.y;
    float _425 = in.m_44.z;
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].x, _415);
    float _429 = _391 * _417;
    float _431 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _433 = sqrt(_403);
    float _435 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _437 = _405 * _427;
    float _439 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _411);
    float _441 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].z, _435);
    float _443 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _445 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _447 = _419 >= 9.9999999747524270787835121154785e-07;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan(9.9999999747524270787835121154785e-07);
    bool _455 = _451 || _453;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _431);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _443);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _445);
    float _463 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].w, _439);
    float _465 = _433 * _441;
    float _467 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _469 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _473 = fma(_363, _413, _425);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].w, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].w, _469);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].w, _471);
    float _481 = fma(_291, _413, _421);
    float _483 = fma(_361, _413, _423);
    float _485 = _363;
    float _487 = _463;
    float _489 = _475;
    if (_455)
    {
        _485 = _475;
    }
    float _491 = _485;
    float _493 = _491;
    if (_455)
    {
        _487 = _477;
    }
    float _495 = _487;
    float _497 = _495;
    if (_455)
    {
        _489 = _479;
    }
    float _499 = _489;
    float _501 = _499;
    if (!_455)
    {
        bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _505 = !_503;
        if (!_505)
        {
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _511 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _513);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _515);
            float _523 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _517);
            float _527 = _391 * _519;
            float _529 = _405 * _521;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _523);
            float _533 = _433 * _525;
            float _535 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _537 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _541 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _531);
            float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
            float _545 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
            float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _543);
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _547);
            float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].w, _549);
            float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].w, _551);
            float _559 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].w, _553);
            float _561 = _555 * _555;
            float _563 = fma(_557, _557, _561);
            float _565 = fma(_559, _559, _563);
            float _567 = rsqrt(_565);
            float _569 = _567 * 9.9999999747524270787835121154785e-07;
            float _571 = _557 * _569;
            float _573 = _555 * _569;
            float _575 = _559 * _569;
            _497 = _573;
            _493 = _571;
            _501 = _575;
            _577 = true;
        }
        else
        {
            float _579 = _145 * _145;
            float _581 = fma(_143, _143, _579);
            float _583 = fma(_147, _147, _581);
            float _585 = sqrt(_583);
            bool _587 = _585 >= 9.9999999747524270787835121154785e-07;
            bool _589 = isnan(_585);
            bool _591 = _587 || _589;
            bool _593 = isnan(9.9999999747524270787835121154785e-07);
            bool _595 = _591 || _593;
            if (!_595)
            {
                float _597 = _423 * _423;
                float _599 = fma(_421, _421, _597);
                float _601 = fma(_425, _425, _599);
                float _603 = sqrt(_601);
                bool _605 = _603 >= 9.9999999747524270787835121154785e-07;
                bool _607 = isnan(_603);
                bool _609 = _605 || _607;
                bool _611 = isnan(9.9999999747524270787835121154785e-07);
                bool _613 = _609 || _611;
                if (!_613)
                {
                    float _615 = _391 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _617 = _405 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _619 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _621 = _615 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _623 = _615 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _625 = _615 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _627 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _621);
                    float _629 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _625);
                    float _633 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[25].z, _627);
                    float _635 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[24].z, _629);
                    float _637 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[26].z, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _635);
                    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _637);
                    float _645 = _639 * _639;
                    float _647 = fma(_641, _641, _645);
                    float _649 = fma(_643, _643, _647);
                    float _651 = rsqrt(_649);
                    float _653 = _651 * 9.9999999747524270787835121154785e-07;
                    float _655 = _641 * _653;
                    float _657 = _639 * _653;
                    float _659 = _643 * _653;
                    _497 = _657;
                    _493 = _655;
                    _501 = _659;
                    _577 = true;
                }
                else
                {
                    float _661 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _663 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _665 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _667 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _669 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].y, _661);
                    float _671 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].x, _663);
                    float _673 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].z, _665);
                    float _675 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].w, _667);
                    float _677 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].y, _669);
                    float _679 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].x, _671);
                    float _681 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].z, _673);
                    float _683 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].w, _675);
                    float _685 = _391 * _677;
                    float _687 = _405 * _679;
                    float _689 = _433 * _681;
                    float _691 = _685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _693 = _685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _695 = _685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].x, _691);
                    float _699 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
                    float _703 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].z, _697);
                    float _705 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].z, _699);
                    float _707 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].z, _701);
                    float _709 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].w, _703);
                    float _711 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].w, _705);
                    float _713 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].w, _707);
                    float _715 = _709 * _709;
                    float _717 = fma(_711, _711, _715);
                    float _719 = fma(_713, _713, _717);
                    float _721 = rsqrt(_719);
                    float _723 = _721 * 9.9999999747524270787835121154785e-07;
                    float _725 = _711 * _723;
                    float _727 = _709 * _723;
                    float _729 = _713 * _723;
                    _497 = _727;
                    _493 = _725;
                    _501 = _729;
                    _577 = true;
                }
            }
            else
            {
                float _731 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _733 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _735 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _737 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].y, _731);
                float _739 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].x, _733);
                float _741 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].z, _735);
                float _743 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _745 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _747 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _749 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = _391 * _743;
                float _753 = _405 * _745;
                float _755 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].w, _747);
                float _757 = _433 * _749;
                float _759 = _751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].w, _755);
                float _765 = _751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _769 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _771 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _769);
                float _777 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _771);
                float _779 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].w, _773);
                float _781 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].w, _775);
                float _783 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].w, _777);
                float _785 = _779 * _779;
                float _787 = fma(_781, _781, _785);
                float _789 = fma(_783, _783, _787);
                float _791 = rsqrt(_789);
                float _793 = _791 * 9.9999999747524270787835121154785e-07;
                float _795 = _781 * _793;
                float _797 = _779 * _793;
                float _799 = _783 * _793;
                _497 = _797;
                _493 = _795;
                _501 = _799;
            }
        }
    }
    _577 = false;
    float _801 = _497;
    float _803 = _493;
    float _805 = _501;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _809 = !_807;
    float _811 = _801;
    float _813 = _803;
    float _815 = _805;
    float _833;
    if (!_809)
    {
        float _817 = in.m_56.x;
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _821 = _817 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _825 = _823 * _819;
        float _827 = floor(_825);
        float _829 = -_827;
        float _831 = _825 + _829;
        _833 = _831;
        _835 = true;
    }
    else
    {
        float _837 = float(_85);
        float _839 = 1.0 / _837;
        float _841 = _119 * _839;
        _833 = _841;
    }
    _835 = false;
    float _843 = _833;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _847 = _843 + _845;
    float _849 = in.m_54.x;
    float _851 = in.m_54.y;
    bool _853 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _855 = isnan(_843);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _865;
    bool _869 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _871 = isnan(_843);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _885;
    float _889 = 1.0 / _867;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _893 = _879 * _883;
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _847 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _901;
    float _905 = fma(_887, _899, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _907 = fma(_903, _899, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _909 = _905 * _893;
    float _911 = _907 * _893;
    float _913 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].x, _909);
    float _915 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].y, _911);
    float _917 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[144].x, _913);
    float _919 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[144].y, _915);
    float _921 = _917 * _849;
    float _923 = _919 * _851;
    bool _925 = !_891;
    float _943;
    if (!_925)
    {
        float _927 = in.m_56.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_85);
        float _949 = 1.0 / _947;
        float _951 = _119 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _957 = _953 + _955;
    bool _959 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _961 = isnan(_953);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _971;
    bool _975 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _977 = isnan(_953);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = -_969;
    float _989 = _987 + 1.0;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _991;
    float _995 = 1.0 / _973;
    bool _997 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _999 = _985 * _989;
    float _1001 = -_985;
    float _1003 = _1001 + 1.0;
    float _1005 = _957 * _995;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1007;
    float _1011 = fma(_993, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1013;
    float _1017 = fma(_1009, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1019 = _1011 * _999;
    float _1021 = fma(_1015, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1023 = _1017 * _999;
    float _1025 = _1021 * _999;
    float _1027 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1019);
    float _1029 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1025);
    float _1031 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1023);
    float _1033 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1027);
    float _1035 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1029);
    float _1037 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1031);
    bool _1039 = !_997;
    float _1057;
    if (!_1039)
    {
        float _1041 = in.m_56.x;
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1045 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _1049 = _1047 * _1043;
        float _1051 = floor(_1049);
        float _1053 = -_1051;
        float _1055 = _1049 + _1053;
        _1057 = _1055;
        _1059 = true;
    }
    else
    {
        float _1061 = float(_85);
        float _1063 = 1.0 / _1061;
        float _1065 = _119 * _1063;
        _1057 = _1065;
    }
    _1059 = false;
    float _1067 = _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1071 = _1067 + _1069;
    float _1073 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1083 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1085 = isnan(_1067);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1099 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1101 = isnan(_1067);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1077;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1113;
    float _1117 = -_1093;
    float _1119 = _1117 + 1.0;
    bool _1121 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1123 = isnan(_1067);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1137 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = 1.0 / _1081;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1145 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1147 = 1.0 / _1097;
    float _1149 = _1115 * _1111;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1155 = _1109 * _1119;
    float _1157 = -_1109;
    float _1159 = _1157 + 1.0;
    float _1161 = fma(_1149, _1071, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1163;
    float _1167 = _1131 * _1159;
    float _1169 = _1153 * _1139;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1173 = _1067 + _1171;
    bool _1175 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1177 = isnan(_1067);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = _1161 * _1167;
    float _1189 = -_1131;
    float _1191 = _1189 + 1.0;
    float _1193 = fma(_1169, _1173, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1197 = _1067 + _1195;
    float _1199 = _1165 * _1147;
    float _1201 = -_1185;
    float _1203 = _1201 + 1.0;
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1187);
    float _1207 = fma(_1199, _1197, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1209 = _1093 * _1203;
    float _1211 = fma(_1193, _1155, _1205);
    float _1213 = fma(_1207, _1209, _1211);
    float _1215 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1213);
    float _1217 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1137;
    out.m_58.y = _1141;
    out.m_58.z = _1143;
    out.m_58.w = _1217;
    bool _1219 = !_1145;
    float _1237;
    if (!_1219)
    {
        float _1221 = in.m_56.x;
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1225 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1229 = _1227 * _1223;
        float _1231 = floor(_1229);
        float _1233 = -_1231;
        float _1235 = _1229 + _1233;
        _1237 = _1235;
        _1239 = true;
    }
    else
    {
        float _1241 = float(_85);
        float _1243 = 1.0 / _1241;
        float _1245 = _119 * _1243;
        _1237 = _1245;
    }
    _1239 = false;
    float _1247 = _1237;
    float _1249 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1251 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1253 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1255 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1257 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1249);
    float _1259 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1251);
    float _1261 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1253);
    float _1263 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1255);
    float _1265 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1257);
    float _1267 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1259);
    float _1269 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1261);
    float _1271 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1275 = _1267 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1277 = _1269 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1279 = in.m_56.x;
    float _1281 = in.m_56.y;
    float _1283 = in.m_56.z;
    float _1285 = in.m_56.w;
    float _1287 = _391 * _1273;
    float _1289 = _405 * _1275;
    float _1291 = _433 * _1277;
    float _1293 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1295);
    float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1299);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1309 = _1247 + _1307;
    float _1311 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1301);
    float _1313 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1303);
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1305);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1319 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1311);
    float _1321 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1313);
    float _1323 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1315);
    float _1325 = _1319 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1327 = _1321 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1329 = _1323 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    bool _1331 = _1285 > 0.5;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1335 = _1325 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1327 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1329 + _1341;
    float _1345 = _1335 * _1335;
    float _1347 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1349;
    float _1353 = fma(_1339, _1339, _1345);
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1357 = _1355 != 0;
    float _1359 = _801 * _801;
    float _1361 = 1.0 / _1351;
    float _1363 = fma(_1343, _1343, _1353);
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1367 = _1365 != 0;
    float _1369 = fma(_803, _803, _1359);
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1373 = _1371 != 0;
    float _1375 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1379 = _1377 != 0;
    float _1381 = rsqrt(_1363);
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1385 = _1383 != 0;
    float _1387 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1389 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1391 = fma(_1387, -2.0, _1317);
    float _1393 = fma(_805, _805, _1369);
    float _1395 = _1309 * _1361;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1401 = rsqrt(_1393);
    float _1403 = -_199;
    int _1405 = _1331 ? as_type<int>(_1403) : as_type<int>(_199);
    float _1407 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1397);
    bool _1409 = _1279 > 0.5;
    float _1411 = -_1399;
    float _1413 = fma(_1389, 2.0, _1411);
    float _1415 = _1335 * _1381;
    float _1417 = _1339 * _1381;
    float _1419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1421 = -_1415;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    float _1425 = -_1417;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1339);
    float _1429 = -_193;
    int _1431 = _1409 ? as_type<int>(_1429) : as_type<int>(_193);
    float _1433 = -_119;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1413);
    float _1437 = _1423 * _1423;
    float _1439 = _1389;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1443 = _1283;
    float _1445 = _1393;
    if (!_1357)
    {
        _1439 = _1281;
    }
    float _1447 = _1439;
    float _1449 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1391);
    float _1451 = _1401 * _805;
    float _1453 = fma(_1427, _1427, _1437);
    float _1455 = _1343 * _1381;
    float _1457 = _1401 * _803;
    float _1459 = _1401 * _801;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1463 = _1451 * _1461;
    bool _1465 = _1283 > 0.5;
    float _1467 = -_1455;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _1471 = _1447;
    if (_1357)
    {
        _1471 = _1279;
    }
    float _1473 = _1471;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1479 = _1459 * _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1483 = -_1463;
    float _1485 = fma(_1457, _1481, _1483);
    float _1487 = -_193;
    int _1489 = _1465 ? as_type<int>(_1487) : as_type<int>(_193);
    float _1491 = fma(_1469, _1469, _1453);
    if (!_1357)
    {
        _1441 = _1283;
    }
    float _1493 = _1441;
    float _1495 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1475);
    bool _1497 = _1281 > 0.5;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1501 = -_1479;
    float _1503 = fma(_1451, _1499, _1501);
    float _1505 = _1493;
    if (_1357)
    {
        _1505 = _1281;
    }
    float _1507 = _1505;
    float _1509 = _1485 * _1485;
    if (_1357)
    {
        _1443 = _1281;
    }
    float _1511 = _1443;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1515 = _1457 * _1513;
    float _1517 = sqrt(_1491);
    float _1519 = fma(_1503, _1503, _1509);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1523 = -_1515;
    float _1525 = fma(_1459, _1521, _1523);
    float _1527 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1529 = fma(_1525, _1525, _1519);
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1539;
    float _1543 = rsqrt(_1529);
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1547 = fma(_1533, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1549 = _1381 * _1517;
    float _1551 = fma(_1537, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1553 = -_199;
    int _1555 = _1497 ? as_type<int>(_1553) : as_type<int>(_199);
    float _1557 = fma(_1541, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1559 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1545);
    float _1561 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1563 = !_1367;
    float _1565 = _1563 ? _193 : as_type<float>(_1431);
    float _1567 = _1347 * _1549;
    bool _1569 = !_1379;
    float _1571 = _1569 ? _193 : as_type<float>(_1489);
    float _1573 = _1561 * _1549;
    bool _1575 = !_1373;
    float _1577 = _1575 ? _199 : as_type<float>(_1555);
    bool _1579 = !_1385;
    float _1581 = _1579 ? _199 : as_type<float>(_1405);
    float _1583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1585 = _1525 * _1543;
    float _1587 = _1485 * _1543;
    float _1589 = _1503 * _1543;
    float _1591 = _1567 * _1583;
    float _1593 = _1459 * _1585;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1597 = _1573 * _1375;
    float _1599 = _1591 * _1457;
    float _1601 = _1457 * _1587;
    float _1603 = _1591 * _1451;
    float _1605 = -_1593;
    float _1607 = fma(_1451, _1587, _1605);
    float _1609 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1611 = _1609 * 0.5;
    float _1613 = _1565 + 0.5;
    float _1615 = fma(_1597, _1589, _1599);
    float _1617 = -_1601;
    float _1619 = fma(_1459, _1589, _1617);
    float _1621 = fma(_1597, _1585, _1603);
    float _1623 = fma(_1527, _1613, _1435);
    float _1625 = fma(_1611, _1607, _1615);
    float _1627 = _1451 * _1589;
    float _1629 = fma(_1611, _1619, _1621);
    float _1631 = _1577 + (-0.5);
    float _1633 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1635 = _1327 + _1625;
    float _1637 = _1329 + _1629;
    float _1639 = _1591 * _1459;
    float _1641 = -_1633;
    float _1643 = -_1449;
    float _1645 = fma(_1641, _1631, _1643);
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1649 = _1635 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1653 = _1637 + _1651;
    float _1655 = fma(_1597, _1587, _1639);
    float _1657 = -_1627;
    float _1659 = fma(_1457, _1585, _1657);
    float _1661 = _1649 * _1649;
    float _1663 = _1653 * _1653;
    bool _1665 = _1247 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1667 = isnan(_1247);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1679 = _1247 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1681 = isnan(_1247);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1661 + _1663;
    float _1693 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1695 = -_1689;
    float _1697 = _1695 + 1.0;
    float _1699 = sqrt(_1691);
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1703 = _1675 * _1697;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1709 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1701);
    float _1711 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1713 = _1547 * _1703;
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1717 = _1551 * _1703;
    float _1719 = _1557 * _1703;
    float _1721 = -_1705;
    float _1723 = fma(_1711, 2.0, _1721);
    float _1725 = fma(_1693, -2.0, _1707);
    float _1727 = fma(_1611, _1659, _1655);
    float _1729 = -_1675;
    float _1731 = _1729 + 1.0;
    float _1733 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1735 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1737 = _1571 + 0.5;
    float _1739 = _1581 + (-0.5);
    float _1741 = -_119;
    float _1743 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1723);
    float _1745 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1725);
    float _1747 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1713);
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1717);
    float _1751 = fma(_1733, _1737, _1743);
    float _1753 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1755 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1719);
    float _1757 = _1325 + _1727;
    float _1759 = -_1753;
    float _1761 = -_1745;
    float _1763 = fma(_1759, _1739, _1761);
    bool _1765 = !_1735;
    float _1767 = _1757;
    float _1769 = _1661;
    float _1771 = _1663;
    float _1773 = _1635;
    float _1775 = _1637;
    float _1777 = _1581;
    if (!_1765)
    {
        float _1779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1783 = _1699 + _1781;
        float _1785 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1787 = rsqrt(_1691);
        float _1789 = _1783 * _1779;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1791 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = _1791 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = fma(_1795, _1785, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1803 = _1787 * _1801;
        float _1805 = _1799 + (-1.0);
        float _1807 = fma(_1649, _1803, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1809 = fma(_1653, _1803, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1811 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1815 = _1807 + _1813;
        float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1819 = _1809 + _1817;
        float _1821 = fma(_1757, _1799, _1811);
        float _1823 = _1815 * _1815;
        float _1825 = _1819 * _1819;
        _1767 = _1821;
        _1769 = _1823;
        _1771 = _1825;
        _1773 = _1807;
        _1775 = _1809;
    }
    float _1827 = _1767;
    float _1829 = _1769;
    float _1831 = _1771;
    float _1833 = _1773;
    float _1835 = _1775;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1839 = _1827 + _1837;
    float _1841 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    float _1843 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1495);
    float _1845 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1709);
    float _1847 = fma(_1839, _1839, _1829);
    float _1849 = -_1841;
    float _1851 = _1849 + 1.0;
    float _1853 = -_1843;
    float _1855 = _1853 + 1.0;
    float _1857 = -_1845;
    float _1859 = _1857 + 1.0;
    float _1861 = _1847 + _1831;
    float _1863 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1747);
    float _1865 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1749);
    float _1867 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1755);
    float _1869 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1559);
    float _1871 = -_1851;
    float _1873 = fma(_1565, _1871, _1623);
    float _1875 = sqrt(_1861);
    float _1877 = fma(_1577, _1855, _1645);
    float _1879 = -_1859;
    float _1881 = fma(_1571, _1879, _1751);
    float _1883 = -_1869;
    float _1885 = _1883 + 1.0;
    float _1887 = _1863 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1889 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1891 = _1867 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1893 = fma(_1581, _1885, _1763);
    float _1895 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1899 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1873;
    out.m_60.y = _1877;
    out.m_60.z = _1881;
    out.m_60.w = _1893;
    out.m_62.x = _1895;
    out.m_62.y = _1897;
    out.m_62.z = _1899;
    bool _1901 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1903 = isnan(_1875);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1909 = _1905 || _1907;
    float _1911 = _1899;
    float _1913 = _1897;
    if (!_1909)
    {
        _1777 = 1.0;
    }
    float _1915 = _1777;
    bool _1917 = !_1909;
    float _1919 = _1915;
    if (!_1917)
    {
        bool _1921 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1923 = isnan(_1875);
        bool _1925 = _1921 || _1923;
        bool _1927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1929 = _1925 || _1927;
        if (!_1929)
        {
            float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1933 = _1875 + _1931;
            float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1937 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1935;
            float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1941 = _1939 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1943 = 1.0 / _1937;
            float _1945 = _1933 * _1943;
            float _1947 = fma(_1945, _1941, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1919 = _1947;
            _1949 = true;
        }
        else
        {
            bool _1951 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1953 = isnan(_1875);
            bool _1955 = _1951 || _1953;
            bool _1957 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1959 = _1955 || _1957;
            if (!_1959)
            {
                float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1963 = _1875 + _1961;
                float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1967 = _1965 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1969 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1971 = _1969 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1973 = 1.0 / _1967;
                float _1975 = _1963 * _1973;
                float _1977 = fma(_1975, _1971, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1919 = _1977;
                _1949 = true;
            }
            else
            {
                _1919 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1949 = false;
    float _1979 = _1919;
    float _1981 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1983 = _1827 + _1981;
    float _1985 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1987 = _1833 + _1985;
    float _1989 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1991 = _1835 + _1989;
    float _1993 = fma(_1983, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1995 = fma(_1987, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1997 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1999 = -_1325;
    float _2001 = _1999 + _1993;
    float _2003 = -_1327;
    float _2005 = _2003 + _1995;
    float _2007 = -_1329;
    float _2009 = _2007 + _1997;
    float _2011 = _2001 * _2001;
    float _2013 = fma(_2005, _2005, _2011);
    float _2015 = fma(_2009, _2009, _2013);
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 > 0.0;
    bool _2021 = !_2019;
    float _2023 = _2017;
    float _2025 = _1993;
    float _2027 = _1995;
    float _2029 = _1997;
    float _2031 = _2015;
    if (!_2021)
    {
        bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2035 = _1869;
        if (_2033)
        {
            float _2037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2035 = _2037;
        }
        float _2039 = _2035;
        if (_2033)
        {
            _1911 = _1393;
        }
        float _2041 = _1911;
        float _2043 = _2041;
        if (_2033)
        {
            float _2045 = _2039 * _803;
            _2023 = _2045;
        }
        float _2047 = _2023;
        float _2049 = _2047;
        float _2051 = _2047;
        if (_2033)
        {
            float _2053 = _2039 * _801;
            _1445 = _2053;
        }
        float _2055 = _1445;
        float _2057 = _2055;
        if (_2033)
        {
            float _2059 = _2039 * _805;
            _1913 = _2059;
        }
        float _2061 = _1913;
        float _2063 = _2061;
        if (!_2033)
        {
            float _2065 = _119 + 1.0;
            float _2067 = _2065;
            if (!_157)
            {
                float _2069 = _2065 * _2065;
                float _2071 = _2069 * 0.5;
                _2049 = _2071;
            }
            float _2073 = _2049;
            float _2075 = _2073;
            if (!_157)
            {
                float _2077 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2075 = _2077;
            }
            float _2079 = _2075;
            bool _2081 = !_157;
            float _2083 = _2079;
            if (!_2081)
            {
                float _2085 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2087 = log2(_2085);
                float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2091 = _2089 + 1.0;
                float _2093 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2095 = _2087 * _2065;
                float _2097 = 1.0 / _2091;
                float _2099 = _2093 * 0.693147182464599609375;
                float _2101 = exp2(_2095);
                float _2103 = 1.0 / _2099;
                float _2105 = _2101 + (-1.0);
                float _2107 = -_2105;
                float _2109 = fma(_2107, _2103, _2065);
                float _2111 = _2109 * _2097;
                float _2113 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2083 = _2113;
            }
            float _2115 = _2083;
            float _2117 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2119 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2121 = !_157;
            if (!_2121)
            {
                float _2123 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2125 = log2(_2123);
                float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2129 = _2127 + 1.0;
                float _2131 = 1.0 / _2129;
                float _2133 = _2125 * _2065;
                float _2135 = exp2(_2133);
                float _2137 = -_2135;
                float _2139 = _2137 + 1.0;
                float _2141 = _2139 * _2131;
                _2067 = _2141;
            }
            float _2143 = _2067;
            float _2145 = fma(_2143, _145, _2119);
            float _2147 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2149 = fma(_2143, _143, _2117);
            float _2151 = -_367;
            float _2153 = _2151 + _2145;
            float _2155 = fma(_2143, _147, _2147);
            float _2157 = -_371;
            float _2159 = _2157 + _2149;
            float _2161 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _2163 = -_377;
            float _2165 = _2163 + _2155;
            float _2167 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _2169 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _2171 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2161);
            float _2173 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _2175 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2167);
            float _2177 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2171);
            float _2179 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2173);
            float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2175);
            float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2169);
            float _2185 = _391 * _2177;
            float _2187 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2179);
            float _2189 = _405 * _2181;
            float _2191 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2183);
            float _2193 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _2195 = _433 * _2187;
            float _2197 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
            float _2203 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2197);
            float _2205 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
            float _2207 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2201);
            float _2209 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2203);
            float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2205);
            float _2213 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2207);
            float _2215 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2209);
            float _2217 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2211);
            float _2219 = _2213 * _2213;
            float _2221 = fma(_2215, _2215, _2219);
            float _2223 = fma(_2217, _2217, _2221);
            _2043 = _2223;
            _811 = _2213;
            _813 = _2215;
            _815 = _2217;
            _2051 = _2215;
            _2057 = _2213;
            _2063 = _2217;
        }
        float _2225 = _2043;
        float _2227 = _811;
        float _2229 = _813;
        float _2231 = _815;
        float _2233 = _2051;
        float _2235 = _2057;
        float _2237 = _2063;
        float _2239 = sqrt(_2225);
        float _2241 = rsqrt(_2015);
        bool _2243 = _2239 > 0.0;
        float _2245 = _2005 * _2241;
        float _2247 = _2001 * _2241;
        float _2249 = _2009 * _2241;
        bool _2251 = !_2243;
        if (!_2251)
        {
            float _2253 = rsqrt(_2225);
            float _2255 = _2253 * _2227;
            float _2257 = _2253 * _2229;
            float _2259 = _2247 * _2255;
            float _2261 = _2253 * _2231;
            float _2263 = fma(_2245, _2257, _2259);
            float _2265 = fma(_2249, _2261, _2263);
            float _2267 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2269 = fma(_2233, _2267, _1995);
            float _2271 = fma(_2235, _2267, _1993);
            float _2273 = fma(_2237, _2267, _1997);
            _2025 = _2271;
            _2027 = _2269;
            _2029 = _2273;
        }
    }
    float _2275 = _2025;
    float _2277 = _2027;
    float _2279 = _2029;
    float _2281 = -_1415;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2275);
    float _2285 = -_1417;
    float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2277);
    float _2289 = -_1455;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2295 = _2283 + _2293;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2299 = _2287 + _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2303 = _2291 + _2301;
    float _2305 = _2295 * _2295;
    float _2307 = fma(_2299, _2299, _2305);
    float _2309 = fma(_2303, _2303, _2307);
    float _2311 = rsqrt(_2309);
    float _2313 = sqrt(_2309);
    float _2315 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2317 = _2299 * _2315;
    float _2319 = _2303 * _2315;
    float _2321 = _2317 * _2317;
    float _2323 = _2319 * _2319;
    float _2325 = _2321 + _2323;
    float _2327 = sqrt(_2325);
    bool _2329 = _2327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2333 = _2327 + _2331;
    float _2335 = _2311;
    float _2337 = _2333;
    float _2339 = _2295;
    float _2341 = _2315;
    if (_2329)
    {
        float _2343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2335 = _2343;
    }
    float _2345 = _2335;
    float _2347 = _2345;
    if (_2329)
    {
        float _2349 = _2333 * _2345;
        _2337 = _2349;
    }
    float _2351 = _2337;
    if (_2329)
    {
        float _2353 = rsqrt(_2325);
        _2347 = _2353;
    }
    float _2355 = _2347;
    float _2357 = _2355;
    if (_2329)
    {
        float _2359 = _2351 * 0.15915493667125701904296875;
        _2031 = _2359;
    }
    float _2361 = _2031;
    float _2363 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2365 = _2303;
    float _2367 = _2361;
    if (_2329)
    {
        float _2369 = _2361 * 6.283185482025146484375;
        float _2371 = sin(_2369);
        _2365 = _2371;
    }
    float _2373 = _2365;
    float _2375 = precise::max(0.0, _2363);
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2379 = _2275;
    float _2381 = _2375;
    if (_2329)
    {
        float _2383 = _2361 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        _2379 = _2385;
    }
    float _2387 = _2379;
    float _2389 = -_2315;
    float _2391 = -_2375;
    float _2393 = fma(_2295, _2389, _2391);
    if (_2329)
    {
        float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2339 = _2395;
    }
    float _2397 = _2339;
    float _2399 = _2373;
    float _2401 = _2397;
    if (_2329)
    {
        float _2403 = fma(_2373, _2397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2399 = _2403;
    }
    float _2405 = _2399;
    float _2407 = _2405;
    if (!_2329)
    {
        _2401 = _2393;
    }
    float _2409 = _2401;
    float _2411 = _2409;
    if (_2329)
    {
        float _2413 = _2355 * _2405;
        _2341 = _2413;
    }
    float _2415 = _2341;
    if (!_2329)
    {
        _2357 = _2317;
    }
    float _2417 = _2357;
    float _2419 = _2417;
    float _2421 = _2387;
    if (_2329)
    {
        float _2423 = _2387 + (-1.0);
        _2381 = _2423;
    }
    float _2425 = _2381;
    float _2427 = _2425;
    if (_2329)
    {
        float _2429 = _2317 * _2415;
        _2419 = _2429;
    }
    float _2431 = _2419;
    if (!_2329)
    {
        _2407 = _2321;
    }
    float _2433 = _2407;
    float _2435 = _2433;
    if (_2329)
    {
        float _2437 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2437;
    }
    float _2439 = _2367;
    if (!_2329)
    {
        _2427 = _2319;
    }
    float _2441 = _2427;
    float _2443 = _2441;
    if (_2329)
    {
        float _2445 = _2319 * _2415;
        _2443 = _2445;
    }
    float _2447 = _2443;
    if (_2329)
    {
        float _2449 = _2431 * _2431;
        _2435 = _2449;
    }
    float _2451 = _2435;
    if (_2329)
    {
        float _2453 = fma(_2393, _2387, _2439);
        _2411 = _2453;
    }
    float _2455 = _2411;
    if (!_2329)
    {
        _2421 = _2323;
    }
    float _2457 = _2421;
    float _2459 = _2457;
    if (_2329)
    {
        float _2461 = _2447 * _2447;
        _2459 = _2461;
    }
    float _2463 = _2459;
    float _2465 = fma(_2455, _2455, _2451);
    float _2467 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _2465 + _2463;
    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2473 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2471);
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    float _2479 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2481 = rsqrt(_2469);
    float _2483 = -_2475;
    float _2485 = _2483 + 1.0;
    float _2487 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2477);
    float _2489 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2491 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2479);
    float _2493 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2495 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2497 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2489);
    float _2499 = abs(_2485);
    float _2501 = log2(_2499);
    float _2503 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2491);
    float _2505 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2507 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2493);
    float _2509 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2497);
    float _2511 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2513 = -_2505;
    float _2515 = fma(_2513, _2377, 1.0);
    float _2517 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2507);
    float _2519 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2521 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2523 = _2481 * _2431;
    float _2525 = _2481 * _2455;
    float _2527 = _2481 * _2447;
    float _2529 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2521);
    float _2531 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2533 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2535 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2537 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2529);
    float _2539 = -_2531;
    float _2541 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2539);
    float _2543 = log2(_2515);
    float _2545 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2547 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2537);
    float _2549 = -_2527;
    float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2541);
    float _2553 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2555 = fma(_2551, -0.5, 0.5);
    float _2557 = exp2(_2535);
    float _2559 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2553);
    float _2561 = fma(_2551, 0.5, 0.5);
    float _2563 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2545);
    float _2565 = _2525 + 1.0;
    float _2567 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2559);
    float _2569 = fma(_2561, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2571 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2563);
    float _2573 = 1.0 / _2547;
    float _2575 = _2543 * 0.693147182464599609375;
    float _2577 = fma(_2561, _2569, -0.212114393711090087890625);
    float _2579 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2581 = fma(_2561, _2577, 1.570728778839111328125);
    float _2583 = sqrt(_2555);
    float _2585 = -_2525;
    float _2587 = fma(_2557, _2565, _2585);
    float _2589 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2567);
    float _2591 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2571);
    float _2593 = fma(_2587, 0.5, 0.5);
    float _2595 = _2589 * _2573;
    float _2597 = _2591 * _2573;
    float _2599 = fma(_2595, 0.5, 0.5);
    float _2601 = fma(_2597, -0.5, 0.5);
    float _2603 = _2583 * 0.636619746685028076171875;
    float3 _7001 = float3(_2599, _2601, _2579);
    float _2605 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).x;
    float3 _7012 = float3(_2599, _2601, _2579);
    float4 _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7012, float3(0.0), isnan(_7012)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7012, float3(0.0), isnan(_7012)), level(0.0)).xyzw;
    float _2610 = _2608.x;
    float _2612 = _2608.y;
    float _2614 = _2608.z;
    float _2616 = _2608.w;
    float _2618 = -_2581;
    float _2620 = fma(_2603, _2618, 1.0);
    float2 _7034 = float2(_2620, _2593);
    float3 _2624 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _2626 = _2624.x;
    float _2628 = _2624.y;
    float _2630 = _2624.z;
    float _2632 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2634 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2636 = _2589 + _2547;
    float _2638 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2632);
    float _2640 = _2636 * 0.5;
    float _2642 = exp2(_2634);
    float _2644 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2638);
    float _2646 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2644);
    float _2648 = _2547 * 0.5;
    float _2650 = _2646 + _2547;
    float _2652 = -_2642;
    float _2654 = _2652 + 1.0;
    float _2656 = fma(_2591, -0.5, _2648);
    float _2658 = _2650 * 0.5;
    float _2660 = _2654 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2589;
    out.gl_Position.y = _2591;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _2547;
    float _2662 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2640;
    out.m_64.y = _2656;
    out.m_64.z = _2658;
    out.m_64.w = _2547;
    out.m_47.x = _2662;
    float _2664 = _2660 * _2605;
    float _2666 = -_2660;
    float _2668 = _2666 + 1.0;
    float _2670 = _2616 * _2664;
    float _2672 = _2630 * _2664;
    float _2674 = fma(_2626, _2670, _2610);
    float _2676 = fma(_2628, _2670, _2612);
    float _2678 = _2616 * _2668;
    float _2680 = fma(_2616, _2672, _2614);
    out.m_66.x = _2674;
    out.m_66.y = _2676;
    out.m_66.z = _2680;
    out.m_66.w = _2678;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1949 = false;
    bool _1239 = false;
    bool _1059 = false;
    bool _945 = false;
    bool _835 = false;
    bool _577 = false;
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
        float _2737 = as_type<float>(_101);
        out.gl_Position.z = _2737;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2806 = as_type<float>(_137);
        out.gl_Position.z = _2806;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _161 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _159);
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _161);
    float _167 = _161;
    float _169 = _141;
    if (!_157)
    {
        float _171 = _141 * _141;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = _175;
    if (!_157)
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
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _195);
    bool _203 = !_157;
    float _205 = _181;
    float _207 = _195;
    if (!_203)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _141 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _141);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _237;
        _207 = _227;
    }
    float _239 = _205;
    float _241 = _207;
    bool _243 = !_157;
    float _245 = _241;
    float _247 = _239;
    if (!_243)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _141 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _169 = _267;
        _245 = _255;
    }
    float _269 = _169;
    float _271 = _245;
    float _273 = 0.0;
    float _275 = _271;
    if (!_157)
    {
        float _277 = _119 * _119;
        float _279 = _277 * 0.5;
        _273 = _279;
    }
    float _281 = _273;
    float _283 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _285 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _287 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_157)
    {
        _275 = _119;
    }
    float _289 = _275;
    float _291 = fma(_269, _143, _283);
    float _293 = _289;
    if (!_157)
    {
        float _295 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _247 = _295;
    }
    float _297 = _247;
    bool _299 = !_157;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _119 * _305;
        float _315 = 1.0 / _309;
        float _317 = _311 * 0.693147182464599609375;
        float _319 = exp2(_313);
        float _321 = 1.0 / _317;
        float _323 = _319 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _321, _119);
        float _329 = _327 * _315;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
    }
    float _333 = _301;
    bool _335 = !_157;
    if (!_335)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = 1.0 / _343;
        float _347 = _119 * _339;
        float _349 = exp2(_347);
        float _351 = -_349;
        float _353 = _351 + 1.0;
        float _355 = _353 * _345;
        _293 = _355;
    }
    float _357 = _293;
    float _359 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _361 = fma(_269, _145, _285);
    float _363 = fma(_269, _147, _287);
    float _365 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _367 = fma(_357, _145, _359);
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_357, _143, _365);
    float _373 = -_367;
    float _375 = _361 + _373;
    float _377 = fma(_357, _147, _369);
    float _379 = -_371;
    float _381 = _291 + _379;
    float _383 = _375 * _375;
    float _385 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _387 = -_377;
    float _389 = _363 + _387;
    float _391 = sqrt(_201);
    float _393 = fma(_381, _381, _383);
    float _395 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _385);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _399 = fma(_389, _389, _393);
    float _401 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _403 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _395);
    float _405 = sqrt(_165);
    float _407 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].y, _397);
    float _409 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _411 = _375 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _413 = in.m_54.w;
    float _415 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].x, _401);
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].y, _407);
    float _419 = sqrt(_399);
    float _421 = in.m_44.x;
    float _423 = in.m_44.y;
    float _425 = in.m_44.z;
    float _427 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].x, _415);
    float _429 = _391 * _417;
    float _431 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _433 = sqrt(_403);
    float _435 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].z, _409);
    float _437 = _405 * _427;
    float _439 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[14].w, _411);
    float _441 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].z, _435);
    float _443 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _445 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _447 = _419 >= 9.9999999747524270787835121154785e-07;
    bool _449 = isnan(_419);
    bool _451 = _447 || _449;
    bool _453 = isnan(9.9999999747524270787835121154785e-07);
    bool _455 = _451 || _453;
    float _457 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[24].x, _431);
    float _459 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[25].x, _443);
    float _461 = fma(_437, (*spvDescriptorSet0.vp_c8)._m0[26].x, _445);
    float _463 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[16].w, _439);
    float _465 = _433 * _441;
    float _467 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[24].z, _457);
    float _469 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[25].z, _459);
    float _471 = fma(_465, (*spvDescriptorSet0.vp_c8)._m0[26].z, _461);
    float _473 = fma(_363, _413, _425);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].w, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].w, _469);
    float _479 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].w, _471);
    float _481 = fma(_291, _413, _421);
    float _483 = fma(_361, _413, _423);
    float _485 = _363;
    float _487 = _463;
    float _489 = _475;
    if (_455)
    {
        _485 = _475;
    }
    float _491 = _485;
    float _493 = _491;
    if (_455)
    {
        _487 = _477;
    }
    float _495 = _487;
    float _497 = _495;
    if (_455)
    {
        _489 = _479;
    }
    float _499 = _489;
    float _501 = _499;
    if (!_455)
    {
        bool _503 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _505 = !_503;
        if (!_505)
        {
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _509 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _511 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _513);
            float _521 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _515);
            float _523 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _525 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _517);
            float _527 = _391 * _519;
            float _529 = _405 * _521;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _523);
            float _533 = _433 * _525;
            float _535 = _527 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _537 = _527 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _539 = _527 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _541 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _531);
            float _543 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _535);
            float _545 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _537);
            float _547 = fma(_529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _539);
            float _549 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[25].z, _543);
            float _551 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[24].z, _545);
            float _553 = fma(_533, (*spvDescriptorSet0.vp_c8)._m0[26].z, _547);
            float _555 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[25].w, _549);
            float _557 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[24].w, _551);
            float _559 = fma(_541, (*spvDescriptorSet0.vp_c8)._m0[26].w, _553);
            float _561 = _555 * _555;
            float _563 = fma(_557, _557, _561);
            float _565 = fma(_559, _559, _563);
            float _567 = rsqrt(_565);
            float _569 = _567 * 9.9999999747524270787835121154785e-07;
            float _571 = _557 * _569;
            float _573 = _555 * _569;
            float _575 = _559 * _569;
            _497 = _573;
            _493 = _571;
            _501 = _575;
            _577 = true;
        }
        else
        {
            float _579 = _145 * _145;
            float _581 = fma(_143, _143, _579);
            float _583 = fma(_147, _147, _581);
            float _585 = sqrt(_583);
            bool _587 = _585 >= 9.9999999747524270787835121154785e-07;
            bool _589 = isnan(_585);
            bool _591 = _587 || _589;
            bool _593 = isnan(9.9999999747524270787835121154785e-07);
            bool _595 = _591 || _593;
            if (!_595)
            {
                float _597 = _423 * _423;
                float _599 = fma(_421, _421, _597);
                float _601 = fma(_425, _425, _599);
                float _603 = sqrt(_601);
                bool _605 = _603 >= 9.9999999747524270787835121154785e-07;
                bool _607 = isnan(_603);
                bool _609 = _605 || _607;
                bool _611 = isnan(9.9999999747524270787835121154785e-07);
                bool _613 = _609 || _611;
                if (!_613)
                {
                    float _615 = _391 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _617 = _405 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _619 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _621 = _615 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _623 = _615 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _625 = _615 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _627 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[25].x, _621);
                    float _629 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[24].x, _623);
                    float _631 = fma(_617, (*spvDescriptorSet0.vp_c8)._m0[26].x, _625);
                    float _633 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[25].z, _627);
                    float _635 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[24].z, _629);
                    float _637 = fma(_619, (*spvDescriptorSet0.vp_c8)._m0[26].z, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _633);
                    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _635);
                    float _643 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _637);
                    float _645 = _639 * _639;
                    float _647 = fma(_641, _641, _645);
                    float _649 = fma(_643, _643, _647);
                    float _651 = rsqrt(_649);
                    float _653 = _651 * 9.9999999747524270787835121154785e-07;
                    float _655 = _641 * _653;
                    float _657 = _639 * _653;
                    float _659 = _643 * _653;
                    _497 = _657;
                    _493 = _655;
                    _501 = _659;
                    _577 = true;
                }
                else
                {
                    float _661 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _663 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _665 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _667 = _423 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _669 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].y, _661);
                    float _671 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].x, _663);
                    float _673 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].z, _665);
                    float _675 = fma(_421, (*spvDescriptorSet0.vp_c10)._m0[14].w, _667);
                    float _677 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].y, _669);
                    float _679 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].x, _671);
                    float _681 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].z, _673);
                    float _683 = fma(_425, (*spvDescriptorSet0.vp_c10)._m0[16].w, _675);
                    float _685 = _391 * _677;
                    float _687 = _405 * _679;
                    float _689 = _433 * _681;
                    float _691 = _685 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _693 = _685 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _695 = _685 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _697 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[25].x, _691);
                    float _699 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[24].x, _693);
                    float _701 = fma(_687, (*spvDescriptorSet0.vp_c8)._m0[26].x, _695);
                    float _703 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[25].z, _697);
                    float _705 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[24].z, _699);
                    float _707 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[26].z, _701);
                    float _709 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].w, _703);
                    float _711 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].w, _705);
                    float _713 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].w, _707);
                    float _715 = _709 * _709;
                    float _717 = fma(_711, _711, _715);
                    float _719 = fma(_713, _713, _717);
                    float _721 = rsqrt(_719);
                    float _723 = _721 * 9.9999999747524270787835121154785e-07;
                    float _725 = _711 * _723;
                    float _727 = _709 * _723;
                    float _729 = _713 * _723;
                    _497 = _727;
                    _493 = _725;
                    _501 = _729;
                    _577 = true;
                }
            }
            else
            {
                float _731 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _733 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _735 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _737 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].y, _731);
                float _739 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].x, _733);
                float _741 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].z, _735);
                float _743 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].y, _737);
                float _745 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].x, _739);
                float _747 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _749 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].z, _741);
                float _751 = _391 * _743;
                float _753 = _405 * _745;
                float _755 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].w, _747);
                float _757 = _433 * _749;
                float _759 = _751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _763 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].w, _755);
                float _765 = _751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _759);
                float _769 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _761);
                float _771 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _765);
                float _773 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].z, _767);
                float _775 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].z, _769);
                float _777 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].z, _771);
                float _779 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[25].w, _773);
                float _781 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[24].w, _775);
                float _783 = fma(_763, (*spvDescriptorSet0.vp_c8)._m0[26].w, _777);
                float _785 = _779 * _779;
                float _787 = fma(_781, _781, _785);
                float _789 = fma(_783, _783, _787);
                float _791 = rsqrt(_789);
                float _793 = _791 * 9.9999999747524270787835121154785e-07;
                float _795 = _781 * _793;
                float _797 = _779 * _793;
                float _799 = _783 * _793;
                _497 = _797;
                _493 = _795;
                _501 = _799;
            }
        }
    }
    _577 = false;
    float _801 = _497;
    float _803 = _493;
    float _805 = _501;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _809 = !_807;
    float _811 = _801;
    float _813 = _803;
    float _815 = _805;
    float _833;
    if (!_809)
    {
        float _817 = in.m_56.x;
        float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _821 = _817 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _823 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _825 = _823 * _819;
        float _827 = floor(_825);
        float _829 = -_827;
        float _831 = _825 + _829;
        _833 = _831;
        _835 = true;
    }
    else
    {
        float _837 = float(_85);
        float _839 = 1.0 / _837;
        float _841 = _119 * _839;
        _833 = _841;
    }
    _835 = false;
    float _843 = _833;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _847 = _843 + _845;
    float _849 = in.m_54.x;
    float _851 = in.m_54.y;
    bool _853 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _855 = isnan(_843);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _865;
    bool _869 = _843 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _871 = isnan(_843);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_863;
    float _883 = _881 + 1.0;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _885;
    float _889 = 1.0 / _867;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _893 = _879 * _883;
    float _895 = -_879;
    float _897 = _895 + 1.0;
    float _899 = _847 * _889;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _901;
    float _905 = fma(_887, _899, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _907 = fma(_903, _899, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _909 = _905 * _893;
    float _911 = _907 * _893;
    float _913 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].x, _909);
    float _915 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[143].y, _911);
    float _917 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[144].x, _913);
    float _919 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[144].y, _915);
    float _921 = _917 * _849;
    float _923 = _919 * _851;
    bool _925 = !_891;
    float _943;
    if (!_925)
    {
        float _927 = in.m_56.x;
        float _929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _931 = _927 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _933 = fma(_931, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _935 = _933 * _929;
        float _937 = floor(_935);
        float _939 = -_937;
        float _941 = _935 + _939;
        _943 = _941;
        _945 = true;
    }
    else
    {
        float _947 = float(_85);
        float _949 = 1.0 / _947;
        float _951 = _119 * _949;
        _943 = _951;
    }
    _945 = false;
    float _953 = _943;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _957 = _953 + _955;
    bool _959 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _961 = isnan(_953);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _971;
    bool _975 = _953 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _977 = isnan(_953);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = -_969;
    float _989 = _987 + 1.0;
    float _991 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _991;
    float _995 = 1.0 / _973;
    bool _997 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _999 = _985 * _989;
    float _1001 = -_985;
    float _1003 = _1001 + 1.0;
    float _1005 = _957 * _995;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1007;
    float _1011 = fma(_993, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1013;
    float _1017 = fma(_1009, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1019 = _1011 * _999;
    float _1021 = fma(_1015, _1005, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1023 = _1017 * _999;
    float _1025 = _1021 * _999;
    float _1027 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1019);
    float _1029 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1025);
    float _1031 = fma(_1003, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1023);
    float _1033 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1027);
    float _1035 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1029);
    float _1037 = fma(_969, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1031);
    bool _1039 = !_997;
    float _1057;
    if (!_1039)
    {
        float _1041 = in.m_56.x;
        float _1043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1045 = _1041 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1047 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _1049 = _1047 * _1043;
        float _1051 = floor(_1049);
        float _1053 = -_1051;
        float _1055 = _1049 + _1053;
        _1057 = _1055;
        _1059 = true;
    }
    else
    {
        float _1061 = float(_85);
        float _1063 = 1.0 / _1061;
        float _1065 = _119 * _1063;
        _1057 = _1065;
    }
    _1059 = false;
    float _1067 = _1057;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1071 = _1067 + _1069;
    float _1073 = _1033 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1079 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1081 = _1079 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1083 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1085 = isnan(_1067);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1097 = _1095 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1099 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1101 = isnan(_1067);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1107 = _1103 || _1105;
    float _1109 = float(_1107);
    float _1111 = 1.0 / _1077;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1113;
    float _1117 = -_1093;
    float _1119 = _1117 + 1.0;
    bool _1121 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1123 = isnan(_1067);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1129 = _1125 || _1127;
    float _1131 = float(_1129);
    float _1133 = _1035 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1135 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1137 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1139 = 1.0 / _1081;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1135 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1145 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1147 = 1.0 / _1097;
    float _1149 = _1115 * _1111;
    float _1151 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1153 = _1151 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1155 = _1109 * _1119;
    float _1157 = -_1109;
    float _1159 = _1157 + 1.0;
    float _1161 = fma(_1149, _1071, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1163;
    float _1167 = _1131 * _1159;
    float _1169 = _1153 * _1139;
    float _1171 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1173 = _1067 + _1171;
    bool _1175 = _1067 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1177 = isnan(_1067);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = _1161 * _1167;
    float _1189 = -_1131;
    float _1191 = _1189 + 1.0;
    float _1193 = fma(_1169, _1173, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1197 = _1067 + _1195;
    float _1199 = _1165 * _1147;
    float _1201 = -_1185;
    float _1203 = _1201 + 1.0;
    float _1205 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1187);
    float _1207 = fma(_1199, _1197, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1209 = _1093 * _1203;
    float _1211 = fma(_1193, _1155, _1205);
    float _1213 = fma(_1207, _1209, _1211);
    float _1215 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1213);
    float _1217 = _1215 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _1137;
    out.m_58.y = _1141;
    out.m_58.z = _1143;
    out.m_58.w = _1217;
    bool _1219 = !_1145;
    float _1237;
    if (!_1219)
    {
        float _1221 = in.m_56.x;
        float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1225 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _1229 = _1227 * _1223;
        float _1231 = floor(_1229);
        float _1233 = -_1231;
        float _1235 = _1229 + _1233;
        _1237 = _1235;
        _1239 = true;
    }
    else
    {
        float _1241 = float(_85);
        float _1243 = 1.0 / _1241;
        float _1245 = _119 * _1243;
        _1237 = _1245;
    }
    _1239 = false;
    float _1247 = _1237;
    float _1249 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _1251 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _1253 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _1255 = _483 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _1257 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1249);
    float _1259 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1251);
    float _1261 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1253);
    float _1263 = fma(_481, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1255);
    float _1265 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1257);
    float _1267 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1259);
    float _1269 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1261);
    float _1271 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1263);
    float _1273 = _1265 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _1275 = _1267 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1277 = _1269 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1279 = in.m_56.x;
    float _1281 = in.m_56.y;
    float _1283 = in.m_56.z;
    float _1285 = in.m_56.w;
    float _1287 = _391 * _1273;
    float _1289 = _405 * _1275;
    float _1291 = _433 * _1277;
    float _1293 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1299 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1295);
    float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1297);
    float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1299);
    float _1307 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1309 = _1247 + _1307;
    float _1311 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1301);
    float _1313 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1303);
    float _1315 = fma(_1291, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1305);
    float _1317 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1319 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1311);
    float _1321 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1313);
    float _1323 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1315);
    float _1325 = _1319 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _1327 = _1321 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1329 = _1323 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    bool _1331 = _1285 > 0.5;
    float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1335 = _1325 + _1333;
    float _1337 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1339 = _1327 + _1337;
    float _1341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1343 = _1329 + _1341;
    float _1345 = _1335 * _1335;
    float _1347 = _923 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1349;
    float _1353 = fma(_1339, _1339, _1345);
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1357 = _1355 != 0;
    float _1359 = _801 * _801;
    float _1361 = 1.0 / _1351;
    float _1363 = fma(_1343, _1343, _1353);
    int _1365 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1367 = _1365 != 0;
    float _1369 = fma(_803, _803, _1359);
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1373 = _1371 != 0;
    float _1375 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1379 = _1377 != 0;
    float _1381 = rsqrt(_1363);
    int _1383 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1385 = _1383 != 0;
    float _1387 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1389 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1391 = fma(_1387, -2.0, _1317);
    float _1393 = fma(_805, _805, _1369);
    float _1395 = _1309 * _1361;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1399 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1401 = rsqrt(_1393);
    float _1403 = -_199;
    int _1405 = _1331 ? as_type<int>(_1403) : as_type<int>(_199);
    float _1407 = fma(_1279, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1397);
    bool _1409 = _1279 > 0.5;
    float _1411 = -_1399;
    float _1413 = fma(_1389, 2.0, _1411);
    float _1415 = _1335 * _1381;
    float _1417 = _1339 * _1381;
    float _1419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1421 = -_1415;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1335);
    float _1425 = -_1417;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1339);
    float _1429 = -_193;
    int _1431 = _1409 ? as_type<int>(_1429) : as_type<int>(_193);
    float _1433 = -_119;
    float _1435 = fma(_1433, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1413);
    float _1437 = _1423 * _1423;
    float _1439 = _1389;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1443 = _1283;
    float _1445 = _1393;
    if (!_1357)
    {
        _1439 = _1281;
    }
    float _1447 = _1439;
    float _1449 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1391);
    float _1451 = _1401 * _805;
    float _1453 = fma(_1427, _1427, _1437);
    float _1455 = _1343 * _1381;
    float _1457 = _1401 * _803;
    float _1459 = _1401 * _801;
    float _1461 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1463 = _1451 * _1461;
    bool _1465 = _1283 > 0.5;
    float _1467 = -_1455;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1343);
    float _1471 = _1447;
    if (_1357)
    {
        _1471 = _1279;
    }
    float _1473 = _1471;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1479 = _1459 * _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1483 = -_1463;
    float _1485 = fma(_1457, _1481, _1483);
    float _1487 = -_193;
    int _1489 = _1465 ? as_type<int>(_1487) : as_type<int>(_193);
    float _1491 = fma(_1469, _1469, _1453);
    if (!_1357)
    {
        _1441 = _1283;
    }
    float _1493 = _1441;
    float _1495 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1475);
    bool _1497 = _1281 > 0.5;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1501 = -_1479;
    float _1503 = fma(_1451, _1499, _1501);
    float _1505 = _1493;
    if (_1357)
    {
        _1505 = _1281;
    }
    float _1507 = _1505;
    float _1509 = _1485 * _1485;
    if (_1357)
    {
        _1443 = _1281;
    }
    float _1511 = _1443;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1515 = _1457 * _1513;
    float _1517 = sqrt(_1491);
    float _1519 = fma(_1503, _1503, _1509);
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1523 = -_1515;
    float _1525 = fma(_1459, _1521, _1523);
    float _1527 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1529 = fma(_1525, _1525, _1519);
    float _1531 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1535;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1541 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1539;
    float _1543 = rsqrt(_1529);
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1547 = fma(_1533, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1549 = _1381 * _1517;
    float _1551 = fma(_1537, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1553 = -_199;
    int _1555 = _1497 ? as_type<int>(_1553) : as_type<int>(_199);
    float _1557 = fma(_1541, _1395, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1559 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1545);
    float _1561 = _921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1563 = !_1367;
    float _1565 = _1563 ? _193 : as_type<float>(_1431);
    float _1567 = _1347 * _1549;
    bool _1569 = !_1379;
    float _1571 = _1569 ? _193 : as_type<float>(_1489);
    float _1573 = _1561 * _1549;
    bool _1575 = !_1373;
    float _1577 = _1575 ? _199 : as_type<float>(_1555);
    bool _1579 = !_1385;
    float _1581 = _1579 ? _199 : as_type<float>(_1405);
    float _1583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1585 = _1525 * _1543;
    float _1587 = _1485 * _1543;
    float _1589 = _1503 * _1543;
    float _1591 = _1567 * _1583;
    float _1593 = _1459 * _1585;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1597 = _1573 * _1375;
    float _1599 = _1591 * _1457;
    float _1601 = _1457 * _1587;
    float _1603 = _1591 * _1451;
    float _1605 = -_1593;
    float _1607 = fma(_1451, _1587, _1605);
    float _1609 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1611 = _1609 * 0.5;
    float _1613 = _1565 + 0.5;
    float _1615 = fma(_1597, _1589, _1599);
    float _1617 = -_1601;
    float _1619 = fma(_1459, _1589, _1617);
    float _1621 = fma(_1597, _1585, _1603);
    float _1623 = fma(_1527, _1613, _1435);
    float _1625 = fma(_1611, _1607, _1615);
    float _1627 = _1451 * _1589;
    float _1629 = fma(_1611, _1619, _1621);
    float _1631 = _1577 + (-0.5);
    float _1633 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1635 = _1327 + _1625;
    float _1637 = _1329 + _1629;
    float _1639 = _1591 * _1459;
    float _1641 = -_1633;
    float _1643 = -_1449;
    float _1645 = fma(_1641, _1631, _1643);
    float _1647 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1649 = _1635 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1653 = _1637 + _1651;
    float _1655 = fma(_1597, _1587, _1639);
    float _1657 = -_1627;
    float _1659 = fma(_1457, _1585, _1657);
    float _1661 = _1649 * _1649;
    float _1663 = _1653 * _1653;
    bool _1665 = _1247 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1667 = isnan(_1247);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1679 = _1247 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1681 = isnan(_1247);
    bool _1683 = _1679 || _1681;
    bool _1685 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1687 = _1683 || _1685;
    float _1689 = float(_1687);
    float _1691 = _1661 + _1663;
    float _1693 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1695 = -_1689;
    float _1697 = _1695 + 1.0;
    float _1699 = sqrt(_1691);
    float _1701 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1703 = _1675 * _1697;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1707 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1709 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1701);
    float _1711 = _1473 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1713 = _1547 * _1703;
    float _1715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1717 = _1551 * _1703;
    float _1719 = _1557 * _1703;
    float _1721 = -_1705;
    float _1723 = fma(_1711, 2.0, _1721);
    float _1725 = fma(_1693, -2.0, _1707);
    float _1727 = fma(_1611, _1659, _1655);
    float _1729 = -_1675;
    float _1731 = _1729 + 1.0;
    float _1733 = _1677 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1735 = _1699 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1737 = _1571 + 0.5;
    float _1739 = _1581 + (-0.5);
    float _1741 = -_119;
    float _1743 = fma(_1741, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1723);
    float _1745 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1725);
    float _1747 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1713);
    float _1749 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1717);
    float _1751 = fma(_1733, _1737, _1743);
    float _1753 = _1715 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1755 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1719);
    float _1757 = _1325 + _1727;
    float _1759 = -_1753;
    float _1761 = -_1745;
    float _1763 = fma(_1759, _1739, _1761);
    bool _1765 = !_1735;
    float _1767 = _1757;
    float _1769 = _1661;
    float _1771 = _1663;
    float _1773 = _1635;
    float _1775 = _1637;
    float _1777 = _1581;
    if (!_1765)
    {
        float _1779 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1783 = _1699 + _1781;
        float _1785 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1787 = rsqrt(_1691);
        float _1789 = _1783 * _1779;
        float _1791 = _1789 * 0.15915493667125701904296875;
        float _1793 = _1791 * 6.283185482025146484375;
        float _1795 = sin(_1793);
        float _1797 = _1791 * 6.283185482025146484375;
        float _1799 = cos(_1797);
        float _1801 = fma(_1795, _1785, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1803 = _1787 * _1801;
        float _1805 = _1799 + (-1.0);
        float _1807 = fma(_1649, _1803, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1809 = fma(_1653, _1803, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1811 = _1805 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1813 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1815 = _1807 + _1813;
        float _1817 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1819 = _1809 + _1817;
        float _1821 = fma(_1757, _1799, _1811);
        float _1823 = _1815 * _1815;
        float _1825 = _1819 * _1819;
        _1767 = _1821;
        _1769 = _1823;
        _1771 = _1825;
        _1773 = _1807;
        _1775 = _1809;
    }
    float _1827 = _1767;
    float _1829 = _1769;
    float _1831 = _1771;
    float _1833 = _1773;
    float _1835 = _1775;
    float _1837 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1839 = _1827 + _1837;
    float _1841 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    float _1843 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1495);
    float _1845 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1709);
    float _1847 = fma(_1839, _1839, _1829);
    float _1849 = -_1841;
    float _1851 = _1849 + 1.0;
    float _1853 = -_1843;
    float _1855 = _1853 + 1.0;
    float _1857 = -_1845;
    float _1859 = _1857 + 1.0;
    float _1861 = _1847 + _1831;
    float _1863 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1747);
    float _1865 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1749);
    float _1867 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1755);
    float _1869 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1559);
    float _1871 = -_1851;
    float _1873 = fma(_1565, _1871, _1623);
    float _1875 = sqrt(_1861);
    float _1877 = fma(_1577, _1855, _1645);
    float _1879 = -_1859;
    float _1881 = fma(_1571, _1879, _1751);
    float _1883 = -_1869;
    float _1885 = _1883 + 1.0;
    float _1887 = _1863 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1889 = _1865 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1891 = _1867 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1893 = fma(_1581, _1885, _1763);
    float _1895 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1899 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_60.x = _1873;
    out.m_60.y = _1877;
    out.m_60.z = _1881;
    out.m_60.w = _1893;
    out.m_62.x = _1895;
    out.m_62.y = _1897;
    out.m_62.z = _1899;
    bool _1901 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1903 = isnan(_1875);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1909 = _1905 || _1907;
    float _1911 = _1899;
    float _1913 = _1897;
    if (!_1909)
    {
        _1777 = 1.0;
    }
    float _1915 = _1777;
    bool _1917 = !_1909;
    float _1919 = _1915;
    if (!_1917)
    {
        bool _1921 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1923 = isnan(_1875);
        bool _1925 = _1921 || _1923;
        bool _1927 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1929 = _1925 || _1927;
        if (!_1929)
        {
            float _1931 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1933 = _1875 + _1931;
            float _1935 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1937 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1935;
            float _1939 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1941 = _1939 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1943 = 1.0 / _1937;
            float _1945 = _1933 * _1943;
            float _1947 = fma(_1945, _1941, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1919 = _1947;
            _1949 = true;
        }
        else
        {
            bool _1951 = _1875 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1953 = isnan(_1875);
            bool _1955 = _1951 || _1953;
            bool _1957 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1959 = _1955 || _1957;
            if (!_1959)
            {
                float _1961 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1963 = _1875 + _1961;
                float _1965 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1967 = _1965 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1969 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1971 = _1969 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1973 = 1.0 / _1967;
                float _1975 = _1963 * _1973;
                float _1977 = fma(_1975, _1971, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1919 = _1977;
                _1949 = true;
            }
            else
            {
                _1919 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1949 = false;
    float _1979 = _1919;
    float _1981 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1983 = _1827 + _1981;
    float _1985 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1987 = _1833 + _1985;
    float _1989 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1991 = _1835 + _1989;
    float _1993 = fma(_1983, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1995 = fma(_1987, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1997 = fma(_1991, _1979, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1999 = -_1325;
    float _2001 = _1999 + _1993;
    float _2003 = -_1327;
    float _2005 = _2003 + _1995;
    float _2007 = -_1329;
    float _2009 = _2007 + _1997;
    float _2011 = _2001 * _2001;
    float _2013 = fma(_2005, _2005, _2011);
    float _2015 = fma(_2009, _2009, _2013);
    float _2017 = sqrt(_2015);
    bool _2019 = _2017 > 0.0;
    bool _2021 = !_2019;
    float _2023 = _2017;
    float _2025 = _1993;
    float _2027 = _1995;
    float _2029 = _1997;
    float _2031 = _2015;
    if (!_2021)
    {
        bool _2033 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2035 = _1869;
        if (_2033)
        {
            float _2037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2035 = _2037;
        }
        float _2039 = _2035;
        if (_2033)
        {
            _1911 = _1393;
        }
        float _2041 = _1911;
        float _2043 = _2041;
        if (_2033)
        {
            float _2045 = _2039 * _803;
            _2023 = _2045;
        }
        float _2047 = _2023;
        float _2049 = _2047;
        float _2051 = _2047;
        if (_2033)
        {
            float _2053 = _2039 * _801;
            _1445 = _2053;
        }
        float _2055 = _1445;
        float _2057 = _2055;
        if (_2033)
        {
            float _2059 = _2039 * _805;
            _1913 = _2059;
        }
        float _2061 = _1913;
        float _2063 = _2061;
        if (!_2033)
        {
            float _2065 = _119 + 1.0;
            float _2067 = _2065;
            if (!_157)
            {
                float _2069 = _2065 * _2065;
                float _2071 = _2069 * 0.5;
                _2049 = _2071;
            }
            float _2073 = _2049;
            float _2075 = _2073;
            if (!_157)
            {
                float _2077 = _2073 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2075 = _2077;
            }
            float _2079 = _2075;
            bool _2081 = !_157;
            float _2083 = _2079;
            if (!_2081)
            {
                float _2085 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2087 = log2(_2085);
                float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2091 = _2089 + 1.0;
                float _2093 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2095 = _2087 * _2065;
                float _2097 = 1.0 / _2091;
                float _2099 = _2093 * 0.693147182464599609375;
                float _2101 = exp2(_2095);
                float _2103 = 1.0 / _2099;
                float _2105 = _2101 + (-1.0);
                float _2107 = -_2105;
                float _2109 = fma(_2107, _2103, _2065);
                float _2111 = _2109 * _2097;
                float _2113 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2083 = _2113;
            }
            float _2115 = _2083;
            float _2117 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2119 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2121 = !_157;
            if (!_2121)
            {
                float _2123 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2125 = log2(_2123);
                float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2129 = _2127 + 1.0;
                float _2131 = 1.0 / _2129;
                float _2133 = _2125 * _2065;
                float _2135 = exp2(_2133);
                float _2137 = -_2135;
                float _2139 = _2137 + 1.0;
                float _2141 = _2139 * _2131;
                _2067 = _2141;
            }
            float _2143 = _2067;
            float _2145 = fma(_2143, _145, _2119);
            float _2147 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2149 = fma(_2143, _143, _2117);
            float _2151 = -_367;
            float _2153 = _2151 + _2145;
            float _2155 = fma(_2143, _147, _2147);
            float _2157 = -_371;
            float _2159 = _2157 + _2149;
            float _2161 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _2163 = -_377;
            float _2165 = _2163 + _2155;
            float _2167 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _2169 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _2171 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].y, _2161);
            float _2173 = _2153 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _2175 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].x, _2167);
            float _2177 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].y, _2171);
            float _2179 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].z, _2173);
            float _2181 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].x, _2175);
            float _2183 = fma(_2159, (*spvDescriptorSet0.vp_c10)._m0[14].w, _2169);
            float _2185 = _391 * _2177;
            float _2187 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].z, _2179);
            float _2189 = _405 * _2181;
            float _2191 = fma(_2165, (*spvDescriptorSet0.vp_c10)._m0[16].w, _2183);
            float _2193 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _2195 = _433 * _2187;
            float _2197 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _2199 = _2185 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _2201 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2193);
            float _2203 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2197);
            float _2205 = fma(_2189, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2199);
            float _2207 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2201);
            float _2209 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2203);
            float _2211 = fma(_2195, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2205);
            float _2213 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[25].w, _2207);
            float _2215 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[24].w, _2209);
            float _2217 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[26].w, _2211);
            float _2219 = _2213 * _2213;
            float _2221 = fma(_2215, _2215, _2219);
            float _2223 = fma(_2217, _2217, _2221);
            _2043 = _2223;
            _811 = _2213;
            _813 = _2215;
            _815 = _2217;
            _2051 = _2215;
            _2057 = _2213;
            _2063 = _2217;
        }
        float _2225 = _2043;
        float _2227 = _811;
        float _2229 = _813;
        float _2231 = _815;
        float _2233 = _2051;
        float _2235 = _2057;
        float _2237 = _2063;
        float _2239 = sqrt(_2225);
        float _2241 = rsqrt(_2015);
        bool _2243 = _2239 > 0.0;
        float _2245 = _2005 * _2241;
        float _2247 = _2001 * _2241;
        float _2249 = _2009 * _2241;
        bool _2251 = !_2243;
        if (!_2251)
        {
            float _2253 = rsqrt(_2225);
            float _2255 = _2253 * _2227;
            float _2257 = _2253 * _2229;
            float _2259 = _2247 * _2255;
            float _2261 = _2253 * _2231;
            float _2263 = fma(_2245, _2257, _2259);
            float _2265 = fma(_2249, _2261, _2263);
            float _2267 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2269 = fma(_2233, _2267, _1995);
            float _2271 = fma(_2235, _2267, _1993);
            float _2273 = fma(_2237, _2267, _1997);
            _2025 = _2271;
            _2027 = _2269;
            _2029 = _2273;
        }
    }
    float _2275 = _2025;
    float _2277 = _2027;
    float _2279 = _2029;
    float _2281 = -_1415;
    float _2283 = fma(_2281, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2275);
    float _2285 = -_1417;
    float _2287 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2277);
    float _2289 = -_1455;
    float _2291 = fma(_2289, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2279);
    float _2293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2295 = _2283 + _2293;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2299 = _2287 + _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2303 = _2291 + _2301;
    float _2305 = _2295 * _2295;
    float _2307 = fma(_2299, _2299, _2305);
    float _2309 = fma(_2303, _2303, _2307);
    float _2311 = rsqrt(_2309);
    float _2313 = sqrt(_2309);
    float _2315 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2317 = _2299 * _2315;
    float _2319 = _2303 * _2315;
    float _2321 = _2317 * _2317;
    float _2323 = _2319 * _2319;
    float _2325 = _2321 + _2323;
    float _2327 = sqrt(_2325);
    bool _2329 = _2327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2333 = _2327 + _2331;
    float _2335 = _2311;
    float _2337 = _2333;
    float _2339 = _2295;
    float _2341 = _2315;
    if (_2329)
    {
        float _2343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2335 = _2343;
    }
    float _2345 = _2335;
    float _2347 = _2345;
    if (_2329)
    {
        float _2349 = _2333 * _2345;
        _2337 = _2349;
    }
    float _2351 = _2337;
    if (_2329)
    {
        float _2353 = rsqrt(_2325);
        _2347 = _2353;
    }
    float _2355 = _2347;
    float _2357 = _2355;
    if (_2329)
    {
        float _2359 = _2351 * 0.15915493667125701904296875;
        _2031 = _2359;
    }
    float _2361 = _2031;
    float _2363 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2365 = _2303;
    float _2367 = _2361;
    if (_2329)
    {
        float _2369 = _2361 * 6.283185482025146484375;
        float _2371 = sin(_2369);
        _2365 = _2371;
    }
    float _2373 = _2365;
    float _2375 = precise::max(0.0, _2363);
    float _2377 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2379 = _2275;
    float _2381 = _2375;
    if (_2329)
    {
        float _2383 = _2361 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        _2379 = _2385;
    }
    float _2387 = _2379;
    float _2389 = -_2315;
    float _2391 = -_2375;
    float _2393 = fma(_2295, _2389, _2391);
    if (_2329)
    {
        float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2339 = _2395;
    }
    float _2397 = _2339;
    float _2399 = _2373;
    float _2401 = _2397;
    if (_2329)
    {
        float _2403 = fma(_2373, _2397, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2399 = _2403;
    }
    float _2405 = _2399;
    float _2407 = _2405;
    if (!_2329)
    {
        _2401 = _2393;
    }
    float _2409 = _2401;
    float _2411 = _2409;
    if (_2329)
    {
        float _2413 = _2355 * _2405;
        _2341 = _2413;
    }
    float _2415 = _2341;
    if (!_2329)
    {
        _2357 = _2317;
    }
    float _2417 = _2357;
    float _2419 = _2417;
    float _2421 = _2387;
    if (_2329)
    {
        float _2423 = _2387 + (-1.0);
        _2381 = _2423;
    }
    float _2425 = _2381;
    float _2427 = _2425;
    if (_2329)
    {
        float _2429 = _2317 * _2415;
        _2419 = _2429;
    }
    float _2431 = _2419;
    if (!_2329)
    {
        _2407 = _2321;
    }
    float _2433 = _2407;
    float _2435 = _2433;
    if (_2329)
    {
        float _2437 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2437;
    }
    float _2439 = _2367;
    if (!_2329)
    {
        _2427 = _2319;
    }
    float _2441 = _2427;
    float _2443 = _2441;
    if (_2329)
    {
        float _2445 = _2319 * _2415;
        _2443 = _2445;
    }
    float _2447 = _2443;
    if (_2329)
    {
        float _2449 = _2431 * _2431;
        _2435 = _2449;
    }
    float _2451 = _2435;
    if (_2329)
    {
        float _2453 = fma(_2393, _2387, _2439);
        _2411 = _2453;
    }
    float _2455 = _2411;
    if (!_2329)
    {
        _2421 = _2323;
    }
    float _2457 = _2421;
    float _2459 = _2457;
    if (_2329)
    {
        float _2461 = _2447 * _2447;
        _2459 = _2461;
    }
    float _2463 = _2459;
    float _2465 = fma(_2455, _2455, _2451);
    float _2467 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2469 = _2465 + _2463;
    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2473 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2471);
    float _2475 = precise::clamp(_2473, 0.0, 1.0);
    float _2477 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2467);
    float _2479 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2481 = rsqrt(_2469);
    float _2483 = -_2475;
    float _2485 = _2483 + 1.0;
    float _2487 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2477);
    float _2489 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2491 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2479);
    float _2493 = _2283 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2495 = _2487 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2497 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2489);
    float _2499 = abs(_2485);
    float _2501 = log2(_2499);
    float _2503 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2491);
    float _2505 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2507 = fma(_2287, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2493);
    float _2509 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2497);
    float _2511 = _2503 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2513 = -_2505;
    float _2515 = fma(_2513, _2377, 1.0);
    float _2517 = fma(_2291, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2507);
    float _2519 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2521 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2523 = _2481 * _2431;
    float _2525 = _2481 * _2455;
    float _2527 = _2481 * _2447;
    float _2529 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2521);
    float _2531 = _2523 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2533 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2535 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2537 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2529);
    float _2539 = -_2531;
    float _2541 = fma(_2525, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2539);
    float _2543 = log2(_2515);
    float _2545 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2547 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2537);
    float _2549 = -_2527;
    float _2551 = fma(_2549, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2541);
    float _2553 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2555 = fma(_2551, -0.5, 0.5);
    float _2557 = exp2(_2535);
    float _2559 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2553);
    float _2561 = fma(_2551, 0.5, 0.5);
    float _2563 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2545);
    float _2565 = _2525 + 1.0;
    float _2567 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2559);
    float _2569 = fma(_2561, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2571 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2563);
    float _2573 = 1.0 / _2547;
    float _2575 = _2543 * 0.693147182464599609375;
    float _2577 = fma(_2561, _2569, -0.212114393711090087890625);
    float _2579 = _2575 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2581 = fma(_2561, _2577, 1.570728778839111328125);
    float _2583 = sqrt(_2555);
    float _2585 = -_2525;
    float _2587 = fma(_2557, _2565, _2585);
    float _2589 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2567);
    float _2591 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2571);
    float _2593 = fma(_2587, 0.5, 0.5);
    float _2595 = _2589 * _2573;
    float _2597 = _2591 * _2573;
    float _2599 = fma(_2595, 0.5, 0.5);
    float _2601 = fma(_2597, -0.5, 0.5);
    float _2603 = _2583 * 0.636619746685028076171875;
    float3 _7001 = float3(_2599, _2601, _2579);
    float _2605 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).x;
    float3 _7012 = float3(_2599, _2601, _2579);
    float4 _2608 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7012, float3(0.0), isnan(_7012)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7012, float3(0.0), isnan(_7012)), level(0.0)).xyzw;
    float _2610 = _2608.x;
    float _2612 = _2608.y;
    float _2614 = _2608.z;
    float _2616 = _2608.w;
    float _2618 = -_2581;
    float _2620 = fma(_2603, _2618, 1.0);
    float2 _7034 = float2(_2620, _2593);
    float3 _2624 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7034, float2(0.0), isnan(_7034)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7034, float2(0.0), isnan(_7034)), level(0.0)).xyz;
    float _2626 = _2624.x;
    float _2628 = _2624.y;
    float _2630 = _2624.z;
    float _2632 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2634 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2636 = _2589 + _2547;
    float _2638 = fma(_2519, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2632);
    float _2640 = _2636 * 0.5;
    float _2642 = exp2(_2634);
    float _2644 = fma(_2495, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2638);
    float _2646 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2644);
    float _2648 = _2547 * 0.5;
    float _2650 = _2646 + _2547;
    float _2652 = -_2642;
    float _2654 = _2652 + 1.0;
    float _2656 = fma(_2591, -0.5, _2648);
    float _2658 = _2650 * 0.5;
    float _2660 = _2654 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2589;
    out.gl_Position.y = _2591;
    out.gl_Position.z = _2646;
    out.gl_Position.w = _2547;
    float _2662 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _2640;
    out.m_64.y = _2656;
    out.m_64.z = _2658;
    out.m_64.w = _2547;
    out.m_47.x = _2662;
    float _2664 = _2660 * _2605;
    float _2666 = -_2660;
    float _2668 = _2666 + 1.0;
    float _2670 = _2616 * _2664;
    float _2672 = _2630 * _2664;
    float _2674 = fma(_2626, _2670, _2610);
    float _2676 = fma(_2628, _2670, _2612);
    float _2678 = _2616 * _2668;
    float _2680 = fma(_2616, _2672, _2614);
    out.m_66.x = _2674;
    out.m_66.y = _2676;
    out.m_66.z = _2680;
    out.m_66.w = _2678;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

