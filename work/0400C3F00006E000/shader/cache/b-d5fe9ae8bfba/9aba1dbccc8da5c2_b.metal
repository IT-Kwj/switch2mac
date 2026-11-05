#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
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
    texture2d_ms<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
};

struct main0_out
{
    float4 m_26 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _32(thread const int& _611, thread const int& _612, constant _10& support_buffer)
{
    int _615 = 1 + _612;
    float _617 = support_buffer._m5[_615].x;
    float _619 = abs(_617);
    bool _623 = _619 == 1.0;
    if (_623)
    {
        return _611;
    }
    float _625 = float(_611);
    float _627 = _625 / _619;
    int _629 = int(_627);
    return _629;
}

static inline __attribute__((always_inline))
int _34(thread const int& _652, thread const int& _653, thread const int& _654, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _657 = 1 + _653;
    float _659 = support_buffer._m5[_657].x;
    bool _661 = _659 == 1.0;
    if (_661)
    {
        return _652;
    }
    bool _663 = _659 < 0.0;
    if (_663)
    {
        float _665 = -_659;
        float _667 = float(_652);
        float _669 = _667 * _665;
        float _671 = gl_FragCoord.x;
        float _673 = gl_FragCoord.y;
        float _675 = (_654 != 0) ? _673 : _671;
        float _677 = mod(_675, _665);
        float _679 = _669 + _677;
        int _681 = int(_679);
        return _681;
    }
    float _683 = float(_652);
    float _685 = _683 * _659;
    int _687 = int(_685);
    return _687;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _37 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _39 = _37;
    int _41 = 0;
    int _43 = _32(_39, _41, (*spvDescriptorSet0.support_buffer));
    int _45 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _47 = _45;
    int _49 = 0;
    int _51 = _32(_47, _49, (*spvDescriptorSet0.support_buffer));
    float _54 = gl_FragCoord.w;
    float _56 = in.m_23.x;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_23.y;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _54;
    float _70 = _68 * _60;
    float _72 = _68 * _66;
    float _74 = float(_43);
    float _76 = float(_51);
    float _78 = _70 * _74;
    float _80 = _72 * _76;
    float _82 = trunc(_78);
    int _84 = int(_82);
    float _86 = trunc(_80);
    int _88 = int(_86);
    int _90 = _84;
    int _92 = 0;
    int _94 = 0;
    int _96 = _34(_90, _92, _94, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _98 = _88;
    int _100 = 0;
    int _102 = 1;
    int _104 = _34(_98, _100, _102, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _108 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_96, _104)), 0).xyz;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    int _116 = _84;
    int _118 = 0;
    int _120 = 0;
    int _122 = _34(_116, _118, _120, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _124 = _88;
    int _126 = 0;
    int _128 = 1;
    int _130 = _34(_124, _126, _128, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _132 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_122, _130)), 1).xyz;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    int _140 = _84;
    int _142 = 0;
    int _144 = 0;
    int _146 = _34(_140, _142, _144, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _148 = _88;
    int _150 = 0;
    int _152 = 1;
    int _154 = _34(_148, _150, _152, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _156 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_146, _154)), 2).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    int _164 = _84;
    int _166 = 0;
    int _168 = 0;
    int _170 = _34(_164, _166, _168, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _172 = _88;
    int _174 = 0;
    int _176 = 1;
    int _178 = _34(_172, _174, _176, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _180 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_170, _178)), 3).xyz;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    int _188 = _84;
    int _190 = 0;
    int _192 = 0;
    int _194 = _34(_188, _190, _192, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _196 = _88;
    int _198 = 0;
    int _200 = 1;
    int _202 = _34(_196, _198, _200, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _204 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_194, _202)), 4).xyz;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    int _212 = _84;
    int _214 = 0;
    int _216 = 0;
    int _218 = _34(_212, _214, _216, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _220 = _88;
    int _222 = 0;
    int _224 = 1;
    int _226 = _34(_220, _222, _224, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _228 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_218, _226)), 5).xyz;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    int _236 = _84;
    int _238 = 0;
    int _240 = 0;
    int _242 = _34(_236, _238, _240, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _244 = _88;
    int _246 = 0;
    int _248 = 1;
    int _250 = _34(_244, _246, _248, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _252 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_242, _250)), 6).xyz;
    float _254 = _252.x;
    float _256 = _252.y;
    float _258 = _252.z;
    int _260 = _84;
    int _262 = 0;
    int _264 = 0;
    int _266 = _34(_260, _262, _264, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _268 = _88;
    int _270 = 0;
    int _272 = 1;
    int _274 = _34(_268, _270, _272, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float3 _276 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_266, _274)), 7).xyz;
    float _278 = _276.x;
    float _280 = _276.y;
    float _282 = _276.z;
    float _284 = _110 + _134;
    float _286 = _112 + _136;
    float _288 = _114 + _138;
    float _290 = _284 + _158;
    float _292 = _286 + _160;
    float _294 = _288 + _162;
    float _296 = _290 + _182;
    float _298 = _292 + _184;
    float _300 = _294 + _186;
    float _302 = _296 + _206;
    float _304 = _298 + _208;
    float _306 = _300 + _210;
    float _308 = _302 + _230;
    float _310 = _304 + _232;
    float _312 = _306 + _234;
    float _314 = _308 + _254;
    float _316 = _310 + _256;
    float _318 = _312 + _258;
    float _320 = _278 + _314;
    float _322 = _280 + _316;
    float _324 = _282 + _318;
    float _326 = _320 * 0.125;
    float _328 = _322 * 0.125;
    float _330 = _324 * 0.125;
    out.m_26.x = _326;
    out.m_26.y = _328;
    out.m_26.z = _330;
    out.m_26.w = 1.0;
    return out;
}

