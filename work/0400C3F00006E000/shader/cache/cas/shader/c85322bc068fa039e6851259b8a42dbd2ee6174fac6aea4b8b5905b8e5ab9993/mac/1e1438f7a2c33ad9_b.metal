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
    bool _406 = false;
    bool _372 = false;
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
    float2 _459 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_459, float2(0.0), isnan(_459))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_459, float2(0.0), isnan(_459))).x;
    float2 _470 = float2(_57, _59);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_470, float2(0.0), isnan(_470))).x;
    float _65 = fma(_59, 2.0, -1.0);
    float _67 = _65 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _69 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[15].w, (*spvDescriptorSet0.fp_c3)._m0[15].z);
    bool _73 = _63 != 0.0;
    bool _75 = isnan(_63);
    bool _77 = _73 || _75;
    bool _79 = isnan(0.0);
    bool _81 = _77 || _79;
    float _83 = fma(_57, 2.0, -1.0);
    float _85 = _69 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _87 = _69 * _67;
    float _89 = _83 * (*spvDescriptorSet0.fp_c3)._m0[15].x;
    bool _91 = _85 > (*spvDescriptorSet0.fp_c3)._m0[11].w;
    bool _93 = !_81;
    bool _95 = _91 || _93;
    float _97 = _69 * _89;
    if (!_95)
    {
        float _99 = -_87;
        float _101 = fma(-0.100000001490116119384765625, (*spvDescriptorSet0.fp_c3)._m0[7].y, _99);
        float _103 = -(*spvDescriptorSet0.fp_c3)._m0[7].x;
        float _105 = fma(0.100000001490116119384765625, _103, _97);
        float _107 = 0.100000001490116119384765625 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
        float _109 = _101 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
        float _111 = _101 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _113 = -_85;
        float _115 = -_107;
        float _117 = _113 + _115;
        float _119 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[6].x, _109);
        float _121 = _101 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
        float _123 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[4].x, _111);
        float _125 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[6].z, _119);
        float _127 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[3].x, _121);
        float _129 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[4].z, _123);
        float _131 = _125 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
        float _133 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[3].z, _127);
        float _135 = _129 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
        float _137 = 1.0 / _131;
        float _139 = _133 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
        float _141 = _135 * _137;
        float _143 = _139 * _137;
        float _145 = -_59;
        float _147 = _145 + _141;
        float _149 = -_57;
        float _151 = _149 + _143;
        float _153 = _147 * _147;
        float _155 = fma(_151, _151, _153);
        float _157 = sqrt(_155);
        bool _159 = _157 != 0.0;
        bool _161 = isnan(_157);
        bool _163 = _159 || _161;
        bool _165 = isnan(0.0);
        bool _167 = _163 || _165;
        float _169 = _157;
        if (!_167)
        {
            float _171 = -_107;
            bool _173 = _171 < 0.0;
            float _175 = float(_173);
            _169 = _175;
        }
        float _177 = _169;
        bool _179 = !_167;
        float _181 = _177;
        if (!_179)
        {
            float _183 = rsqrt(_155);
            float _185 = _63 * 10.0;
            float _187 = -_141;
            float _189 = _59 + _187;
            float _191 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[13].w;
            float _193 = _185 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _195 = _63 * _191;
            float _197 = _195 * 2.0;
            float _199 = _183 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
            float _201 = 1.0 / _199;
            float _203 = _199 * _189;
            float _205 = _193 * _201;
            float _207 = -_143;
            float _209 = _57 + _207;
            bool _211 = _205 >= _197;
            bool _213 = isnan(_205);
            bool _215 = _211 || _213;
            bool _217 = isnan(_197);
            bool _219 = _215 || _217;
            float _221 = _199 * _209;
            float _223 = _107 * _199;
            float _225 = _209;
            if (!_219)
            {
                float _227 = -_107;
                bool _229 = _227 < 0.0;
                float _231 = float(_229);
                _225 = _231;
            }
            float _233 = _225;
            bool _235 = !_219;
            _181 = _233;
            if (!_235)
            {
                float _237 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[12].x));
                float _239 = fma(_203, -1.5, _59);
                bool _241 = _223 >= 0.0;
                bool _243 = isnan(_223);
                bool _245 = _241 || _243;
                bool _247 = isnan(0.0);
                bool _249 = _245 || _247;
                float _251 = _221 * _205;
                bool _253 = _237 > 0.0;
                float _255 = _203 * _205;
                float _257 = fma(_221, -1.5, _57);
                float _259 = _223 * _205;
                bool _261 = !_249;
                float _263 = _261 ? 2.5 : 0.5;
                float _265 = -_223;
                float _267 = -_85;
                float _269 = fma(_265, _263, _267);
                bool _271 = !_253;
                if (!_271)
                {
                    float _273 = _269 + (*spvDescriptorSet0.fp_c3)._m0[14].x;
                    float _275 = _259 * (*spvDescriptorSet0.fp_c3)._m0[14].z;
                    int _278 = 0;
                    float _280 = 0.0;
                    int _282 = 3;
                    float _284 = 0.0;
                    bool _286;
                    float _290;
                    do
                    {
                        int _288 = _278;
                        _290 = _280;
                        int _292 = _282;
                        float _294 = _284;
                        float _296 = float(_288);
                        float _298 = -_251;
                        float _300 = fma(_298, _290, _257);
                        float _302 = -_255;
                        float _304 = fma(_302, _290, _239);
                        float2 _838 = float2(_300, _304);
                        float _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_838, float2(0.0), isnan(_838)), level(_296)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_838, float2(0.0), isnan(_838)), level(_296)).x;
                        float _308 = _275 * _290;
                        float _310 = -_308;
                        float _312 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[14].z, _310);
                        float _314 = _312 + _306;
                        float _316 = -_314;
                        float _318 = precise::max(_316, (*spvDescriptorSet0.fp_c3)._m0[8].w);
                        float _320 = precise::min(_318, (*spvDescriptorSet0.fp_c3)._m0[7].w);
                        float _322 = -_314;
                        bool _324 = _320 != _322;
                        bool _326 = isnan(_320);
                        bool _328 = _324 || _326;
                        bool _330 = isnan(_322);
                        bool _332 = _328 || _330;
                        int _334 = as_type<int>(_320);
                        int _336 = as_type<int>(_314);
                        int _338 = _292;
                        float _340 = _294;
                        float _342 = _306;
                        if (_332)
                        {
                            int _344 = _288 + 1;
                            _334 = _344;
                        }
                        int _346 = _334;
                        if (_332)
                        {
                            int _348 = min(_346, _292);
                            _336 = _348;
                        }
                        int _350 = _336;
                        int _352 = _350;
                        if (_332)
                        {
                            _338 = 3;
                        }
                        int _354 = _338;
                        int _356 = _354;
                        if (_332)
                        {
                            float _358 = float(_350);
                            _340 = _358;
                        }
                        float _360 = _340;
                        _284 = _360;
                        if (_332)
                        {
                            float _362 = _360 + _290;
                            _342 = _362;
                        }
                        float _364 = _342;
                        float _366 = _364;
                        if (!_332)
                        {
                            bool _368 = _288 != 0;
                            bool _370 = !_368;
                            _372 = _370;
                            if (_372)
                            {
                                break;
                            }
                            int _374 = _288 + (-1);
                            float _376 = float(_374);
                            float _378 = -_376;
                            float _380 = _378 + _290;
                            float _382 = precise::max(_380, 1.0);
                            _356 = _374;
                            _366 = _382;
                            _352 = _374;
                        }
                        int _384 = _356;
                        float _386 = _366;
                        int _388 = _352;
                        bool _390 = _386 >= _237;
                        bool _392 = isnan(_386);
                        bool _394 = _390 || _392;
                        bool _396 = isnan(_237);
                        bool _398 = _394 || _396;
                        _286 = !_398;
                        _278 = _388;
                        _280 = _386;
                        _282 = _384;
                    } while (_286);
                    if (!_372)
                    {
                    }
                    if (false || _372)
                    {
                        _372 = false;
                        float _400 = -_290;
                        float _402 = fma(_400, (*spvDescriptorSet0.fp_c3)._m0[10].w, 1.0);
                        float _404 = precise::clamp(_402, 0.0, 1.0);
                        _181 = _404;
                        _406 = true;
                    }
                }
                if (!_406)
                {
                    _181 = 0.0;
                }
            }
        }
        _406 = false;
        float _408 = _181;
        float _410 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _412 = _85 + _410;
        float _414 = _412 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _416 = precise::clamp(_414, 0.0, 1.0);
        float _418 = -_416;
        float _420 = _418 + 1.0;
        float _422 = -_408;
        float _424 = fma(_420, _422, 1.0);
        out.m_34.x = _424;
        out.m_34.y = _424;
        out.m_34.z = _424;
        out.m_34.w = _424;
        return out;
    }
    out.m_34.x = 1.0;
    out.m_34.y = 1.0;
    out.m_34.z = 1.0;
    out.m_34.w = 1.0;
    return out;
}

