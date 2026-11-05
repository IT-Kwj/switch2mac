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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _497 = false;
    bool _461 = false;
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _544 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_544, float2(0.0), isnan(_544))).x;
    float2 _555 = float2(_57, _59);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_555, float2(0.0), isnan(_555))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_555, float2(0.0), isnan(_555))).x;
    float _65 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[15].w, (*spvDescriptorSet0.fp_c3)._m0[15].z);
    bool _69 = _63 != 0.0;
    bool _71 = isnan(_63);
    bool _73 = _69 || _71;
    bool _75 = isnan(0.0);
    bool _77 = _73 || _75;
    float _79 = _65 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _81 = fma(_57, 2.0, -1.0);
    bool _83 = _79 > (*spvDescriptorSet0.fp_c3)._m0[11].w;
    bool _85 = !_77;
    bool _87 = _83 || _85;
    float _89 = fma(_59, 2.0, -1.0);
    float _91 = _81 * (*spvDescriptorSet0.fp_c3)._m0[15].x;
    float _93 = _89 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _95 = _65 * _91;
    float _97 = _65 * _93;
    if (!_87)
    {
        int _100 = 0;
        bool _102 = false;
        float _104 = 0.0;
        float _106 = 0.0;
        bool _108;
        bool _377;
        float _381;
        float _505;
        do
        {
            int _110 = _100;
            bool _112 = _102;
            float _114 = _104;
            float _116 = _106;
            int _118 = _110 << 4;
            int _120 = _118 + 112;
            int _122 = _110 + 1;
            uint _125 = uint(int(uint(_120) >> uint(2)));
            uint _127 = uint(int(uint(int(_125)) >> uint(2)));
            int _129 = int(_125) & 3;
            float _131 = (*spvDescriptorSet0.fp_c3)._m0[int(_127)][_129];
            int _133 = int(_125) + 1;
            uint _135 = uint(int(uint(_133) >> uint(2)));
            int _137 = _133 & 3;
            float _139 = (*spvDescriptorSet0.fp_c3)._m0[int(_135)][_137];
            bool _141 = _122 >= 2;
            int _143 = _120 + 8;
            uint _145 = uint(int(uint(_143) >> uint(2)));
            uint _147 = uint(int(uint(int(_145)) >> uint(2)));
            int _149 = int(_145) & 3;
            float _151 = (*spvDescriptorSet0.fp_c3)._m0[int(_147)][_149];
            float _153 = -_97;
            float _155 = fma(_139, -0.100000001490116119384765625, _153);
            float _157 = fma(_131, -0.100000001490116119384765625, _95);
            float _159 = _155 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _161 = _151 * 0.100000001490116119384765625;
            float _163 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[6].x, _159);
            float _165 = -_79;
            float _167 = -_161;
            float _169 = _165 + _167;
            float _171 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[6].z, _163);
            float _173 = _171 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _175 = _155 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _177 = _155 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _179 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[4].x, _175);
            float _181 = 1.0 / _173;
            float _183 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[3].x, _177);
            float _185 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[4].z, _179);
            float _187 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[3].z, _183);
            float _189 = _185 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _191 = _187 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            float _193 = _189 * _181;
            float _195 = _191 * _181;
            float _197 = -_59;
            float _199 = _197 + _193;
            float _201 = -_57;
            float _203 = _201 + _195;
            float _205 = _199 * _199;
            float _207 = fma(_203, _203, _205);
            float _209 = sqrt(_207);
            bool _211 = _209 != 0.0;
            bool _213 = isnan(_209);
            bool _215 = _211 || _213;
            bool _217 = isnan(0.0);
            bool _219 = _215 || _217;
            _100 = _122;
            bool _221 = _112;
            float _223 = _205;
            float _225 = _209;
            float _227 = _116;
            float _229 = _116;
            if (!_219)
            {
                float _231 = -_161;
                bool _233 = _231 >= 0.0;
                bool _235 = isnan(_231);
                bool _237 = _233 || _235;
                bool _239 = isnan(0.0);
                bool _241 = _237 || _239;
                _221 = _241;
            }
            bool _243 = _221;
            bool _245 = _243;
            bool _247 = _243;
            if (!_219)
            {
                float _249 = _243 ? 0.0 : 0.5;
                _223 = _249;
            }
            float _251 = _223;
            if (!_219)
            {
                float _253 = _251 + _114;
                _225 = _253;
            }
            float _255 = _225;
            bool _257 = !_219;
            float _259 = _255;
            if (!_257)
            {
                float _261 = rsqrt(_207);
                float _263 = _63 * 10.0;
                float _265 = -_193;
                float _267 = _59 + _265;
                float _269 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[13].w;
                float _271 = _263 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
                float _273 = _63 * _269;
                float _275 = _273 * 2.0;
                float _277 = _261 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
                float _279 = 1.0 / _277;
                float _281 = _277 * _267;
                float _283 = _161 * _277;
                float _285 = _271 * _279;
                float _287 = -_195;
                float _289 = _57 + _287;
                bool _291 = _285 >= _275;
                bool _293 = isnan(_285);
                bool _295 = _291 || _293;
                bool _297 = isnan(_275);
                bool _299 = _295 || _297;
                float _301 = _277 * _289;
                float _303 = _277;
                if (!_299)
                {
                    float _305 = -_161;
                    bool _307 = _305 >= 0.0;
                    bool _309 = isnan(_305);
                    bool _311 = _307 || _309;
                    bool _313 = isnan(0.0);
                    bool _315 = _311 || _313;
                    _245 = _315;
                }
                bool _317 = _245;
                _247 = _317;
                if (!_299)
                {
                    float _319 = _317 ? 0.0 : 0.5;
                    _227 = _319;
                }
                float _321 = _227;
                float _323 = _321;
                _229 = _321;
                if (!_299)
                {
                    float _325 = _321 + _114;
                    _303 = _325;
                }
                float _327 = _303;
                bool _329 = !_299;
                _259 = _327;
                if (!_329)
                {
                    float _331 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[12].x));
                    float _333 = _283 * _285;
                    bool _335 = _283 >= 0.0;
                    bool _337 = isnan(_283);
                    bool _339 = _335 || _337;
                    bool _341 = isnan(0.0);
                    bool _343 = _339 || _341;
                    bool _345 = _331 > 0.0;
                    bool _347 = !_343;
                    float _349 = _347 ? 2.5 : 0.5;
                    float _351 = -_283;
                    float _353 = -_79;
                    float _355 = fma(_351, _349, _353);
                    bool _357 = !_345;
                    _247 = _345;
                    if (!_357)
                    {
                        float _359 = _333 * (*spvDescriptorSet0.fp_c3)._m0[14].z;
                        float _361 = _281 * _285;
                        float _363 = fma(_281, -1.5, _59);
                        float _365 = _355 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
                        float _367 = _301 * _285;
                        float _369 = fma(_301, -1.5, _57);
                        int _371 = 4;
                        float _373 = 0.0;
                        int _375 = 0;
                        _323 = _367;
                        _229 = _367;
                        do
                        {
                            int _379 = _371;
                            _381 = _373;
                            int _383 = _375;
                            float _385 = -_361;
                            float _387 = fma(_385, _381, _363);
                            float _389 = float(_383);
                            float _391 = -_367;
                            float _393 = fma(_391, _381, _369);
                            float2 _1038 = float2(_393, _387);
                            float _395 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1038, float2(0.0), isnan(_1038)), level(_389)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1038, float2(0.0), isnan(_1038)), level(_389)).x;
                            float _397 = _359 * _381;
                            float _399 = -_397;
                            float _401 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[14].z, _399);
                            float _403 = _401 + _395;
                            float _405 = -_403;
                            float _407 = precise::max(_405, (*spvDescriptorSet0.fp_c3)._m0[8].w);
                            float _409 = precise::min(_407, (*spvDescriptorSet0.fp_c3)._m0[7].w);
                            float _411 = -_403;
                            bool _413 = _409 != _411;
                            bool _415 = isnan(_409);
                            bool _417 = _413 || _415;
                            bool _419 = isnan(_411);
                            bool _421 = _417 || _419;
                            int _423 = as_type<int>(_403);
                            int _425 = _379;
                            float _427 = _409;
                            float _429 = _395;
                            if (_421)
                            {
                                int _431 = _383 + 1;
                                _423 = _431;
                            }
                            int _433 = _423;
                            int _435 = _433;
                            if (_421)
                            {
                                int _437 = min(_433, _379);
                                _435 = _437;
                            }
                            int _439 = _435;
                            int _441 = _439;
                            if (_421)
                            {
                                _425 = 4;
                            }
                            int _443 = _425;
                            int _445 = _443;
                            if (_421)
                            {
                                float _447 = float(_439);
                                _427 = _447;
                            }
                            float _449 = _427;
                            if (_421)
                            {
                                float _451 = _449 + _381;
                                _429 = _451;
                            }
                            float _453 = _429;
                            float _455 = _453;
                            if (!_421)
                            {
                                bool _457 = _383 != 0;
                                bool _459 = !_457;
                                _461 = _459;
                                if (_461)
                                {
                                    break;
                                }
                                int _463 = _383 + (-1);
                                float _465 = float(_463);
                                float _467 = -_465;
                                float _469 = _467 + _381;
                                float _471 = precise::max(_469, 1.0);
                                _445 = _463;
                                _455 = _471;
                                _441 = _463;
                            }
                            int _473 = _445;
                            float _475 = _455;
                            int _477 = _441;
                            bool _479 = _475 >= _331;
                            bool _481 = isnan(_475);
                            bool _483 = _479 || _481;
                            bool _485 = isnan(_331);
                            bool _487 = _483 || _485;
                            _377 = !_487;
                            _371 = _473;
                            _373 = _475;
                            _375 = _477;
                        } while (_377);
                        if (!_461)
                        {
                        }
                        if (false || _461)
                        {
                            _461 = false;
                            float _489 = -_381;
                            float _491 = fma(_489, (*spvDescriptorSet0.fp_c3)._m0[10].w, 1.0);
                            float _493 = precise::clamp(_491, 0.0, 1.0);
                            float _495 = fma(_493, 0.5, _114);
                            _259 = _495;
                            _497 = true;
                        }
                    }
                    if (!_497)
                    {
                        float _499 = _323;
                        _229 = _499;
                        _259 = _114;
                    }
                }
            }
            _497 = false;
            bool _501 = _247;
            float _503 = _229;
            _505 = _259;
            _108 = !_141;
            _102 = _501;
            _104 = _505;
            _106 = _503;
        } while (_108);
        float _507 = -_505;
        float _509 = _507 + 1.0;
        out.m_34.x = _509;
        out.m_34.y = _509;
        out.m_34.z = _509;
        out.m_34.w = _509;
        return out;
    }
    out.m_34.x = 1.0;
    out.m_34.y = 1.0;
    out.m_34.z = 1.0;
    out.m_34.w = 1.0;
    return out;
}

