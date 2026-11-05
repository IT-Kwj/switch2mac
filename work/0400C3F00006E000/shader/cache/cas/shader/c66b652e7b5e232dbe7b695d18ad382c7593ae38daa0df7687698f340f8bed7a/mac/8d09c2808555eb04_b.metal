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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_47 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1307 = false;
    bool _607 = false;
    bool _457 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1939 = as_type<float>(_99);
        out.gl_Position.z = _1939;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_113)
    {
        float _123 = float(_83);
        _93 = _123;
    }
    float _125 = _93;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _101 = as_type<int>(_137);
    }
    int _139 = _101;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_139);
        out.gl_Position.z = _2010;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _141 = _165;
    }
    float _167 = _141;
    float _169 = 0.0;
    float _171 = _167;
    if (!_159)
    {
        float _173 = _117 * _117;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    if (!_159)
    {
        float _179 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _179;
    }
    float _181 = _171;
    bool _183 = !_159;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _149 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _149);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _119 = _205;
        _185 = _215;
        _121 = _203;
    }
    float _217 = _119;
    float _219 = _185;
    float _221 = _121;
    bool _223 = !_159;
    float _225 = _217;
    float _227 = _221;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _225 = _241;
        _227 = _235;
        _161 = _247;
    }
    float _249 = _225;
    float _251 = _227;
    float _253 = _161;
    float _255 = _251;
    float _257 = _249;
    if (!_159)
    {
        _255 = _117;
    }
    float _259 = _255;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _259;
    if (!_159)
    {
        float _265 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _265;
    }
    float _267 = _257;
    bool _269 = !_159;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _117 * _275;
        float _285 = 1.0 / _279;
        float _287 = _281 * 0.693147182464599609375;
        float _289 = exp2(_283);
        float _291 = 1.0 / _287;
        float _293 = _289 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _291, _117);
        float _299 = _297 * _285;
        float _301 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _301;
    }
    float _303 = _271;
    bool _305 = !_159;
    if (!_305)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _117 * _309;
        float _319 = exp2(_317);
        float _321 = -_319;
        float _323 = _321 + 1.0;
        float _325 = _323 * _315;
        _263 = _325;
    }
    float _327 = _263;
    float _329 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _331 = fma(_253, _145, _261);
    float _333 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _335 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = fma(_327, _145, _329);
    float _339 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = fma(_253, _143, _333);
    float _345 = fma(_327, _143, _335);
    float _347 = -_337;
    float _349 = _331 + _347;
    float _351 = fma(_253, _147, _339);
    float _353 = fma(_327, _147, _341);
    float _355 = -_345;
    float _357 = _343 + _355;
    float _359 = _349 * _349;
    float _361 = in.m_51.w;
    float _363 = -_353;
    float _365 = _351 + _363;
    float _367 = _349 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = fma(_357, _357, _359);
    float _371 = _349 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = _349 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _377 = fma(_365, _365, _369);
    float _379 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = in.m_44.x;
    float _383 = in.m_44.y;
    float _385 = in.m_44.z;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _391 = sqrt(_377);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _395 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _397 = _391 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_391);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_343, _361, _381);
    float _409 = fma(_331, _361, _383);
    float _411 = fma(_351, _361, _385);
    float _413 = _393;
    float _415 = _389;
    float _417 = _395;
    if (!_405)
    {
        bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _421 = !_419;
        if (!_421)
        {
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _433);
            float _441 = _435 * _435;
            float _443 = fma(_437, _437, _441);
            float _445 = fma(_439, _439, _443);
            float _447 = rsqrt(_445);
            float _449 = _447 * 9.9999999747524270787835121154785e-07;
            float _451 = _437 * _449;
            float _453 = _435 * _449;
            float _455 = _439 * _449;
            _413 = _453;
            _415 = _451;
            _417 = _455;
            _457 = true;
        }
        else
        {
            float _459 = _145 * _145;
            float _461 = fma(_143, _143, _459);
            float _463 = fma(_147, _147, _461);
            float _465 = sqrt(_463);
            bool _467 = _465 >= 9.9999999747524270787835121154785e-07;
            bool _469 = isnan(_465);
            bool _471 = _467 || _469;
            bool _473 = isnan(9.9999999747524270787835121154785e-07);
            bool _475 = _471 || _473;
            if (!_475)
            {
                float _477 = _383 * _383;
                float _479 = fma(_381, _381, _477);
                float _481 = fma(_385, _385, _479);
                float _483 = sqrt(_481);
                bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
                bool _487 = isnan(_483);
                bool _489 = _485 || _487;
                bool _491 = isnan(9.9999999747524270787835121154785e-07);
                bool _493 = _489 || _491;
                if (!_493)
                {
                    float _495 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _497 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _495);
                    float _499 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _497);
                    float _501 = rsqrt(_499);
                    float _503 = _501 * 9.9999999747524270787835121154785e-07;
                    float _505 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _507 = _503 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _413 = _507;
                    _415 = _505;
                    _417 = _509;
                    _457 = true;
                }
                else
                {
                    float _511 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _515 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _517 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
                    float _519 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _513);
                    float _521 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _515);
                    float _523 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
                    float _525 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
                    float _527 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _521);
                    float _529 = _523 * _523;
                    float _531 = fma(_525, _525, _529);
                    float _533 = fma(_527, _527, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _525 * _537;
                    float _541 = _523 * _537;
                    float _543 = _527 * _537;
                    _413 = _541;
                    _415 = _539;
                    _417 = _543;
                    _457 = true;
                }
            }
            else
            {
                float _545 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _547 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _549 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _551 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                float _553 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                float _555 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                float _557 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                float _559 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                float _561 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                float _563 = _557 * _557;
                float _565 = fma(_559, _559, _563);
                float _567 = fma(_561, _561, _565);
                float _569 = rsqrt(_567);
                float _571 = _569 * 9.9999999747524270787835121154785e-07;
                float _573 = _559 * _571;
                float _575 = _557 * _571;
                float _577 = _561 * _571;
                _413 = _575;
                _415 = _573;
                _417 = _577;
            }
        }
    }
    _457 = false;
    float _579 = _413;
    float _581 = _415;
    float _583 = _417;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _587 = !_585;
    float _605;
    if (!_587)
    {
        float _589 = in.m_53.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_83);
        float _611 = 1.0 / _609;
        float _613 = _117 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _619 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _621 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _623 = as_type<float>(int(gl_VertexIndex));
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _633 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _617);
    float _635 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _619);
    float _637 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _621);
    float _639 = 1.0 / _631;
    float _641 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _643 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _635);
    float _645 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _647 = _579 * _579;
    float _649 = _641 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _653 = _645 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _655 = 1.0 / _627;
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _659 = _649 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _615 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _667 = _651 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _671 = _653 + _669;
    float _673 = _659 * _659;
    float _675 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _677 = precise::clamp(_675, 0.0, 1.0);
    float _679 = _663 * _639;
    float _681 = fma(_667, _667, _673);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = _615 + _683;
    bool _687 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _689 = isnan(_615);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    bool _699 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_615);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = fma(_671, _671, _681);
    bool _713 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _715 = isnan(_615);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_581, _581, _647);
    float _727 = _685 * _655;
    float _729 = -_723;
    float _731 = _729 + 1.0;
    float _733 = fma(_583, _583, _725);
    float _735 = rsqrt(_711);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _741 = _709 * _731;
    float _743 = -_709;
    float _745 = _743 + 1.0;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _755;
    float _759 = fma(_739, _679, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _761 = rsqrt(_733);
    float _763 = fma(_677, -0.64999997615814208984375, 1.0);
    float _765 = fma(_749, _727, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _767 = _697 * _745;
    float _769 = fma(_753, _679, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _771 = fma(_757, _727, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _773 = as_type<int>(_623) & 1;
    bool _775 = _773 != 0;
    int _777 = as_type<int>(_623) & 2;
    bool _779 = _777 != 0;
    float _781 = _659 * _735;
    float _783 = _765 * _767;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _785;
    float _789 = -_781;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _793 = _771 * _767;
    float _795 = -_697;
    float _797 = _795 + 1.0;
    float _799 = _761 * _581;
    float _801 = _667 * _735;
    float _803 = _791 * _791;
    float _805 = _761 * _583;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _809 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _807;
    float _811 = -_801;
    float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _815 = _787 * _787;
    float _817 = _761 * _579;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[143].x, _783);
    float _821 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[143].y, _793);
    float _823 = fma(_813, _813, _803);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _827 = _805 * _825;
    float _829 = _671 * _735;
    float _831 = in.m_51.x;
    float _833 = in.m_51.y;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _835;
    float _839 = fma(_809, _809, _815);
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _843 = _817 * _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _847 = -_827;
    float _849 = fma(_799, _845, _847);
    float _851 = -_829;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _855 = fma(_837, _837, _839);
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _859 = _799 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _863 = -_843;
    float _865 = fma(_805, _861, _863);
    float _867 = _849 * _849;
    float _869 = fma(_853, _853, _823);
    float _871 = rsqrt(_855);
    float _873 = fma(_759, _741, _819);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _877 = -_859;
    float _879 = fma(_817, _875, _877);
    float _881 = fma(_865, _865, _867);
    float _883 = fma(_769, _741, _821);
    float _885 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[145].x, _873);
    float _887 = fma(_879, _879, _881);
    float _889 = sqrt(_869);
    float _891 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[145].y, _883);
    float _893 = _891 * _833;
    float _895 = _885 * _831;
    float _897 = rsqrt(_887);
    float _899 = _871 * (-0.20000000298023223876953125);
    float _901 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _905 = !_779;
    float _907 = _905 ? (-0.5) : 0.5;
    float _909 = fma(_837, _899, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _911 = !_775;
    float _913 = _911 ? (-0.5) : 0.5;
    float _915 = sqrt(_855);
    float _917 = _735 * _889;
    float _919 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _907);
    float _921 = fma(_787, _899, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _913);
    float _925 = _901 * _917;
    float _927 = _903 * _917;
    float _929 = fma(_809, _899, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _931 = _865 * _897;
    float _933 = _925 * _919;
    float _935 = _849 * _897;
    float _937 = _879 * _897;
    float _939 = _927 * _923;
    float _941 = _805 * _931;
    float _943 = _933 * _817;
    float _945 = _817 * _937;
    float _947 = _915 * 0.066666670143604278564453125;
    float _949 = -_941;
    float _951 = fma(_799, _937, _949);
    float _953 = _917 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _955 = _953 * 0.5;
    float _957 = _933 * _799;
    float _959 = fma(_939, _935, _943);
    float _961 = precise::max(_947, 1.0);
    float _963 = _799 * _935;
    float _965 = -_945;
    float _967 = fma(_805, _935, _965);
    float _969 = fma(_939, _931, _957);
    float _971 = fma(_955, _951, _959);
    float _973 = _933 * _805;
    float _975 = precise::min(_961, 2.0);
    float _977 = fma(_955, _967, _969);
    float _979 = _649 + _971;
    float _981 = -_963;
    float _983 = fma(_817, _931, _981);
    float _985 = fma(_939, _937, _973);
    float _987 = -_921;
    float _989 = _987 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _991 = _975 * _763;
    float _993 = _651 + _977;
    float _995 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _997 = _979 + _995;
    float _999 = fma(_955, _983, _985);
    float _1001 = _989 * _989;
    float _1003 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1005 = _993 + _1003;
    float _1007 = fma(_997, _991, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1009 = _653 + _999;
    float _1011 = -_929;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = fma(_1005, _991, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1017 = -_1007;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1021 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1023 = _1009 + _1021;
    float _1025 = fma(_1013, _1013, _1001);
    float _1027 = -_909;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1031 = -_1015;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1035 = _1019 * _1019;
    float _1037 = fma(_1023, _991, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1041 = _921 + _1039;
    float _1043 = fma(_1029, _1029, _1025);
    float _1045 = fma(_1033, _1033, _1035);
    float _1047 = -_1037;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _929 + _1051;
    float _1055 = _1041 * _1041;
    float _1057 = in.m_53.x;
    float _1059 = in.m_53.y;
    float _1061 = fma(_1049, _1049, _1045);
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1065 = _909 + _1063;
    float _1067 = fma(_1053, _1053, _1055);
    float _1069 = sqrt(_1043);
    float _1071 = fma(_1065, _1065, _1067);
    float _1073 = sqrt(_1061);
    float _1075 = rsqrt(_1071);
    bool _1077 = _1057 > 0.5;
    bool _1079 = _1059 > 0.5;
    float _1081 = -_1069;
    float _1083 = _1073 + _1081;
    float _1085 = _1075 * _1083;
    float _1087 = -_1085;
    float _1089 = fma(_1053, _1087, _1015);
    float _1091 = -_1085;
    float _1093 = fma(_1065, _1091, _1037);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1089 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1103 = _1093 + _1101;
    float _1105 = -_1085;
    float _1107 = fma(_1041, _1105, _1007);
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1111 = _1109 != 0;
    float _1113 = _1099 * _1099;
    float _1115 = _1103 * _1103;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1119 = _1117 != 0;
    float _1121 = _1113 + _1115;
    float _1123 = sqrt(_1121);
    bool _1125 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1129 = _1113;
    float _1131 = _1041;
    float _1133 = _1075;
    float _1135 = _1115;
    float _1137 = _1121;
    if (!_1125)
    {
        _1127 = _1113;
    }
    float _1139 = _1127;
    float _1141 = _1139;
    if (!_1125)
    {
        _1129 = _1089;
    }
    float _1143 = _1129;
    float _1145 = _1143;
    if (!_1125)
    {
        _1131 = _1093;
    }
    float _1147 = _1131;
    float _1149 = _1147;
    if (!_1125)
    {
        _1133 = _1107;
    }
    float _1151 = _1133;
    bool _1153 = !_1125;
    float _1155 = _1151;
    if (!_1153)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1123 + _1159;
        float _1163 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1121);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1181 = _1165 * _1179;
        float _1183 = _1177 + (-1.0);
        float _1185 = fma(_1099, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1187 = fma(_1103, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1189 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1193 = _1185 + _1191;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1197 = _1187 + _1195;
        float _1199 = fma(_1107, _1177, _1189);
        float _1201 = _1193 * _1193;
        float _1203 = _1197 * _1197;
        _1155 = _1199;
        _1141 = _1201;
        _1135 = _1203;
        _1145 = _1185;
        _1149 = _1187;
    }
    float _1205 = _1155;
    float _1207 = _1141;
    float _1209 = _1135;
    float _1211 = _1145;
    float _1213 = _1149;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1217 = _1205 + _1215;
    float _1219 = -_913;
    int _1221 = _1077 ? as_type<int>(_1219) : as_type<int>(_913);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1225 = -_907;
    int _1227 = _1079 ? as_type<int>(_1225) : as_type<int>(_907);
    float _1229 = fma(_1217, _1217, _1207);
    bool _1231 = !_1111;
    float _1233 = _1231 ? _913 : as_type<float>(_1221);
    bool _1235 = !_1119;
    float _1237 = _1235 ? _907 : as_type<float>(_1227);
    float _1239 = _1229 + _1209;
    float _1241 = _1233 + 0.5;
    float _1243 = -_1237;
    float _1245 = _1243 + 0.5;
    float _1247 = sqrt(_1239);
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1253 = _1249 * _1095;
    float _1255 = _1251 * _1223;
    out.m_58.x = _1253;
    out.m_58.y = _1255;
    bool _1257 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1259 = isnan(_1247);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1265 = _1261 || _1263;
    float _1267 = _1207;
    float _1269 = _1255;
    float _1271 = _1245;
    if (!_1265)
    {
        _1267 = 1.0;
    }
    float _1273 = _1267;
    bool _1275 = !_1265;
    float _1277 = _1273;
    if (!_1275)
    {
        bool _1279 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1281 = isnan(_1247);
        bool _1283 = _1279 || _1281;
        bool _1285 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1287 = _1283 || _1285;
        if (!_1287)
        {
            float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1291 = _1247 + _1289;
            float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1295 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1293;
            float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1299 = _1297 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1301 = 1.0 / _1295;
            float _1303 = _1291 * _1301;
            float _1305 = fma(_1303, _1299, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1277 = _1305;
            _1307 = true;
        }
        else
        {
            bool _1309 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1311 = isnan(_1247);
            bool _1313 = _1309 || _1311;
            bool _1315 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1317 = _1313 || _1315;
            if (!_1317)
            {
                float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1321 = _1247 + _1319;
                float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1325 = _1323 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1329 = _1327 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1331 = 1.0 / _1325;
                float _1333 = _1321 * _1331;
                float _1335 = fma(_1333, _1329, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1277 = _1335;
                _1307 = true;
            }
            else
            {
                _1277 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1307 = false;
    float _1337 = _1277;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1341 = _1205 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1345 = _1211 + _1343;
    float _1347 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1349 = _1213 + _1347;
    float _1351 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1353 = fma(_1345, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1355 = fma(_1349, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1357 = -_781;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1361 = -_801;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1353);
    float _1365 = -_829;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1355);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = _1359 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = _1363 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1371 * _1371;
    float _1383 = fma(_1375, _1375, _1381);
    float _1385 = fma(_1379, _1379, _1383);
    float _1387 = rsqrt(_1385);
    float _1389 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1391 = _1375 * _1389;
    float _1393 = _1379 * _1389;
    float _1395 = _1391 * _1391;
    float _1397 = _1393 * _1393;
    float _1399 = _1395 + _1397;
    float _1401 = sqrt(_1399);
    bool _1403 = _1401 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1407 = _1401 + _1405;
    float _1409 = _1379;
    float _1411 = _1399;
    float _1413 = _1407;
    float _1415 = _1371;
    if (_1403)
    {
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1417;
    }
    float _1419 = _1409;
    if (_1403)
    {
        float _1421 = rsqrt(_1399);
        _1411 = _1421;
    }
    float _1423 = _1411;
    float _1425 = _1423;
    if (_1403)
    {
        float _1427 = _1407 * _1419;
        _1413 = _1427;
    }
    float _1429 = _1413;
    if (_1403)
    {
        float _1431 = _1429 * 0.15915493667125701904296875;
        _1269 = _1431;
    }
    float _1433 = _1269;
    float _1435 = _1419;
    if (_1403)
    {
        float _1437 = _1433 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        _1435 = _1439;
    }
    float _1441 = _1435;
    float _1443 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1445 = precise::max(0.0, _1443);
    float _1447 = _1387;
    float _1449 = _1445;
    if (_1403)
    {
        float _1451 = _1433 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        _1447 = _1453;
    }
    float _1455 = _1447;
    float _1457 = -_1389;
    float _1459 = -_1445;
    float _1461 = fma(_1371, _1457, _1459);
    if (_1403)
    {
        float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1463;
    }
    float _1465 = _1449;
    float _1467 = sqrt(_1385);
    float _1469 = _1441;
    float _1471 = _1465;
    if (_1403)
    {
        float _1473 = fma(_1441, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1415 = _1473;
    }
    float _1475 = _1415;
    float _1477 = _1475;
    if (!_1403)
    {
        _1469 = _1391;
    }
    float _1479 = _1469;
    float _1481 = _1479;
    float _1483 = _1455;
    if (_1403)
    {
        float _1485 = _1455 + (-1.0);
        _1471 = _1485;
    }
    float _1487 = _1471;
    float _1489 = _1487;
    if (_1403)
    {
        float _1491 = _1423 * _1475;
        _1137 = _1491;
    }
    float _1493 = _1137;
    if (!_1403)
    {
        _1477 = _1461;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (_1403)
    {
        float _1499 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1271 = _1499;
    }
    float _1501 = _1271;
    if (_1403)
    {
        float _1503 = _1391 * _1493;
        _1481 = _1503;
    }
    float _1505 = _1481;
    if (!_1403)
    {
        _1489 = _1393;
    }
    float _1507 = _1489;
    float _1509 = _1507;
    if (_1403)
    {
        float _1511 = _1393 * _1493;
        _1509 = _1511;
    }
    float _1513 = _1509;
    if (!_1403)
    {
        _1425 = _1395;
    }
    float _1515 = _1425;
    float _1517 = _1515;
    if (_1403)
    {
        float _1519 = fma(_1461, _1455, _1501);
        _1497 = _1519;
    }
    float _1521 = _1497;
    if (_1403)
    {
        float _1523 = _1505 * _1505;
        _1517 = _1523;
    }
    float _1525 = _1517;
    if (!_1403)
    {
        _1483 = _1397;
    }
    float _1527 = _1483;
    float _1529 = _1527;
    if (_1403)
    {
        float _1531 = _1513 * _1513;
        _1529 = _1531;
    }
    float _1533 = _1529;
    float _1535 = fma(_1521, _1521, _1525);
    float _1537 = _1535 + _1533;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1541 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1539);
    float _1543 = precise::clamp(_1541, 0.0, 1.0);
    float _1545 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1547 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1549 = rsqrt(_1537);
    float _1551 = -_1543;
    float _1553 = _1551 + 1.0;
    float _1555 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1545);
    float _1557 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1547);
    float _1559 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1563 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1555);
    float _1565 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1567 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1557);
    float _1569 = abs(_1553);
    float _1571 = log2(_1569);
    float _1573 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1559);
    float _1575 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1565);
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1579 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1581 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1573);
    float _1583 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1575);
    float _1585 = _1549 * _1505;
    float _1587 = _1549 * _1521;
    float _1589 = _1549 * _1513;
    float _1591 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1593 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1595 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1597 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1599 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1601 = -_1593;
    float _1603 = fma(_1587, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1601);
    float _1605 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1595);
    float _1607 = -_1597;
    float _1609 = fma(_1607, _1561, 1.0);
    float _1611 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1613 = -_1589;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1603);
    float _1617 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1605);
    float _1619 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1621 = exp2(_1611);
    float _1623 = fma(_1615, -0.5, 0.5);
    float _1625 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1617);
    float _1627 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1629 = fma(_1615, 0.5, 0.5);
    float _1631 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1619);
    float _1633 = _1587 + 1.0;
    float _1635 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1627);
    float _1637 = log2(_1609);
    float _1639 = fma(_1629, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1641 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1631);
    float _1643 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1645 = fma(_1629, _1639, -0.212114393711090087890625);
    float _1647 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1641);
    float _1649 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1643);
    float _1651 = 1.0 / _1625;
    float _1653 = -_1587;
    float _1655 = fma(_1621, _1633, _1653);
    float _1657 = fma(_1629, _1645, 1.570728778839111328125);
    float _1659 = fma(_1655, 0.5, 0.5);
    float _1661 = sqrt(_1623);
    float _1663 = _1637 * 0.693147182464599609375;
    float _1665 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1667 = _1647 * _1651;
    float _1669 = _1649 * _1651;
    float _1671 = fma(_1667, 0.5, 0.5);
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = _1661 * 0.636619746685028076171875;
    float _1677 = -_1657;
    float _1679 = fma(_1675, _1677, 1.0);
    float3 _4535 = float3(_1671, _1673, _1665);
    float _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4535, float3(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4535, float3(0.0), isnan(_4535)), level(0.0)).x;
    float3 _4546 = float3(_1671, _1673, _1665);
    float4 _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4546, float3(0.0), isnan(_4546)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4546, float3(0.0), isnan(_4546)), level(0.0)).xyzw;
    float _1686 = _1684.x;
    float _1688 = _1684.y;
    float _1690 = _1684.z;
    float _1692 = _1684.w;
    float2 _4563 = float2(_1679, _1659);
    float3 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4563, float2(0.0), isnan(_4563)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4563, float2(0.0), isnan(_4563)), level(0.0)).xyz;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = -_781;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _1708 = -_801;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1712 = -_829;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _1716 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1720 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1718);
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1724 = exp2(_1716);
    float _1726 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1722);
    bool _1730 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan(0.5);
    bool _1738 = _1734 || _1736;
    float _1740 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1728);
    float _1744 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1746 = 1.0 / _1740;
    float _1748 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1750 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1744);
    float _1752 = _1748 + _1740;
    float _1754 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1750);
    float _1756 = _1750;
    if (_1738)
    {
        _1756 = 1.0;
    }
    float _1758 = _1756;
    float _1760 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1754);
    float _1762 = _1752 * _1746;
    float _1764 = _1762 * 0.5;
    float _1766 = _1758;
    if (!_1738)
    {
        float _1768 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1772 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
        float _1774 = _1768 * 0.15915493667125701904296875;
        float _1776 = _1774 * 6.283185482025146484375;
        float _1778 = cos(_1776);
        float _1780 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1782 = _1780 * 0.15915493667125701904296875;
        float _1784 = _1774 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        float _1788 = 1.0 / _1778;
        float _1790 = _1782 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        float _1794 = _1786 * _1788;
        float _1796 = 1.0 / _1772;
        float _1798 = _1792 * _1794;
        float _1800 = _1782 * 6.283185482025146484375;
        float _1802 = sin(_1800);
        float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1806 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1804;
        float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1810 = _1796 * _1808;
        float _1812 = 1.0 / _1798;
        float _1814 = 1.0 / _1806;
        float _1816 = _1802 * _1812;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1820 = fma(_1816, _1810, _1818);
        float _1822 = _1820 * _1814;
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -_1824;
        float _1828 = _1826 + 1.0;
        _1766 = _1828;
    }
    float _1830 = _1766;
    float _1832 = -_1724;
    float _1834 = _1832 + 1.0;
    float _1836 = _1625 * 0.5;
    float _1838 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1840 = _1830 > 0.0;
    bool _1842 = isnan(_1830);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1852 = fma(_1649, -0.5, _1836);
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1856 = _1760 + _1625;
    float _1858 = _1850 * _1681;
    float _1860 = _1647 + _1625;
    out.m_60.x = _1363;
    out.m_60.y = _1359;
    out.m_60.z = _1367;
    float _1862 = _1692 * _1858;
    float _1864 = _1702 * _1858;
    float _1866 = -_1850;
    float _1868 = _1866 + 1.0;
    out.gl_Position.x = _1647;
    out.gl_Position.y = _1649;
    out.gl_Position.z = _1760;
    out.gl_Position.w = _1625;
    float _1870 = _1856 * 0.5;
    float _1872 = _1860 * 0.5;
    float _1874 = _1692 * _1868;
    out.m_47.x = _1854;
    float _1876 = fma(_1698, _1862, _1686);
    float _1878 = fma(_1700, _1862, _1688);
    float _1880 = fma(_1692, _1864, _1690);
    out.m_62.x = _1872;
    out.m_62.y = _1852;
    out.m_62.z = _1870;
    out.m_62.w = _1625;
    out.m_64.x = _1876;
    out.m_64.y = _1878;
    out.m_64.z = _1880;
    out.m_64.w = _1874;
    if (_1848)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1882;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1307 = false;
    bool _607 = false;
    bool _457 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1939 = as_type<float>(_99);
        out.gl_Position.z = _1939;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_113)
    {
        float _123 = float(_83);
        _93 = _123;
    }
    float _125 = _93;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _101 = as_type<int>(_137);
    }
    int _139 = _101;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_139);
        out.gl_Position.z = _2010;
    }
    if (_131)
    {
        return out;
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _141 = _165;
    }
    float _167 = _141;
    float _169 = 0.0;
    float _171 = _167;
    if (!_159)
    {
        float _173 = _117 * _117;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    if (!_159)
    {
        float _179 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _179;
    }
    float _181 = _171;
    bool _183 = !_159;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _149 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _149);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _119 = _205;
        _185 = _215;
        _121 = _203;
    }
    float _217 = _119;
    float _219 = _185;
    float _221 = _121;
    bool _223 = !_159;
    float _225 = _217;
    float _227 = _221;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _225 = _241;
        _227 = _235;
        _161 = _247;
    }
    float _249 = _225;
    float _251 = _227;
    float _253 = _161;
    float _255 = _251;
    float _257 = _249;
    if (!_159)
    {
        _255 = _117;
    }
    float _259 = _255;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _259;
    if (!_159)
    {
        float _265 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _265;
    }
    float _267 = _257;
    bool _269 = !_159;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _117 * _275;
        float _285 = 1.0 / _279;
        float _287 = _281 * 0.693147182464599609375;
        float _289 = exp2(_283);
        float _291 = 1.0 / _287;
        float _293 = _289 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _291, _117);
        float _299 = _297 * _285;
        float _301 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _301;
    }
    float _303 = _271;
    bool _305 = !_159;
    if (!_305)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _117 * _309;
        float _319 = exp2(_317);
        float _321 = -_319;
        float _323 = _321 + 1.0;
        float _325 = _323 * _315;
        _263 = _325;
    }
    float _327 = _263;
    float _329 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _331 = fma(_253, _145, _261);
    float _333 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _335 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = fma(_327, _145, _329);
    float _339 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = fma(_253, _143, _333);
    float _345 = fma(_327, _143, _335);
    float _347 = -_337;
    float _349 = _331 + _347;
    float _351 = fma(_253, _147, _339);
    float _353 = fma(_327, _147, _341);
    float _355 = -_345;
    float _357 = _343 + _355;
    float _359 = _349 * _349;
    float _361 = in.m_51.w;
    float _363 = -_353;
    float _365 = _351 + _363;
    float _367 = _349 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = fma(_357, _357, _359);
    float _371 = _349 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = _349 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _377 = fma(_365, _365, _369);
    float _379 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = in.m_44.x;
    float _383 = in.m_44.y;
    float _385 = in.m_44.z;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _391 = sqrt(_377);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _395 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _397 = _391 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_391);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_343, _361, _381);
    float _409 = fma(_331, _361, _383);
    float _411 = fma(_351, _361, _385);
    float _413 = _393;
    float _415 = _389;
    float _417 = _395;
    if (!_405)
    {
        bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _421 = !_419;
        if (!_421)
        {
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _433);
            float _441 = _435 * _435;
            float _443 = fma(_437, _437, _441);
            float _445 = fma(_439, _439, _443);
            float _447 = rsqrt(_445);
            float _449 = _447 * 9.9999999747524270787835121154785e-07;
            float _451 = _437 * _449;
            float _453 = _435 * _449;
            float _455 = _439 * _449;
            _413 = _453;
            _415 = _451;
            _417 = _455;
            _457 = true;
        }
        else
        {
            float _459 = _145 * _145;
            float _461 = fma(_143, _143, _459);
            float _463 = fma(_147, _147, _461);
            float _465 = sqrt(_463);
            bool _467 = _465 >= 9.9999999747524270787835121154785e-07;
            bool _469 = isnan(_465);
            bool _471 = _467 || _469;
            bool _473 = isnan(9.9999999747524270787835121154785e-07);
            bool _475 = _471 || _473;
            if (!_475)
            {
                float _477 = _383 * _383;
                float _479 = fma(_381, _381, _477);
                float _481 = fma(_385, _385, _479);
                float _483 = sqrt(_481);
                bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
                bool _487 = isnan(_483);
                bool _489 = _485 || _487;
                bool _491 = isnan(9.9999999747524270787835121154785e-07);
                bool _493 = _489 || _491;
                if (!_493)
                {
                    float _495 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _497 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _495);
                    float _499 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _497);
                    float _501 = rsqrt(_499);
                    float _503 = _501 * 9.9999999747524270787835121154785e-07;
                    float _505 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _507 = _503 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _413 = _507;
                    _415 = _505;
                    _417 = _509;
                    _457 = true;
                }
                else
                {
                    float _511 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _515 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _517 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
                    float _519 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _513);
                    float _521 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _515);
                    float _523 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
                    float _525 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
                    float _527 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _521);
                    float _529 = _523 * _523;
                    float _531 = fma(_525, _525, _529);
                    float _533 = fma(_527, _527, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _525 * _537;
                    float _541 = _523 * _537;
                    float _543 = _527 * _537;
                    _413 = _541;
                    _415 = _539;
                    _417 = _543;
                    _457 = true;
                }
            }
            else
            {
                float _545 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _547 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _549 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _551 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                float _553 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                float _555 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                float _557 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                float _559 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                float _561 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                float _563 = _557 * _557;
                float _565 = fma(_559, _559, _563);
                float _567 = fma(_561, _561, _565);
                float _569 = rsqrt(_567);
                float _571 = _569 * 9.9999999747524270787835121154785e-07;
                float _573 = _559 * _571;
                float _575 = _557 * _571;
                float _577 = _561 * _571;
                _413 = _575;
                _415 = _573;
                _417 = _577;
            }
        }
    }
    _457 = false;
    float _579 = _413;
    float _581 = _415;
    float _583 = _417;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _587 = !_585;
    float _605;
    if (!_587)
    {
        float _589 = in.m_53.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_83);
        float _611 = 1.0 / _609;
        float _613 = _117 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _619 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _621 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _623 = as_type<float>(int(gl_VertexIndex));
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _633 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _617);
    float _635 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _619);
    float _637 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _621);
    float _639 = 1.0 / _631;
    float _641 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _643 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _635);
    float _645 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _647 = _579 * _579;
    float _649 = _641 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _653 = _645 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _655 = 1.0 / _627;
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _659 = _649 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _615 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _667 = _651 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _671 = _653 + _669;
    float _673 = _659 * _659;
    float _675 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _677 = precise::clamp(_675, 0.0, 1.0);
    float _679 = _663 * _639;
    float _681 = fma(_667, _667, _673);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = _615 + _683;
    bool _687 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _689 = isnan(_615);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    bool _699 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_615);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = fma(_671, _671, _681);
    bool _713 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _715 = isnan(_615);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_581, _581, _647);
    float _727 = _685 * _655;
    float _729 = -_723;
    float _731 = _729 + 1.0;
    float _733 = fma(_583, _583, _725);
    float _735 = rsqrt(_711);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _741 = _709 * _731;
    float _743 = -_709;
    float _745 = _743 + 1.0;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _755;
    float _759 = fma(_739, _679, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _761 = rsqrt(_733);
    float _763 = fma(_677, -0.64999997615814208984375, 1.0);
    float _765 = fma(_749, _727, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _767 = _697 * _745;
    float _769 = fma(_753, _679, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _771 = fma(_757, _727, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _773 = as_type<int>(_623) & 1;
    bool _775 = _773 != 0;
    int _777 = as_type<int>(_623) & 2;
    bool _779 = _777 != 0;
    float _781 = _659 * _735;
    float _783 = _765 * _767;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _785;
    float _789 = -_781;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _793 = _771 * _767;
    float _795 = -_697;
    float _797 = _795 + 1.0;
    float _799 = _761 * _581;
    float _801 = _667 * _735;
    float _803 = _791 * _791;
    float _805 = _761 * _583;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _809 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _807;
    float _811 = -_801;
    float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _815 = _787 * _787;
    float _817 = _761 * _579;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[143].x, _783);
    float _821 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[143].y, _793);
    float _823 = fma(_813, _813, _803);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _827 = _805 * _825;
    float _829 = _671 * _735;
    float _831 = in.m_51.x;
    float _833 = in.m_51.y;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _835;
    float _839 = fma(_809, _809, _815);
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _843 = _817 * _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _847 = -_827;
    float _849 = fma(_799, _845, _847);
    float _851 = -_829;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _855 = fma(_837, _837, _839);
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _859 = _799 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _863 = -_843;
    float _865 = fma(_805, _861, _863);
    float _867 = _849 * _849;
    float _869 = fma(_853, _853, _823);
    float _871 = rsqrt(_855);
    float _873 = fma(_759, _741, _819);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _877 = -_859;
    float _879 = fma(_817, _875, _877);
    float _881 = fma(_865, _865, _867);
    float _883 = fma(_769, _741, _821);
    float _885 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[145].x, _873);
    float _887 = fma(_879, _879, _881);
    float _889 = sqrt(_869);
    float _891 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[145].y, _883);
    float _893 = _891 * _833;
    float _895 = _885 * _831;
    float _897 = rsqrt(_887);
    float _899 = _871 * (-0.20000000298023223876953125);
    float _901 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _905 = !_779;
    float _907 = _905 ? (-0.5) : 0.5;
    float _909 = fma(_837, _899, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _911 = !_775;
    float _913 = _911 ? (-0.5) : 0.5;
    float _915 = sqrt(_855);
    float _917 = _735 * _889;
    float _919 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _907);
    float _921 = fma(_787, _899, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _913);
    float _925 = _901 * _917;
    float _927 = _903 * _917;
    float _929 = fma(_809, _899, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _931 = _865 * _897;
    float _933 = _925 * _919;
    float _935 = _849 * _897;
    float _937 = _879 * _897;
    float _939 = _927 * _923;
    float _941 = _805 * _931;
    float _943 = _933 * _817;
    float _945 = _817 * _937;
    float _947 = _915 * 0.066666670143604278564453125;
    float _949 = -_941;
    float _951 = fma(_799, _937, _949);
    float _953 = _917 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _955 = _953 * 0.5;
    float _957 = _933 * _799;
    float _959 = fma(_939, _935, _943);
    float _961 = precise::max(_947, 1.0);
    float _963 = _799 * _935;
    float _965 = -_945;
    float _967 = fma(_805, _935, _965);
    float _969 = fma(_939, _931, _957);
    float _971 = fma(_955, _951, _959);
    float _973 = _933 * _805;
    float _975 = precise::min(_961, 2.0);
    float _977 = fma(_955, _967, _969);
    float _979 = _649 + _971;
    float _981 = -_963;
    float _983 = fma(_817, _931, _981);
    float _985 = fma(_939, _937, _973);
    float _987 = -_921;
    float _989 = _987 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _991 = _975 * _763;
    float _993 = _651 + _977;
    float _995 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _997 = _979 + _995;
    float _999 = fma(_955, _983, _985);
    float _1001 = _989 * _989;
    float _1003 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1005 = _993 + _1003;
    float _1007 = fma(_997, _991, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1009 = _653 + _999;
    float _1011 = -_929;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = fma(_1005, _991, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1017 = -_1007;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1021 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1023 = _1009 + _1021;
    float _1025 = fma(_1013, _1013, _1001);
    float _1027 = -_909;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1031 = -_1015;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1035 = _1019 * _1019;
    float _1037 = fma(_1023, _991, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1041 = _921 + _1039;
    float _1043 = fma(_1029, _1029, _1025);
    float _1045 = fma(_1033, _1033, _1035);
    float _1047 = -_1037;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _929 + _1051;
    float _1055 = _1041 * _1041;
    float _1057 = in.m_53.x;
    float _1059 = in.m_53.y;
    float _1061 = fma(_1049, _1049, _1045);
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1065 = _909 + _1063;
    float _1067 = fma(_1053, _1053, _1055);
    float _1069 = sqrt(_1043);
    float _1071 = fma(_1065, _1065, _1067);
    float _1073 = sqrt(_1061);
    float _1075 = rsqrt(_1071);
    bool _1077 = _1057 > 0.5;
    bool _1079 = _1059 > 0.5;
    float _1081 = -_1069;
    float _1083 = _1073 + _1081;
    float _1085 = _1075 * _1083;
    float _1087 = -_1085;
    float _1089 = fma(_1053, _1087, _1015);
    float _1091 = -_1085;
    float _1093 = fma(_1065, _1091, _1037);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1089 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1103 = _1093 + _1101;
    float _1105 = -_1085;
    float _1107 = fma(_1041, _1105, _1007);
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1111 = _1109 != 0;
    float _1113 = _1099 * _1099;
    float _1115 = _1103 * _1103;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1119 = _1117 != 0;
    float _1121 = _1113 + _1115;
    float _1123 = sqrt(_1121);
    bool _1125 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1129 = _1113;
    float _1131 = _1041;
    float _1133 = _1075;
    float _1135 = _1115;
    float _1137 = _1121;
    if (!_1125)
    {
        _1127 = _1113;
    }
    float _1139 = _1127;
    float _1141 = _1139;
    if (!_1125)
    {
        _1129 = _1089;
    }
    float _1143 = _1129;
    float _1145 = _1143;
    if (!_1125)
    {
        _1131 = _1093;
    }
    float _1147 = _1131;
    float _1149 = _1147;
    if (!_1125)
    {
        _1133 = _1107;
    }
    float _1151 = _1133;
    bool _1153 = !_1125;
    float _1155 = _1151;
    if (!_1153)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1123 + _1159;
        float _1163 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1121);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1181 = _1165 * _1179;
        float _1183 = _1177 + (-1.0);
        float _1185 = fma(_1099, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1187 = fma(_1103, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1189 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1193 = _1185 + _1191;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1197 = _1187 + _1195;
        float _1199 = fma(_1107, _1177, _1189);
        float _1201 = _1193 * _1193;
        float _1203 = _1197 * _1197;
        _1155 = _1199;
        _1141 = _1201;
        _1135 = _1203;
        _1145 = _1185;
        _1149 = _1187;
    }
    float _1205 = _1155;
    float _1207 = _1141;
    float _1209 = _1135;
    float _1211 = _1145;
    float _1213 = _1149;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1217 = _1205 + _1215;
    float _1219 = -_913;
    int _1221 = _1077 ? as_type<int>(_1219) : as_type<int>(_913);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1225 = -_907;
    int _1227 = _1079 ? as_type<int>(_1225) : as_type<int>(_907);
    float _1229 = fma(_1217, _1217, _1207);
    bool _1231 = !_1111;
    float _1233 = _1231 ? _913 : as_type<float>(_1221);
    bool _1235 = !_1119;
    float _1237 = _1235 ? _907 : as_type<float>(_1227);
    float _1239 = _1229 + _1209;
    float _1241 = _1233 + 0.5;
    float _1243 = -_1237;
    float _1245 = _1243 + 0.5;
    float _1247 = sqrt(_1239);
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1253 = _1249 * _1095;
    float _1255 = _1251 * _1223;
    out.m_58.x = _1253;
    out.m_58.y = _1255;
    bool _1257 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1259 = isnan(_1247);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1265 = _1261 || _1263;
    float _1267 = _1207;
    float _1269 = _1255;
    float _1271 = _1245;
    if (!_1265)
    {
        _1267 = 1.0;
    }
    float _1273 = _1267;
    bool _1275 = !_1265;
    float _1277 = _1273;
    if (!_1275)
    {
        bool _1279 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1281 = isnan(_1247);
        bool _1283 = _1279 || _1281;
        bool _1285 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1287 = _1283 || _1285;
        if (!_1287)
        {
            float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1291 = _1247 + _1289;
            float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1295 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1293;
            float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1299 = _1297 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1301 = 1.0 / _1295;
            float _1303 = _1291 * _1301;
            float _1305 = fma(_1303, _1299, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1277 = _1305;
            _1307 = true;
        }
        else
        {
            bool _1309 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1311 = isnan(_1247);
            bool _1313 = _1309 || _1311;
            bool _1315 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1317 = _1313 || _1315;
            if (!_1317)
            {
                float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1321 = _1247 + _1319;
                float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1325 = _1323 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1329 = _1327 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1331 = 1.0 / _1325;
                float _1333 = _1321 * _1331;
                float _1335 = fma(_1333, _1329, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1277 = _1335;
                _1307 = true;
            }
            else
            {
                _1277 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1307 = false;
    float _1337 = _1277;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1341 = _1205 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1345 = _1211 + _1343;
    float _1347 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1349 = _1213 + _1347;
    float _1351 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1353 = fma(_1345, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1355 = fma(_1349, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1357 = -_781;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1361 = -_801;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1353);
    float _1365 = -_829;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1355);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = _1359 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = _1363 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1371 * _1371;
    float _1383 = fma(_1375, _1375, _1381);
    float _1385 = fma(_1379, _1379, _1383);
    float _1387 = rsqrt(_1385);
    float _1389 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1391 = _1375 * _1389;
    float _1393 = _1379 * _1389;
    float _1395 = _1391 * _1391;
    float _1397 = _1393 * _1393;
    float _1399 = _1395 + _1397;
    float _1401 = sqrt(_1399);
    bool _1403 = _1401 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1407 = _1401 + _1405;
    float _1409 = _1379;
    float _1411 = _1399;
    float _1413 = _1407;
    float _1415 = _1371;
    if (_1403)
    {
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1417;
    }
    float _1419 = _1409;
    if (_1403)
    {
        float _1421 = rsqrt(_1399);
        _1411 = _1421;
    }
    float _1423 = _1411;
    float _1425 = _1423;
    if (_1403)
    {
        float _1427 = _1407 * _1419;
        _1413 = _1427;
    }
    float _1429 = _1413;
    if (_1403)
    {
        float _1431 = _1429 * 0.15915493667125701904296875;
        _1269 = _1431;
    }
    float _1433 = _1269;
    float _1435 = _1419;
    if (_1403)
    {
        float _1437 = _1433 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        _1435 = _1439;
    }
    float _1441 = _1435;
    float _1443 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1445 = precise::max(0.0, _1443);
    float _1447 = _1387;
    float _1449 = _1445;
    if (_1403)
    {
        float _1451 = _1433 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        _1447 = _1453;
    }
    float _1455 = _1447;
    float _1457 = -_1389;
    float _1459 = -_1445;
    float _1461 = fma(_1371, _1457, _1459);
    if (_1403)
    {
        float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1463;
    }
    float _1465 = _1449;
    float _1467 = sqrt(_1385);
    float _1469 = _1441;
    float _1471 = _1465;
    if (_1403)
    {
        float _1473 = fma(_1441, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1415 = _1473;
    }
    float _1475 = _1415;
    float _1477 = _1475;
    if (!_1403)
    {
        _1469 = _1391;
    }
    float _1479 = _1469;
    float _1481 = _1479;
    float _1483 = _1455;
    if (_1403)
    {
        float _1485 = _1455 + (-1.0);
        _1471 = _1485;
    }
    float _1487 = _1471;
    float _1489 = _1487;
    if (_1403)
    {
        float _1491 = _1423 * _1475;
        _1137 = _1491;
    }
    float _1493 = _1137;
    if (!_1403)
    {
        _1477 = _1461;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (_1403)
    {
        float _1499 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1271 = _1499;
    }
    float _1501 = _1271;
    if (_1403)
    {
        float _1503 = _1391 * _1493;
        _1481 = _1503;
    }
    float _1505 = _1481;
    if (!_1403)
    {
        _1489 = _1393;
    }
    float _1507 = _1489;
    float _1509 = _1507;
    if (_1403)
    {
        float _1511 = _1393 * _1493;
        _1509 = _1511;
    }
    float _1513 = _1509;
    if (!_1403)
    {
        _1425 = _1395;
    }
    float _1515 = _1425;
    float _1517 = _1515;
    if (_1403)
    {
        float _1519 = fma(_1461, _1455, _1501);
        _1497 = _1519;
    }
    float _1521 = _1497;
    if (_1403)
    {
        float _1523 = _1505 * _1505;
        _1517 = _1523;
    }
    float _1525 = _1517;
    if (!_1403)
    {
        _1483 = _1397;
    }
    float _1527 = _1483;
    float _1529 = _1527;
    if (_1403)
    {
        float _1531 = _1513 * _1513;
        _1529 = _1531;
    }
    float _1533 = _1529;
    float _1535 = fma(_1521, _1521, _1525);
    float _1537 = _1535 + _1533;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1541 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1539);
    float _1543 = precise::clamp(_1541, 0.0, 1.0);
    float _1545 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1547 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1549 = rsqrt(_1537);
    float _1551 = -_1543;
    float _1553 = _1551 + 1.0;
    float _1555 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1545);
    float _1557 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1547);
    float _1559 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1563 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1555);
    float _1565 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1567 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1557);
    float _1569 = abs(_1553);
    float _1571 = log2(_1569);
    float _1573 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1559);
    float _1575 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1565);
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1579 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1581 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1573);
    float _1583 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1575);
    float _1585 = _1549 * _1505;
    float _1587 = _1549 * _1521;
    float _1589 = _1549 * _1513;
    float _1591 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1593 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1595 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1597 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1599 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1601 = -_1593;
    float _1603 = fma(_1587, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1601);
    float _1605 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1595);
    float _1607 = -_1597;
    float _1609 = fma(_1607, _1561, 1.0);
    float _1611 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1613 = -_1589;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1603);
    float _1617 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1605);
    float _1619 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1621 = exp2(_1611);
    float _1623 = fma(_1615, -0.5, 0.5);
    float _1625 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1617);
    float _1627 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1629 = fma(_1615, 0.5, 0.5);
    float _1631 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1619);
    float _1633 = _1587 + 1.0;
    float _1635 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1627);
    float _1637 = log2(_1609);
    float _1639 = fma(_1629, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1641 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1631);
    float _1643 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1645 = fma(_1629, _1639, -0.212114393711090087890625);
    float _1647 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1641);
    float _1649 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1643);
    float _1651 = 1.0 / _1625;
    float _1653 = -_1587;
    float _1655 = fma(_1621, _1633, _1653);
    float _1657 = fma(_1629, _1645, 1.570728778839111328125);
    float _1659 = fma(_1655, 0.5, 0.5);
    float _1661 = sqrt(_1623);
    float _1663 = _1637 * 0.693147182464599609375;
    float _1665 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1667 = _1647 * _1651;
    float _1669 = _1649 * _1651;
    float _1671 = fma(_1667, 0.5, 0.5);
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = _1661 * 0.636619746685028076171875;
    float _1677 = -_1657;
    float _1679 = fma(_1675, _1677, 1.0);
    float3 _4535 = float3(_1671, _1673, _1665);
    float _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4535, float3(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4535, float3(0.0), isnan(_4535)), level(0.0)).x;
    float3 _4546 = float3(_1671, _1673, _1665);
    float4 _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4546, float3(0.0), isnan(_4546)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4546, float3(0.0), isnan(_4546)), level(0.0)).xyzw;
    float _1686 = _1684.x;
    float _1688 = _1684.y;
    float _1690 = _1684.z;
    float _1692 = _1684.w;
    float2 _4563 = float2(_1679, _1659);
    float3 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4563, float2(0.0), isnan(_4563)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4563, float2(0.0), isnan(_4563)), level(0.0)).xyz;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = -_781;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _1708 = -_801;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1712 = -_829;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _1716 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1720 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1718);
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1724 = exp2(_1716);
    float _1726 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1722);
    bool _1730 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan(0.5);
    bool _1738 = _1734 || _1736;
    float _1740 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1728);
    float _1744 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1746 = 1.0 / _1740;
    float _1748 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1750 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1744);
    float _1752 = _1748 + _1740;
    float _1754 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1750);
    float _1756 = _1750;
    if (_1738)
    {
        _1756 = 1.0;
    }
    float _1758 = _1756;
    float _1760 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1754);
    float _1762 = _1752 * _1746;
    float _1764 = _1762 * 0.5;
    float _1766 = _1758;
    if (!_1738)
    {
        float _1768 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1772 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
        float _1774 = _1768 * 0.15915493667125701904296875;
        float _1776 = _1774 * 6.283185482025146484375;
        float _1778 = cos(_1776);
        float _1780 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1782 = _1780 * 0.15915493667125701904296875;
        float _1784 = _1774 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        float _1788 = 1.0 / _1778;
        float _1790 = _1782 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        float _1794 = _1786 * _1788;
        float _1796 = 1.0 / _1772;
        float _1798 = _1792 * _1794;
        float _1800 = _1782 * 6.283185482025146484375;
        float _1802 = sin(_1800);
        float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1806 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1804;
        float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1810 = _1796 * _1808;
        float _1812 = 1.0 / _1798;
        float _1814 = 1.0 / _1806;
        float _1816 = _1802 * _1812;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1820 = fma(_1816, _1810, _1818);
        float _1822 = _1820 * _1814;
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -_1824;
        float _1828 = _1826 + 1.0;
        _1766 = _1828;
    }
    float _1830 = _1766;
    float _1832 = -_1724;
    float _1834 = _1832 + 1.0;
    float _1836 = _1625 * 0.5;
    float _1838 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1840 = _1830 > 0.0;
    bool _1842 = isnan(_1830);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1852 = fma(_1649, -0.5, _1836);
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1856 = _1760 + _1625;
    float _1858 = _1850 * _1681;
    float _1860 = _1647 + _1625;
    out.m_60.x = _1363;
    out.m_60.y = _1359;
    out.m_60.z = _1367;
    float _1862 = _1692 * _1858;
    float _1864 = _1702 * _1858;
    float _1866 = -_1850;
    float _1868 = _1866 + 1.0;
    out.gl_Position.x = _1647;
    out.gl_Position.y = _1649;
    out.gl_Position.z = _1760;
    out.gl_Position.w = _1625;
    float _1870 = _1856 * 0.5;
    float _1872 = _1860 * 0.5;
    float _1874 = _1692 * _1868;
    out.m_47.x = _1854;
    float _1876 = fma(_1698, _1862, _1686);
    float _1878 = fma(_1700, _1862, _1688);
    float _1880 = fma(_1692, _1864, _1690);
    out.m_62.x = _1872;
    out.m_62.y = _1852;
    out.m_62.z = _1870;
    out.m_62.w = _1625;
    out.m_64.x = _1876;
    out.m_64.y = _1878;
    out.m_64.z = _1880;
    out.m_64.w = _1874;
    if (_1848)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1882;
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
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1307 = false;
    bool _607 = false;
    bool _457 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1939 = as_type<float>(_99);
        out.gl_Position.z = _1939;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    float _121 = 0.0;
    if (_113)
    {
        float _123 = float(_83);
        _93 = _123;
    }
    float _125 = _93;
    bool _127 = _117 >= _125;
    bool _129 = !_113;
    bool _131 = _127 || _129;
    float _133 = _125;
    if (_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _133;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _137 = _135 * 5.0;
        _101 = as_type<int>(_137);
    }
    int _139 = _101;
    float _141 = as_type<float>(_139);
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2010 = as_type<float>(_139);
        out.gl_Position.z = _2010;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    float _149 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = _149;
    if (!_159)
    {
        float _163 = _149 * _149;
        float _165 = _163 * 0.5;
        _141 = _165;
    }
    float _167 = _141;
    float _169 = 0.0;
    float _171 = _167;
    if (!_159)
    {
        float _173 = _117 * _117;
        float _175 = _173 * 0.5;
        _169 = _175;
    }
    float _177 = _169;
    if (!_159)
    {
        float _179 = _167 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _171 = _179;
    }
    float _181 = _171;
    bool _183 = !_159;
    float _185 = _181;
    if (!_183)
    {
        float _187 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _189 = log2(_187);
        float _191 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _193 = _191 + 1.0;
        float _195 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = _149 * _189;
        float _199 = 1.0 / _193;
        float _201 = _195 * 0.693147182464599609375;
        float _203 = exp2(_197);
        float _205 = 1.0 / _201;
        float _207 = _203 + (-1.0);
        float _209 = -_207;
        float _211 = fma(_209, _205, _149);
        float _213 = _211 * _199;
        float _215 = _213 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _119 = _205;
        _185 = _215;
        _121 = _203;
    }
    float _217 = _119;
    float _219 = _185;
    float _221 = _121;
    bool _223 = !_159;
    float _225 = _217;
    float _227 = _221;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = 1.0 / _235;
        float _239 = _149 * _231;
        float _241 = exp2(_239);
        float _243 = -_241;
        float _245 = _243 + 1.0;
        float _247 = _245 * _237;
        _225 = _241;
        _227 = _235;
        _161 = _247;
    }
    float _249 = _225;
    float _251 = _227;
    float _253 = _161;
    float _255 = _251;
    float _257 = _249;
    if (!_159)
    {
        _255 = _117;
    }
    float _259 = _255;
    float _261 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _263 = _259;
    if (!_159)
    {
        float _265 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _265;
    }
    float _267 = _257;
    bool _269 = !_159;
    float _271 = _267;
    if (!_269)
    {
        float _273 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _275 = log2(_273);
        float _277 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _279 = _277 + 1.0;
        float _281 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = _117 * _275;
        float _285 = 1.0 / _279;
        float _287 = _281 * 0.693147182464599609375;
        float _289 = exp2(_283);
        float _291 = 1.0 / _287;
        float _293 = _289 + (-1.0);
        float _295 = -_293;
        float _297 = fma(_295, _291, _117);
        float _299 = _297 * _285;
        float _301 = _299 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _271 = _301;
    }
    float _303 = _271;
    bool _305 = !_159;
    if (!_305)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = 1.0 / _313;
        float _317 = _117 * _309;
        float _319 = exp2(_317);
        float _321 = -_319;
        float _323 = _321 + 1.0;
        float _325 = _323 * _315;
        _263 = _325;
    }
    float _327 = _263;
    float _329 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _331 = fma(_253, _145, _261);
    float _333 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _335 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _337 = fma(_327, _145, _329);
    float _339 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _341 = _303 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = fma(_253, _143, _333);
    float _345 = fma(_327, _143, _335);
    float _347 = -_337;
    float _349 = _331 + _347;
    float _351 = fma(_253, _147, _339);
    float _353 = fma(_327, _147, _341);
    float _355 = -_345;
    float _357 = _343 + _355;
    float _359 = _349 * _349;
    float _361 = in.m_51.w;
    float _363 = -_353;
    float _365 = _351 + _363;
    float _367 = _349 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _369 = fma(_357, _357, _359);
    float _371 = _349 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _373 = _349 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _375 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].x, _367);
    float _377 = fma(_365, _365, _369);
    float _379 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].x, _371);
    float _381 = in.m_44.x;
    float _383 = in.m_44.y;
    float _385 = in.m_44.z;
    float _387 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].x, _373);
    float _389 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[4].z, _375);
    float _391 = sqrt(_377);
    float _393 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[5].z, _379);
    float _395 = fma(_365, (*spvDescriptorSet0.vp_c10)._m0[6].z, _387);
    bool _397 = _391 >= 9.9999999747524270787835121154785e-07;
    bool _399 = isnan(_391);
    bool _401 = _397 || _399;
    bool _403 = isnan(9.9999999747524270787835121154785e-07);
    bool _405 = _401 || _403;
    float _407 = fma(_343, _361, _381);
    float _409 = fma(_331, _361, _383);
    float _411 = fma(_351, _361, _385);
    float _413 = _393;
    float _415 = _389;
    float _417 = _395;
    if (!_405)
    {
        bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _421 = !_419;
        if (!_421)
        {
            float _423 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _425 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _427 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _429 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _423);
            float _431 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _425);
            float _433 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _427);
            float _435 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _429);
            float _437 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _431);
            float _439 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _433);
            float _441 = _435 * _435;
            float _443 = fma(_437, _437, _441);
            float _445 = fma(_439, _439, _443);
            float _447 = rsqrt(_445);
            float _449 = _447 * 9.9999999747524270787835121154785e-07;
            float _451 = _437 * _449;
            float _453 = _435 * _449;
            float _455 = _439 * _449;
            _413 = _453;
            _415 = _451;
            _417 = _455;
            _457 = true;
        }
        else
        {
            float _459 = _145 * _145;
            float _461 = fma(_143, _143, _459);
            float _463 = fma(_147, _147, _461);
            float _465 = sqrt(_463);
            bool _467 = _465 >= 9.9999999747524270787835121154785e-07;
            bool _469 = isnan(_465);
            bool _471 = _467 || _469;
            bool _473 = isnan(9.9999999747524270787835121154785e-07);
            bool _475 = _471 || _473;
            if (!_475)
            {
                float _477 = _383 * _383;
                float _479 = fma(_381, _381, _477);
                float _481 = fma(_385, _385, _479);
                float _483 = sqrt(_481);
                bool _485 = _483 >= 9.9999999747524270787835121154785e-07;
                bool _487 = isnan(_483);
                bool _489 = _485 || _487;
                bool _491 = isnan(9.9999999747524270787835121154785e-07);
                bool _493 = _489 || _491;
                if (!_493)
                {
                    float _495 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _497 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _495);
                    float _499 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _497);
                    float _501 = rsqrt(_499);
                    float _503 = _501 * 9.9999999747524270787835121154785e-07;
                    float _505 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _507 = _503 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _509 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _413 = _507;
                    _415 = _505;
                    _417 = _509;
                    _457 = true;
                }
                else
                {
                    float _511 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _513 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _515 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _517 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
                    float _519 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _513);
                    float _521 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _515);
                    float _523 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _517);
                    float _525 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _519);
                    float _527 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _521);
                    float _529 = _523 * _523;
                    float _531 = fma(_525, _525, _529);
                    float _533 = fma(_527, _527, _531);
                    float _535 = rsqrt(_533);
                    float _537 = _535 * 9.9999999747524270787835121154785e-07;
                    float _539 = _525 * _537;
                    float _541 = _523 * _537;
                    float _543 = _527 * _537;
                    _413 = _541;
                    _415 = _539;
                    _417 = _543;
                    _457 = true;
                }
            }
            else
            {
                float _545 = _145 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _547 = _145 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _549 = _145 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _551 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[5].x, _545);
                float _553 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[4].x, _547);
                float _555 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[6].x, _549);
                float _557 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].z, _551);
                float _559 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].z, _553);
                float _561 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].z, _555);
                float _563 = _557 * _557;
                float _565 = fma(_559, _559, _563);
                float _567 = fma(_561, _561, _565);
                float _569 = rsqrt(_567);
                float _571 = _569 * 9.9999999747524270787835121154785e-07;
                float _573 = _559 * _571;
                float _575 = _557 * _571;
                float _577 = _561 * _571;
                _413 = _575;
                _415 = _573;
                _417 = _577;
            }
        }
    }
    _457 = false;
    float _579 = _413;
    float _581 = _415;
    float _583 = _417;
    bool _585 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _587 = !_585;
    float _605;
    if (!_587)
    {
        float _589 = in.m_53.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_83);
        float _611 = 1.0 / _609;
        float _613 = _117 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = _409 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _619 = _409 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _621 = _409 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _623 = as_type<float>(int(gl_VertexIndex));
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _633 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].x, _617);
    float _635 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].x, _619);
    float _637 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].x, _621);
    float _639 = 1.0 / _631;
    float _641 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].z, _633);
    float _643 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].z, _635);
    float _645 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].z, _637);
    float _647 = _579 * _579;
    float _649 = _641 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _651 = _643 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _653 = _645 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _655 = 1.0 / _627;
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _659 = _649 + _657;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _663 = _615 + _661;
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _667 = _651 + _665;
    float _669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _671 = _653 + _669;
    float _673 = _659 * _659;
    float _675 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _677 = precise::clamp(_675, 0.0, 1.0);
    float _679 = _663 * _639;
    float _681 = fma(_667, _667, _673);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _685 = _615 + _683;
    bool _687 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _689 = isnan(_615);
    bool _691 = _687 || _689;
    bool _693 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _695 = _691 || _693;
    float _697 = float(_695);
    bool _699 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _701 = isnan(_615);
    bool _703 = _699 || _701;
    bool _705 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _707 = _703 || _705;
    float _709 = float(_707);
    float _711 = fma(_671, _671, _681);
    bool _713 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _715 = isnan(_615);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = fma(_581, _581, _647);
    float _727 = _685 * _655;
    float _729 = -_723;
    float _731 = _729 + 1.0;
    float _733 = fma(_583, _583, _725);
    float _735 = rsqrt(_711);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _739 = _737 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _741 = _709 * _731;
    float _743 = -_709;
    float _745 = _743 + 1.0;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _749 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _747;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _753 = _751 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _755;
    float _759 = fma(_739, _679, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _761 = rsqrt(_733);
    float _763 = fma(_677, -0.64999997615814208984375, 1.0);
    float _765 = fma(_749, _727, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _767 = _697 * _745;
    float _769 = fma(_753, _679, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _771 = fma(_757, _727, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _773 = as_type<int>(_623) & 1;
    bool _775 = _773 != 0;
    int _777 = as_type<int>(_623) & 2;
    bool _779 = _777 != 0;
    float _781 = _659 * _735;
    float _783 = _765 * _767;
    float _785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _787 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _785;
    float _789 = -_781;
    float _791 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _659);
    float _793 = _771 * _767;
    float _795 = -_697;
    float _797 = _795 + 1.0;
    float _799 = _761 * _581;
    float _801 = _667 * _735;
    float _803 = _791 * _791;
    float _805 = _761 * _583;
    float _807 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _809 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _807;
    float _811 = -_801;
    float _813 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[18].w, _667);
    float _815 = _787 * _787;
    float _817 = _761 * _579;
    float _819 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[143].x, _783);
    float _821 = fma(_797, (*spvDescriptorSet0.vp_c9)._m0[143].y, _793);
    float _823 = fma(_813, _813, _803);
    float _825 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _827 = _805 * _825;
    float _829 = _671 * _735;
    float _831 = in.m_51.x;
    float _833 = in.m_51.y;
    float _835 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _837 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _835;
    float _839 = fma(_809, _809, _815);
    float _841 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _843 = _817 * _841;
    float _845 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _847 = -_827;
    float _849 = fma(_799, _845, _847);
    float _851 = -_829;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[18].w, _671);
    float _855 = fma(_837, _837, _839);
    float _857 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _859 = _799 * _857;
    float _861 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _863 = -_843;
    float _865 = fma(_805, _861, _863);
    float _867 = _849 * _849;
    float _869 = fma(_853, _853, _823);
    float _871 = rsqrt(_855);
    float _873 = fma(_759, _741, _819);
    float _875 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _877 = -_859;
    float _879 = fma(_817, _875, _877);
    float _881 = fma(_865, _865, _867);
    float _883 = fma(_769, _741, _821);
    float _885 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[145].x, _873);
    float _887 = fma(_879, _879, _881);
    float _889 = sqrt(_869);
    float _891 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[145].y, _883);
    float _893 = _891 * _833;
    float _895 = _885 * _831;
    float _897 = rsqrt(_887);
    float _899 = _871 * (-0.20000000298023223876953125);
    float _901 = _893 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _903 = _895 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _905 = !_779;
    float _907 = _905 ? (-0.5) : 0.5;
    float _909 = fma(_837, _899, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    bool _911 = !_775;
    float _913 = _911 ? (-0.5) : 0.5;
    float _915 = sqrt(_855);
    float _917 = _735 * _889;
    float _919 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _907);
    float _921 = fma(_787, _899, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _923 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _913);
    float _925 = _901 * _917;
    float _927 = _903 * _917;
    float _929 = fma(_809, _899, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _931 = _865 * _897;
    float _933 = _925 * _919;
    float _935 = _849 * _897;
    float _937 = _879 * _897;
    float _939 = _927 * _923;
    float _941 = _805 * _931;
    float _943 = _933 * _817;
    float _945 = _817 * _937;
    float _947 = _915 * 0.066666670143604278564453125;
    float _949 = -_941;
    float _951 = fma(_799, _937, _949);
    float _953 = _917 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _955 = _953 * 0.5;
    float _957 = _933 * _799;
    float _959 = fma(_939, _935, _943);
    float _961 = precise::max(_947, 1.0);
    float _963 = _799 * _935;
    float _965 = -_945;
    float _967 = fma(_805, _935, _965);
    float _969 = fma(_939, _931, _957);
    float _971 = fma(_955, _951, _959);
    float _973 = _933 * _805;
    float _975 = precise::min(_961, 2.0);
    float _977 = fma(_955, _967, _969);
    float _979 = _649 + _971;
    float _981 = -_963;
    float _983 = fma(_817, _931, _981);
    float _985 = fma(_939, _937, _973);
    float _987 = -_921;
    float _989 = _987 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _991 = _975 * _763;
    float _993 = _651 + _977;
    float _995 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _997 = _979 + _995;
    float _999 = fma(_955, _983, _985);
    float _1001 = _989 * _989;
    float _1003 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1005 = _993 + _1003;
    float _1007 = fma(_997, _991, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1009 = _653 + _999;
    float _1011 = -_929;
    float _1013 = _1011 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = fma(_1005, _991, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1017 = -_1007;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1021 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1023 = _1009 + _1021;
    float _1025 = fma(_1013, _1013, _1001);
    float _1027 = -_909;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1031 = -_1015;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1035 = _1019 * _1019;
    float _1037 = fma(_1023, _991, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1041 = _921 + _1039;
    float _1043 = fma(_1029, _1029, _1025);
    float _1045 = fma(_1033, _1033, _1035);
    float _1047 = -_1037;
    float _1049 = _1047 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1051 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1053 = _929 + _1051;
    float _1055 = _1041 * _1041;
    float _1057 = in.m_53.x;
    float _1059 = in.m_53.y;
    float _1061 = fma(_1049, _1049, _1045);
    float _1063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1065 = _909 + _1063;
    float _1067 = fma(_1053, _1053, _1055);
    float _1069 = sqrt(_1043);
    float _1071 = fma(_1065, _1065, _1067);
    float _1073 = sqrt(_1061);
    float _1075 = rsqrt(_1071);
    bool _1077 = _1057 > 0.5;
    bool _1079 = _1059 > 0.5;
    float _1081 = -_1069;
    float _1083 = _1073 + _1081;
    float _1085 = _1075 * _1083;
    float _1087 = -_1085;
    float _1089 = fma(_1053, _1087, _1015);
    float _1091 = -_1085;
    float _1093 = fma(_1065, _1091, _1037);
    float _1095 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1097 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1099 = _1089 + _1097;
    float _1101 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1103 = _1093 + _1101;
    float _1105 = -_1085;
    float _1107 = fma(_1041, _1105, _1007);
    int _1109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1111 = _1109 != 0;
    float _1113 = _1099 * _1099;
    float _1115 = _1103 * _1103;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1119 = _1117 != 0;
    float _1121 = _1113 + _1115;
    float _1123 = sqrt(_1121);
    bool _1125 = _1123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1129 = _1113;
    float _1131 = _1041;
    float _1133 = _1075;
    float _1135 = _1115;
    float _1137 = _1121;
    if (!_1125)
    {
        _1127 = _1113;
    }
    float _1139 = _1127;
    float _1141 = _1139;
    if (!_1125)
    {
        _1129 = _1089;
    }
    float _1143 = _1129;
    float _1145 = _1143;
    if (!_1125)
    {
        _1131 = _1093;
    }
    float _1147 = _1131;
    float _1149 = _1147;
    if (!_1125)
    {
        _1133 = _1107;
    }
    float _1151 = _1133;
    bool _1153 = !_1125;
    float _1155 = _1151;
    if (!_1153)
    {
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1161 = _1123 + _1159;
        float _1163 = _1107 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1165 = rsqrt(_1121);
        float _1167 = _1161 * _1157;
        float _1169 = _1167 * 0.15915493667125701904296875;
        float _1171 = _1169 * 6.283185482025146484375;
        float _1173 = sin(_1171);
        float _1175 = _1169 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = fma(_1173, _1163, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1181 = _1165 * _1179;
        float _1183 = _1177 + (-1.0);
        float _1185 = fma(_1099, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1187 = fma(_1103, _1181, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1189 = _1183 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1191 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1193 = _1185 + _1191;
        float _1195 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1197 = _1187 + _1195;
        float _1199 = fma(_1107, _1177, _1189);
        float _1201 = _1193 * _1193;
        float _1203 = _1197 * _1197;
        _1155 = _1199;
        _1141 = _1201;
        _1135 = _1203;
        _1145 = _1185;
        _1149 = _1187;
    }
    float _1205 = _1155;
    float _1207 = _1141;
    float _1209 = _1135;
    float _1211 = _1145;
    float _1213 = _1149;
    float _1215 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1217 = _1205 + _1215;
    float _1219 = -_913;
    int _1221 = _1077 ? as_type<int>(_1219) : as_type<int>(_913);
    float _1223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1225 = -_907;
    int _1227 = _1079 ? as_type<int>(_1225) : as_type<int>(_907);
    float _1229 = fma(_1217, _1217, _1207);
    bool _1231 = !_1111;
    float _1233 = _1231 ? _913 : as_type<float>(_1221);
    bool _1235 = !_1119;
    float _1237 = _1235 ? _907 : as_type<float>(_1227);
    float _1239 = _1229 + _1209;
    float _1241 = _1233 + 0.5;
    float _1243 = -_1237;
    float _1245 = _1243 + 0.5;
    float _1247 = sqrt(_1239);
    float _1249 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1251 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1253 = _1249 * _1095;
    float _1255 = _1251 * _1223;
    out.m_58.x = _1253;
    out.m_58.y = _1255;
    bool _1257 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1259 = isnan(_1247);
    bool _1261 = _1257 || _1259;
    bool _1263 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1265 = _1261 || _1263;
    float _1267 = _1207;
    float _1269 = _1255;
    float _1271 = _1245;
    if (!_1265)
    {
        _1267 = 1.0;
    }
    float _1273 = _1267;
    bool _1275 = !_1265;
    float _1277 = _1273;
    if (!_1275)
    {
        bool _1279 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1281 = isnan(_1247);
        bool _1283 = _1279 || _1281;
        bool _1285 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1287 = _1283 || _1285;
        if (!_1287)
        {
            float _1289 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1291 = _1247 + _1289;
            float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1295 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1293;
            float _1297 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1299 = _1297 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1301 = 1.0 / _1295;
            float _1303 = _1291 * _1301;
            float _1305 = fma(_1303, _1299, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1277 = _1305;
            _1307 = true;
        }
        else
        {
            bool _1309 = _1247 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1311 = isnan(_1247);
            bool _1313 = _1309 || _1311;
            bool _1315 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1317 = _1313 || _1315;
            if (!_1317)
            {
                float _1319 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1321 = _1247 + _1319;
                float _1323 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1325 = _1323 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1329 = _1327 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1331 = 1.0 / _1325;
                float _1333 = _1321 * _1331;
                float _1335 = fma(_1333, _1329, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1277 = _1335;
                _1307 = true;
            }
            else
            {
                _1277 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1307 = false;
    float _1337 = _1277;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1341 = _1205 + _1339;
    float _1343 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1345 = _1211 + _1343;
    float _1347 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1349 = _1213 + _1347;
    float _1351 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1353 = fma(_1345, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1355 = fma(_1349, _1337, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1357 = -_781;
    float _1359 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1351);
    float _1361 = -_801;
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1353);
    float _1365 = -_829;
    float _1367 = fma(_1365, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1355);
    float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1371 = _1359 + _1369;
    float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1375 = _1363 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1379 = _1367 + _1377;
    float _1381 = _1371 * _1371;
    float _1383 = fma(_1375, _1375, _1381);
    float _1385 = fma(_1379, _1379, _1383);
    float _1387 = rsqrt(_1385);
    float _1389 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1391 = _1375 * _1389;
    float _1393 = _1379 * _1389;
    float _1395 = _1391 * _1391;
    float _1397 = _1393 * _1393;
    float _1399 = _1395 + _1397;
    float _1401 = sqrt(_1399);
    bool _1403 = _1401 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1407 = _1401 + _1405;
    float _1409 = _1379;
    float _1411 = _1399;
    float _1413 = _1407;
    float _1415 = _1371;
    if (_1403)
    {
        float _1417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1409 = _1417;
    }
    float _1419 = _1409;
    if (_1403)
    {
        float _1421 = rsqrt(_1399);
        _1411 = _1421;
    }
    float _1423 = _1411;
    float _1425 = _1423;
    if (_1403)
    {
        float _1427 = _1407 * _1419;
        _1413 = _1427;
    }
    float _1429 = _1413;
    if (_1403)
    {
        float _1431 = _1429 * 0.15915493667125701904296875;
        _1269 = _1431;
    }
    float _1433 = _1269;
    float _1435 = _1419;
    if (_1403)
    {
        float _1437 = _1433 * 6.283185482025146484375;
        float _1439 = sin(_1437);
        _1435 = _1439;
    }
    float _1441 = _1435;
    float _1443 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1445 = precise::max(0.0, _1443);
    float _1447 = _1387;
    float _1449 = _1445;
    if (_1403)
    {
        float _1451 = _1433 * 6.283185482025146484375;
        float _1453 = cos(_1451);
        _1447 = _1453;
    }
    float _1455 = _1447;
    float _1457 = -_1389;
    float _1459 = -_1445;
    float _1461 = fma(_1371, _1457, _1459);
    if (_1403)
    {
        float _1463 = _1461 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1449 = _1463;
    }
    float _1465 = _1449;
    float _1467 = sqrt(_1385);
    float _1469 = _1441;
    float _1471 = _1465;
    if (_1403)
    {
        float _1473 = fma(_1441, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1415 = _1473;
    }
    float _1475 = _1415;
    float _1477 = _1475;
    if (!_1403)
    {
        _1469 = _1391;
    }
    float _1479 = _1469;
    float _1481 = _1479;
    float _1483 = _1455;
    if (_1403)
    {
        float _1485 = _1455 + (-1.0);
        _1471 = _1485;
    }
    float _1487 = _1471;
    float _1489 = _1487;
    if (_1403)
    {
        float _1491 = _1423 * _1475;
        _1137 = _1491;
    }
    float _1493 = _1137;
    if (!_1403)
    {
        _1477 = _1461;
    }
    float _1495 = _1477;
    float _1497 = _1495;
    if (_1403)
    {
        float _1499 = _1487 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1271 = _1499;
    }
    float _1501 = _1271;
    if (_1403)
    {
        float _1503 = _1391 * _1493;
        _1481 = _1503;
    }
    float _1505 = _1481;
    if (!_1403)
    {
        _1489 = _1393;
    }
    float _1507 = _1489;
    float _1509 = _1507;
    if (_1403)
    {
        float _1511 = _1393 * _1493;
        _1509 = _1511;
    }
    float _1513 = _1509;
    if (!_1403)
    {
        _1425 = _1395;
    }
    float _1515 = _1425;
    float _1517 = _1515;
    if (_1403)
    {
        float _1519 = fma(_1461, _1455, _1501);
        _1497 = _1519;
    }
    float _1521 = _1497;
    if (_1403)
    {
        float _1523 = _1505 * _1505;
        _1517 = _1523;
    }
    float _1525 = _1517;
    if (!_1403)
    {
        _1483 = _1397;
    }
    float _1527 = _1483;
    float _1529 = _1527;
    if (_1403)
    {
        float _1531 = _1513 * _1513;
        _1529 = _1531;
    }
    float _1533 = _1529;
    float _1535 = fma(_1521, _1521, _1525);
    float _1537 = _1535 + _1533;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1541 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1539);
    float _1543 = precise::clamp(_1541, 0.0, 1.0);
    float _1545 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1547 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1549 = rsqrt(_1537);
    float _1551 = -_1543;
    float _1553 = _1551 + 1.0;
    float _1555 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1545);
    float _1557 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1547);
    float _1559 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1561 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1563 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1555);
    float _1565 = _1359 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1567 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1557);
    float _1569 = abs(_1553);
    float _1571 = log2(_1569);
    float _1573 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1559);
    float _1575 = fma(_1363, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1565);
    float _1577 = _1567 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1579 = _1563 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1581 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1573);
    float _1583 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1575);
    float _1585 = _1549 * _1505;
    float _1587 = _1549 * _1521;
    float _1589 = _1549 * _1513;
    float _1591 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1593 = _1585 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1595 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1597 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1599 = _1581 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1601 = -_1593;
    float _1603 = fma(_1587, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1601);
    float _1605 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1595);
    float _1607 = -_1597;
    float _1609 = fma(_1607, _1561, 1.0);
    float _1611 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1613 = -_1589;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1603);
    float _1617 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1605);
    float _1619 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1621 = exp2(_1611);
    float _1623 = fma(_1615, -0.5, 0.5);
    float _1625 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1617);
    float _1627 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1629 = fma(_1615, 0.5, 0.5);
    float _1631 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1619);
    float _1633 = _1587 + 1.0;
    float _1635 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1627);
    float _1637 = log2(_1609);
    float _1639 = fma(_1629, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1641 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1631);
    float _1643 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1635);
    float _1645 = fma(_1629, _1639, -0.212114393711090087890625);
    float _1647 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1641);
    float _1649 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1643);
    float _1651 = 1.0 / _1625;
    float _1653 = -_1587;
    float _1655 = fma(_1621, _1633, _1653);
    float _1657 = fma(_1629, _1645, 1.570728778839111328125);
    float _1659 = fma(_1655, 0.5, 0.5);
    float _1661 = sqrt(_1623);
    float _1663 = _1637 * 0.693147182464599609375;
    float _1665 = _1663 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1667 = _1647 * _1651;
    float _1669 = _1649 * _1651;
    float _1671 = fma(_1667, 0.5, 0.5);
    float _1673 = fma(_1669, -0.5, 0.5);
    float _1675 = _1661 * 0.636619746685028076171875;
    float _1677 = -_1657;
    float _1679 = fma(_1675, _1677, 1.0);
    float3 _4535 = float3(_1671, _1673, _1665);
    float _1681 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4535, float3(0.0), isnan(_4535)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4535, float3(0.0), isnan(_4535)), level(0.0)).x;
    float3 _4546 = float3(_1671, _1673, _1665);
    float4 _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4546, float3(0.0), isnan(_4546)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4546, float3(0.0), isnan(_4546)), level(0.0)).xyzw;
    float _1686 = _1684.x;
    float _1688 = _1684.y;
    float _1690 = _1684.z;
    float _1692 = _1684.w;
    float2 _4563 = float2(_1679, _1659);
    float3 _1696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4563, float2(0.0), isnan(_4563)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4563, float2(0.0), isnan(_4563)), level(0.0)).xyz;
    float _1698 = _1696.x;
    float _1700 = _1696.y;
    float _1702 = _1696.z;
    float _1704 = -_781;
    float _1706 = fma(_1704, (*spvDescriptorSet0.vp_c9)._m0[18].w, _649);
    float _1708 = -_801;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c9)._m0[18].w, _651);
    float _1712 = -_829;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[18].w, _653);
    float _1716 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1720 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1718);
    float _1722 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1724 = exp2(_1716);
    float _1726 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    float _1728 = fma(_1710, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1722);
    bool _1730 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan(0.5);
    bool _1738 = _1734 || _1736;
    float _1740 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = fma(_1714, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1728);
    float _1744 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1746 = 1.0 / _1740;
    float _1748 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1750 = fma(_1591, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1744);
    float _1752 = _1748 + _1740;
    float _1754 = fma(_1579, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1750);
    float _1756 = _1750;
    if (_1738)
    {
        _1756 = 1.0;
    }
    float _1758 = _1756;
    float _1760 = fma(_1599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1754);
    float _1762 = _1752 * _1746;
    float _1764 = _1762 * 0.5;
    float _1766 = _1758;
    if (!_1738)
    {
        float _1768 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1770 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1772 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1770);
        float _1774 = _1768 * 0.15915493667125701904296875;
        float _1776 = _1774 * 6.283185482025146484375;
        float _1778 = cos(_1776);
        float _1780 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1782 = _1780 * 0.15915493667125701904296875;
        float _1784 = _1774 * 6.283185482025146484375;
        float _1786 = sin(_1784);
        float _1788 = 1.0 / _1778;
        float _1790 = _1782 * 6.283185482025146484375;
        float _1792 = cos(_1790);
        float _1794 = _1786 * _1788;
        float _1796 = 1.0 / _1772;
        float _1798 = _1792 * _1794;
        float _1800 = _1782 * 6.283185482025146484375;
        float _1802 = sin(_1800);
        float _1804 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1806 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1804;
        float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1810 = _1796 * _1808;
        float _1812 = 1.0 / _1798;
        float _1814 = 1.0 / _1806;
        float _1816 = _1802 * _1812;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1820 = fma(_1816, _1810, _1818);
        float _1822 = _1820 * _1814;
        float _1824 = precise::clamp(_1822, 0.0, 1.0);
        float _1826 = -_1824;
        float _1828 = _1826 + 1.0;
        _1766 = _1828;
    }
    float _1830 = _1766;
    float _1832 = -_1724;
    float _1834 = _1832 + 1.0;
    float _1836 = _1625 * 0.5;
    float _1838 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1840 = _1830 > 0.0;
    bool _1842 = isnan(_1830);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan(0.0);
    bool _1848 = _1844 || _1846;
    float _1850 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1852 = fma(_1649, -0.5, _1836);
    float _1854 = _1838 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1856 = _1760 + _1625;
    float _1858 = _1850 * _1681;
    float _1860 = _1647 + _1625;
    out.m_60.x = _1363;
    out.m_60.y = _1359;
    out.m_60.z = _1367;
    float _1862 = _1692 * _1858;
    float _1864 = _1702 * _1858;
    float _1866 = -_1850;
    float _1868 = _1866 + 1.0;
    out.gl_Position.x = _1647;
    out.gl_Position.y = _1649;
    out.gl_Position.z = _1760;
    out.gl_Position.w = _1625;
    float _1870 = _1856 * 0.5;
    float _1872 = _1860 * 0.5;
    float _1874 = _1692 * _1868;
    out.m_47.x = _1854;
    float _1876 = fma(_1698, _1862, _1686);
    float _1878 = fma(_1700, _1862, _1688);
    float _1880 = fma(_1692, _1864, _1690);
    out.m_62.x = _1872;
    out.m_62.y = _1852;
    out.m_62.z = _1870;
    out.m_62.w = _1625;
    out.m_64.x = _1876;
    out.m_64.y = _1878;
    out.m_64.z = _1880;
    out.m_64.w = _1874;
    if (_1848)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1882 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1882;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

