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

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    constant _16* fp_c9 [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_37.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_37.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _237 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_237, float2(0.0), isnan(_237))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_237, float2(0.0), isnan(_237))).w;
    bool _71 = _67 >= (*spvDescriptorSet0.fp_c11)._m0[34].z;
    bool _73 = isnan(_67);
    bool _75 = _71 || _73;
    bool _77 = isnan((*spvDescriptorSet0.fp_c11)._m0[34].z);
    bool _79 = _75 || _77;
    if (!_79)
    {
        discard_fragment();
    }
    float2 _270 = float2(_63, _65);
    float3 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_270, float2(0.0), isnan(_270))).xyz;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = _83.z;
    if (!_79)
    {
        out.m_40.x = 0.0;
        out.m_40.y = 0.0;
        out.m_40.z = 0.0;
        out.m_40.w = 0.0;
        return out;
    }
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _94 = _92 & 31;
    uint _97 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_94)));
    bool _99 = uint(_94) < 32u;
    int _101 = _99 ? int(_97) : 0;
    int _103 = _101 & 255;
    bool _105 = _103 != 255;
    bool _107 = !_105;
    if (!_107)
    {
        bool _109 = _103 != 0;
        if (!_109)
        {
            discard_fragment();
        }
        if (!_109)
        {
            out.m_40.x = 0.0;
            out.m_40.y = 0.0;
            out.m_40.z = 0.0;
            out.m_40.w = 0.0;
            return out;
        }
        float _111 = gl_FragCoord.x;
        float _113 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _115 = _111 / _113;
        float _117 = gl_FragCoord.y;
        float _119 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _121 = _117 / _119;
        float _123 = trunc(_115);
        float _125 = precise::max(_123, 0.0);
        uint _127 = uint(_125);
        float _129 = trunc(_121);
        float _131 = precise::max(_129, 0.0);
        uint _133 = uint(_131);
        int _135 = int(_127) + 2;
        uint _137 = uint(int(uint(_135) >> uint(1)));
        uint _139 = uint(int(uint(int(_133)) >> uint(1)));
        int _141 = int(_137) ^ int(_139);
        int _143 = _141 * 65536;
        int _145 = _143 ^ int(_137);
        int _147 = 983055 & _145;
        int _149 = _147 * 64;
        int _151 = _149 + _147;
        int _153 = _151 & 13369548;
        uint _155 = uint(int(uint(_153) >> uint(3)));
        int _157 = _153 | int(_155);
        int _159 = _157 & 5570560;
        int _161 = _157 & 85;
        uint _163 = uint(int(uint(_159) >> uint(15)));
        int _165 = int(_163) + _161;
        bool _167 = uint(_103) >= uint(_165);
        if (!_167)
        {
            discard_fragment();
        }
        if (!_167)
        {
            out.m_40.x = 0.0;
            out.m_40.y = 0.0;
            out.m_40.z = 0.0;
            out.m_40.w = 0.0;
            return out;
        }
    }
    float _169 = _87 * 0.715200006961822509765625;
    float _171 = fma(_85, 0.2125999927520751953125, _169);
    float _173 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _175 = fma(_89, 0.072200000286102294921875, _171);
    float _177 = 1.0 / _175;
    float _179 = _177 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _181 = _173 * _179;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = fma(_183, (*spvDescriptorSet0.fp_c9)._m0[37].w, (*spvDescriptorSet0.fp_c9)._m0[37].z);
    float _187 = precise::min(_179, _185);
    float _189 = _187 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _191 = fma(_185, (*spvDescriptorSet0.fp_c9)._m0[39].x, _189);
    float _193 = _85 * _191;
    float _195 = _87 * _191;
    float _197 = _89 * _191;
    float _199 = precise::max(0.0, _193);
    float _201 = precise::max(0.0, _195);
    float _203 = precise::max(0.0, _197);
    out.m_40.x = _199;
    out.m_40.y = _201;
    out.m_40.z = _203;
    out.m_40.w = 1.0;
    return out;
}

