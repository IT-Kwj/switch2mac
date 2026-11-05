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
    texture2d<float> fp_t_tcb_E [[id(1)]];
    sampler fp_t_tcb_ESmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _96 = false;
    float _43 = in.m_33.x;
    float _45 = in.m_33.y;
    float2 _249 = float2(_43, _45);
    float _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_249, float2(0.0), isnan(_249))).x;
    float _49 = fma(_47, 2.0, -1.0);
    float _51 = -_49;
    float _53 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _55 = _53 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _57 = 1.0 / _55;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _63 = _59 >= 1.0;
    bool _65 = isnan(_59);
    bool _67 = _63 || _65;
    bool _69 = isnan(1.0);
    bool _71 = _67 || _69;
    float _73 = 1.0;
    float _75 = _57;
    int _78 = as_type<int>(_59);
    int _90;
    int _92;
    int _94;
    if (!_71)
    {
        float2 _301 = float2(_43, _45);
        float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).xyz;
        float _84 = _82.x;
        float _86 = _82.y;
        float _88 = _82.z;
        _90 = as_type<int>(_84);
        _92 = as_type<int>(_86);
        _94 = as_type<int>(_88);
        _96 = true;
    }
    else
    {
        bool _98 = _59 >= 2.0;
        bool _100 = isnan(_59);
        bool _102 = _98 || _100;
        bool _104 = isnan(2.0);
        bool _106 = _102 || _104;
        if (!_106)
        {
            float2 _337 = float2(_43, _45);
            float3 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_337, float2(0.0), isnan(_337))).xyz;
            float _110 = _108.x;
            float _112 = _108.y;
            float _114 = _108.z;
            float2 _351 = float2(_43, _45);
            float3 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_351, float2(0.0), isnan(_351))).xyz;
            float _118 = _116.x;
            float _120 = _116.y;
            float _122 = _116.z;
            float _124 = _59 + (-1.0);
            float _126 = -_112;
            float _128 = _126 + _120;
            float _130 = -_110;
            float _132 = _130 + _118;
            float _134 = -_114;
            float _136 = _134 + _122;
            float _138 = fma(_124, _128, _112);
            float _140 = fma(_124, _132, _110);
            float _142 = fma(_124, _136, _114);
            _90 = as_type<int>(_140);
            _92 = as_type<int>(_138);
            _94 = as_type<int>(_142);
            _96 = true;
        }
        else
        {
            bool _144 = _59 >= 4.0;
            bool _146 = isnan(_59);
            bool _148 = _144 || _146;
            bool _150 = isnan(4.0);
            bool _152 = _148 || _150;
            float2 _413 = float2(_43, _45);
            float3 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_413, float2(0.0), isnan(_413))).xyz;
            float _156 = _154.x;
            float _158 = _154.y;
            float _160 = _154.z;
            float _162 = 0.0;
            float _164 = 0.0;
            float _166 = 0.0;
            if (!_152)
            {
                float2 _430 = float2(_43, _45);
                float3 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_430, float2(0.0), isnan(_430))).xyz;
                float _170 = _168.x;
                float _172 = _168.y;
                float _174 = _168.z;
                _162 = _170;
                _164 = _172;
                _166 = _174;
            }
            float _176 = _162;
            float _178 = _164;
            float _180 = _166;
            if (!_152)
            {
                float _182 = fma(_59, 0.5, -1.0);
                _73 = _182;
            }
            float _184 = _73;
            float _186 = 0.0;
            if (!_152)
            {
                float _188 = -_178;
                float _190 = _158 + _188;
                _186 = _190;
            }
            float _192 = _186;
            int _194 = as_type<int>(_192);
            if (!_152)
            {
                float _196 = -_176;
                float _198 = _156 + _196;
                _75 = _198;
            }
            float _200 = _75;
            float _202 = 0.0;
            int _204 = as_type<int>(_200);
            if (!_152)
            {
                float _206 = -_180;
                float _208 = _160 + _206;
                _202 = _208;
            }
            float _210 = _202;
            if (!_152)
            {
                float _212 = fma(_184, _192, _178);
                _78 = as_type<int>(_212);
            }
            int _214 = _78;
            int _216 = _214;
            if (!_152)
            {
                float _218 = fma(_184, _200, _176);
                _204 = as_type<int>(_218);
            }
            int _220 = _204;
            int _222 = _220;
            if (!_152)
            {
                float _224 = fma(_184, _210, _180);
                _194 = as_type<int>(_224);
            }
            int _226 = _194;
            _94 = _226;
            if (_152)
            {
                _222 = as_type<int>(_156);
            }
            int _228 = _222;
            _90 = _228;
            if (_152)
            {
                _216 = as_type<int>(_158);
            }
            int _230 = _216;
            _92 = _230;
            if (_152)
            {
                _94 = as_type<int>(_160);
            }
        }
    }
    _96 = false;
    int _232 = _90;
    int _234 = _92;
    int _236 = _94;
    out.m_36.x = as_type<float>(_232);
    out.m_36.y = as_type<float>(_234);
    out.m_36.z = as_type<float>(_236);
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _96 = false;
    float _43 = in.m_33.x;
    float _45 = in.m_33.y;
    float2 _249 = float2(_43, _45);
    float _47 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_249, float2(0.0), isnan(_249))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_249, float2(0.0), isnan(_249))).x;
    float _49 = fma(_47, 2.0, -1.0);
    float _51 = -_49;
    float _53 = fma(_51, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _55 = _53 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _57 = 1.0 / _55;
    float _59 = _57 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _63 = _59 >= 1.0;
    bool _65 = isnan(_59);
    bool _67 = _63 || _65;
    bool _69 = isnan(1.0);
    bool _71 = _67 || _69;
    float _73 = 1.0;
    float _75 = _57;
    int _78 = as_type<int>(_59);
    int _90;
    int _92;
    int _94;
    if (!_71)
    {
        float2 _301 = float2(_43, _45);
        float3 _82 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).xyz;
        float _84 = _82.x;
        float _86 = _82.y;
        float _88 = _82.z;
        _90 = as_type<int>(_84);
        _92 = as_type<int>(_86);
        _94 = as_type<int>(_88);
        _96 = true;
    }
    else
    {
        bool _98 = _59 >= 2.0;
        bool _100 = isnan(_59);
        bool _102 = _98 || _100;
        bool _104 = isnan(2.0);
        bool _106 = _102 || _104;
        if (!_106)
        {
            float2 _337 = float2(_43, _45);
            float3 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_337, float2(0.0), isnan(_337))).xyz;
            float _110 = _108.x;
            float _112 = _108.y;
            float _114 = _108.z;
            float2 _351 = float2(_43, _45);
            float3 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_351, float2(0.0), isnan(_351))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_351, float2(0.0), isnan(_351))).xyz;
            float _118 = _116.x;
            float _120 = _116.y;
            float _122 = _116.z;
            float _124 = _59 + (-1.0);
            float _126 = -_112;
            float _128 = _126 + _120;
            float _130 = -_110;
            float _132 = _130 + _118;
            float _134 = -_114;
            float _136 = _134 + _122;
            float _138 = fma(_124, _128, _112);
            float _140 = fma(_124, _132, _110);
            float _142 = fma(_124, _136, _114);
            _90 = as_type<int>(_140);
            _92 = as_type<int>(_138);
            _94 = as_type<int>(_142);
            _96 = true;
        }
        else
        {
            bool _144 = _59 >= 4.0;
            bool _146 = isnan(_59);
            bool _148 = _144 || _146;
            bool _150 = isnan(4.0);
            bool _152 = _148 || _150;
            float2 _413 = float2(_43, _45);
            float3 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_413, float2(0.0), isnan(_413))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_413, float2(0.0), isnan(_413))).xyz;
            float _156 = _154.x;
            float _158 = _154.y;
            float _160 = _154.z;
            float _162 = 0.0;
            float _164 = 0.0;
            float _166 = 0.0;
            if (!_152)
            {
                float2 _430 = float2(_43, _45);
                float3 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_430, float2(0.0), isnan(_430))).xyz;
                float _170 = _168.x;
                float _172 = _168.y;
                float _174 = _168.z;
                _162 = _170;
                _164 = _172;
                _166 = _174;
            }
            float _176 = _162;
            float _178 = _164;
            float _180 = _166;
            if (!_152)
            {
                float _182 = fma(_59, 0.5, -1.0);
                _73 = _182;
            }
            float _184 = _73;
            float _186 = 0.0;
            if (!_152)
            {
                float _188 = -_178;
                float _190 = _158 + _188;
                _186 = _190;
            }
            float _192 = _186;
            int _194 = as_type<int>(_192);
            if (!_152)
            {
                float _196 = -_176;
                float _198 = _156 + _196;
                _75 = _198;
            }
            float _200 = _75;
            float _202 = 0.0;
            int _204 = as_type<int>(_200);
            if (!_152)
            {
                float _206 = -_180;
                float _208 = _160 + _206;
                _202 = _208;
            }
            float _210 = _202;
            if (!_152)
            {
                float _212 = fma(_184, _192, _178);
                _78 = as_type<int>(_212);
            }
            int _214 = _78;
            int _216 = _214;
            if (!_152)
            {
                float _218 = fma(_184, _200, _176);
                _204 = as_type<int>(_218);
            }
            int _220 = _204;
            int _222 = _220;
            if (!_152)
            {
                float _224 = fma(_184, _210, _180);
                _194 = as_type<int>(_224);
            }
            int _226 = _194;
            _94 = _226;
            if (_152)
            {
                _222 = as_type<int>(_156);
            }
            int _228 = _222;
            _90 = _228;
            if (_152)
            {
                _216 = as_type<int>(_158);
            }
            int _230 = _216;
            _92 = _230;
            if (_152)
            {
                _94 = as_type<int>(_160);
            }
        }
    }
    _96 = false;
    int _232 = _90;
    int _234 = _92;
    int _236 = _94;
    out.m_36.x = as_type<float>(_232);
    out.m_36.y = as_type<float>(_234);
    out.m_36.z = as_type<float>(_236);
    return main0_out_u{as_type<uint4>(out.m_36)};
}

