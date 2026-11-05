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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _221 = float2(_59, _61);
    float3 _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_221, float2(0.0), isnan(_221))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_221, float2(0.0), isnan(_221))).xyz;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    int _74 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    int _76 = _74 & 31;
    uint _79 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_76)));
    bool _83 = uint(_76) < 32u;
    int _85 = _83 ? int(_79) : 0;
    int _87 = _85 & 255;
    bool _89 = _87 != 255;
    bool _91 = !_89;
    if (!_91)
    {
        bool _93 = _87 != 0;
        if (!_93)
        {
            discard_fragment();
        }
        if (!_93)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return out;
        }
        float _95 = gl_FragCoord.x;
        float _97 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _99 = _95 / _97;
        float _101 = gl_FragCoord.y;
        float _103 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _105 = _101 / _103;
        float _107 = trunc(_99);
        float _109 = precise::max(_107, 0.0);
        uint _111 = uint(_109);
        float _113 = trunc(_105);
        float _115 = precise::max(_113, 0.0);
        uint _117 = uint(_115);
        int _119 = int(_111) + 2;
        uint _121 = uint(int(uint(_119) >> uint(1)));
        uint _123 = uint(int(uint(int(_117)) >> uint(1)));
        int _125 = int(_121) ^ int(_123);
        int _127 = _125 * 65536;
        int _129 = _127 ^ int(_121);
        int _131 = 983055 & _129;
        int _133 = _131 * 64;
        int _135 = _133 + _131;
        int _137 = _135 & 13369548;
        uint _139 = uint(int(uint(_137) >> uint(3)));
        int _141 = _137 | int(_139);
        int _143 = _141 & 5570560;
        int _145 = _141 & 85;
        uint _147 = uint(int(uint(_143) >> uint(15)));
        int _149 = int(_147) + _145;
        bool _151 = uint(_87) >= uint(_149);
        if (!_151)
        {
            discard_fragment();
        }
        if (!_151)
        {
            out.m_36.x = 0.0;
            out.m_36.y = 0.0;
            out.m_36.z = 0.0;
            out.m_36.w = 0.0;
            return out;
        }
    }
    float _153 = _69 * 0.715200006961822509765625;
    float _155 = fma(_67, 0.2125999927520751953125, _153);
    float _157 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _159 = fma(_71, 0.072200000286102294921875, _155);
    float _161 = 1.0 / _159;
    float _163 = _161 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _165 = _157 * _163;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_167, (*spvDescriptorSet0.fp_c9)._m0[37].w, (*spvDescriptorSet0.fp_c9)._m0[37].z);
    float _171 = precise::min(_163, _169);
    float _173 = _171 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _175 = fma(_169, (*spvDescriptorSet0.fp_c9)._m0[39].x, _173);
    float _177 = _67 * _175;
    float _179 = _69 * _175;
    float _181 = _71 * _175;
    float _183 = precise::max(0.0, _177);
    float _185 = precise::max(0.0, _179);
    float _187 = precise::max(0.0, _181);
    out.m_36.x = _183;
    out.m_36.y = _185;
    out.m_36.z = _187;
    out.m_36.w = 1.0;
    return out;
}

