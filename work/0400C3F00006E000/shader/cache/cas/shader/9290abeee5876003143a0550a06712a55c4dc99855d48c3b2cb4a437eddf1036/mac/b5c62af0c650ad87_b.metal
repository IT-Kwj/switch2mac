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
    texture2d<float, access::write> fp_i_tcb_48_ [[id(3)]];
    texture2d<float, access::write> fp_i_tcb_4A_ [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[color(2)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = gl_FragCoord.y;
    float _52 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _54 = _50 / _52;
    float _56 = gl_FragCoord.x;
    float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _60 = _56 / _58;
    float _62 = in.m_35.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_35.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _76 = as_type<float>(gl_SubgroupInvocationID);
    int _79 = as_type<int>(_76) & 3;
    bool _83 = _79 != 0;
    float _85 = 1.0 / _48;
    float _87 = trunc(_54);
    int _89 = int(_87);
    float _91 = trunc(_60);
    int _93 = int(_91);
    float _95 = _85 * _66;
    float _97 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _99 = _95 * _74;
    float _101 = _85 * _72;
    int _103 = _89 * 2;
    float _105 = _101 * _97;
    float _107 = trunc(_99);
    int _109 = int(_107);
    int _111 = _93 & 1;
    float _113 = trunc(_105);
    int _115 = int(_113);
    int _117 = 2 & _103;
    int _119 = (-3) & _111;
    int _121 = _117 | _119;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_93, _89)));
    int _123 = _115 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _125 = _123 + _109;
    int _127 = _125 * 4;
    int _129 = _127 + _121;
    int _131 = _129 << 2;
    if (!_83)
    {
        int _133 = _93 >> 31;
        int _135 = _89 >> 31;
        int _137 = _133 & 1;
        int _139 = _135 & 1;
        int _141 = _93 + _137;
        int _143 = _89 + _139;
        int _145 = _141 >> 1;
        int _147 = _143 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(0.0), uint2(int2(_145, _147)));
    }
    uint _150 = uint(int(uint(_131) >> uint(2)));
    uint _311 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_150)], 0u, memory_order_relaxed);
    uint _152 = _311;
    out.m_41.x = 0.0;
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(2)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = gl_FragCoord.y;
    float _52 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _54 = _50 / _52;
    float _56 = gl_FragCoord.x;
    float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _60 = _56 / _58;
    float _62 = in.m_35.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_35.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _76 = as_type<float>(gl_SubgroupInvocationID);
    int _79 = as_type<int>(_76) & 3;
    bool _83 = _79 != 0;
    float _85 = 1.0 / _48;
    float _87 = trunc(_54);
    int _89 = int(_87);
    float _91 = trunc(_60);
    int _93 = int(_91);
    float _95 = _85 * _66;
    float _97 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _99 = _95 * _74;
    float _101 = _85 * _72;
    int _103 = _89 * 2;
    float _105 = _101 * _97;
    float _107 = trunc(_99);
    int _109 = int(_107);
    int _111 = _93 & 1;
    float _113 = trunc(_105);
    int _115 = int(_113);
    int _117 = 2 & _103;
    int _119 = (-3) & _111;
    int _121 = _117 | _119;
    spvDescriptorSet0.fp_i_tcb_48_.write(float4(0.0), uint2(int2(_93, _89)));
    int _123 = _115 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _125 = _123 + _109;
    int _127 = _125 * 4;
    int _129 = _127 + _121;
    int _131 = _129 << 2;
    if (!_83)
    {
        int _133 = _93 >> 31;
        int _135 = _89 >> 31;
        int _137 = _133 & 1;
        int _139 = _135 & 1;
        int _141 = _93 + _137;
        int _143 = _89 + _139;
        int _145 = _141 >> 1;
        int _147 = _143 >> 1;
        spvDescriptorSet0.fp_i_tcb_4A_.write(float4(0.0), uint2(int2(_145, _147)));
    }
    uint _150 = uint(int(uint(_131) >> uint(2)));
    uint _311 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_150)], 0u, memory_order_relaxed);
    uint _152 = _311;
    out.m_41.x = 0.0;
    return main0_out_u{as_type<uint4>(out.m_41)};
}

