#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
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
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _233 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_233, float2(0.0), isnan(_233)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = gl_FragCoord.x;
    float _77 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _79 = _75 / _77;
    float _81 = gl_FragCoord.y;
    float _83 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _85 = _81 / _83;
    float _87 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _91 = _62 * _87;
    float _93 = _60 * _89;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = trunc(_93);
    int _102 = int(_100);
    float _104 = trunc(_79);
    int _106 = int(_104);
    int _108 = _98 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _110 = _108 + _102;
    float _112 = trunc(_85);
    int _114 = int(_112);
    float _116 = precise::max(_67, _69);
    float _118 = precise::max(_71, _73);
    int _120 = _114 << 1;
    float _122 = precise::max(_116, _118);
    int _124 = _106 & 1;
    bool _128 = _122 >= 1.0;
    bool _130 = isnan(_122);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = -_122;
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _142 = 2 & _120;
    int _144 = (-3) & _124;
    int _146 = _142 | _144;
    float _148 = 1.0 / _140;
    int _150 = _110 * 4;
    int _152 = _150 + _146;
    int _154 = _152 << 2;
    int _156 = _154 + 9728;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _160 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[1].w, _158);
    float _162 = _160 * 16777215.0;
    bool _164 = !_136;
    float _166 = _164 ? _162 : 16777215.0;
    float _168 = -_73;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _172 = trunc(_166);
    float _174 = precise::max(_172, 0.0);
    uint _177 = uint(_174);
    float _179 = 1.0 / _170;
    bool _181 = _73 != 1.0;
    bool _183 = isnan(_73);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    uint _191 = uint(int(uint(_156) >> uint(2)));
    uint _408 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_191)], _177, memory_order_relaxed);
    uint _193 = _408;
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _197 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].w, _195);
    int _199 = _189 ? as_type<int>(_197) : 1065353216;
    out.m_37.x = as_type<float>(_199);
    out.m_37.y = as_type<float>(_199);
    out.m_37.z = as_type<float>(_199);
    out.m_37.w = as_type<float>(_199);
    return out;
}


struct main0_out_u
{
    uint4 m_37 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_34.x;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_34.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    float2 _233 = float2(_60, _62);
    float4 _65 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_233, float2(0.0), isnan(_233)), int2(0), component::x).xyzw;
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    float _75 = gl_FragCoord.x;
    float _77 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _79 = _75 / _77;
    float _81 = gl_FragCoord.y;
    float _83 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _85 = _81 / _83;
    float _87 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _89 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _91 = _62 * _87;
    float _93 = _60 * _89;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = trunc(_93);
    int _102 = int(_100);
    float _104 = trunc(_79);
    int _106 = int(_104);
    int _108 = _98 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _110 = _108 + _102;
    float _112 = trunc(_85);
    int _114 = int(_112);
    float _116 = precise::max(_67, _69);
    float _118 = precise::max(_71, _73);
    int _120 = _114 << 1;
    float _122 = precise::max(_116, _118);
    int _124 = _106 & 1;
    bool _128 = _122 >= 1.0;
    bool _130 = isnan(_122);
    bool _132 = _128 || _130;
    bool _134 = isnan(1.0);
    bool _136 = _132 || _134;
    float _138 = -_122;
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _142 = 2 & _120;
    int _144 = (-3) & _124;
    int _146 = _142 | _144;
    float _148 = 1.0 / _140;
    int _150 = _110 * 4;
    int _152 = _150 + _146;
    int _154 = _152 << 2;
    int _156 = _154 + 9728;
    float _158 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _160 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[1].w, _158);
    float _162 = _160 * 16777215.0;
    bool _164 = !_136;
    float _166 = _164 ? _162 : 16777215.0;
    float _168 = -_73;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _172 = trunc(_166);
    float _174 = precise::max(_172, 0.0);
    uint _177 = uint(_174);
    float _179 = 1.0 / _170;
    bool _181 = _73 != 1.0;
    bool _183 = isnan(_73);
    bool _185 = _181 || _183;
    bool _187 = isnan(1.0);
    bool _189 = _185 || _187;
    uint _191 = uint(int(uint(_156) >> uint(2)));
    uint _408 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_191)], _177, memory_order_relaxed);
    uint _193 = _408;
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _197 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[1].w, _195);
    int _199 = _189 ? as_type<int>(_197) : 1065353216;
    out.m_37.x = as_type<float>(_199);
    out.m_37.y = as_type<float>(_199);
    out.m_37.z = as_type<float>(_199);
    out.m_37.w = as_type<float>(_199);
    return main0_out_u{as_type<uint4>(out.m_37)};
}

