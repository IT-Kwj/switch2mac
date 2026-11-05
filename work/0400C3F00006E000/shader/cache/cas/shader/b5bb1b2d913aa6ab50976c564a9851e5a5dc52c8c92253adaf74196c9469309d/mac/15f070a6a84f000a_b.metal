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
    float2 _270 = float2(_67, _69);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = gl_FragCoord.y;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = gl_FragCoord.x;
    float _90 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _92 = _88 / _90;
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _96 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _98 = _67 * _94;
    float _100 = _69 * _96;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = trunc(_100);
    int _109 = int(_107);
    float _111 = trunc(_86);
    int _113 = int(_111);
    int _115 = _109 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _117 = _115 + _105;
    float _119 = trunc(_92);
    int _121 = int(_119);
    int _123 = _113 * 2;
    int _125 = _121 & 1;
    int _127 = 2 & _123;
    int _129 = (-3) & _125;
    int _131 = _127 | _129;
    int _133 = _117 << 2;
    int _135 = _133 + _131;
    float _137 = precise::min(_74, _76);
    float _139 = precise::min(_78, _80);
    float _141 = precise::min(_137, _139);
    float _143 = precise::max(_74, _76);
    float _145 = precise::max(_78, _80);
    float _147 = -_141;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _153 = _141 >= 1.0;
    bool _155 = isnan(_141);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / _149;
    float _165 = -_80;
    float _167 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _169 = precise::max(_143, _145);
    float _171 = -_169;
    float _173 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _175 = 1.0 / _167;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _179 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[1].w, _177);
    float _181 = _179 * 16777215.0;
    float _183 = 1.0 / _173;
    bool _185 = !_161;
    float _187 = _185 ? _181 : 16777215.0;
    int _189 = _135 << 2;
    int _191 = _189 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    float _193 = trunc(_187);
    float _195 = precise::max(_193, 0.0);
    uint _198 = uint(_195);
    float _200 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _202 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[1].w, _200);
    bool _204 = _80 != 1.0;
    bool _206 = isnan(_80);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.0);
    bool _212 = _208 || _210;
    float _214 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _216 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[1].w, _214);
    int _218 = _212 ? as_type<int>(_202) : 1065353216;
    bool _220 = _169 >= 1.0;
    bool _222 = isnan(_169);
    bool _224 = _220 || _222;
    bool _226 = isnan(1.0);
    bool _228 = _224 || _226;
    bool _230 = !_228;
    int _232 = _230 ? as_type<int>(_216) : 1065353216;
    uint _234 = uint(int(uint(_189) >> uint(2)));
    uint _502 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_234)], _198, memory_order_relaxed);
    uint _236 = _502;
    out.gl_FragDepth = as_type<float>(_191);
    out.m_42.x = as_type<float>(_218);
    out.m_42.y = as_type<float>(_218);
    out.m_42.z = as_type<float>(_218);
    out.m_42.w = as_type<float>(_218);
    out.m_44.x = as_type<float>(_232);
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
    float2 _270 = float2(_67, _69);
    float4 _72 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270)), int2(0), component::x).xyzw;
    float _74 = _72.x;
    float _76 = _72.y;
    float _78 = _72.z;
    float _80 = _72.w;
    float _82 = gl_FragCoord.y;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = gl_FragCoord.x;
    float _90 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _92 = _88 / _90;
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _96 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _98 = _67 * _94;
    float _100 = _69 * _96;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = trunc(_100);
    int _109 = int(_107);
    float _111 = trunc(_86);
    int _113 = int(_111);
    int _115 = _109 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _117 = _115 + _105;
    float _119 = trunc(_92);
    int _121 = int(_119);
    int _123 = _113 * 2;
    int _125 = _121 & 1;
    int _127 = 2 & _123;
    int _129 = (-3) & _125;
    int _131 = _127 | _129;
    int _133 = _117 << 2;
    int _135 = _133 + _131;
    float _137 = precise::min(_74, _76);
    float _139 = precise::min(_78, _80);
    float _141 = precise::min(_137, _139);
    float _143 = precise::max(_74, _76);
    float _145 = precise::max(_78, _80);
    float _147 = -_141;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _153 = _141 >= 1.0;
    bool _155 = isnan(_141);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = 1.0 / _149;
    float _165 = -_80;
    float _167 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _169 = precise::max(_143, _145);
    float _171 = -_169;
    float _173 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _175 = 1.0 / _167;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _179 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[1].w, _177);
    float _181 = _179 * 16777215.0;
    float _183 = 1.0 / _173;
    bool _185 = !_161;
    float _187 = _185 ? _181 : 16777215.0;
    int _189 = _135 << 2;
    int _191 = _189 + as_type<int>((*spvDescriptorSet0.fp_c0)._m0[81].x);
    float _193 = trunc(_187);
    float _195 = precise::max(_193, 0.0);
    uint _198 = uint(_195);
    float _200 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _202 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[1].w, _200);
    bool _204 = _80 != 1.0;
    bool _206 = isnan(_80);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.0);
    bool _212 = _208 || _210;
    float _214 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _216 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[1].w, _214);
    int _218 = _212 ? as_type<int>(_202) : 1065353216;
    bool _220 = _169 >= 1.0;
    bool _222 = isnan(_169);
    bool _224 = _220 || _222;
    bool _226 = isnan(1.0);
    bool _228 = _224 || _226;
    bool _230 = !_228;
    int _232 = _230 ? as_type<int>(_216) : 1065353216;
    uint _234 = uint(int(uint(_189) >> uint(2)));
    uint _502 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_234)], _198, memory_order_relaxed);
    uint _236 = _502;
    out.gl_FragDepth = as_type<float>(_191);
    out.m_42.x = as_type<float>(_218);
    out.m_42.y = as_type<float>(_218);
    out.m_42.z = as_type<float>(_218);
    out.m_42.w = as_type<float>(_218);
    out.m_44.x = as_type<float>(_232);
    return main0_out_u{as_type<uint4>(out.m_42), as_type<uint4>(out.m_44), out.gl_FragDepth};
}

