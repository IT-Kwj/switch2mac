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
    texture2d<float> fp_t_tcb_10 [[id(1)]];
    sampler fp_t_tcb_10Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ESmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _98 = false;
    float _45 = in.m_35.x;
    float _47 = in.m_35.y;
    float2 _297 = float2(_45, _47);
    float _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_297, float2(0.0), isnan(_297))).x;
    float _51 = fma(_49, 2.0, -1.0);
    float _53 = -_51;
    float _55 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _57 = _55 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = 1.0 / _57;
    float _61 = _59 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _65 = _61 >= 1.0;
    bool _67 = isnan(_61);
    bool _69 = _65 || _67;
    bool _71 = isnan(1.0);
    bool _73 = _69 || _71;
    float _75 = 1.0;
    float _77 = _59;
    int _80 = as_type<int>(_61);
    int _92;
    int _94;
    int _96;
    if (!_73)
    {
        float2 _349 = float2(_45, _47);
        float3 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349))).xyz;
        float _86 = _84.x;
        float _88 = _84.y;
        float _90 = _84.z;
        _92 = as_type<int>(_86);
        _94 = as_type<int>(_88);
        _96 = as_type<int>(_90);
        _98 = true;
    }
    else
    {
        bool _100 = _61 >= 2.0;
        bool _102 = isnan(_61);
        bool _104 = _100 || _102;
        bool _106 = isnan(2.0);
        bool _108 = _104 || _106;
        if (!_108)
        {
            float2 _385 = float2(_45, _47);
            float3 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).xyz;
            float _112 = _110.x;
            float _114 = _110.y;
            float _116 = _110.z;
            float2 _399 = float2(_45, _47);
            float3 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).xyz;
            float _120 = _118.x;
            float _122 = _118.y;
            float _124 = _118.z;
            float _126 = _61 + (-1.0);
            float _128 = -_114;
            float _130 = _128 + _122;
            float _132 = -_112;
            float _134 = _132 + _120;
            float _136 = -_116;
            float _138 = _136 + _124;
            float _140 = fma(_126, _130, _114);
            float _142 = fma(_126, _134, _112);
            float _144 = fma(_126, _138, _116);
            _92 = as_type<int>(_142);
            _94 = as_type<int>(_140);
            _96 = as_type<int>(_144);
            _98 = true;
        }
        else
        {
            bool _146 = _61 >= 4.0;
            bool _148 = isnan(_61);
            bool _150 = _146 || _148;
            bool _152 = isnan(4.0);
            bool _154 = _150 || _152;
            if (!_154)
            {
                float2 _464 = float2(_45, _47);
                float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_464, float2(0.0), isnan(_464))).xyz;
                float _158 = _156.x;
                float _160 = _156.y;
                float _162 = _156.z;
                float2 _478 = float2(_45, _47);
                float3 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_478, float2(0.0), isnan(_478))).xyz;
                float _166 = _164.x;
                float _168 = _164.y;
                float _170 = _164.z;
                float _172 = fma(_61, 0.5, -1.0);
                float _174 = -_160;
                float _176 = _174 + _168;
                float _178 = -_158;
                float _180 = _178 + _166;
                float _182 = -_162;
                float _184 = _182 + _170;
                float _186 = fma(_172, _176, _160);
                float _188 = fma(_172, _180, _158);
                float _190 = fma(_172, _184, _162);
                _92 = as_type<int>(_188);
                _94 = as_type<int>(_186);
                _96 = as_type<int>(_190);
                _98 = true;
            }
            else
            {
                bool _192 = _61 >= 8.0;
                bool _194 = isnan(_61);
                bool _196 = _192 || _194;
                bool _198 = isnan(8.0);
                bool _200 = _196 || _198;
                float2 _541 = float2(_45, _47);
                float3 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_541, float2(0.0), isnan(_541))).xyz;
                float _204 = _202.x;
                float _206 = _202.y;
                float _208 = _202.z;
                float _210 = 0.0;
                float _212 = 0.0;
                float _214 = 0.0;
                if (!_200)
                {
                    float2 _558 = float2(_45, _47);
                    float3 _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_558, float2(0.0), isnan(_558))).xyz;
                    float _218 = _216.x;
                    float _220 = _216.y;
                    float _222 = _216.z;
                    _210 = _218;
                    _212 = _220;
                    _214 = _222;
                }
                float _224 = _210;
                float _226 = _212;
                float _228 = _214;
                float _230 = 0.0;
                if (!_200)
                {
                    float _232 = fma(_61, 0.25, -1.0);
                    _230 = _232;
                }
                float _234 = _230;
                if (!_200)
                {
                    float _236 = -_226;
                    float _238 = _206 + _236;
                    _75 = _238;
                }
                float _240 = _75;
                int _242 = as_type<int>(_240);
                if (!_200)
                {
                    float _244 = -_224;
                    float _246 = _204 + _244;
                    _77 = _246;
                }
                float _248 = _77;
                float _250 = 0.0;
                int _252 = as_type<int>(_248);
                if (!_200)
                {
                    float _254 = -_228;
                    float _256 = _208 + _254;
                    _250 = _256;
                }
                float _258 = _250;
                if (!_200)
                {
                    float _260 = fma(_234, _240, _226);
                    _80 = as_type<int>(_260);
                }
                int _262 = _80;
                int _264 = _262;
                if (!_200)
                {
                    float _266 = fma(_234, _248, _224);
                    _252 = as_type<int>(_266);
                }
                int _268 = _252;
                int _270 = _268;
                if (!_200)
                {
                    float _272 = fma(_234, _258, _228);
                    _242 = as_type<int>(_272);
                }
                int _274 = _242;
                _96 = _274;
                if (_200)
                {
                    _270 = as_type<int>(_204);
                }
                int _276 = _270;
                _92 = _276;
                if (_200)
                {
                    _264 = as_type<int>(_206);
                }
                int _278 = _264;
                _94 = _278;
                if (_200)
                {
                    _96 = as_type<int>(_208);
                }
            }
        }
    }
    _98 = false;
    int _280 = _92;
    int _282 = _94;
    int _284 = _96;
    out.m_38.x = as_type<float>(_280);
    out.m_38.y = as_type<float>(_282);
    out.m_38.z = as_type<float>(_284);
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _98 = false;
    float _45 = in.m_35.x;
    float _47 = in.m_35.y;
    float2 _297 = float2(_45, _47);
    float _49 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_297, float2(0.0), isnan(_297))).x;
    float _51 = fma(_49, 2.0, -1.0);
    float _53 = -_51;
    float _55 = fma(_53, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _57 = _55 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _59 = 1.0 / _57;
    float _61 = _59 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _65 = _61 >= 1.0;
    bool _67 = isnan(_61);
    bool _69 = _65 || _67;
    bool _71 = isnan(1.0);
    bool _73 = _69 || _71;
    float _75 = 1.0;
    float _77 = _59;
    int _80 = as_type<int>(_61);
    int _92;
    int _94;
    int _96;
    if (!_73)
    {
        float2 _349 = float2(_45, _47);
        float3 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_349, float2(0.0), isnan(_349))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_349, float2(0.0), isnan(_349))).xyz;
        float _86 = _84.x;
        float _88 = _84.y;
        float _90 = _84.z;
        _92 = as_type<int>(_86);
        _94 = as_type<int>(_88);
        _96 = as_type<int>(_90);
        _98 = true;
    }
    else
    {
        bool _100 = _61 >= 2.0;
        bool _102 = isnan(_61);
        bool _104 = _100 || _102;
        bool _106 = isnan(2.0);
        bool _108 = _104 || _106;
        if (!_108)
        {
            float2 _385 = float2(_45, _47);
            float3 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).xyz;
            float _112 = _110.x;
            float _114 = _110.y;
            float _116 = _110.z;
            float2 _399 = float2(_45, _47);
            float3 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).xyz;
            float _120 = _118.x;
            float _122 = _118.y;
            float _124 = _118.z;
            float _126 = _61 + (-1.0);
            float _128 = -_114;
            float _130 = _128 + _122;
            float _132 = -_112;
            float _134 = _132 + _120;
            float _136 = -_116;
            float _138 = _136 + _124;
            float _140 = fma(_126, _130, _114);
            float _142 = fma(_126, _134, _112);
            float _144 = fma(_126, _138, _116);
            _92 = as_type<int>(_142);
            _94 = as_type<int>(_140);
            _96 = as_type<int>(_144);
            _98 = true;
        }
        else
        {
            bool _146 = _61 >= 4.0;
            bool _148 = isnan(_61);
            bool _150 = _146 || _148;
            bool _152 = isnan(4.0);
            bool _154 = _150 || _152;
            if (!_154)
            {
                float2 _464 = float2(_45, _47);
                float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_464, float2(0.0), isnan(_464))).xyz;
                float _158 = _156.x;
                float _160 = _156.y;
                float _162 = _156.z;
                float2 _478 = float2(_45, _47);
                float3 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_478, float2(0.0), isnan(_478))).xyz;
                float _166 = _164.x;
                float _168 = _164.y;
                float _170 = _164.z;
                float _172 = fma(_61, 0.5, -1.0);
                float _174 = -_160;
                float _176 = _174 + _168;
                float _178 = -_158;
                float _180 = _178 + _166;
                float _182 = -_162;
                float _184 = _182 + _170;
                float _186 = fma(_172, _176, _160);
                float _188 = fma(_172, _180, _158);
                float _190 = fma(_172, _184, _162);
                _92 = as_type<int>(_188);
                _94 = as_type<int>(_186);
                _96 = as_type<int>(_190);
                _98 = true;
            }
            else
            {
                bool _192 = _61 >= 8.0;
                bool _194 = isnan(_61);
                bool _196 = _192 || _194;
                bool _198 = isnan(8.0);
                bool _200 = _196 || _198;
                float2 _541 = float2(_45, _47);
                float3 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_541, float2(0.0), isnan(_541))).xyz;
                float _204 = _202.x;
                float _206 = _202.y;
                float _208 = _202.z;
                float _210 = 0.0;
                float _212 = 0.0;
                float _214 = 0.0;
                if (!_200)
                {
                    float2 _558 = float2(_45, _47);
                    float3 _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_558, float2(0.0), isnan(_558))).xyz;
                    float _218 = _216.x;
                    float _220 = _216.y;
                    float _222 = _216.z;
                    _210 = _218;
                    _212 = _220;
                    _214 = _222;
                }
                float _224 = _210;
                float _226 = _212;
                float _228 = _214;
                float _230 = 0.0;
                if (!_200)
                {
                    float _232 = fma(_61, 0.25, -1.0);
                    _230 = _232;
                }
                float _234 = _230;
                if (!_200)
                {
                    float _236 = -_226;
                    float _238 = _206 + _236;
                    _75 = _238;
                }
                float _240 = _75;
                int _242 = as_type<int>(_240);
                if (!_200)
                {
                    float _244 = -_224;
                    float _246 = _204 + _244;
                    _77 = _246;
                }
                float _248 = _77;
                float _250 = 0.0;
                int _252 = as_type<int>(_248);
                if (!_200)
                {
                    float _254 = -_228;
                    float _256 = _208 + _254;
                    _250 = _256;
                }
                float _258 = _250;
                if (!_200)
                {
                    float _260 = fma(_234, _240, _226);
                    _80 = as_type<int>(_260);
                }
                int _262 = _80;
                int _264 = _262;
                if (!_200)
                {
                    float _266 = fma(_234, _248, _224);
                    _252 = as_type<int>(_266);
                }
                int _268 = _252;
                int _270 = _268;
                if (!_200)
                {
                    float _272 = fma(_234, _258, _228);
                    _242 = as_type<int>(_272);
                }
                int _274 = _242;
                _96 = _274;
                if (_200)
                {
                    _270 = as_type<int>(_204);
                }
                int _276 = _270;
                _92 = _276;
                if (_200)
                {
                    _264 = as_type<int>(_206);
                }
                int _278 = _264;
                _94 = _278;
                if (_200)
                {
                    _96 = as_type<int>(_208);
                }
            }
        }
    }
    _98 = false;
    int _280 = _92;
    int _282 = _94;
    int _284 = _96;
    out.m_38.x = as_type<float>(_280);
    out.m_38.y = as_type<float>(_282);
    out.m_38.z = as_type<float>(_284);
    return main0_out_u{as_type<uint4>(out.m_38)};
}

