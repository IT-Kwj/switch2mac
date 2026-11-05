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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_23 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.w;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = 1.0 / _37;
    float _53 = _51 * _43;
    float _55 = _51 * _49;
    bool _59 = _53 != 1.0;
    bool _61 = isnan(_53);
    bool _63 = _59 || _61;
    bool _65 = isnan(1.0);
    bool _67 = _63 || _65;
    bool _69 = !_67;
    if (!_69)
    {
        float _71 = in.m_27.x;
        float _73 = gl_FragCoord.w;
        float _75 = _71 * _73;
        float _77 = in.m_27.y;
        float _79 = gl_FragCoord.w;
        float _81 = _77 * _79;
        float _83 = _51 * _75;
        float _85 = _51 * _81;
        int _88 = as_type<int>(_83);
        int _90 = as_type<int>(_85);
        int _92 = as_type<int>(_81);
        if (_67)
        {
            float2 _257 = float2(_83, _85);
            float3 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_257, float2(0.0), isnan(_257))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_257, float2(0.0), isnan(_257))).xyz;
            float _98 = _96.x;
            float _100 = _96.y;
            float _102 = _96.z;
            _88 = as_type<int>(_98);
            _90 = as_type<int>(_100);
            _92 = as_type<int>(_102);
        }
        int _104 = _88;
        int _106 = _90;
        int _108 = _92;
        bool _110 = !_67;
        if (!_110)
        {
            float _112 = gl_FragCoord.x;
            float _114 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
            float _116 = _112 / _114;
            float _118 = gl_FragCoord.y;
            float _120 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
            float _122 = _118 / _120;
            float _124 = _53 * 256.0;
            float _126 = trunc(_124);
            int _128 = int(_126);
            float _130 = trunc(_116);
            int _132 = int(_130);
            float _134 = trunc(_122);
            int _136 = int(_134);
            int _138 = _132 + 2;
            int _140 = _138 >> 1;
            uint _143 = uint(int(uint(_136) >> uint(1)));
            int _145 = _140 ^ int(_143);
            int _147 = _145 * 65536;
            int _149 = _147 ^ _140;
            int _151 = 983055 & _149;
            int _153 = _151 * 64;
            int _155 = _153 + _151;
            int _157 = _155 & 13369548;
            uint _159 = uint(int(uint(_157) >> uint(3)));
            int _161 = _157 | int(_159);
            uint _163 = uint(int(uint(_128) >> uint(7)));
            int _165 = int(_163) + _128;
            int _167 = _161 & 5570560;
            int _169 = _161 & 85;
            uint _171 = uint(int(uint(_167) >> uint(15)));
            int _173 = int(_171) + _169;
            bool _175 = uint(_165) > uint(_173);
            if (!_175)
            {
                discard_fragment();
            }
            if (!_175)
            {
                out.m_30.x = as_type<float>(_104);
                out.m_30.y = as_type<float>(_106);
                out.m_30.z = as_type<float>(_108);
                out.m_30.w = _55;
                return out;
            }
        }
    }
    float _177 = 0.0 + _55;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    out.m_30.x = 1.0;
    out.m_30.y = 1.0;
    out.m_30.z = 1.0;
    out.m_30.w = _179;
    return out;
}


struct main0_out_u
{
    uint4 m_30 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.w;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_25.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = 1.0 / _37;
    float _53 = _51 * _43;
    float _55 = _51 * _49;
    bool _59 = _53 != 1.0;
    bool _61 = isnan(_53);
    bool _63 = _59 || _61;
    bool _65 = isnan(1.0);
    bool _67 = _63 || _65;
    bool _69 = !_67;
    if (!_69)
    {
        float _71 = in.m_27.x;
        float _73 = gl_FragCoord.w;
        float _75 = _71 * _73;
        float _77 = in.m_27.y;
        float _79 = gl_FragCoord.w;
        float _81 = _77 * _79;
        float _83 = _51 * _75;
        float _85 = _51 * _81;
        int _88 = as_type<int>(_83);
        int _90 = as_type<int>(_85);
        int _92 = as_type<int>(_81);
        if (_67)
        {
            float2 _257 = float2(_83, _85);
            float3 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_257, float2(0.0), isnan(_257))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_257, float2(0.0), isnan(_257))).xyz;
            float _98 = _96.x;
            float _100 = _96.y;
            float _102 = _96.z;
            _88 = as_type<int>(_98);
            _90 = as_type<int>(_100);
            _92 = as_type<int>(_102);
        }
        int _104 = _88;
        int _106 = _90;
        int _108 = _92;
        bool _110 = !_67;
        if (!_110)
        {
            float _112 = gl_FragCoord.x;
            float _114 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
            float _116 = _112 / _114;
            float _118 = gl_FragCoord.y;
            float _120 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
            float _122 = _118 / _120;
            float _124 = _53 * 256.0;
            float _126 = trunc(_124);
            int _128 = int(_126);
            float _130 = trunc(_116);
            int _132 = int(_130);
            float _134 = trunc(_122);
            int _136 = int(_134);
            int _138 = _132 + 2;
            int _140 = _138 >> 1;
            uint _143 = uint(int(uint(_136) >> uint(1)));
            int _145 = _140 ^ int(_143);
            int _147 = _145 * 65536;
            int _149 = _147 ^ _140;
            int _151 = 983055 & _149;
            int _153 = _151 * 64;
            int _155 = _153 + _151;
            int _157 = _155 & 13369548;
            uint _159 = uint(int(uint(_157) >> uint(3)));
            int _161 = _157 | int(_159);
            uint _163 = uint(int(uint(_128) >> uint(7)));
            int _165 = int(_163) + _128;
            int _167 = _161 & 5570560;
            int _169 = _161 & 85;
            uint _171 = uint(int(uint(_167) >> uint(15)));
            int _173 = int(_171) + _169;
            bool _175 = uint(_165) > uint(_173);
            if (!_175)
            {
                discard_fragment();
            }
            if (!_175)
            {
                out.m_30.x = as_type<float>(_104);
                out.m_30.y = as_type<float>(_106);
                out.m_30.z = as_type<float>(_108);
                out.m_30.w = _55;
                return main0_out_u{as_type<uint4>(out.m_30)};
            }
        }
    }
    float _177 = 0.0 + _55;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    out.m_30.x = 1.0;
    out.m_30.y = 1.0;
    out.m_30.z = 1.0;
    out.m_30.w = _179;
    return main0_out_u{as_type<uint4>(out.m_30)};
}

