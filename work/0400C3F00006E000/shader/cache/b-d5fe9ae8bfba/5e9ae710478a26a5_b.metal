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
    texturecube_array<float> fp_t_tcb_8 [[id(1)]];
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
    float _64 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].y));
    bool _68 = 0 != as_type<int>((*spvDescriptorSet0.fp_c3)._m0[8].y);
    float _70 = rint(_64);
    float _72 = precise::max(_70, 0.0);
    uint _75 = uint(_72);
    uint _77 = clamp(_75, 0u, 65535u);
    float _79 = 1.0 / _44;
    float _81 = _79 * _50;
    float _83 = _79 * _56;
    float _85 = _79 * _62;
    float _87 = abs(_81);
    float _89 = abs(_83);
    float _91 = precise::max(_87, _89);
    float _93 = abs(_85);
    float _95 = precise::max(_93, _91);
    float _97 = 1.0 / _95;
    float _99 = _81 * _97;
    float _101 = _83 * _97;
    float _103 = _85 * _97;
    float _105 = _91;
    float _107 = _79;
    float _109 = 0.0;
    float _111 = 0.0;
    if (!_68)
    {
        float4 _287 = float4(_99, _101, _103, float(int(_77)));
        float4 _291 = select(_287, float4(0.0), isnan(_287));
        float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _291.xyz, uint(rint(_291.w))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _291.xyz, uint(rint(_291.w))).xyzw;
        float _116 = _114.x;
        float _118 = _114.y;
        float _120 = _114.z;
        float _122 = _114.w;
        _105 = _116;
        _107 = _118;
        _109 = _120;
        _111 = _122;
    }
    float _124 = _105;
    float _126 = _107;
    float _128 = _109;
    float _130 = _111;
    float _132 = 0.0;
    if (_68)
    {
        _132 = (*spvDescriptorSet0.fp_c3)._m0[7].w;
    }
    float _134 = _132;
    float _136 = _124;
    float _138 = _126;
    float _140 = _128;
    float _142 = _130;
    if (_68)
    {
        float4 _331 = float4(_99, _101, _103, float(int(_77)));
        float4 _333 = select(_331, float4(0.0), isnan(_331));
        float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _333.xyz, uint(rint(_333.w)), level(_134)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _333.xyz, uint(rint(_333.w)), level(_134)).xyzw;
        float _146 = _144.x;
        float _148 = _144.y;
        float _150 = _144.z;
        float _152 = _144.w;
        _136 = _146;
        _138 = _148;
        _140 = _150;
        _142 = _152;
    }
    float _154 = _136;
    float _156 = _138;
    float _158 = _140;
    float _160 = _142;
    float2 _357 = float2(0.5);
    float _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_357, float2(0.0), isnan(_357))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_357, float2(0.0), isnan(_357))).x;
    float _164 = abs(_160);
    float _166 = log2(_164);
    float _168 = _166 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _170 = exp2(_168);
    float _172 = _170 * _162;
    float _174 = _172 * _154;
    float _176 = _172 * _156;
    float _178 = _172 * _158;
    float _180 = _160 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = precise::max(0.0, _174);
    float _186 = precise::max(0.0, _176);
    float _188 = precise::max(0.0, _178);
    out.m_37.x = _184;
    out.m_37.y = _186;
    out.m_37.z = _188;
    out.m_37.w = _182;
    return out;
}

