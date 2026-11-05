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
    texturecube<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_37 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_34.z;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    bool _66 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].y);
    float _68 = 1.0 / _44;
    float _70 = _68 * _50;
    float _72 = _68 * _56;
    float _74 = _68 * _62;
    float _76 = abs(_70);
    float _78 = abs(_72);
    float _80 = precise::max(_76, _78);
    float _82 = abs(_74);
    float _84 = precise::max(_82, _80);
    float _86 = 1.0 / _84;
    float _88 = _70 * _86;
    float _90 = _72 * _86;
    float _92 = _74 * _86;
    float _94 = _68;
    float _96 = _86;
    float _98 = 0.0;
    float _100 = 0.0;
    if (!_66)
    {
        float3 _259 = float3(_88, _90, _92);
        float4 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_259, float3(0.0), isnan(_259))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_259, float3(0.0), isnan(_259))).xyzw;
        float _105 = _103.x;
        float _107 = _103.y;
        float _109 = _103.z;
        float _111 = _103.w;
        _94 = _105;
        _96 = _107;
        _98 = _109;
        _100 = _111;
    }
    float _113 = _94;
    float _115 = _96;
    float _117 = _98;
    float _119 = _100;
    float _121 = 0.0;
    if (_66)
    {
        _121 = (*spvDescriptorSet0.fp_c3)._m0[7].w;
    }
    float _123 = _121;
    float _125 = _113;
    float _127 = _115;
    float _129 = _117;
    float _131 = _119;
    if (_66)
    {
        float3 _300 = float3(_88, _90, _92);
        float4 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_300, float3(0.0), isnan(_300)), level(_123)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_300, float3(0.0), isnan(_300)), level(_123)).xyzw;
        float _135 = _133.x;
        float _137 = _133.y;
        float _139 = _133.z;
        float _141 = _133.w;
        _125 = _135;
        _127 = _137;
        _129 = _139;
        _131 = _141;
    }
    float _143 = _125;
    float _145 = _127;
    float _147 = _129;
    float _149 = _131;
    float2 _326 = float2(0.5);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_326, float2(0.0), isnan(_326))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_326, float2(0.0), isnan(_326))).x;
    float _153 = abs(_149);
    float _155 = log2(_153);
    float _157 = _155 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _159 = exp2(_157);
    float _161 = _159 * _151;
    float _163 = _161 * _143;
    float _165 = _161 * _145;
    float _167 = _161 * _147;
    float _169 = _149 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = precise::max(0.0, _163);
    float _175 = precise::max(0.0, _165);
    float _177 = precise::max(0.0, _167);
    out.m_37.x = _173;
    out.m_37.y = _175;
    out.m_37.z = _177;
    out.m_37.w = _171;
    return out;
}

