#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
    texture2d_array<float> cp_i_tcb_48_ [[id(1)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(2)]];
};

static inline __attribute__((always_inline))
int _36(thread const int& _686, thread const int& _687, constant _10& support_buffer)
{
    int _690 = 1 + _687;
    float _692 = support_buffer._m5[_690].x;
    bool _694 = _692 == 1.0;
    if (_694)
    {
        return _686;
    }
    float _696 = float(_686);
    float _698 = _696 * _692;
    int _700 = int(_698);
    return _700;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]])
{
    threadgroup spvUnsafeArray<uint, 128> _18;
    float _40 = as_type<float>(gl_LocalInvocationID.x);
    float _42 = as_type<float>(gl_WorkGroupID.x);
    float _44 = as_type<float>(gl_WorkGroupID.y);
    float _46 = as_type<float>(gl_WorkGroupID.z);
    int _48 = as_type<int>(_42) << 4;
    int _50 = _48 + as_type<int>(_40);
    int _52 = _50;
    int _54 = 0;
    int _56 = _36(_52, _54, (*spvDescriptorSet0.support_buffer));
    int _58 = as_type<int>(_44);
    int _60 = 0;
    int _62 = _36(_58, _60, (*spvDescriptorSet0.support_buffer));
    int3 _314 = int3(_56, _62, as_type<int>(_46));
    float4 _65 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_314.xy), uint(_314.z)).xyzw);
    float _67 = _65.x;
    float _69 = _65.y;
    float _71 = _65.z;
    float _73 = _65.w;
    int _75 = as_type<int>(_40) << 4;
    int _77 = as_type<int>(_40) << 4;
    uint _80 = uint(int(uint(_77) >> uint(2)));
    _18[int(_80)] = as_type<uint>(_67);
    int _82 = _77 + 4;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    _18[int(_84)] = as_type<uint>(_69);
    int _86 = _77 + 8;
    uint _88 = uint(int(uint(_86) >> uint(2)));
    _18[int(_88)] = as_type<uint>(_71);
    int _90 = _77 + 12;
    uint _92 = uint(int(uint(_90) >> uint(2)));
    _18[int(_92)] = as_type<uint>(_73);
    int _94 = 0;
    bool _98;
    do
    {
        int _100 = _94;
        int _102 = _100 + 1;
        int _104 = _102 & 31;
        uint _106 = uint(int(uint(16) >> uint(_104)));
        bool _108 = uint(_104) < 32u;
        int _110 = _108 ? int(_106) : 0;
        int _112 = ~_110;
        int _114 = _112 + 1;
        int _116 = as_type<int>(_40) & _114;
        float _118 = float(uint(_116));
        int _120 = _116 + as_type<int>(_40);
        float _122 = _118 * (-0.3926990926265716552734375);
        int _124 = _120 & 15;
        float _126 = _122 * 0.15915493667125701904296875;
        float _128 = _126 * 6.283185482025146484375;
        float _130 = cos(_128);
        float _132 = _126 * 6.283185482025146484375;
        float _134 = sin(_132);
        threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup | mem_flags::mem_texture);
        int _136 = _124 + _110;
        int _138 = _136 & 15;
        int _140 = _100 & 1;
        int _142 = ~_100;
        int _144 = _142 & 1;
        int _146 = _140 << 8;
        bool _148 = uint(_102) >= 4u;
        int _150 = _138 << 4;
        int _152 = _150 + _146;
        uint _154 = uint(int(uint(_152) >> uint(2)));
        float _156 = as_type<float>(_18[int(_154)]);
        int _158 = _152 + 4;
        uint _160 = uint(int(uint(_158) >> uint(2)));
        float _162 = as_type<float>(_18[int(_160)]);
        int _164 = _152 + 8;
        uint _166 = uint(int(uint(_164) >> uint(2)));
        float _168 = as_type<float>(_18[int(_166)]);
        int _170 = _152 + 12;
        uint _172 = uint(int(uint(_170) >> uint(2)));
        float _174 = as_type<float>(_18[int(_172)]);
        int _176 = _124 << 4;
        int _178 = _176 + _146;
        uint _180 = uint(int(uint(_178) >> uint(2)));
        float _182 = as_type<float>(_18[int(_180)]);
        int _184 = _178 + 4;
        uint _186 = uint(int(uint(_184) >> uint(2)));
        float _188 = as_type<float>(_18[int(_186)]);
        int _190 = _178 + 8;
        uint _192 = uint(int(uint(_190) >> uint(2)));
        float _194 = as_type<float>(_18[int(_192)]);
        int _196 = _178 + 12;
        uint _198 = uint(int(uint(_196) >> uint(2)));
        float _200 = as_type<float>(_18[int(_198)]);
        float _202 = -_162;
        float _204 = _134 * _202;
        float _206 = -_156;
        float _208 = _134 * _206;
        float _210 = -_174;
        float _212 = _134 * _210;
        float _214 = -_168;
        float _216 = _134 * _214;
        float _218 = -_204;
        float _220 = fma(_130, _156, _218);
        float _222 = fma(_130, _162, _208);
        float _224 = -_212;
        float _226 = fma(_130, _168, _224);
        float _228 = fma(_130, _174, _216);
        float _230 = _182 + _220;
        float _232 = _188 + _222;
        float _234 = _194 + _226;
        float _236 = _200 + _228;
        int _238 = _144 << 8;
        int _240 = _238 + _75;
        uint _242 = uint(int(uint(_240) >> uint(2)));
        _18[int(_242)] = as_type<uint>(_230);
        int _244 = _240 + 4;
        uint _246 = uint(int(uint(_244) >> uint(2)));
        _18[int(_246)] = as_type<uint>(_232);
        int _248 = _240 + 8;
        uint _250 = uint(int(uint(_248) >> uint(2)));
        _18[int(_250)] = as_type<uint>(_234);
        int _252 = _240 + 12;
        uint _254 = uint(int(uint(_252) >> uint(2)));
        _18[int(_254)] = as_type<uint>(_236);
        _98 = !_148;
        _94 = _102;
    } while (_98);
    threadgroup_barrier(mem_flags::mem_device | mem_flags::mem_threadgroup | mem_flags::mem_texture);
    int _256 = as_type<int>(_40) << 4;
    uint _258 = uint(int(uint(_256) >> uint(2)));
    float _260 = as_type<float>(_18[int(_258)]);
    int _262 = _256 + 4;
    uint _264 = uint(int(uint(_262) >> uint(2)));
    float _266 = as_type<float>(_18[int(_264)]);
    int _268 = _256 + 8;
    uint _270 = uint(int(uint(_268) >> uint(2)));
    float _272 = as_type<float>(_18[int(_270)]);
    int _274 = _256 + 12;
    uint _276 = uint(int(uint(_274) >> uint(2)));
    float _278 = as_type<float>(_18[int(_276)]);
    int3 _680 = int3(_50, as_type<int>(_44), as_type<int>(_46));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_260, _266, _272, _278), uint2(_680.xy), uint(_680.z));
}

