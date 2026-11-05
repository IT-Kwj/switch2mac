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

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c0 [[id(2)]];
    device _23* fp_s0 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
    float4 m_44 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_36.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_36.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _224 = float2(_67, _69);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _84 = gl_FragCoord.y;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = _67 * _82;
    float _100 = _69 * _90;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = trunc(_100);
    int _109 = int(_107);
    float _111 = trunc(_88);
    int _113 = int(_111);
    int _115 = _109 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _117 = _115 + _105;
    float _119 = trunc(_96);
    int _121 = int(_119);
    int _123 = _113 * 2;
    int _125 = _121 & 1;
    int _127 = 2 & _123;
    int _129 = (-3) & _125;
    int _131 = _127 | _129;
    int _133 = _117 << 2;
    int _135 = _133 + _131;
    int _137 = _135 << 2;
    int _139 = _137 + 9728;
    float _141 = precise::max(_74, _76);
    float _143 = precise::max(_78, _80);
    float _145 = precise::max(_141, _143);
    int _147 = _139 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    bool _151 = _145 >= 1.0;
    bool _153 = isnan(_145);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = -_145;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _165 = 1.0 / _163;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[1].w, _167);
    float _171 = _169 * 16777215.0;
    bool _173 = !_159;
    float _175 = _173 ? _171 : 16777215.0;
    float _177 = trunc(_175);
    float _179 = precise::max(_177, 0.0);
    uint _182 = uint(_179);
    bool _184 = !_159;
    int _186 = _184 ? as_type<int>(_169) : 1065353216;
    uint _188 = uint(int(uint(_139) >> uint(2)));
    uint _392 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_188)], _182, memory_order_relaxed);
    uint _190 = _392;
    out.gl_FragDepth = as_type<float>(_147);
    out.m_42.x = _80;
    out.m_42.y = _80;
    out.m_42.z = _80;
    out.m_42.w = _80;
    out.m_44.x = as_type<float>(_186);
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
    uint4 m_44 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_36.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_36.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _224 = float2(_67, _69);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _84 = gl_FragCoord.y;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = _67 * _82;
    float _100 = _69 * _90;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = trunc(_100);
    int _109 = int(_107);
    float _111 = trunc(_88);
    int _113 = int(_111);
    int _115 = _109 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _117 = _115 + _105;
    float _119 = trunc(_96);
    int _121 = int(_119);
    int _123 = _113 * 2;
    int _125 = _121 & 1;
    int _127 = 2 & _123;
    int _129 = (-3) & _125;
    int _131 = _127 | _129;
    int _133 = _117 << 2;
    int _135 = _133 + _131;
    int _137 = _135 << 2;
    int _139 = _137 + 9728;
    float _141 = precise::max(_74, _76);
    float _143 = precise::max(_78, _80);
    float _145 = precise::max(_141, _143);
    int _147 = _139 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    bool _151 = _145 >= 1.0;
    bool _153 = isnan(_145);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = -_145;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _165 = 1.0 / _163;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[1].w, _167);
    float _171 = _169 * 16777215.0;
    bool _173 = !_159;
    float _175 = _173 ? _171 : 16777215.0;
    float _177 = trunc(_175);
    float _179 = precise::max(_177, 0.0);
    uint _182 = uint(_179);
    bool _184 = !_159;
    int _186 = _184 ? as_type<int>(_169) : 1065353216;
    uint _188 = uint(int(uint(_139) >> uint(2)));
    uint _392 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_188)], _182, memory_order_relaxed);
    uint _190 = _392;
    out.gl_FragDepth = as_type<float>(_147);
    out.m_42.x = _80;
    out.m_42.y = _80;
    out.m_42.z = _80;
    out.m_42.w = _80;
    out.m_44.x = as_type<float>(_186);
    return main0_out_u{as_type<uint4>(out.m_42), as_type<uint4>(out.m_44), out.gl_FragDepth};
}


struct main0_out_m
{
    float4 m_42 [[color(0)]];
    uint4 m_44 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_m main0_m(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_36.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_36.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _224 = float2(_67, _69);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_224, float2(0.0), isnan(_224)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _84 = gl_FragCoord.y;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = gl_FragCoord.x;
    float _94 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _96 = _92 / _94;
    float _98 = _67 * _82;
    float _100 = _69 * _90;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = trunc(_100);
    int _109 = int(_107);
    float _111 = trunc(_88);
    int _113 = int(_111);
    int _115 = _109 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _117 = _115 + _105;
    float _119 = trunc(_96);
    int _121 = int(_119);
    int _123 = _113 * 2;
    int _125 = _121 & 1;
    int _127 = 2 & _123;
    int _129 = (-3) & _125;
    int _131 = _127 | _129;
    int _133 = _117 << 2;
    int _135 = _133 + _131;
    int _137 = _135 << 2;
    int _139 = _137 + 9728;
    float _141 = precise::max(_74, _76);
    float _143 = precise::max(_78, _80);
    float _145 = precise::max(_141, _143);
    int _147 = _139 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    bool _151 = _145 >= 1.0;
    bool _153 = isnan(_145);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = -_145;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _165 = 1.0 / _163;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[1].w, _167);
    float _171 = _169 * 16777215.0;
    bool _173 = !_159;
    float _175 = _173 ? _171 : 16777215.0;
    float _177 = trunc(_175);
    float _179 = precise::max(_177, 0.0);
    uint _182 = uint(_179);
    bool _184 = !_159;
    int _186 = _184 ? as_type<int>(_169) : 1065353216;
    uint _188 = uint(int(uint(_139) >> uint(2)));
    uint _392 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_188)], _182, memory_order_relaxed);
    uint _190 = _392;
    out.gl_FragDepth = as_type<float>(_147);
    out.m_42.x = _80;
    out.m_42.y = _80;
    out.m_42.z = _80;
    out.m_42.w = _80;
    out.m_44.x = as_type<float>(_186);
    return main0_out_m{out.m_42, as_type<uint4>(out.m_44), out.gl_FragDepth};
}

